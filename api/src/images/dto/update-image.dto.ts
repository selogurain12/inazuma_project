import { ApiProperty, PartialType } from '@nestjs/swagger';
import { CreateImageDto } from './create-image.dto';
import { IsOptional, IsString } from 'class-validator';
import { Equipe } from 'src/equipes/entities/equipe.entity';
import { Personnage } from 'src/personnages/entities/personnage.entity';

export class UpdateImageDto extends PartialType(CreateImageDto) {
  @ApiProperty({ description: "Note sur l'équipe" })
  @IsString()
  @IsOptional()
  note: string;

  @ApiProperty({
    description: 'Id de la série',
  })
  @IsOptional()
  serieId: string;

  @ApiProperty({
    description: "Id de l'épisode",
  })
  @IsOptional()
  episodeId: string;

  @IsOptional()
  images: string;

  @IsOptional()
  equipe: Equipe[];

  @IsOptional()
  personnages: Personnage[];
}
