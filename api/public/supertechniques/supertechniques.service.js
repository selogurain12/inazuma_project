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
exports.SupertechniquesService = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("@nestjs/typeorm");
const supertechnique_entity_1 = require("./entities/supertechnique.entity");
const typeorm_2 = require("typeorm");
let SupertechniquesService = class SupertechniquesService {
    constructor(supertechniqueRepository) {
        this.supertechniqueRepository = supertechniqueRepository;
    }
    async create(createSupertechniqueDto) {
        const newSupertechnique = this.supertechniqueRepository.create(createSupertechniqueDto);
        const saveSupertechnique = await this.supertechniqueRepository.save(newSupertechnique);
        return saveSupertechnique;
    }
    async findAll() {
        return await this.supertechniqueRepository.find({
            relations: ['equipes', 'episodes', 'matchs', 'serie', 'personnages'],
        });
    }
    async findOne(id) {
        return await this.supertechniqueRepository.findOne({
            where: {
                id,
            },
            relations: ['equipes', 'episodes', 'matchs', 'serie', 'personnages'],
        });
    }
    async update(id, updateSupertechniqueDto) {
        const supertechnique = await this.supertechniqueRepository.findOne({
            where: { id },
            relations: ['equipes', 'episodes', 'matchs', 'serie', 'personnages'],
        });
        if (!supertechnique) {
            throw new common_1.NotFoundException(`Supertechnique with ID ${id} not found`);
        }
        if (updateSupertechniqueDto.nom_français_supertechniques) {
            supertechnique.nom_français_supertechniques =
                updateSupertechniqueDto.nom_français_supertechniques;
        }
        if (updateSupertechniqueDto.nom_original_supertechniques) {
            supertechnique.nom_original_supertechniques =
                updateSupertechniqueDto.nom_original_supertechniques;
        }
        if (updateSupertechniqueDto.type_supertechniques) {
            supertechnique.type_supertechniques =
                updateSupertechniqueDto.type_supertechniques;
        }
        if (updateSupertechniqueDto.notes_supertechniques) {
            supertechnique.notes_supertechniques =
                updateSupertechniqueDto.notes_supertechniques;
        }
        if (updateSupertechniqueDto.obtention_supertechniques) {
            supertechnique.obtention_supertechniques =
                updateSupertechniqueDto.obtention_supertechniques;
        }
        if (updateSupertechniqueDto.equipes) {
            supertechnique.equipes = [
                ...supertechnique.equipes,
                ...updateSupertechniqueDto.equipes,
            ];
        }
        if (updateSupertechniqueDto.personnages) {
            supertechnique.personnages = [
                ...supertechnique.personnages,
                ...updateSupertechniqueDto.personnages,
            ];
        }
        if (updateSupertechniqueDto.episodes) {
            supertechnique.episodes = [
                ...supertechnique.episodes,
                ...updateSupertechniqueDto.episodes,
            ];
        }
        if (updateSupertechniqueDto.matchs) {
            supertechnique.matchs = [
                ...supertechnique.matchs,
                ...updateSupertechniqueDto.matchs,
            ];
        }
        if (updateSupertechniqueDto.video) {
            supertechnique.video = [
                ...supertechnique.video,
                ...updateSupertechniqueDto.video,
            ];
        }
        if (updateSupertechniqueDto.serieId) {
            supertechnique.serie.id = updateSupertechniqueDto.serieId;
        }
        return this.supertechniqueRepository.save(supertechnique);
    }
    async remove(id) {
        const deleteSupertechnique = await this.supertechniqueRepository.findOne({
            where: {
                id,
            },
        });
        if (!deleteSupertechnique) {
            throw new common_1.NotFoundException(`Supertechnique with ID ${id} not found`);
        }
        await this.supertechniqueRepository.delete(deleteSupertechnique.id);
        return `This action removes a #${id} supertechnique`;
    }
};
exports.SupertechniquesService = SupertechniquesService;
exports.SupertechniquesService = SupertechniquesService = __decorate([
    (0, common_1.Injectable)(),
    __param(0, (0, typeorm_1.InjectRepository)(supertechnique_entity_1.Supertechnique)),
    __metadata("design:paramtypes", [typeorm_2.Repository])
], SupertechniquesService);
//# sourceMappingURL=supertechniques.service.js.map