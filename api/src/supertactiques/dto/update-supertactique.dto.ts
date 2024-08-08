import { ApiProperty, PartialType } from '@nestjs/swagger';
import { CreateSupertactiqueDto } from './create-supertactique.dto';
import { IsOptional, IsString } from 'class-validator';
import { Episode } from 'src/episodes/entities/episode.entity';
import { Equipe } from 'src/equipes/entities/equipe.entity';
import { Match } from 'src/matchs/entities/match.entity';

export class UpdateSupertactiqueDto extends PartialType(
  CreateSupertactiqueDto,
) {
  @ApiProperty({
    description: 'Nom de la supertactique',
  })
  @IsOptional()
  @IsString()
  nom: string;

  @ApiProperty({
    description: 'Id de la série',
  })
  @IsOptional()
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
