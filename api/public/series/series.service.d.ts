import { CreateSerieDto } from './dto/create-series.dto';
import { UpdateSerieDto } from './dto/update-series.dto';
import { Serie } from './entities/series.entity';
import { Repository } from 'typeorm';
export declare class SeriesService {
    private readonly serieRepository;
    constructor(serieRepository: Repository<Serie>);
    create(createSerieDto: CreateSerieDto): Promise<Serie>;
    findAll(): Promise<Serie[]>;
    findOne(id: string): Promise<Serie>;
    update(id: string, updateSerieDto: UpdateSerieDto): Promise<Serie>;
    remove(id: string): Promise<string>;
}
