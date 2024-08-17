import { EquipesService } from './equipes.service';
import { CreateEquipeDto } from './dto/create-equipe.dto';
import { UpdateEquipeDto } from './dto/update-equipe.dto';
export declare class EquipesController {
    private readonly equipesService;
    constructor(equipesService: EquipesService);
    create(createEquipeDto: CreateEquipeDto): Promise<import("./entities/equipe.entity").Equipe>;
    findAll(): Promise<import("./entities/equipe.entity").Equipe[]>;
    findOne(id: string): Promise<import("./entities/equipe.entity").Equipe>;
    update(id: string, updateEquipeDto: UpdateEquipeDto): Promise<import("./entities/equipe.entity").Equipe>;
    remove(id: string): Promise<string>;
}
