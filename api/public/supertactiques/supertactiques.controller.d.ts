import { SupertactiquesService } from './supertactiques.service';
import { CreateSupertactiqueDto } from './dto/create-supertactique.dto';
import { UpdateSupertactiqueDto } from './dto/update-supertactique.dto';
export declare class SupertactiquesController {
    private readonly supertactiquesService;
    constructor(supertactiquesService: SupertactiquesService);
    create(createSupertactiqueDto: CreateSupertactiqueDto): Promise<import("./entities/supertactique.entity").Supertactique>;
    findAll(): Promise<import("./entities/supertactique.entity").Supertactique[]>;
    findOne(id: string): Promise<import("./entities/supertactique.entity").Supertactique>;
    update(id: string, updateSupertactiqueDto: UpdateSupertactiqueDto): Promise<import("./entities/supertactique.entity").Supertactique>;
    remove(id: string): Promise<string>;
}
