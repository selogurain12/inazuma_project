import { EpisodeData } from "../episodes/episodedata";
import { EquipeData } from "../equipes/equipedata";
import { SerieData } from "../series/seriedata";
import { SupertactiqueData } from "../supertactiques/supertactiquedata";
import { SupertechniqueData } from "../supertechniques/supertechniquedata";

export interface CreateMatchData {
    id_equipe_1: string;
    id_equipe_2: string;
    notes: string;
    compo_equipe_1: string;
    compo_equipe_2: string;
    episodes: EpisodeData[];
    supertechniques: SupertechniqueData[];
    supertactiques: SupertactiqueData[];
    serie: SerieData;
}

export interface MatchData {
    id: string;
    id_equipe_1: EquipeData;
    id_equipe_2: EquipeData;
    notes: string;
    compo_equipe_1: string;
    compo_equipe_2: string;
}

export interface UpdateMatchData {
    id_equipe_1: string;
    id_equipe_2: string;
    notes: string;
    compo_equipe_1: string;
    compo_equipe_2: string;
    episodes: EpisodeData[];
    supertechniques: SupertechniqueData[];
    supertactiques: SupertactiqueData[];
    serie: SerieData;
}