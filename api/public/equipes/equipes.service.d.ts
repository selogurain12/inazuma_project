import { CreateEquipeDto } from './dto/create-equipe.dto';
import { UpdateEquipeDto } from './dto/update-equipe.dto';
import { Equipe } from './entities/equipe.entity';
import { Repository } from 'typeorm';
export declare class EquipesService {
    private readonly equipeRepository;
    constructor(equipeRepository: Repository<Equipe>);
    create(createEquipeDto: CreateEquipeDto): Promise<Equipe>;
    findAll(): Promise<Equipe[]>;
    findOne(id: string): Promise<Equipe>;
    update(id: string, updateEquipeDto: UpdateEquipeDto): Promise<Equipe>;
    remove(id: string): Promise<string>;
}
