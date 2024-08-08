import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsString } from 'class-validator';
import { Episode } from 'src/episodes/entities/episode.entity';
import { Equipe } from 'src/equipes/entities/equipe.entity';
import { Match } from 'src/matchs/entities/match.entity';
import { Personnage } from 'src/personnages/entities/personnage.entity';
import { Supertactique } from 'src/supertactiques/entities/supertactique.entity';
import { Supertechnique } from 'src/supertechniques/entities/supertechnique.entity';
import { Image } from 'src/images/entities/image.entity';
import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class Serie {
  @ApiProperty({
    description: "L'id de la série",
    minimum: 1,
  })
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @ApiProperty({
    description: 'Nom de la série',
  })
  @Column({ nullable: false })
  @IsNotEmpty()
  @IsString()
  nom: string;

  @OneToMany(() => Episode, (episode: Episode) => episode.serie)
  episodes: Episode[];

  @OneToMany(() => Personnage, (personngae: Personnage) => personngae.serie)
  personnages: Personnage[];

  @OneToMany(
    () => Supertechnique,
    (supertechnique: Supertechnique) => supertechnique.serie,
  )
  supertechniques: Supertechnique[];

  @OneToMany(() => Equipe, (equipe: Equipe) => equipe.serie)
  equipes: Equipe[];

  @OneToMany(() => Match, (match: Match) => match.serie)
  matchs: Match[];

  @OneToMany(
    () => Supertactique,
    (supertactique: Supertactique) => supertactique.serie,
  )
  supertactiques: Supertactique[];

  @OneToMany(() => Image, (image: Image) => image.serie)
  images: Image[];
}
