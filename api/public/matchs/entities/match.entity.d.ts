import { Serie } from 'src/series/entities/series.entity';
import { Equipe } from 'src/equipes/entities/equipe.entity';
import { Episode } from 'src/episodes/entities/episode.entity';
import { Supertechnique } from 'src/supertechniques/entities/supertechnique.entity';
import { Supertactique } from 'src/supertactiques/entities/supertactique.entity';
export declare class Match {
    id: string;
    id_equipe_1: Equipe;
    id_equipe_2: Equipe;
    notes: string;
    episodes: Episode[];
    supertechniques: Supertechnique[];
    supertactiques: Supertactique[];
    serie: Serie;
    compo_equipe_1: string;
    compo_equipe_2: string;
}
