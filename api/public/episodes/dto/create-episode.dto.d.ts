import { Equipe } from '../../equipes/entities/equipe.entity';
import { Match } from '../../matchs/entities/match.entity';
import { Personnage } from '../../personnages/entities/personnage.entity';
import { Supertactique } from '../../supertactiques/entities/supertactique.entity';
import { Supertechnique } from '../../supertechniques/entities/supertechnique.entity';
import { Image } from '../../images/entities/image.entity';
import { Serie } from '../../series/entities/series.entity';
export declare class CreateEpisodeDto {
    titre: string;
    titre_original: string;
    numepisode: number;
    saison: number;
    scenario: string;
    diffusion_originale: string;
    resume: string;
    note: string;
    video: string;
    serie: Serie;
    equipes: Equipe[];
    personnages: Personnage[];
    matchs: Match[];
    supertactiques: Supertactique[];
    supertechniques: Supertechnique[];
    images: Image[];
}
