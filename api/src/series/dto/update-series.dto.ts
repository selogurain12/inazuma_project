import { PartialType } from '@nestjs/mapped-types';
import { CreateSerieDto } from './create-series.dto';
import { IsOptional, IsString } from 'class-validator';
import { ApiProperty } from '@nestjs/swagger';
import { Episode } from 'src/episodes/entities/episode.entity';
import { Equipe } from 'src/equipes/entities/equipe.entity';
import { Match } from 'src/matchs/entities/match.entity';
import { Personnage } from 'src/personnages/entities/personnage.entity';
import { Supertactique } from 'src/supertactiques/entities/supertactique.entity';
import { Supertechnique } from 'src/supertechniques/entities/supertechnique.entity';
import { Image } from 'src/images/entities/image.entity';

export class UpdateSerieDto extends PartialType(CreateSerieDto) {
  @ApiProperty({
    description: 'Nom de la série',
  })
  @IsOptional()
  @IsString()
  nom: string;

  @IsOptional()
  episodes: Episode[];

  @IsOptional()
  personnages: Personnage[];

  @IsOptional()
  supertechniques: Supertechnique[];

  @IsOptional()
  equipes: Equipe[];

  @IsOptional()
  matchs: Match[];

  @IsOptional()
  supertactiques: Supertactique[];

  @IsOptional()
  images: Image[];
}
