import { MatchsService } from './matchs.service';
import { CreateMatchDto } from './dto/create-match.dto';
import { UpdateMatchDto } from './dto/update-match.dto';
export declare class MatchsController {
    private readonly matchsService;
    constructor(matchsService: MatchsService);
    create(createMatchDto: CreateMatchDto): Promise<import("./entities/match.entity").Match>;
    findAll(): Promise<import("./entities/match.entity").Match[]>;
    findOne(id: string): Promise<import("./entities/match.entity").Match>;
    update(id: string, updateMatchDto: UpdateMatchDto): Promise<import("./entities/match.entity").Match>;
    remove(id: string): Promise<string>;
}
