import { Episode } from '../../episodes/entities/episode.entity';
import { Equipe } from '../../equipes/entities/equipe.entity';
import { Personnage } from '../../personnages/entities/personnage.entity';
import { Serie } from '../../series/entities/series.entity';
export declare class Image {
    id: string;
    note: string;
    serie: Serie;
    episode: Episode;
    images: string;
    equipe: Equipe[];
    personnages: Personnage[];
}
