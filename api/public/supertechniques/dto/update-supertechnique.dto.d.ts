import { CreateSupertechniqueDto } from './create-supertechnique.dto';
import { Episode } from 'src/episodes/entities/episode.entity';
import { Equipe } from 'src/equipes/entities/equipe.entity';
import { Match } from 'src/matchs/entities/match.entity';
import { Personnage } from 'src/personnages/entities/personnage.entity';
declare const UpdateSupertechniqueDto_base: import("@nestjs/common").Type<Partial<CreateSupertechniqueDto>>;
export declare class UpdateSupertechniqueDto extends UpdateSupertechniqueDto_base {
    nom_français_supertechniques: string;
    nom_original_supertechniques: string;
    type_supertechniques: string;
    notes_supertechniques: string;
    obtention_supertechniques: string;
    equipes: Equipe[];
    personnages: Personnage[];
    episodes: Episode[];
    matchs: Match[];
    serieId: string;
    video: string[];
}
export {};
