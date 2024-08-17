import { Episode } from 'src/episodes/entities/episode.entity';
import { Match } from 'src/matchs/entities/match.entity';
import { Personnage } from 'src/personnages/entities/personnage.entity';
import { Supertactique } from 'src/supertactiques/entities/supertactique.entity';
import { Supertechnique } from 'src/supertechniques/entities/supertechnique.entity';
import { Image } from 'src/images/entities/image.entity';
import { Serie } from 'src/series/entities/series.entity';
export declare class CreateEquipeDto {
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
