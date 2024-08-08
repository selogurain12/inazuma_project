import { Module } from '@nestjs/common';
import { PersonnagesService } from './personnages.service';
import { PersonnagesController } from './personnages.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Personnage } from './entities/personnage.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Personnage])],
  controllers: [PersonnagesController],
  providers: [PersonnagesService],
})
export class PersonnagesModule {}
