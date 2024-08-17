import { EpisodesService } from './episodes.service';
import { CreateEpisodeDto } from './dto/create-episode.dto';
import { UpdateEpisodeDto } from './dto/update-episode.dto';
export declare class EpisodesController {
    private readonly episodesService;
    constructor(episodesService: EpisodesService);
    create(createEpisodeDto: CreateEpisodeDto): Promise<import("./entities/episode.entity").Episode>;
    findAll(): Promise<import("./entities/episode.entity").Episode[]>;
    findOne(id: string): Promise<import("./entities/episode.entity").Episode>;
    update(id: string, updateEpisodeDto: UpdateEpisodeDto): Promise<import("./entities/episode.entity").Episode>;
    remove(id: string): Promise<string>;
}
