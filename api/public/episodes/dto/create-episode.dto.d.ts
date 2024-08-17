import { Equipe } from 'src/equipes/entities/equipe.entity';
import { Match } from 'src/matchs/entities/match.entity';
import { Personnage } from 'src/personnages/entities/personnage.entity';
import { Supertactique } from 'src/supertactiques/entities/supertactique.entity';
import { Supertechnique } from 'src/supertechniques/entities/supertechnique.entity';
import { Image } from 'src/images/entities/image.entity';
import { Serie } from 'src/series/entities/series.entity';
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
