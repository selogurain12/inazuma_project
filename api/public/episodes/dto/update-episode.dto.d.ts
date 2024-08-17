import { CreateEpisodeDto } from './create-episode.dto';
import { Equipe } from 'src/equipes/entities/equipe.entity';
import { Match } from 'src/matchs/entities/match.entity';
import { Personnage } from 'src/personnages/entities/personnage.entity';
import { Supertactique } from 'src/supertactiques/entities/supertactique.entity';
import { Supertechnique } from 'src/supertechniques/entities/supertechnique.entity';
import { Image } from 'src/images/entities/image.entity';
declare const UpdateEpisodeDto_base: import("@nestjs/common").Type<Partial<CreateEpisodeDto>>;
export declare class UpdateEpisodeDto extends UpdateEpisodeDto_base {
    titre: string;
    titre_original: string;
    numepisode: number;
    saison: number;
    scenario: string;
    diffusion_originale: string;
    resume: string;
    note: string;
    video: string;
    serieId: string;
    equipes: Equipe[];
    personnages: Personnage[];
    matchs: Match[];
    supertactiques: Supertactique[];
    supertechniques: Supertechnique[];
    images: Image[];
}
export {};
