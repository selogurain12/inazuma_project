import { SeriesService } from './series.service';
import { CreateSerieDto } from './dto/create-series.dto';
import { UpdateSerieDto } from './dto/update-series.dto';
export declare class SeriesController {
    private readonly seriesService;
    constructor(seriesService: SeriesService);
    create(createseriesDto: CreateSerieDto): Promise<import("./entities/series.entity").Serie>;
    findAll(): Promise<import("./entities/series.entity").Serie[]>;
    findOne(id: string): Promise<import("./entities/series.entity").Serie>;
    update(id: string, updateseriesDto: UpdateSerieDto): Promise<import("./entities/series.entity").Serie>;
    remove(id: string): Promise<string>;
}
