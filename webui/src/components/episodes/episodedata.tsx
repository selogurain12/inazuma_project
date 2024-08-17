import { EquipeData } from "../equipes/equipedata";
import { MatchData } from "../matchs/matchdata";
import { PersonnageData } from "../personnages/personnagedata";
import { SerieData } from "../series/seriedata";
import { SupertactiqueData } from "../supertactiques/supertactiquedata";
import { SupertechniqueData } from "../supertechniques/supertechniquedata";
import { ImageData } from "../images/imagedata";

export interface EpisodeForm {
    titre: string;
    titre_original: string | null;
    numepisode: number;
    saison: number;
    scenario: string | null;
    diffusion_originale: Date | null;
    resume: string | null;
    note: string | null;
    video: string | null;
    supertechniques: SupertechniqueData[] | null;
    equipes: EquipeData[] | null;
    serie: SerieData;
    images: ImageData[] | null;
    personnages: PersonnageData[] | null;
    matchs: MatchData[] | null;
    supertactiques: SupertactiqueData[] | null;
}

export interface EpisodeData {
    id: string;
    titre: string;
    titre_original: string;
    numepisode: number;
    saison: number;
    scenario: string;
    diffusion_originale: Date;
    resume: string;
    note: string;
    video: string;
}

export interface Episode {
    id: string;
    titre: string;
    titre_original: string;
    numepisode: number;
    saison: number;
    scenario: string;
    diffusion_originale: Date;
    resume: string;
    note: string;
    video: string;
    supertechniques: SupertechniqueData[];
    equipes: EquipeData[];
    serie: SerieData;
    images: ImageData[];
    personnages: PersonnageData[];
    matchs: MatchData[];
    supertactiques: SupertactiqueData[];
}