import { Serie } from '../../series/entities/series.entity';
import { Supertechnique } from '../../supertechniques/entities/supertechnique.entity';
import { Episode } from '../../episodes/entities/episode.entity';
import { Equipe } from '../../equipes/entities/equipe.entity';
import { Image } from '../../images/entities/image.entity';
export declare class Personnage {
    id: string;
    nom_français_personnage: string;
    nom_original_personnage: string;
    position_personnage: string;
    note: string;
    supertechniques: Supertechnique[];
    episode: Episode[];
    equipes: Equipe[];
    serie: Serie;
    images: Image[];
}
