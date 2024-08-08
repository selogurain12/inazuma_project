import { Module } from '@nestjs/common';
import { SupertechniquesService } from './supertechniques.service';
import { SupertechniquesController } from './supertechniques.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Supertechnique } from './entities/supertechnique.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Supertechnique])],
  controllers: [SupertechniquesController],
  providers: [SupertechniquesService],
})
export class SupertechniquesModule {}
