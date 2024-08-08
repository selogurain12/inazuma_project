import { ApiProperty } from '@nestjs/swagger';
import { IsString, IsNotEmpty, IsOptional } from 'class-validator';
import { Episode } from 'src/episodes/entities/episode.entity';
import { Supertactique } from 'src/supertactiques/entities/supertactique.entity';
import { Supertechnique } from 'src/supertechniques/entities/supertechnique.entity';

export class CreateMatchDto {
  @ApiProperty({
    description: "Id de l'équipe 1",
  })
  @IsNotEmpty()
  id_equipe_1: string;

  @ApiProperty({
    description: "Id de l'équipe 2",
  })
  @IsNotEmpty()
  id_equipe_2: string;

  @ApiProperty({
    description: 'Notes sur le match',
  })
  @IsString()
  @IsOptional()
  notes: string;

  @IsOptional()
  episodes: Episode[];

  @IsOptional()
  supertechniques: Supertechnique[];

  @IsOptional()
  supetactiques: Supertactique[];

  @ApiProperty({
    description: 'Id de la série',
  })
  @IsNotEmpty()
  serieId: string;

  @IsOptional()
  compo_equipe_1: string;

  @IsOptional()
  compo_equipe_2: string;
}
