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
exports.Equipe = void 0;
const swagger_1 = require("@nestjs/swagger");
const class_validator_1 = require("class-validator");
const episode_entity_1 = require("../../episodes/entities/episode.entity");
const image_entity_1 = require("../../images/entities/image.entity");
const match_entity_1 = require("../../matchs/entities/match.entity");
const personnage_entity_1 = require("../../personnages/entities/personnage.entity");
const series_entity_1 = require("../../series/entities/series.entity");
const supertactique_entity_1 = require("../../supertactiques/entities/supertactique.entity");
const supertechnique_entity_1 = require("../../supertechniques/entities/supertechnique.entity");
const typeorm_1 = require("typeorm");
let Equipe = class Equipe {
};
exports.Equipe = Equipe;
__decorate([
    (0, swagger_1.ApiProperty)({ description: "L'id de l'équipe", minimum: 1 }),
    (0, typeorm_1.PrimaryGeneratedColumn)('uuid'),
    __metadata("design:type", String)
], Equipe.prototype, "id", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({ description: "Nom français de l'équipe" }),
    (0, typeorm_1.Column)({ nullable: false }),
    (0, class_validator_1.IsNotEmpty)(),
    (0, class_validator_1.IsString)(),
    __metadata("design:type", String)
], Equipe.prototype, "nom_francais_equipe", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({ description: "Nom original de l'équipe" }),
    (0, typeorm_1.Column)({ nullable: true }),
    (0, class_validator_1.IsString)(),
    __metadata("design:type", String)
], Equipe.prototype, "nom_original_equipe", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({ description: "Note sur l'équipe" }),
    (0, typeorm_1.Column)({ nullable: true }),
    (0, class_validator_1.IsString)(),
    __metadata("design:type", String)
], Equipe.prototype, "note", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({ description: "Capitaine de l'équipe" }),
    (0, typeorm_1.ManyToMany)(() => personnage_entity_1.Personnage),
    (0, typeorm_1.JoinTable)(),
    __metadata("design:type", Array)
], Equipe.prototype, "capitaines", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({ description: "Joueurs de l'équipe" }),
    (0, typeorm_1.ManyToMany)(() => personnage_entity_1.Personnage),
    (0, typeorm_1.JoinTable)(),
    __metadata("design:type", Array)
], Equipe.prototype, "joueurs", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({ description: "Manageur de l'équipe" }),
    (0, typeorm_1.ManyToMany)(() => personnage_entity_1.Personnage),
    (0, typeorm_1.JoinTable)(),
    __metadata("design:type", Array)
], Equipe.prototype, "manageurs", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({ description: "Supertactique utilisé par l'équipe" }),
    (0, typeorm_1.ManyToMany)(() => supertactique_entity_1.Supertactique),
    (0, typeorm_1.JoinTable)(),
    __metadata("design:type", Array)
], Equipe.prototype, "supertactiques", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({ description: "Supertechnique utilisé par l'équipe" }),
    (0, typeorm_1.ManyToMany)(() => supertechnique_entity_1.Supertechnique),
    (0, typeorm_1.JoinTable)(),
    __metadata("design:type", Array)
], Equipe.prototype, "supertechniques", void 0);
__decorate([
    (0, typeorm_1.ManyToMany)(() => match_entity_1.Match),
    (0, typeorm_1.JoinTable)(),
    __metadata("design:type", Array)
], Equipe.prototype, "matchs", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: 'Id de la série',
    }),
    (0, typeorm_1.ManyToOne)(() => series_entity_1.Serie, (serie) => serie.equipes),
    __metadata("design:type", series_entity_1.Serie)
], Equipe.prototype, "serie", void 0);
__decorate([
    (0, typeorm_1.ManyToMany)(() => episode_entity_1.Episode),
    (0, typeorm_1.JoinTable)(),
    __metadata("design:type", Array)
], Equipe.prototype, "episodes", void 0);
__decorate([
    (0, typeorm_1.ManyToMany)(() => personnage_entity_1.Personnage),
    (0, typeorm_1.JoinTable)(),
    __metadata("design:type", Array)
], Equipe.prototype, "entraineur", void 0);
__decorate([
    (0, typeorm_1.ManyToMany)(() => image_entity_1.Image),
    (0, typeorm_1.JoinTable)(),
    __metadata("design:type", Array)
], Equipe.prototype, "images", void 0);
exports.Equipe = Equipe = __decorate([
    (0, typeorm_1.Entity)()
], Equipe);
//# sourceMappingURL=equipe.entity.js.map