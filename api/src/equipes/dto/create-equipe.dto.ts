import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsOptional, IsString } from 'class-validator';
import { Episode } from 'src/episodes/entities/episode.entity';
import { Match } from 'src/matchs/entities/match.entity';
import { Personnage } from 'src/personnages/entities/personnage.entity';
import { Supertactique } from 'src/supertactiques/entities/supertactique.entity';
import { Supertechnique } from 'src/supertechniques/entities/supertechnique.entity';
import { Image } from 'src/images/entities/image.entity';
import { Serie } from 'src/series/entities/series.entity';

export class CreateEquipeDto {
  @ApiProperty({ description: "Nom français de l'équipe" })
  @IsNotEmpty()
  @IsString()
  nom_francais_equipe: string;

  @ApiProperty({ description: "Nom original de l'équipe" })
  @IsString()
  @IsOptional()
  nom_original_equipe: string;

  @ApiProperty({ description: "Note sur l'équipe" })
  @IsString()
  @IsOptional()
  note: string;

  @ApiProperty({ description: "Capitaine de l'équipe" })
  @IsOptional()
  capitaines: Personnage[];

  @ApiProperty({ description: "Joueurs de l'équipe" })
  @IsOptional()
  joueurs: Personnage[];

  @ApiProperty({ description: "Manageur de l'équipe" })
  @IsOptional()
  manageurs: Personnage[];

  @ApiProperty({ description: "Supertactique utilisé par l'équipe" })
  @IsOptional()
  supertactiques: Supertactique[];

  @ApiProperty({ description: "Supertechnique utilisé par l'équipe" })
  @IsOptional()
  supertechniques: Supertechnique[];

  @IsOptional()
  matchs: Match[];

  @ApiProperty({
    description: 'Id de la série',
  })
  @IsNotEmpty()
  serie: Serie;

  @IsOptional()
  episodes: Episode[];

  @IsOptional()
  entraineur: Personnage[];

  @IsOptional()
  images: Image[];
}
