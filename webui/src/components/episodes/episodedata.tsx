import { EquipeData } from "../equipes/equipedata";
import { MatchData } from "../matchs/matchdata";
import { PersonnageData } from "../personnages/personnagedata";
import { SerieData } from "../series/seriedata";
import { SupertactiqueData } from "../supertactiques/supertactiquedata";
import { SupertechniqueData } from "../supertechniques/supertechniquedata";

export interface CreateEpisodeData {
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

export interface UpdateEpisodeData {
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