import {
  Entity,
  Column,
  PrimaryGeneratedColumn,
  ManyToOne,
  ManyToMany,
  OneToMany,
  JoinTable,
} from 'typeorm';
import { IsString, IsNotEmpty, IsNumber } from 'class-validator';
import { ApiProperty } from '@nestjs/swagger';
import { Serie } from 'src/series/entities/series.entity';
import { Equipe } from 'src/equipes/entities/equipe.entity';
import { Personnage } from 'src/personnages/entities/personnage.entity';
import { Match } from 'src/matchs/entities/match.entity';
import { Supertactique } from 'src/supertactiques/entities/supertactique.entity';
import { Supertechnique } from 'src/supertechniques/entities/supertechnique.entity';
import { Image } from 'src/images/entities/image.entity';
import { Transform } from 'class-transformer';
import { toFrenchDateFormat } from 'src/data-transform.helper';

@Entity()
export class Episode {
  @ApiProperty({
    description: "L'id de l'épisode",
    minimum: 1,
  })
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @ApiProperty({
    description: "Le titre de l'épisode",
  })
  @Column({ nullable: false })
  @IsString()
  @IsNotEmpty()
  titre: string;

  @ApiProperty({
    description: "Le titre original de l'épisode",
  })
  @Column({ nullable: false })
  @IsString()
  @IsNotEmpty()
  titre_original: string;

  @ApiProperty({
    description: "Le numéro de l'épisode",
    minimum: 1,
  })
  @Column({ nullable: false })
  @IsNumber()
  @IsNotEmpty()
  numepisode: number;

  @ApiProperty({
    description: 'Le numéro de la saison',
    minimum: 1,
  })
  @Column({ nullable: false })
  @IsNumber()
  @IsNotEmpty()
  saison: number;

  @ApiProperty({
    description: "Le scénariste de l'épisode",
  })
  @Column({ nullable: false })
  @IsString()
  @IsNotEmpty()
  scenario: string;

  @ApiProperty({
    description: "Diffusion originale de l'épisode",
  })
  @Column('date')
  @Transform(toFrenchDateFormat)
  @IsNotEmpty()
  diffusion_originale: string;

  @ApiProperty({
    description: "Le résumé de l'épisode",
  })
  @Column({ nullable: false })
  @IsString()
  @IsNotEmpty()
  resume: string;

  @ApiProperty({
    description: "Note sur l'épisode",
  })
  @Column({ nullable: true })
  @IsString()
  note: string;

  @ApiProperty({
    description: 'Lien vers la vidéo',
  })
  @Column({ nullable: false })
  @IsString()
  @IsNotEmpty()
  video: string;

  @ApiProperty({
    description: 'Id de la série',
  })
  @ManyToOne(() => Serie, (serie: Serie) => serie.episodes)
  serie: Serie;

  @ApiProperty({
    description: "Equipes présentes dans l'épisode",
  })
  @ManyToMany(() => Equipe)
  @JoinTable()
  equipes: Equipe[];

  @ApiProperty({
    description: "Personnages présents dans l'épisode",
  })
  @ManyToMany(() => Personnage)
  @JoinTable()
  personnages: Personnage[];

  @ApiProperty({
    description: "Matchs de l'épisode",
  })
  @ManyToMany(() => Match)
  @JoinTable()
  matchs: Match[];

  @ApiProperty({
    description: "Supertactiques de l'épisode",
  })
  @ManyToMany(() => Supertactique)
  @JoinTable()
  supertactiques: Supertactique[];

  @ApiProperty({
    description: "Supertechniques de l'épisode",
  })
  @ManyToMany(() => Supertechnique)
  @JoinTable()
  supertechniques: Supertechnique[];

  @ApiProperty({
    description: "Images de l'épisode",
  })
  @OneToMany(() => Image, (image: Image) => image.episode)
  images: Image[];
}
