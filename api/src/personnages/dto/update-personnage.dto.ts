import { ApiProperty, PartialType } from '@nestjs/swagger';
import { CreatePersonnageDto } from './create-personnage.dto';
import { IsString, IsOptional } from 'class-validator';
import { Episode } from 'src/episodes/entities/episode.entity';
import { Equipe } from 'src/equipes/entities/equipe.entity';
import { Image } from 'src/images/entities/image.entity';
import { Supertechnique } from 'src/supertechniques/entities/supertechnique.entity';

export class UpdatePersonnageDto extends PartialType(CreatePersonnageDto) {
  @ApiProperty({
    description: 'Nom français du personnage',
  })
  @IsOptional()
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
  @IsOptional()
  serieId: string;

  @IsOptional()
  images: Image[];
  updatePersonnageDto: Supertechnique;
}
