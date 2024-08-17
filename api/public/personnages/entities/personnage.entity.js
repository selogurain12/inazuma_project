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
Object.defineProperty(exports, "__esModule", { value: true });
exports.Personnage = void 0;
const typeorm_1 = require("typeorm");
const class_validator_1 = require("class-validator");
const swagger_1 = require("@nestjs/swagger");
const series_entity_1 = require("../../series/entities/series.entity");
const supertechnique_entity_1 = require("../../supertechniques/entities/supertechnique.entity");
const episode_entity_1 = require("../../episodes/entities/episode.entity");
const equipe_entity_1 = require("../../equipes/entities/equipe.entity");
const image_entity_1 = require("../../images/entities/image.entity");
let Personnage = class Personnage {
};
exports.Personnage = Personnage;
__decorate([
    (0, swagger_1.ApiProperty)({
        description: "L'id du personnage",
        minimum: 1,
    }),
    (0, typeorm_1.PrimaryGeneratedColumn)('uuid'),
    __metadata("design:type", String)
], Personnage.prototype, "id", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: 'Nom français du personnage',
    }),
    (0, typeorm_1.Column)({ nullable: false }),
    (0, class_validator_1.IsNotEmpty)(),
    (0, class_validator_1.IsString)(),
    __metadata("design:type", String)
], Personnage.prototype, "nom_fran\u00E7ais_personnage", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: 'Nom original du personnage',
    }),
    (0, typeorm_1.Column)({ nullable: true }),
    (0, class_validator_1.IsString)(),
    __metadata("design:type", String)
], Personnage.prototype, "nom_original_personnage", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: 'Position du personnage',
    }),
    (0, typeorm_1.Column)({ nullable: true }),
    (0, class_validator_1.IsString)(),
    __metadata("design:type", String)
], Personnage.prototype, "position_personnage", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: 'Note sur le personnage',
    }),
    (0, typeorm_1.Column)({ nullable: true }),
    (0, class_validator_1.IsString)(),
    __metadata("design:type", String)
], Personnage.prototype, "note", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: 'Supertechniques de personnage',
    }),
    (0, typeorm_1.ManyToMany)(() => supertechnique_entity_1.Supertechnique),
    (0, typeorm_1.JoinTable)(),
    __metadata("design:type", Array)
], Personnage.prototype, "supertechniques", void 0);
__decorate([
    (0, typeorm_1.ManyToMany)(() => episode_entity_1.Episode),
    (0, typeorm_1.JoinTable)(),
    __metadata("design:type", Array)
], Personnage.prototype, "episode", void 0);
__decorate([
    (0, typeorm_1.ManyToMany)(() => equipe_entity_1.Equipe),
    (0, typeorm_1.JoinTable)(),
    __metadata("design:type", Array)
], Personnage.prototype, "equipes", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: 'Id de la série',
    }),
    (0, typeorm_1.ManyToOne)(() => series_entity_1.Serie, (serie) => serie.personnages),
    __metadata("design:type", series_entity_1.Serie)
], Personnage.prototype, "serie", void 0);
__decorate([
    (0, typeorm_1.ManyToMany)(() => image_entity_1.Image),
    (0, typeorm_1.JoinTable)(),
    __metadata("design:type", Array)
], Personnage.prototype, "images", void 0);
exports.Personnage = Personnage = __decorate([
    (0, typeorm_1.Entity)()
], Personnage);
//# sourceMappingURL=personnage.entity.js.map