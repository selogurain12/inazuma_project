import { Episode } from '../../episodes/entities/episode.entity';
import { Equipe } from '../../equipes/entities/equipe.entity';
import { Match } from '../../matchs/entities/match.entity';
import { Serie } from '../../series/entities/series.entity';
export declare class Supertactique {
    id: string;
    nom: string;
    serie: Serie;
    equipes: Equipe[];
    matchs: Match[];
    episodes: Episode[];
    video: string[];
}
