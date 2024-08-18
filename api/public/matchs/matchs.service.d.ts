import { CreateMatchDto } from './dto/create-match.dto';
import { UpdateMatchDto } from './dto/update-match.dto';
import { Match } from './entities/match.entity';
import { Repository } from 'typeorm';
import { Equipe } from '../equipes/entities/equipe.entity';
export declare class MatchsService {
    private readonly matchRepository;
    private readonly equipeRepository;
    constructor(matchRepository: Repository<Match>, equipeRepository: Repository<Equipe>);
    create(createMatchDto: CreateMatchDto): Promise<Match>;
    findAll(): Promise<Match[]>;
    findOne(id: string): Promise<Match>;
    update(id: string, updateMatchDto: UpdateMatchDto): Promise<Match>;
    remove(id: string): Promise<string>;
}
