import { CreateEquipeDto } from './create-equipe.dto';
import { Episode } from 'src/episodes/entities/episode.entity';
import { Match } from 'src/matchs/entities/match.entity';
import { Personnage } from 'src/personnages/entities/personnage.entity';
import { Supertactique } from 'src/supertactiques/entities/supertactique.entity';
import { Supertechnique } from 'src/supertechniques/entities/supertechnique.entity';
import { Image } from 'src/images/entities/image.entity';
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
