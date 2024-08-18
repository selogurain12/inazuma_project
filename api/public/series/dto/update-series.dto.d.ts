import { CreateSerieDto } from './create-series.dto';
import { Episode } from '../../episodes/entities/episode.entity';
import { Equipe } from '../../equipes/entities/equipe.entity';
import { Match } from '../../matchs/entities/match.entity';
import { Personnage } from '../../personnages/entities/personnage.entity';
import { Supertactique } from '../../supertactiques/entities/supertactique.entity';
import { Supertechnique } from '../../supertechniques/entities/supertechnique.entity';
import { Image } from '../../images/entities/image.entity';
declare const UpdateSerieDto_base: import("@nestjs/mapped-types").MappedType<Partial<CreateSerieDto>>;
export declare class UpdateSerieDto extends UpdateSerieDto_base {
    nom: string;
    episodes: Episode[];
    personnages: Personnage[];
    supertechniques: Supertechnique[];
    equipes: Equipe[];
    matchs: Match[];
    supertactiques: Supertactique[];
    images: Image[];
}
export {};
