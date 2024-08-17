import { Episode } from 'src/episodes/entities/episode.entity';
import { Equipe } from 'src/equipes/entities/equipe.entity';
import { Supertechnique } from 'src/supertechniques/entities/supertechnique.entity';
import { Image } from 'src/images/entities/image.entity';
import { Serie } from 'src/series/entities/series.entity';
export declare class CreatePersonnageDto {
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
