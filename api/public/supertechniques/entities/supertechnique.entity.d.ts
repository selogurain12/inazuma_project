import { Episode } from 'src/episodes/entities/episode.entity';
import { Equipe } from 'src/equipes/entities/equipe.entity';
import { Match } from 'src/matchs/entities/match.entity';
import { Personnage } from 'src/personnages/entities/personnage.entity';
import { Serie } from 'src/series/entities/series.entity';
export declare class Supertechnique {
    id: string;
    nom_français_supertechniques: string;
    nom_original_supertechniques: string;
    type_supertechniques: string;
    notes_supertechniques: string;
    obtention_supertechniques: string;
    equipes: Equipe[];
    personnages: Personnage[];
    episodes: Episode[];
    matchs: Match[];
    serie: Serie;
    video: string[];
}
