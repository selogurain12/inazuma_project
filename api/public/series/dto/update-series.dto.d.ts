import { CreateSerieDto } from './create-series.dto';
import { Episode } from 'src/episodes/entities/episode.entity';
import { Equipe } from 'src/equipes/entities/equipe.entity';
import { Match } from 'src/matchs/entities/match.entity';
import { Personnage } from 'src/personnages/entities/personnage.entity';
import { Supertactique } from 'src/supertactiques/entities/supertactique.entity';
import { Supertechnique } from 'src/supertechniques/entities/supertechnique.entity';
import { Image } from 'src/images/entities/image.entity';
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
