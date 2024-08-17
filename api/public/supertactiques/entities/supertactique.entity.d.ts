import { Episode } from 'src/episodes/entities/episode.entity';
import { Equipe } from 'src/equipes/entities/equipe.entity';
import { Match } from 'src/matchs/entities/match.entity';
import { Serie } from 'src/series/entities/series.entity';
export declare class Supertactique {
    id: string;
    nom: string;
    serie: Serie;
    equipes: Equipe[];
    matchs: Match[];
    episodes: Episode[];
    video: string[];
}
