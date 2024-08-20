import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsString } from 'class-validator';
import { Episode } from 'src/episodes/entities/episode.entity';
import { Equipe } from 'src/equipes/entities/equipe.entity';
import { Match } from 'src/matchs/entities/match.entity';
import { Serie } from 'src/series/entities/series.entity';
import {
  Column,
  Entity,
  ManyToMany,
  ManyToOne,
  PrimaryGeneratedColumn,
} from 'typeorm';

@Entity()
export class Supertactique {
  @ApiProperty({
    description: "L'id de la supertactique",
    minimum: 1,
  })
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @ApiProperty({
    description: 'Nom de la supertactique',
  })
  @Column({ nullable: false })
  @IsNotEmpty()
  @IsString()
  nom: string;

  @ApiProperty({
    description: 'Id de la série',
  })
  @ManyToOne(() => Serie, (serie: Serie) => serie.supertactiques)
  serie: Serie;

  @ManyToMany(() => Equipe)
  equipes: Equipe[];

  @ManyToMany(() => Match)
  matchs: Match[];

  @ManyToMany(() => Episode)
  episodes: Episode[];

  @Column('text', { array: true, nullable: true })
  video: string[];
}
