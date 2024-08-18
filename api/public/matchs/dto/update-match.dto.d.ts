import { Episode } from '../../episodes/entities/episode.entity';
import { Supertactique } from '../../supertactiques/entities/supertactique.entity';
import { Supertechnique } from '../../supertechniques/entities/supertechnique.entity';
export declare class UpdateMatchDto {
    id_equipe_1: string;
    id_equipe_2: string;
    notes: string;
    episodes: Episode[];
    supertechniques: Supertechnique[];
    supertactiques: Supertactique[];
    serieId: string;
    compo_equipe_1: string;
    compo_equipe_2: string;
}
