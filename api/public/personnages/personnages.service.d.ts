import { CreatePersonnageDto } from './dto/create-personnage.dto';
import { UpdatePersonnageDto } from './dto/update-personnage.dto';
import { Personnage } from './entities/personnage.entity';
import { Repository } from 'typeorm';
export declare class PersonnagesService {
    private readonly personnageRepository;
    constructor(personnageRepository: Repository<Personnage>);
    create(createPersonnageDto: CreatePersonnageDto): Promise<Personnage>;
    findAll(): Promise<Personnage[]>;
    findOne(id: string): Promise<Personnage>;
    update(id: string, updatePersonnageDto: UpdatePersonnageDto): Promise<Personnage>;
    remove(id: string): Promise<string>;
}
