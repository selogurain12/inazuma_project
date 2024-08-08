import {
  Entity,
  Column,
  PrimaryGeneratedColumn,
  ManyToOne,
  ManyToMany,
  JoinTable,
} from 'typeorm';
import { IsString } from 'class-validator';
import { ApiProperty } from '@nestjs/swagger';
import { Serie } from 'src/series/entities/series.entity';
import { Equipe } from 'src/equipes/entities/equipe.entity';
import { Episode } from 'src/episodes/entities/episode.entity';
import { Supertechnique } from 'src/supertechniques/entities/supertechnique.entity';
import { Supertactique } from 'src/supertactiques/entities/supertactique.entity';

@Entity()
export class Match {
  @ApiProperty({
    description: "L'id du match",
    minimum: 1,
  })
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @ApiProperty({
    description: "Id de l'équipe 1",
  })
  @ManyToOne(() => Equipe, (equipe: Equipe) => equipe.matchs)
  id_equipe_1: Equipe;

  @ApiProperty({
    description: "Id de l'équipe 2",
  })
  @ManyToOne(() => Equipe, (equipe: Equipe) => equipe.matchs)
  id_equipe_2: Equipe;

  @ApiProperty({
    description: 'Notes sur le match',
  })
  @Column({ nullable: true })
  @IsString()
  notes: string;

  @ManyToMany(() => Episode, (episode: Episode) => episode.matchs)
  @JoinTable()
  episodes: Episode[];

  @ManyToMany(
    () => Supertechnique,
    (supertechnique: Supertechnique) => supertechnique.matchs,
  )
  @JoinTable()
  supertechniques: Supertechnique[];

  @ManyToMany(
    () => Supertactique,
    (supertactique: Supertactique) => supertactique.matchs,
  )
  @JoinTable()
  supertactiques: Supertactique[];

  @ApiProperty({
    description: 'Id de la série',
  })
  @ManyToOne(() => Serie, (serie: Serie) => serie.matchs)
  serie: Serie;

  @Column({ nullable: true })
  compo_equipe_1: string;

  @Column({ nullable: true })
  compo_equipe_2: string;
}
