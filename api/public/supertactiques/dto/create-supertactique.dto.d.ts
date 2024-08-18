import { Episode } from '../../episodes/entities/episode.entity';
import { Equipe } from '../../equipes/entities/equipe.entity';
import { Match } from '../../matchs/entities/match.entity';
export declare class CreateSupertactiqueDto {
    nom: string;
    serieId: string;
    equipes: Equipe[];
    matchs: Match[];
    episodes: Episode[];
    video: string[];
}
