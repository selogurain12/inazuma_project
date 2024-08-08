import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsOptional, IsString } from 'class-validator';
import { Episode } from 'src/episodes/entities/episode.entity';
import { Equipe } from 'src/equipes/entities/equipe.entity';
import { Match } from 'src/matchs/entities/match.entity';

export class CreateSupertactiqueDto {
  @ApiProperty({
    description: 'Nom de la supertactique',
  })
  @IsNotEmpty()
  @IsString()
  nom: string;

  @ApiProperty({
    description: 'Id de la série',
  })
  @IsNotEmpty()
  serieId: string;

  @IsOptional()
  equipes: Equipe[];

  @IsOptional()
  matchs: Match[];

  @IsOptional()
  episodes: Episode[];

  @IsString()
  @IsOptional()
  video: string[];
}
