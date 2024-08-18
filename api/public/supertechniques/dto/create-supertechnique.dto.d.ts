import { Episode } from '../../episodes/entities/episode.entity';
import { Equipe } from '../../equipes/entities/equipe.entity';
import { Match } from '../../matchs/entities/match.entity';
import { Personnage } from '../../personnages/entities/personnage.entity';
export declare class CreateSupertechniqueDto {
    nom_français_supertechniques: string;
    nom_original_supertechniques: string;
    type_supertechniques: string;
    notes_supertechniques: string;
    obtention_supertechniques: string;
    equipes: Equipe[];
    personnages: Personnage[];
    episodes: Episode[];
    matchs: Match[];
    serieId: string;
    video: string[];
}
