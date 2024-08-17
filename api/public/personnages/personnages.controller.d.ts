import { PersonnagesService } from './personnages.service';
import { CreatePersonnageDto } from './dto/create-personnage.dto';
import { UpdatePersonnageDto } from './dto/update-personnage.dto';
export declare class PersonnagesController {
    private readonly personnagesService;
    constructor(personnagesService: PersonnagesService);
    create(createPersonnageDto: CreatePersonnageDto): Promise<import("./entities/personnage.entity").Personnage>;
    findAll(): Promise<import("./entities/personnage.entity").Personnage[]>;
    findOne(id: string): Promise<import("./entities/personnage.entity").Personnage>;
    update(id: string, updatePersonnageDto: UpdatePersonnageDto): Promise<import("./entities/personnage.entity").Personnage>;
    remove(id: string): Promise<string>;
}
