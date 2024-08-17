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
exports.SupertactiquesService = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("@nestjs/typeorm");
const supertactique_entity_1 = require("./entities/supertactique.entity");
const typeorm_2 = require("typeorm");
let SupertactiquesService = class SupertactiquesService {
    constructor(supertactiqueRepository) {
        this.supertactiqueRepository = supertactiqueRepository;
    }
    async create(createSupertactiqueDto) {
        const newSupertactique = this.supertactiqueRepository.create(createSupertactiqueDto);
        const saveSupertactique = await this.supertactiqueRepository.save(newSupertactique);
        return saveSupertactique;
    }
    async findAll() {
        return await this.supertactiqueRepository.find({
            relations: ['equipes', 'episodes', 'matchs', 'serie'],
        });
    }
    async findOne(id) {
        return await this.supertactiqueRepository.findOne({
            where: {
                id,
            },
            relations: ['equipes', 'episodes', 'matchs', 'serie'],
        });
    }
    async update(id, updateSupertactiqueDto) {
        const supertactique = await this.supertactiqueRepository.findOne({
            where: { id },
            relations: ['equipes', 'episodes', 'matchs', 'serie'],
        });
        if (!supertactique) {
            throw new common_1.NotFoundException(`Supertactique with ID ${id} not found`);
        }
        if (updateSupertactiqueDto.nom) {
            supertactique.nom = updateSupertactiqueDto.nom;
        }
        if (updateSupertactiqueDto.serieId) {
            supertactique.serie.id = updateSupertactiqueDto.serieId;
        }
        if (updateSupertactiqueDto.equipes) {
            supertactique.equipes = [
                ...supertactique.equipes,
                ...updateSupertactiqueDto.equipes,
            ];
        }
        if (updateSupertactiqueDto.matchs) {
            supertactique.matchs = [
                ...supertactique.matchs,
                ...updateSupertactiqueDto.matchs,
            ];
        }
        if (updateSupertactiqueDto.episodes) {
            supertactique.episodes = [
                ...supertactique.episodes,
                ...updateSupertactiqueDto.episodes,
            ];
        }
        if (updateSupertactiqueDto.video) {
            supertactique.video = [
                ...supertactique.video,
                ...updateSupertactiqueDto.video,
            ];
        }
        return this.supertactiqueRepository.save(supertactique);
    }
    async remove(id) {
        const deleteSupertactique = await this.supertactiqueRepository.findOne({
            where: {
                id,
            },
        });
        if (!deleteSupertactique) {
            throw new common_1.NotFoundException(`Supertactique with ID ${id} not found`);
        }
        await this.supertactiqueRepository.delete(deleteSupertactique.id);
        return `This action removes a #${id} supertactique`;
    }
};
exports.SupertactiquesService = SupertactiquesService;
exports.SupertactiquesService = SupertactiquesService = __decorate([
    (0, common_1.Injectable)(),
    __param(0, (0, typeorm_1.InjectRepository)(supertactique_entity_1.Supertactique)),
    __metadata("design:paramtypes", [typeorm_2.Repository])
], SupertactiquesService);
//# sourceMappingURL=supertactiques.service.js.map