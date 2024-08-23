import { ApiProperty } from '@nestjs/swagger';
import { IsString } from 'class-validator';
import { Episode } from 'src/episodes/entities/episode.entity';
import { Equipe } from 'src/equipes/entities/equipe.entity';
import { Personnage } from 'src/personnages/entities/personnage.entity';
import { Serie } from 'src/series/entities/series.entity';
import {
  Column,
  Entity,
  JoinTable,
  ManyToMany,
  ManyToOne,
  PrimaryGeneratedColumn,
} from 'typeorm';

@Entity()
export class Image {
  @ApiProperty({ description: "L'id de l'image", minimum: 1 })
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @ApiProperty({ description: "Note sur l'image" })
  @Column({ nullable: true })
  @IsString()
  note: string;

  @ApiProperty({
    description: 'Id de la série',
  })
  @ManyToOne(() => Serie, (serie: Serie) => serie.images)
  serie: Serie;

  @ApiProperty({
    description: "Id de l'épisode",
  })
  @ManyToOne(() => Episode, (episode: Episode) => episode.titre)
  episode: Episode;

  @Column({ nullable: true })
  images: string;

  @ManyToMany(() => Equipe)
  @JoinTable()
  equipe: Equipe[];

  @ManyToMany(() => Personnage)
  @JoinTable()
  personnages: Personnage[];
}
