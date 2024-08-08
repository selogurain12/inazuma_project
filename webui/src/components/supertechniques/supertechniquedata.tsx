import { EpisodeData } from "../episodes/episodedata";
import { EquipeData } from "../equipes/equipedata";
import { MatchData } from "../matchs/matchdata";
import { PersonnageData } from "../personnages/personnagedata";
import { SerieData } from "../series/seriedata";

export interface CreateSupertechniqueData {
    nom_français_supertechniques: string;
    nom_original_supertechniques: string;
    type_supertechniques: string;
    notes_supertechniques: string;
    obtention_supertechniques: string;
    video: string[];
    equipes: EquipeData[];
    personnages: PersonnageData[];
    episodes: EpisodeData[];
    matchs: MatchData[];
    serie: SerieData;
}

export interface SupertechniqueData {
    id: string;
    nom_français_supertechniques: string;
    nom_original_supertechniques: string;
    type_supertechniques: string;
    notes_supertechniques: string;
    obtention_supertechniques: string;
    video: string[];
}

export interface UpdateSupertechniqueData {
    nom_français_supertechniques: string;
    nom_original_supertechniques: string;
    type_supertechniques: string;
    notes_supertechniques: string;
    obtention_supertechniques: string;
    video: string[];
    equipes: EquipeData[];
    personnages: PersonnageData[];
    episodes: EpisodeData[];
    matchs: MatchData[];
    serie: SerieData;
}

export interface Supertechnique {
    id: string;
    nom_français_supertechniques: string;
    nom_original_supertechniques: string;
    type_supertechniques: string;
    notes_supertechniques: string;
    obtention_supertechniques: string;
    video: string[];
    equipes: EquipeData[];
    personnages: PersonnageData[];
    episodes: EpisodeData[];
    matchs: MatchData[];
    serie: SerieData;
}