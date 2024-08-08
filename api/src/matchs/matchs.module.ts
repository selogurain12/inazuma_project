import { Module } from '@nestjs/common';
import { MatchsService } from './matchs.service';
import { MatchsController } from './matchs.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Match } from './entities/match.entity';
import { Equipe } from 'src/equipes/entities/equipe.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Match, Equipe])],
  controllers: [MatchsController],
  providers: [MatchsService],
})
export class MatchsModule {}
