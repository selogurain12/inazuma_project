import { EpisodeData } from "../episodes/episodedata";
import { MatchData } from "../matchs/matchdata";
import { PersonnageData } from "../personnages/personnagedata";
import { SerieData } from "../series/seriedata";
import { SupertactiqueData } from "../supertactiques/supertactiquedata";
import { SupertechniqueData } from "../supertechniques/supertechniquedata";
import { ImageData } from "../images/imagedata";

export interface EquipeForm {
    nom_francais_equipe: string;
    nom_original_equipe: string | null;
    note: string | null;
    capitaines: PersonnageData[] | null;
    joueurs: PersonnageData[] | null;
    manageurs: PersonnageData[] | null;
    supertactiques: SupertactiqueData[] | null;
    supertechniques: SupertechniqueData[] | null;
    matchs: MatchData[] | null;
    serie: SerieData;
    episodes: EpisodeData[] | null;
    entraineur: PersonnageData[] | null;
    images: ImageData[] | null;
}

export interface EquipeData {
    id: string;
    nom_francais_equipe: string;
    nom_original_equipe: string;
    note: string;
}

export interface Equipe {
    id: string,
    nom_francais_equipe: string;
    nom_original_equipe: string;
    note: string;
    capitaines: PersonnageData[];
    joueurs: PersonnageData[];
    manageurs: PersonnageData[];
    supertactiques: SupertactiqueData[];
    supertechniques: SupertechniqueData[];
    matchs: MatchData[];
    serie: SerieData;
    episodes: EpisodeData[];
    entraineur: PersonnageData[];
    images: ImageData[];
}