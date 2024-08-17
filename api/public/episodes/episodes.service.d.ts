import { CreateEpisodeDto } from './dto/create-episode.dto';
import { UpdateEpisodeDto } from './dto/update-episode.dto';
import { Episode } from './entities/episode.entity';
import { Repository } from 'typeorm';
export declare class EpisodesService {
    private readonly episodeRepository;
    constructor(episodeRepository: Repository<Episode>);
    create(createEpisodeDto: CreateEpisodeDto): Promise<Episode>;
    findAll(): Promise<Episode[]>;
    findOne(id: string): Promise<Episode>;
    update(id: string, updateEpisodeDto: UpdateEpisodeDto): Promise<Episode>;
    remove(id: string): Promise<string>;
}
