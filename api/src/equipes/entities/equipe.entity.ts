import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsString } from 'class-validator';
import { Episode } from 'src/episodes/entities/episode.entity';
import { Image } from 'src/images/entities/image.entity';
import { Match } from 'src/matchs/entities/match.entity';
import { Personnage } from 'src/personnages/entities/personnage.entity';
import { Serie } from 'src/series/entities/series.entity';
import { Supertactique } from 'src/supertactiques/entities/supertactique.entity';
import { Supertechnique } from 'src/supertechniques/entities/supertechnique.entity';
import {
  Column,
  Entity,
  JoinTable,
  ManyToMany,
  ManyToOne,
  PrimaryGeneratedColumn,
} from 'typeorm';

@Entity()
export class Equipe {
  @ApiProperty({ description: "L'id de l'équipe", minimum: 1 })
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @ApiProperty({ description: "Nom français de l'équipe" })
  @Column({ nullable: false })
  @IsNotEmpty()
  @IsString()
  nom_francais_equipe: string;

  @ApiProperty({ description: "Nom original de l'équipe" })
  @Column({ nullable: true })
  @IsString()
  nom_original_equipe: string;

  @ApiProperty({ description: "Note sur l'équipe" })
  @Column({ nullable: true })
  @IsString()
  note: string;

  @ApiProperty({ description: "Capitaine de l'équipe" })
  @ManyToMany(() => Personnage)
  capitaines: Personnage[];

  @ApiProperty({ description: "Joueurs de l'équipe" })
  @JoinTable()
  @ManyToMany(() => Personnage)
  joueurs: Personnage[];

  @ApiProperty({ description: "Manageur de l'équipe" })
  @ManyToMany(() => Personnage)
  manageurs: Personnage[];

  @ApiProperty({ description: "Supertactique utilisé par l'équipe" })
  @ManyToMany(() => Supertactique)
  supertactiques: Supertactique[];

  @ApiProperty({ description: "Supertechnique utilisé par l'équipe" })
  @ManyToMany(() => Supertechnique)
  supertechniques: Supertechnique[];

  @ManyToMany(() => Match)
  matchs: Match[];

  @ApiProperty({
    description: 'Id de la série',
  })
  @ManyToOne(() => Serie, (serie: Serie) => serie.equipes)
  serie: Serie;

  @ManyToMany(() => Episode)
  episodes: Episode[];

  @ManyToMany(() => Personnage)
  entraineur: Personnage[];

  @ManyToMany(() => Image)
  images: Image[];
}
