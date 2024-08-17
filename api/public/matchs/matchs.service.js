"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
var __param = (this && this.__param) || function (paramIndex, decorator) {
    return function (target, key) { decorator(target, key, paramIndex); }
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.MatchsService = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("@nestjs/typeorm");
const match_entity_1 = require("./entities/match.entity");
const typeorm_2 = require("typeorm");
const equipe_entity_1 = require("../equipes/entities/equipe.entity");
let MatchsService = class MatchsService {
    constructor(matchRepository, equipeRepository) {
        this.matchRepository = matchRepository;
        this.equipeRepository = equipeRepository;
    }
    async create(createMatchDto) {
        const equipe1 = await this.equipeRepository.findOne({
            where: { id: createMatchDto.id_equipe_1 },
        });
        const equipe2 = await this.equipeRepository.findOne({
            where: { id: createMatchDto.id_equipe_2 },
        });
        if (!equipe1) {
            throw new common_1.NotFoundException(`Equipe with ID ${createMatchDto.id_equipe_1} not found`);
        }
        if (!equipe2) {
            throw new common_1.NotFoundException(`Equipe with ID ${createMatchDto.id_equipe_2} not found`);
        }
        const newMatch = this.matchRepository.create({
            ...createMatchDto,
            id_equipe_1: equipe1,
            id_equipe_2: equipe2,
        });
        return await this.matchRepository.save(newMatch);
    }
    async findAll() {
        return await this.matchRepository.find({
            relations: [
                'id_equipe_1',
                'id_equipe_2',
                'episodes',
                'supertechniques',
                'supertactiques',
                'serie',
            ],
        });
    }
    async findOne(id) {
        const match = await this.matchRepository.findOne({
            where: { id },
            relations: [
                'id_equipe_1',
                'id_equipe_2',
                'episodes',
                'supertechniques',
                'supertactiques',
                'serie',
            ],
        });
        if (!match) {
            throw new common_1.NotFoundException(`Match with ID ${id} not found`);
        }
        return match;
    }
    async update(id, updateMatchDto) {
        const match = await this.matchRepository.findOne({
            where: { id },
            relations: ['episodes', 'supertechniques', 'supertactiques'],
        });
        if (!match) {
            throw new common_1.NotFoundException(`Match with ID ${id} not found`);
        }
        if (updateMatchDto.id_equipe_1) {
            match.id_equipe_1.id = updateMatchDto.id_equipe_1;
        }
        if (updateMatchDto.id_equipe_2) {
            match.id_equipe_2.id = updateMatchDto.id_equipe_2;
        }
        if (updateMatchDto.notes) {
            match.notes = updateMatchDto.notes;
        }
        if (updateMatchDto.episodes) {
            match.episodes = [...match.episodes, ...updateMatchDto.episodes];
        }
        if (updateMatchDto.supertechniques) {
            match.supertechniques = [
                ...match.supertechniques,
                ...updateMatchDto.supertechniques,
            ];
        }
        if (updateMatchDto.supertactiques) {
            match.supertactiques = [
                ...match.supertactiques,
                ...updateMatchDto.supertactiques,
            ];
        }
        if (updateMatchDto.serieId) {
            match.serie.id = updateMatchDto.serieId;
        }
        if (updateMatchDto.compo_equipe_1) {
            match.compo_equipe_1 = updateMatchDto.compo_equipe_1;
        }
        if (updateMatchDto.compo_equipe_2) {
            match.compo_equipe_2 = updateMatchDto.compo_equipe_2;
        }
        return this.matchRepository.save(match);
    }
    async remove(id) {
        const match = await this.matchRepository.findOne({ where: { id } });
        if (!match) {
            throw new common_1.NotFoundException(`Match with ID ${id} not found`);
        }
        await this.matchRepository.delete(id);
        return `Match with ID ${id} removed`;
    }
};
exports.MatchsService = MatchsService;
exports.MatchsService = MatchsService = __decorate([
    (0, common_1.Injectable)(),
    __param(0, (0, typeorm_1.InjectRepository)(match_entity_1.Match)),
    __param(1, (0, typeorm_1.InjectRepository)(equipe_entity_1.Equipe)),
    __metadata("design:paramtypes", [typeorm_2.Repository,
        typeorm_2.Repository])
], MatchsService);
//# sourceMappingURL=matchs.service.js.map