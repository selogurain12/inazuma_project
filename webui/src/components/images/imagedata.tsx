import { EpisodeData } from "../episodes/episodedata";
import { EquipeData } from "../equipes/equipedata";
import { PersonnageData } from "../personnages/personnagedata";
import { SerieData } from "../series/seriedata";

export interface CreateImageData {
    note: string;
    images: string;
    serie: SerieData;
    episode: EpisodeData;
    equipe: EquipeData[];
    personnages: PersonnageData[];
}

export interface ImageData {
    id: string;
    note: string;
    images: string;
}

export interface UpdateImageData {
    note: string;
    images: string;
    serie: SerieData;
    episode: EpisodeData;
    equipe: EquipeData[];
    personnages: PersonnageData[];
}