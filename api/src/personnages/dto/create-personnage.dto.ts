import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsOptional, IsString } from 'class-validator';
import { Episode } from 'src/episodes/entities/episode.entity';
import { Equipe } from 'src/equipes/entities/equipe.entity';
import { Supertechnique } from 'src/supertechniques/entities/supertechnique.entity';
import { Image } from 'src/images/entities/image.entity';
import { Serie } from 'src/series/entities/series.entity';

export class CreatePersonnageDto {
  @ApiProperty({
    description: 'Nom français du personnage',
  })
  @IsNotEmpty()
  @IsString()
  nom_français_personnage: string;

  @ApiProperty({
    description: 'Nom original du personnage',
  })
  @IsOptional()
  @IsString()
  nom_original_personnage: string;

  @ApiProperty({
    description: 'Position du personnage',
  })
  @IsOptional()
  @IsString()
  position_personnage: string;

  @ApiProperty({
    description: 'Note sur le personnage',
  })
  @IsOptional()
  @IsString()
  note: string;

  @ApiProperty({
    description: 'Supertechniques de personnage',
  })
  @IsOptional()
  supertechniques: Supertechnique[];

  @IsOptional()
  episode: Episode[];

  @IsOptional()
  equipes: Equipe[];

  @ApiProperty({
    description: 'Id de la série',
  })
  @IsNotEmpty()
  serie: Serie;

  @IsOptional()
  images: Image[];
}
