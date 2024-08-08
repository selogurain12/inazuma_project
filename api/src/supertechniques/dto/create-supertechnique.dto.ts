import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsOptional, IsString } from 'class-validator';
import { Episode } from 'src/episodes/entities/episode.entity';
import { Equipe } from 'src/equipes/entities/equipe.entity';
import { Match } from 'src/matchs/entities/match.entity';
import { Personnage } from 'src/personnages/entities/personnage.entity';

export class CreateSupertechniqueDto {
  @ApiProperty({
    description: 'Nom français de la supertechnique',
  })
  @IsNotEmpty()
  @IsString()
  nom_français_supertechniques: string;

  @ApiProperty({
    description: 'Nom original de la supertechnique',
  })
  @IsOptional()
  @IsString()
  nom_original_supertechniques: string;

  @ApiProperty({
    description: 'Type de la supertechnique',
  })
  @IsNotEmpty()
  @IsString()
  type_supertechniques: string;

  @ApiProperty({
    description: 'Note(s) sur la supertechnique',
  })
  @IsOptional()
  @IsString()
  notes_supertechniques: string;

  @ApiProperty({
    description: 'Obtention de la supertechnique',
  })
  @IsOptional()
  @IsString()
  obtention_supertechniques: string;

  @IsOptional()
  equipes: Equipe[];

  @IsOptional()
  personnages: Personnage[];

  @IsOptional()
  episodes: Episode[];

  @IsOptional()
  matchs: Match[];

  @ApiProperty({
    description: 'Id de la série',
  })
  @IsNotEmpty()
  serieId: string;

  @IsOptional()
  video: string[];
}
