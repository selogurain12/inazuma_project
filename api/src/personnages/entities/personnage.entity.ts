import {
  Entity,
  Column,
  PrimaryGeneratedColumn,
  ManyToOne,
  ManyToMany,
} from 'typeorm';
import { IsString, IsNotEmpty } from 'class-validator';
import { ApiProperty } from '@nestjs/swagger';
import { Serie } from 'src/series/entities/series.entity';
import { Supertechnique } from 'src/supertechniques/entities/supertechnique.entity';
import { Episode } from 'src/episodes/entities/episode.entity';
import { Equipe } from 'src/equipes/entities/equipe.entity';
import { Image } from 'src/images/entities/image.entity';

@Entity()
export class Personnage {
  @ApiProperty({
    description: "L'id du personnage",
    minimum: 1,
  })
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @ApiProperty({
    description: 'Nom français du personnage',
  })
  @Column({ nullable: false })
  @IsNotEmpty()
  @IsString()
  nom_français_personnage: string;

  @ApiProperty({
    description: 'Nom original du personnage',
  })
  @Column({ nullable: true })
  @IsString()
  nom_original_personnage: string;

  @ApiProperty({
    description: 'Position du personnage',
  })
  @Column({ nullable: true })
  @IsString()
  position_personnage: string;

  @ApiProperty({
    description: 'Note sur le personnage',
  })
  @Column({ nullable: true })
  @IsString()
  note: string;

  @ApiProperty({
    description: 'Supertechniques de personnage',
  })
  @ManyToMany(() => Supertechnique)
  supertechniques: Supertechnique[];

  @ManyToMany(() => Episode)
  episode: Episode[];

  @ManyToMany(() => Equipe)
  equipes: Equipe[];

  @ApiProperty({
    description: 'Id de la série',
  })
  @ManyToOne(() => Serie, (serie: Serie) => serie.personnages)
  serie: Serie;

  @ManyToMany(() => Image)
  images: Image[];
}
