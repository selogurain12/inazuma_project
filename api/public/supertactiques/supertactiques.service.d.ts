import { CreateSupertactiqueDto } from './dto/create-supertactique.dto';
import { UpdateSupertactiqueDto } from './dto/update-supertactique.dto';
import { Supertactique } from './entities/supertactique.entity';
import { Repository } from 'typeorm';
export declare class SupertactiquesService {
    private readonly supertactiqueRepository;
    constructor(supertactiqueRepository: Repository<Supertactique>);
    create(createSupertactiqueDto: CreateSupertactiqueDto): Promise<Supertactique>;
    findAll(): Promise<Supertactique[]>;
    findOne(id: string): Promise<Supertactique>;
    update(id: string, updateSupertactiqueDto: UpdateSupertactiqueDto): Promise<Supertactique>;
    remove(id: string): Promise<string>;
}
