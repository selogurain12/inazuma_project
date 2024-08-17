import { Episode } from 'src/episodes/entities/episode.entity';
import { Equipe } from 'src/equipes/entities/equipe.entity';
import { Match } from 'src/matchs/entities/match.entity';
export declare class CreateSupertactiqueDto {
    nom: string;
    serieId: string;
    equipes: Equipe[];
    matchs: Match[];
    episodes: Episode[];
    video: string[];
}
