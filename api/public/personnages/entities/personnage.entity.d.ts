import { Serie } from 'src/series/entities/series.entity';
import { Supertechnique } from 'src/supertechniques/entities/supertechnique.entity';
import { Episode } from 'src/episodes/entities/episode.entity';
import { Equipe } from 'src/equipes/entities/equipe.entity';
import { Image } from 'src/images/entities/image.entity';
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
