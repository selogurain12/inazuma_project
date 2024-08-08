import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsOptional, IsString } from 'class-validator';
import { Equipe } from 'src/equipes/entities/equipe.entity';
import { Personnage } from 'src/personnages/entities/personnage.entity';

export class CreateImageDto {
  @ApiProperty({ description: "Note sur l'équipe" })
  @IsString()
  @IsOptional()
  note: string;

  @ApiProperty({
    description: 'Id de la série',
  })
  @IsNotEmpty()
  serieId: string;

  @ApiProperty({
    description: "Id de l'épisode",
  })
  @IsNotEmpty()
  episodeId: string;

  @IsNotEmpty()
  images: string;

  @IsOptional()
  equipe: Equipe[];

  @IsOptional()
  personnages: Personnage[];
}
