import { CreateSupertactiqueDto } from './create-supertactique.dto';
import { Episode } from '../../episodes/entities/episode.entity';
import { Equipe } from '../../equipes/entities/equipe.entity';
import { Match } from '../../matchs/entities/match.entity';
declare const UpdateSupertactiqueDto_base: import("@nestjs/common").Type<Partial<CreateSupertactiqueDto>>;
export declare class UpdateSupertactiqueDto extends UpdateSupertactiqueDto_base {
    nom: string;
    serieId: string;
    equipes: Equipe[];
    matchs: Match[];
    episodes: Episode[];
    video: string[];
}
export {};
