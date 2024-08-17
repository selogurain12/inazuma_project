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
exports.Match = void 0;
const typeorm_1 = require("typeorm");
const class_validator_1 = require("class-validator");
const swagger_1 = require("@nestjs/swagger");
const series_entity_1 = require("../../series/entities/series.entity");
const equipe_entity_1 = require("../../equipes/entities/equipe.entity");
const episode_entity_1 = require("../../episodes/entities/episode.entity");
const supertechnique_entity_1 = require("../../supertechniques/entities/supertechnique.entity");
const supertactique_entity_1 = require("../../supertactiques/entities/supertactique.entity");
let Match = class Match {
};
exports.Match = Match;
__decorate([
    (0, swagger_1.ApiProperty)({
        description: "L'id du match",
        minimum: 1,
    }),
    (0, typeorm_1.PrimaryGeneratedColumn)('uuid'),
    __metadata("design:type", String)
], Match.prototype, "id", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: "Id de l'équipe 1",
    }),
    (0, typeorm_1.ManyToOne)(() => equipe_entity_1.Equipe, (equipe) => equipe.matchs),
    __metadata("design:type", equipe_entity_1.Equipe)
], Match.prototype, "id_equipe_1", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: "Id de l'équipe 2",
    }),
    (0, typeorm_1.ManyToOne)(() => equipe_entity_1.Equipe, (equipe) => equipe.matchs),
    __metadata("design:type", equipe_entity_1.Equipe)
], Match.prototype, "id_equipe_2", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: 'Notes sur le match',
    }),
    (0, typeorm_1.Column)({ nullable: true }),
    (0, class_validator_1.IsString)(),
    __metadata("design:type", String)
], Match.prototype, "notes", void 0);
__decorate([
    (0, typeorm_1.ManyToMany)(() => episode_entity_1.Episode, (episode) => episode.matchs),
    (0, typeorm_1.JoinTable)(),
    __metadata("design:type", Array)
], Match.prototype, "episodes", void 0);
__decorate([
    (0, typeorm_1.ManyToMany)(() => supertechnique_entity_1.Supertechnique, (supertechnique) => supertechnique.matchs),
    (0, typeorm_1.JoinTable)(),
    __metadata("design:type", Array)
], Match.prototype, "supertechniques", void 0);
__decorate([
    (0, typeorm_1.ManyToMany)(() => supertactique_entity_1.Supertactique, (supertactique) => supertactique.matchs),
    (0, typeorm_1.JoinTable)(),
    __metadata("design:type", Array)
], Match.prototype, "supertactiques", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: 'Id de la série',
    }),
    (0, typeorm_1.ManyToOne)(() => series_entity_1.Serie, (serie) => serie.matchs),
    __metadata("design:type", series_entity_1.Serie)
], Match.prototype, "serie", void 0);
__decorate([
    (0, typeorm_1.Column)({ nullable: true }),
    __metadata("design:type", String)
], Match.prototype, "compo_equipe_1", void 0);
__decorate([
    (0, typeorm_1.Column)({ nullable: true }),
    __metadata("design:type", String)
], Match.prototype, "compo_equipe_2", void 0);
exports.Match = Match = __decorate([
    (0, typeorm_1.Entity)()
], Match);
//# sourceMappingURL=match.entity.js.map