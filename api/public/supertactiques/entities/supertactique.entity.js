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
exports.Supertactique = void 0;
const swagger_1 = require("@nestjs/swagger");
const class_validator_1 = require("class-validator");
const episode_entity_1 = require("../../episodes/entities/episode.entity");
const equipe_entity_1 = require("../../equipes/entities/equipe.entity");
const match_entity_1 = require("../../matchs/entities/match.entity");
const series_entity_1 = require("../../series/entities/series.entity");
const typeorm_1 = require("typeorm");
let Supertactique = class Supertactique {
};
exports.Supertactique = Supertactique;
__decorate([
    (0, swagger_1.ApiProperty)({
        description: "L'id de la supertactique",
        minimum: 1,
    }),
    (0, typeorm_1.PrimaryGeneratedColumn)('uuid'),
    __metadata("design:type", String)
], Supertactique.prototype, "id", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: 'Nom de la supertactique',
    }),
    (0, typeorm_1.Column)({ nullable: false }),
    (0, class_validator_1.IsNotEmpty)(),
    (0, class_validator_1.IsString)(),
    __metadata("design:type", String)
], Supertactique.prototype, "nom", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: 'Id de la série',
    }),
    (0, typeorm_1.ManyToOne)(() => series_entity_1.Serie, (serie) => serie.supertactiques),
    __metadata("design:type", series_entity_1.Serie)
], Supertactique.prototype, "serie", void 0);
__decorate([
    (0, typeorm_1.ManyToMany)(() => equipe_entity_1.Equipe),
    (0, typeorm_1.JoinTable)(),
    __metadata("design:type", Array)
], Supertactique.prototype, "equipes", void 0);
__decorate([
    (0, typeorm_1.ManyToMany)(() => match_entity_1.Match),
    (0, typeorm_1.JoinTable)(),
    __metadata("design:type", Array)
], Supertactique.prototype, "matchs", void 0);
__decorate([
    (0, typeorm_1.ManyToMany)(() => episode_entity_1.Episode),
    (0, typeorm_1.JoinTable)(),
    __metadata("design:type", Array)
], Supertactique.prototype, "episodes", void 0);
__decorate([
    (0, typeorm_1.Column)('text', { array: true, nullable: true }),
    __metadata("design:type", Array)
], Supertactique.prototype, "video", void 0);
exports.Supertactique = Supertactique = __decorate([
    (0, typeorm_1.Entity)()
], Supertactique);
//# sourceMappingURL=supertactique.entity.js.map