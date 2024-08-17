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
exports.SeriesService = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("@nestjs/typeorm");
const series_entity_1 = require("./entities/series.entity");
const typeorm_2 = require("typeorm");
let SeriesService = class SeriesService {
    constructor(serieRepository) {
        this.serieRepository = serieRepository;
    }
    async create(createSerieDto) {
        const newSerie = this.serieRepository.create(createSerieDto);
        const saveSerie = await this.serieRepository.save(newSerie);
        return saveSerie;
    }
    async findAll() {
        return await this.serieRepository.find();
    }
    async findOne(id) {
        return await this.serieRepository.findOne({
            where: {
                id,
            },
            relations: [
                'equipes',
                'episodes',
                'matchs',
                'personnages',
                'supertactiques',
                'supertechniques',
                'images',
            ],
        });
    }
    async update(id, updateSerieDto) {
        const serie = await this.serieRepository.findOne({
            where: { id },
            relations: [
                'equipes',
                'episodes',
                'matchs',
                'personnages',
                'supertactiques',
                'supertechniques',
                'images',
            ],
        });
        if (!serie) {
            throw new common_1.NotFoundException(`Serie with ID ${id} not found`);
        }
        if (updateSerieDto.nom) {
            serie.nom = updateSerieDto.nom;
        }
        if (updateSerieDto.episodes) {
            serie.episodes = [...serie.episodes, ...updateSerieDto.episodes];
        }
        if (updateSerieDto.personnages) {
            serie.personnages = [...serie.personnages, ...updateSerieDto.personnages];
        }
        if (updateSerieDto.supertechniques) {
            serie.supertechniques = [
                ...serie.supertechniques,
                ...updateSerieDto.supertechniques,
            ];
        }
        if (updateSerieDto.equipes) {
            serie.equipes = [...serie.equipes, ...updateSerieDto.equipes];
        }
        if (updateSerieDto.matchs) {
            serie.matchs = [...serie.matchs, ...updateSerieDto.matchs];
        }
        if (updateSerieDto.matchs) {
            serie.matchs = [...serie.matchs, ...updateSerieDto.matchs];
        }
        if (updateSerieDto.supertactiques) {
            serie.supertactiques = [
                ...serie.supertactiques,
                ...updateSerieDto.supertactiques,
            ];
        }
        if (updateSerieDto.images) {
            serie.images = [...serie.images, ...updateSerieDto.images];
        }
        return this.serieRepository.save(serie);
    }
    async remove(id) {
        const deleteSerie = await this.serieRepository.findOne({
            where: {
                id,
            },
        });
        if (!deleteSerie) {
            throw new common_1.NotFoundException(`Serie with ID ${id} not found`);
        }
        await this.serieRepository.delete(deleteSerie.id);
        return `This action removes a #${id} serie`;
    }
};
exports.SeriesService = SeriesService;
exports.SeriesService = SeriesService = __decorate([
    (0, common_1.Injectable)(),
    __param(0, (0, typeorm_1.InjectRepository)(series_entity_1.Serie)),
    __metadata("design:paramtypes", [typeorm_2.Repository])
], SeriesService);
//# sourceMappingURL=series.service.js.map