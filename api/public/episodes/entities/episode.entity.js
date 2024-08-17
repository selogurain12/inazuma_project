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
exports.Episode = void 0;
const typeorm_1 = require("typeorm");
const class_validator_1 = require("class-validator");
const swagger_1 = require("@nestjs/swagger");
const series_entity_1 = require("../../series/entities/series.entity");
const equipe_entity_1 = require("../../equipes/entities/equipe.entity");
const personnage_entity_1 = require("../../personnages/entities/personnage.entity");
const match_entity_1 = require("../../matchs/entities/match.entity");
const supertactique_entity_1 = require("../../supertactiques/entities/supertactique.entity");
const supertechnique_entity_1 = require("../../supertechniques/entities/supertechnique.entity");
const image_entity_1 = require("../../images/entities/image.entity");
const class_transformer_1 = require("class-transformer");
const data_transform_helper_1 = require("../../data-transform.helper");
let Episode = class Episode {
};
exports.Episode = Episode;
__decorate([
    (0, swagger_1.ApiProperty)({
        description: "L'id de l'épisode",
        minimum: 1,
    }),
    (0, typeorm_1.PrimaryGeneratedColumn)('uuid'),
    __metadata("design:type", String)
], Episode.prototype, "id", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: "Le titre de l'épisode",
    }),
    (0, typeorm_1.Column)({ nullable: false }),
    (0, class_validator_1.IsString)(),
    (0, class_validator_1.IsNotEmpty)(),
    __metadata("design:type", String)
], Episode.prototype, "titre", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: "Le titre original de l'épisode",
    }),
    (0, typeorm_1.Column)({ nullable: false }),
    (0, class_validator_1.IsString)(),
    (0, class_validator_1.IsNotEmpty)(),
    __metadata("design:type", String)
], Episode.prototype, "titre_original", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: "Le numéro de l'épisode",
        minimum: 1,
    }),
    (0, typeorm_1.Column)({ nullable: false }),
    (0, class_validator_1.IsNumber)(),
    (0, class_validator_1.IsNotEmpty)(),
    __metadata("design:type", Number)
], Episode.prototype, "numepisode", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: 'Le numéro de la saison',
        minimum: 1,
    }),
    (0, typeorm_1.Column)({ nullable: false }),
    (0, class_validator_1.IsNumber)(),
    (0, class_validator_1.IsNotEmpty)(),
    __metadata("design:type", Number)
], Episode.prototype, "saison", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: "Le scénariste de l'épisode",
    }),
    (0, typeorm_1.Column)({ nullable: false }),
    (0, class_validator_1.IsString)(),
    (0, class_validator_1.IsNotEmpty)(),
    __metadata("design:type", String)
], Episode.prototype, "scenario", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: "Diffusion originale de l'épisode",
    }),
    (0, typeorm_1.Column)('date'),
    (0, class_transformer_1.Transform)(data_transform_helper_1.toFrenchDateFormat),
    (0, class_validator_1.IsNotEmpty)(),
    __metadata("design:type", String)
], Episode.prototype, "diffusion_originale", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: "Le résumé de l'épisode",
    }),
    (0, typeorm_1.Column)({ nullable: false }),
    (0, class_validator_1.IsString)(),
    (0, class_validator_1.IsNotEmpty)(),
    __metadata("design:type", String)
], Episode.prototype, "resume", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: "Note sur l'épisode",
    }),
    (0, typeorm_1.Column)({ nullable: true }),
    (0, class_validator_1.IsString)(),
    __metadata("design:type", String)
], Episode.prototype, "note", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: 'Lien vers la vidéo',
    }),
    (0, typeorm_1.Column)({ nullable: false }),
    (0, class_validator_1.IsString)(),
    (0, class_validator_1.IsNotEmpty)(),
    __metadata("design:type", String)
], Episode.prototype, "video", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: 'Id de la série',
    }),
    (0, typeorm_1.ManyToOne)(() => series_entity_1.Serie, (serie) => serie.episodes),
    __metadata("design:type", series_entity_1.Serie)
], Episode.prototype, "serie", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: "Equipes présentes dans l'épisode",
    }),
    (0, typeorm_1.ManyToMany)(() => equipe_entity_1.Equipe),
    (0, typeorm_1.JoinTable)(),
    __metadata("design:type", Array)
], Episode.prototype, "equipes", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: "Personnages présents dans l'épisode",
    }),
    (0, typeorm_1.ManyToMany)(() => personnage_entity_1.Personnage),
    (0, typeorm_1.JoinTable)(),
    __metadata("design:type", Array)
], Episode.prototype, "personnages", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: "Matchs de l'épisode",
    }),
    (0, typeorm_1.ManyToMany)(() => match_entity_1.Match),
    (0, typeorm_1.JoinTable)(),
    __metadata("design:type", Array)
], Episode.prototype, "matchs", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: "Supertactiques de l'épisode",
    }),
    (0, typeorm_1.ManyToMany)(() => supertactique_entity_1.Supertactique),
    (0, typeorm_1.JoinTable)(),
    __metadata("design:type", Array)
], Episode.prototype, "supertactiques", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: "Supertechniques de l'épisode",
    }),
    (0, typeorm_1.ManyToMany)(() => supertechnique_entity_1.Supertechnique),
    (0, typeorm_1.JoinTable)(),
    __metadata("design:type", Array)
], Episode.prototype, "supertechniques", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: "Images de l'épisode",
    }),
    (0, typeorm_1.OneToMany)(() => image_entity_1.Image, (image) => image.episode),
    __metadata("design:type", Array)
], Episode.prototype, "images", void 0);
exports.Episode = Episode = __decorate([
    (0, typeorm_1.Entity)()
], Episode);
//# sourceMappingURL=episode.entity.js.map