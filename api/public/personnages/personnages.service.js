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
exports.PersonnagesService = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("@nestjs/typeorm");
const personnage_entity_1 = require("./entities/personnage.entity");
const typeorm_2 = require("typeorm");
let PersonnagesService = class PersonnagesService {
    constructor(personnageRepository) {
        this.personnageRepository = personnageRepository;
    }
    async create(createPersonnageDto) {
        const newPersonnage = this.personnageRepository.create(createPersonnageDto);
        const savePersonnage = await this.personnageRepository.save(newPersonnage);
        return savePersonnage;
    }
    async findAll() {
        return await this.personnageRepository.find({
            relations: ['equipes', 'serie', 'episode', 'supertechniques', 'images'],
        });
    }
    async findOne(id) {
        return await this.personnageRepository.findOne({
            where: {
                id,
            },
            relations: ['equipes', 'serie', 'episode', 'supertechniques', 'images'],
        });
    }
    async update(id, updatePersonnageDto) {
        const personnage = await this.personnageRepository.findOne({
            where: { id },
            relations: ['equipes', 'serie', 'episode', 'supertechniques', 'images'],
        });
        if (!personnage) {
            throw new common_1.NotFoundException(`Personnage with ID ${id} not found`);
        }
        if (updatePersonnageDto.note === null) {
            personnage.note = null;
        }
        if (updatePersonnageDto.nom_original_personnage === null) {
            personnage.nom_original_personnage = null;
        }
        if (updatePersonnageDto.nom_français_personnage) {
            personnage.nom_français_personnage =
                updatePersonnageDto.nom_français_personnage;
        }
        if (updatePersonnageDto.nom_original_personnage) {
            personnage.nom_original_personnage =
                updatePersonnageDto.nom_original_personnage;
        }
        if (updatePersonnageDto.position_personnage) {
            personnage.position_personnage = updatePersonnageDto.position_personnage;
        }
        if (updatePersonnageDto.note) {
            personnage.note = updatePersonnageDto.note;
        }
        if (updatePersonnageDto.serieId) {
            personnage.serie.id = updatePersonnageDto.serieId;
        }
        if (updatePersonnageDto.supertechniques !== null) {
            personnage.supertechniques = updatePersonnageDto.supertechniques;
        }
        else {
            personnage.supertechniques = null;
        }
        if (updatePersonnageDto.episode !== null) {
            personnage.episode = updatePersonnageDto.episode;
        }
        else {
            personnage.episode = null;
        }
        if (updatePersonnageDto.equipes !== null) {
            personnage.equipes = updatePersonnageDto.equipes;
        }
        else {
            personnage.equipes = null;
        }
        if (updatePersonnageDto.images !== null) {
            personnage.images = updatePersonnageDto.images;
        }
        else {
            personnage.images = null;
        }
        return this.personnageRepository.save(personnage);
    }
    async remove(id) {
        const deletePersonnage = await this.personnageRepository.findOne({
            where: {
                id,
            },
        });
        if (!deletePersonnage) {
            throw new common_1.NotFoundException(`Personnage with ID ${id} not found`);
        }
        await this.personnageRepository.delete(deletePersonnage.id);
        return `This action removes a #${id} personnage`;
    }
};
exports.PersonnagesService = PersonnagesService;
exports.PersonnagesService = PersonnagesService = __decorate([
    (0, common_1.Injectable)(),
    __param(0, (0, typeorm_1.InjectRepository)(personnage_entity_1.Personnage)),
    __metadata("design:paramtypes", [typeorm_2.Repository])
], PersonnagesService);
//# sourceMappingURL=personnages.service.js.map