import { Module } from '@nestjs/common';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm';
import { EpisodesModule } from './episodes/episodes.module';
import { Episode } from './episodes/entities/episode.entity';
import { Personnage } from './personnages/entities/personnage.entity';
import { PersonnagesModule } from './personnages/personnages.module';
import { Serie } from './series/entities/series.entity';
import { SeriesModule } from './series/series.module';
import { Equipe } from './equipes/entities/equipe.entity';
import { EquipesModule } from './equipes/equipes.module';
import { Supertactique } from './supertactiques/entities/supertactique.entity';
import { SupertactiquesModule } from './supertactiques/supertactiques.module';
import { Match } from './matchs/entities/match.entity';
import { MatchsModule } from './matchs/matchs.module';
import { Supertechnique } from './supertechniques/entities/supertechnique.entity';
import { SupertechniquesModule } from './supertechniques/supertechniques.module';
import { Image } from './images/entities/image.entity';
import { ImagesModule } from './images/images.module';

@Module({
  imports: [
    ConfigModule.forRoot({ isGlobal: true }),
    TypeOrmModule.forRootAsync({
      imports: [ConfigModule],
      useFactory: (configService: ConfigService) => ({
        type: 'postgres',
        host: configService.get('DB_HOST'),
        port: +configService.get<number>('DB_PORT'),
        username: configService.get('DB_USERNAME'),
        password: configService.get('DB_PASSWORD'),
        database: configService.get('DB_NAME'),
        entities: [
          Serie,
          Image,
          Supertactique,
          Supertechnique,
          Episode,
          Equipe,
          Match,
          Personnage,
        ],
        synchronize: true,
      }),
      inject: [ConfigService],
    }),
    EpisodesModule,
    EquipesModule,
    MatchsModule,
    PersonnagesModule,
    SeriesModule,
    SupertactiquesModule,
    SupertechniquesModule,
    ImagesModule,
  ],
  controllers: [],
  providers: [ConfigService],
})
export class AppModule {}
