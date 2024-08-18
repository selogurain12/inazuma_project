import { CreateEquipeDto } from './create-equipe.dto';
import { Episode } from '../../episodes/entities/episode.entity';
import { Match } from '../../matchs/entities/match.entity';
import { Personnage } from '../../personnages/entities/personnage.entity';
import { Supertactique } from '../../supertactiques/entities/supertactique.entity';
import { Supertechnique } from '../../supertechniques/entities/supertechnique.entity';
import { Image } from '../../images/entities/image.entity';
declare const UpdateEquipeDto_base: import("@nestjs/common").Type<Partial<CreateEquipeDto>>;
export declare class UpdateEquipeDto extends UpdateEquipeDto_base {
    nom_francais_equipe: string;
    nom_original_equipe: string;
    note: string;
    capitaines: Personnage[];
    joueurs: Personnage[];
    manageurs: Personnage[];
    supertactiques: Supertactique[];
    supertechniques: Supertechnique[];
    matchs: Match[];
    serieId: string;
    episodes: Episode[];
    entraineur: Personnage[];
    images: Image[];
}
export {};
