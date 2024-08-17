import { CreateImageDto } from './create-image.dto';
import { Equipe } from 'src/equipes/entities/equipe.entity';
import { Personnage } from 'src/personnages/entities/personnage.entity';
declare const UpdateImageDto_base: import("@nestjs/common").Type<Partial<CreateImageDto>>;
export declare class UpdateImageDto extends UpdateImageDto_base {
    note: string;
    serieId: string;
    episodeId: string;
    images: string;
    equipe: Equipe[];
    personnages: Personnage[];
}
export {};
