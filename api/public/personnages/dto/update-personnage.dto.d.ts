import { CreatePersonnageDto } from './create-personnage.dto';
import { Episode } from 'src/episodes/entities/episode.entity';
import { Equipe } from 'src/equipes/entities/equipe.entity';
import { Image } from 'src/images/entities/image.entity';
import { Supertechnique } from 'src/supertechniques/entities/supertechnique.entity';
declare const UpdatePersonnageDto_base: import("@nestjs/common").Type<Partial<CreatePersonnageDto>>;
export declare class UpdatePersonnageDto extends UpdatePersonnageDto_base {
    nom_français_personnage: string;
    nom_original_personnage: string;
    position_personnage: string;
    note: string;
    supertechniques: Supertechnique[];
    episode: Episode[];
    equipes: Equipe[];
    serieId: string;
    images: Image[];
    updatePersonnageDto: Supertechnique;
}
export {};
