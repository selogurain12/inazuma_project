import { Equipe } from 'src/equipes/entities/equipe.entity';
import { Personnage } from 'src/personnages/entities/personnage.entity';
export declare class CreateImageDto {
    note: string;
    serieId: string;
    episodeId: string;
    images: string;
    equipe: Equipe[];
    personnages: Personnage[];
}
