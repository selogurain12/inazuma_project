import { Equipe } from '../../equipes/entities/equipe.entity';
import { Personnage } from '../../personnages/entities/personnage.entity';
export declare class CreateImageDto {
    note: string;
    serieId: string;
    episodeId: string;
    images: string;
    equipe: Equipe[];
    personnages: Personnage[];
}
