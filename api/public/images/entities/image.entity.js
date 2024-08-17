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
exports.Image = void 0;
const swagger_1 = require("@nestjs/swagger");
const class_validator_1 = require("class-validator");
const episode_entity_1 = require("../../episodes/entities/episode.entity");
const equipe_entity_1 = require("../../equipes/entities/equipe.entity");
const personnage_entity_1 = require("../../personnages/entities/personnage.entity");
const series_entity_1 = require("../../series/entities/series.entity");
const typeorm_1 = require("typeorm");
let Image = class Image {
};
exports.Image = Image;
__decorate([
    (0, swagger_1.ApiProperty)({ description: "L'id de l'image", minimum: 1 }),
    (0, typeorm_1.PrimaryGeneratedColumn)('uuid'),
    __metadata("design:type", String)
], Image.prototype, "id", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({ description: "Note sur l'image" }),
    (0, typeorm_1.Column)({ nullable: true }),
    (0, class_validator_1.IsString)(),
    __metadata("design:type", String)
], Image.prototype, "note", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: 'Id de la série',
    }),
    (0, typeorm_1.ManyToOne)(() => series_entity_1.Serie, (serie) => serie.images),
    __metadata("design:type", series_entity_1.Serie)
], Image.prototype, "serie", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: "Id de l'épisode",
    }),
    (0, typeorm_1.ManyToOne)(() => episode_entity_1.Episode, (episode) => episode.titre),
    __metadata("design:type", episode_entity_1.Episode)
], Image.prototype, "episode", void 0);
__decorate([
    (0, typeorm_1.Column)({ nullable: true }),
    __metadata("design:type", String)
], Image.prototype, "images", void 0);
__decorate([
    (0, typeorm_1.ManyToMany)(() => equipe_entity_1.Equipe),
    (0, typeorm_1.JoinTable)(),
    __metadata("design:type", Array)
], Image.prototype, "equipe", void 0);
__decorate([
    (0, typeorm_1.ManyToMany)(() => personnage_entity_1.Personnage),
    (0, typeorm_1.JoinTable)(),
    __metadata("design:type", Array)
], Image.prototype, "personnages", void 0);
exports.Image = Image = __decorate([
    (0, typeorm_1.Entity)()
], Image);
//# sourceMappingURL=image.entity.js.map