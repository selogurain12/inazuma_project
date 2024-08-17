import { Episode } from 'src/episodes/entities/episode.entity';
import { Supertactique } from 'src/supertactiques/entities/supertactique.entity';
import { Supertechnique } from 'src/supertechniques/entities/supertechnique.entity';
export declare class CreateMatchDto {
    id_equipe_1: string;
    id_equipe_2: string;
    notes: string;
    episodes: Episode[];
    supertechniques: Supertechnique[];
    supetactiques: Supertactique[];
    serieId: string;
    compo_equipe_1: string;
    compo_equipe_2: string;
}
