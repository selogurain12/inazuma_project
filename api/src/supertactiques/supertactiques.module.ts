import { Module } from '@nestjs/common';
import { SupertactiquesService } from './supertactiques.service';
import { SupertactiquesController } from './supertactiques.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Supertactique } from './entities/supertactique.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Supertactique])],
  controllers: [SupertactiquesController],
  providers: [SupertactiquesService],
})
export class SupertactiquesModule {}
