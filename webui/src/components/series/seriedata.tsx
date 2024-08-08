import { EpisodeData } from "../episodes/episodedata";
import { EquipeData } from "../equipes/equipedata";
import { MatchData } from "../matchs/matchdata";
import { PersonnageData } from "../personnages/personnagedata";
import { SupertactiqueData } from "../supertactiques/supertactiquedata";
import { SupertechniqueData } from "../supertechniques/supertechniquedata";

export interface CreateSerieData {
    nom: string;
    episodes: EpisodeData[];
    personnages: PersonnageData[];
    supertechniques: SupertechniqueData[];
    equipes: EquipeData[];
    matchs: MatchData[];
    supertactiques: SupertactiqueData[];
    images: ImageData[];
}

export interface SerieData {
    id: string;
    nom: string;
}

export interface UpdateSerieData {
    nom: string;
    episodes: EpisodeData[];
    personnages: PersonnageData[];
    supertechniques: SupertechniqueData[];
    equipes: EquipeData[];
    matchs: MatchData[];
    supertactiques: SupertactiqueData[];
    images: ImageData[];
}