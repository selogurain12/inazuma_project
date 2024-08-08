import { ApiProperty, PartialType } from '@nestjs/swagger';
import { CreateEpisodeDto } from './create-episode.dto';
import { IsString, IsNumber, IsDateString, IsOptional } from 'class-validator';
import { Equipe } from 'src/equipes/entities/equipe.entity';
import { Match } from 'src/matchs/entities/match.entity';
import { Personnage } from 'src/personnages/entities/personnage.entity';
import { Supertactique } from 'src/supertactiques/entities/supertactique.entity';
import { Supertechnique } from 'src/supertechniques/entities/supertechnique.entity';
import { Image } from 'src/images/entities/image.entity';

export class UpdateEpisodeDto extends PartialType(CreateEpisodeDto) {
  @ApiProperty({
    description: "Le titre de l'épisode",
  })
  @IsString()
  @IsOptional()
  titre: string;

  @ApiProperty({
    description: "Le titre de l'épisode",
  })
  @IsString()
  @IsOptional()
  titre_original: string;

  @ApiProperty({
    description: "Le numéro de l'épisode",
    minimum: 1,
  })
  @IsNumber()
  @IsOptional()
  numepisode: number;

  @ApiProperty({
    description: 'Le numéro de la saison',
    minimum: 1,
  })
  @IsNumber()
  @IsOptional()
  saison: number;

  @ApiProperty({
    description: "Le scénariste de l'épisode",
  })
  @IsString()
  @IsOptional()
  scenario: string;

  @ApiProperty({
    description: "Diffusion originale de l'épisode",
  })
  @IsDateString()
  @IsOptional()
  diffusion_originale: string;

  @ApiProperty({
    description: "Le résumé de l'épisode",
  })
  @IsString()
  @IsOptional()
  resume: string;

  @ApiProperty({
    description: "Note(s) sur l'épisode",
  })
  @IsOptional()
  note: string;

  @ApiProperty({
    description: 'Lien vers la vidéo',
  })
  @IsString()
  @IsOptional()
  video: string;

  @ApiProperty({
    description: 'Id de la série',
  })
  serieId: string;

  @ApiProperty({
    description: "Equipes présentent dans l'épisode",
  })
  @IsOptional()
  equipes: Equipe[];

  @ApiProperty({
    description: "Personnages présents lors de l'épisode",
  })
  @IsOptional()
  personnages: Personnage[];

  @ApiProperty({
    description: "Match de l'épisode",
  })
  @IsOptional()
  matchs: Match[];

  @ApiProperty({
    description: "Supertactiques de l'épisode",
  })
  @IsOptional()
  supertactiques: Supertactique[];

  @ApiProperty({
    description: "Supertechniques de l'épisode",
  })
  @IsOptional()
  supertechniques: Supertechnique[];

  @IsOptional()
  images: Image[];
}
