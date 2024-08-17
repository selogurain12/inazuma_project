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
exports.EpisodesService = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("@nestjs/typeorm");
const episode_entity_1 = require("./entities/episode.entity");
const typeorm_2 = require("typeorm");
let EpisodesService = class EpisodesService {
    constructor(episodeRepository) {
        this.episodeRepository = episodeRepository;
    }
    async create(createEpisodeDto) {
        const newEpisode = this.episodeRepository.create(createEpisodeDto);
        const saveEpisode = await this.episodeRepository.save(newEpisode);
        return saveEpisode;
    }
    async findAll() {
        return await this.episodeRepository.find({
            relations: [
                'serie',
                'equipes',
                'personnages',
                'matchs',
                'supertactiques',
                'supertechniques',
                'images',
            ],
        });
    }
    async findOne(id) {
        return await this.episodeRepository.findOne({
            where: {
                id,
            },
            relations: [
                'serie',
                'equipes',
                'personnages',
                'matchs',
                'supertactiques',
                'supertechniques',
                'images',
            ],
        });
    }
    async update(id, updateEpisodeDto) {
        const episode = await this.episodeRepository.findOne({
            where: { id },
            relations: [
                'serie',
                'equipes',
                'personnages',
                'matchs',
                'supertactiques',
                'supertechniques',
                'images',
            ],
        });
        if (!episode) {
            throw new common_1.NotFoundException(`Episode with ID ${id} not found`);
        }
        if (updateEpisodeDto.titre) {
            episode.titre = updateEpisodeDto.titre;
        }
        if (updateEpisodeDto.titre_original) {
            episode.titre_original = updateEpisodeDto.titre_original;
        }
        if (updateEpisodeDto.numepisode) {
            episode.numepisode = updateEpisodeDto.numepisode;
        }
        if (updateEpisodeDto.saison) {
            episode.saison = updateEpisodeDto.saison;
        }
        if (updateEpisodeDto.scenario) {
            episode.scenario = updateEpisodeDto.scenario;
        }
        if (updateEpisodeDto.diffusion_originale) {
            episode.scenario = updateEpisodeDto.diffusion_originale;
        }
        if (updateEpisodeDto.resume) {
            episode.resume = updateEpisodeDto.resume;
        }
        if (updateEpisodeDto.note) {
            episode.note = updateEpisodeDto.note;
        }
        if (updateEpisodeDto.video) {
            episode.video = updateEpisodeDto.video;
        }
        if (updateEpisodeDto.serieId) {
            episode.serie.id = updateEpisodeDto.serieId;
        }
        if (updateEpisodeDto.equipes) {
            episode.equipes = [...episode.equipes, ...updateEpisodeDto.equipes];
        }
        if (updateEpisodeDto.personnages) {
            episode.personnages = [
                ...episode.personnages,
                ...updateEpisodeDto.personnages,
            ];
        }
        if (updateEpisodeDto.supertactiques) {
            episode.supertactiques = [
                ...episode.supertactiques,
                ...updateEpisodeDto.supertactiques,
            ];
        }
        if (updateEpisodeDto.matchs) {
            episode.matchs = [...episode.matchs, ...updateEpisodeDto.matchs];
        }
        if (updateEpisodeDto.supertechniques) {
            episode.supertechniques = [
                ...episode.supertechniques,
                ...updateEpisodeDto.supertechniques,
            ];
        }
        if (updateEpisodeDto.images) {
            episode.images = [...episode.images, ...updateEpisodeDto.images];
        }
        return this.episodeRepository.save(episode);
    }
    async remove(id) {
        const deleteEpisode = await this.episodeRepository.findOne({
            where: {
                id,
            },
        });
        if (!deleteEpisode) {
            throw new common_1.NotFoundException(`Episode with ID ${id} not found`);
        }
        await this.episodeRepository.delete(deleteEpisode.id);
        return `This action removes a #${id} episode`;
    }
};
exports.EpisodesService = EpisodesService;
exports.EpisodesService = EpisodesService = __decorate([
    (0, common_1.Injectable)(),
    __param(0, (0, typeorm_1.InjectRepository)(episode_entity_1.Episode)),
    __metadata("design:paramtypes", [typeorm_2.Repository])
], EpisodesService);
//# sourceMappingURL=episodes.service.js.map