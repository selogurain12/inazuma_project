import { EpisodeData } from "../episodes/episodedata";
import { EquipeData } from "../equipes/equipedata";
import { SerieData } from "../series/seriedata";
import { SupertechniqueData } from "../supertechniques/supertechniquedata";
import { ImageData } from "../images/imagedata";

export interface PersonnageData {
    id: string;
    nom_français_personnage: string;
    nom_original_personnage: string;
    position_personnage: string;
    note: string;
}

export interface Personnage {
    id: string,
    nom_français_personnage: string;
    nom_original_personnage: string;
    position_personnage: string;
    note: string;
    supertechniques: SupertechniqueData[];
    episode: EpisodeData[];
    equipes: EquipeData[];
    serie: SerieData;
    images: ImageData[];
}

export interface PersonnageForm {
    nom_français_personnage: string;
    nom_original_personnage: string | null;
    position_personnage: string | null;
    note: string | null;
    supertechniques: SupertechniqueData[] | null;
    episode: EpisodeData[] | null;
    equipes: EquipeData[] | null;
    serie: SerieData;
    images: ImageData[] | null;
}