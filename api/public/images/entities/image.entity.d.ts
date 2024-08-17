import { Episode } from 'src/episodes/entities/episode.entity';
import { Equipe } from 'src/equipes/entities/equipe.entity';
import { Personnage } from 'src/personnages/entities/personnage.entity';
import { Serie } from 'src/series/entities/series.entity';
export declare class Image {
    id: string;
    note: string;
    serie: Serie;
    episode: Episode;
    images: string;
    equipe: Equipe[];
    personnages: Personnage[];
}
