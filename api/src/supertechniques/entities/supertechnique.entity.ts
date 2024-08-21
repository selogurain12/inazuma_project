import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsString } from 'class-validator';
import { Episode } from 'src/episodes/entities/episode.entity';
import { Equipe } from 'src/equipes/entities/equipe.entity';
import { Match } from 'src/matchs/entities/match.entity';
import { Personnage } from 'src/personnages/entities/personnage.entity';
import { Serie } from 'src/series/entities/series.entity';
import {
  Column,
  Entity,
  ManyToMany,
  ManyToOne,
  PrimaryGeneratedColumn,
} from 'typeorm';

@Entity()
export class Supertechnique {
  @ApiProperty({
    description: "L'id de la supertechniques",
    minimum: 1,
  })
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @ApiProperty({
    description: 'Nom français de la supertechnique',
  })
  @Column({ nullable: false })
  @IsNotEmpty()
  @IsString()
  nom_français_supertechniques: string;

  @ApiProperty({
    description: 'Nom original de la supertechnique',
  })
  @Column({ nullable: true })
  @IsNotEmpty()
  @IsString()
  nom_original_supertechniques: string;

  @ApiProperty({
    description: 'Type de la supertechnique',
  })
  @Column({ nullable: false })
  @IsNotEmpty()
  @IsString()
  type_supertechniques: string;

  @ApiProperty({
    description: 'Note(s) sur la supertechnique',
  })
  @Column({ nullable: true })
  @IsNotEmpty()
  @IsString()
  notes_supertechniques: string;

  @ApiProperty({
    description: 'Obtention de la supertechnique',
  })
  @Column({ nullable: true })
  @IsNotEmpty()
  @IsString()
  obtention_supertechniques: string;

  @ManyToMany(() => Equipe)
  equipes: Equipe[];

  @ManyToMany(() => Personnage)
  personnages: Personnage[];

  @ManyToMany(() => Episode)
  episodes: Episode[];

  @ManyToMany(() => Match)
  matchs: Match[];

  @ApiProperty({
    description: 'Id de la série',
  })
  @ManyToOne(() => Serie, (serie: Serie) => serie.supertechniques)
  serie: Serie;

  @Column('text', { array: true, nullable: true })
  video: string[];
}
