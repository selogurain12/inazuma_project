import { Episode } from '../../episodes/entities/episode.entity';
import { Image } from '../../images/entities/image.entity';
import { Match } from '../../matchs/entities/match.entity';
import { Personnage } from '../../personnages/entities/personnage.entity';
import { Serie } from '../../series/entities/series.entity';
import { Supertactique } from '../../supertactiques/entities/supertactique.entity';
import { Supertechnique } from '../../supertechniques/entities/supertechnique.entity';
export declare class Equipe {
    id: string;
    nom_francais_equipe: string;
    nom_original_equipe: string;
    note: string;
    capitaines: Personnage[];
    joueurs: Personnage[];
    manageurs: Personnage[];
    supertactiques: Supertactique[];
    supertechniques: Supertechnique[];
    matchs: Match[];
    serie: Serie;
    episodes: Episode[];
    entraineur: Personnage[];
    images: Image[];
}
