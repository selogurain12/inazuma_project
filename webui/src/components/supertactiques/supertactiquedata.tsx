import { EpisodeData } from "../episodes/episodedata";
import { EquipeData } from "../equipes/equipedata";
import { MatchData } from "../matchs/matchdata";
import { SerieData } from "../series/seriedata";

export interface CreateSupertactiqueData {
    nom: string;
    video: string[];
    serie: SerieData;
    equipes: EquipeData[];
    matchs: MatchData[];
    episodes: EpisodeData[];
}

export interface SupertactiqueData {
    id: string;
    nom: string;
    video: string[];
}

export interface UpdateSupertactiqueData {
    nom: string;
    video: string[];
    serie: SerieData;
    equipes: EquipeData[];
    matchs: MatchData[];
    episodes: EpisodeData[];
}