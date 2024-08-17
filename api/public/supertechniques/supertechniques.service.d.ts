import { CreateSupertechniqueDto } from './dto/create-supertechnique.dto';
import { UpdateSupertechniqueDto } from './dto/update-supertechnique.dto';
import { Supertechnique } from './entities/supertechnique.entity';
import { Repository } from 'typeorm';
export declare class SupertechniquesService {
    private readonly supertechniqueRepository;
    constructor(supertechniqueRepository: Repository<Supertechnique>);
    create(createSupertechniqueDto: CreateSupertechniqueDto): Promise<Supertechnique>;
    findAll(): Promise<Supertechnique[]>;
    findOne(id: string): Promise<Supertechnique>;
    update(id: string, updateSupertechniqueDto: UpdateSupertechniqueDto): Promise<Supertechnique>;
    remove(id: string): Promise<string>;
}
