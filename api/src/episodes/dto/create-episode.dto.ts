import {
  IsDateString,
  IsNotEmpty,
  IsNumber,
  IsOptional,
  IsString,
} from 'class-validator';
import { Equipe } from 'src/equipes/entities/equipe.entity';
import { Match } from 'src/matchs/entities/match.entity';
import { Personnage } from 'src/personnages/entities/personnage.entity';
import { Supertactique } from 'src/supertactiques/entities/supertactique.entity';
import { Supertechnique } from 'src/supertechniques/entities/supertechnique.entity';
import { Image } from 'src/images/entities/image.entity';
import { Serie } from 'src/series/entities/series.entity';

export class CreateEpisodeDto {
  @IsString()
  @IsNotEmpty()
  titre: string;

  @IsString()
  @IsNotEmpty()
  titre_original: string;

  @IsNumber()
  @IsNotEmpty()
  numepisode: number;

  @IsNumber()
  @IsNotEmpty()
  saison: number;

  @IsString()
  @IsNotEmpty()
  scenario: string;

  @IsDateString()
  @IsNotEmpty()
  diffusion_originale: string;

  @IsString()
  @IsNotEmpty()
  resume: string;

  @IsString()
  @IsOptional()
  note: string;

  @IsString()
  @IsNotEmpty()
  video: string;

  @IsNotEmpty()
  serie: Serie;

  @IsOptional()
  equipes: Equipe[];

  @IsOptional()
  personnages: Personnage[];

  @IsOptional()
  matchs: Match[];

  @IsOptional()
  supertactiques: Supertactique[];

  @IsOptional()
  supertechniques: Supertechnique[];

  @IsOptional()
  images: Image[];
}
