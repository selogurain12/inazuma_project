import { SupertechniquesService } from './supertechniques.service';
import { CreateSupertechniqueDto } from './dto/create-supertechnique.dto';
import { UpdateSupertechniqueDto } from './dto/update-supertechnique.dto';
export declare class SupertechniquesController {
    private readonly supertechniquesService;
    constructor(supertechniquesService: SupertechniquesService);
    create(createSupertechniqueDto: CreateSupertechniqueDto): Promise<import("./entities/supertechnique.entity").Supertechnique>;
    findAll(): Promise<import("./entities/supertechnique.entity").Supertechnique[]>;
    findOne(id: string): Promise<import("./entities/supertechnique.entity").Supertechnique>;
    update(id: string, updateSupertechniqueDto: UpdateSupertechniqueDto): Promise<import("./entities/supertechnique.entity").Supertechnique>;
    remove(id: string): Promise<string>;
}
