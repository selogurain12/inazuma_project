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
exports.Serie = void 0;
const swagger_1 = require("@nestjs/swagger");
const class_validator_1 = require("class-validator");
const episode_entity_1 = require("../../episodes/entities/episode.entity");
const equipe_entity_1 = require("../../equipes/entities/equipe.entity");
const match_entity_1 = require("../../matchs/entities/match.entity");
const personnage_entity_1 = require("../../personnages/entities/personnage.entity");
const supertactique_entity_1 = require("../../supertactiques/entities/supertactique.entity");
const supertechnique_entity_1 = require("../../supertechniques/entities/supertechnique.entity");
const image_entity_1 = require("../../images/entities/image.entity");
const typeorm_1 = require("typeorm");
let Serie = class Serie {
};
exports.Serie = Serie;
__decorate([
    (0, swagger_1.ApiProperty)({
        description: "L'id de la série",
        minimum: 1,
    }),
    (0, typeorm_1.PrimaryGeneratedColumn)('uuid'),
    __metadata("design:type", String)
], Serie.prototype, "id", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: 'Nom de la série',
    }),
    (0, typeorm_1.Column)({ nullable: false }),
    (0, class_validator_1.IsNotEmpty)(),
    (0, class_validator_1.IsString)(),
    __metadata("design:type", String)
], Serie.prototype, "nom", void 0);
__decorate([
    (0, typeorm_1.OneToMany)(() => episode_entity_1.Episode, (episode) => episode.serie),
    __metadata("design:type", Array)
], Serie.prototype, "episodes", void 0);
__decorate([
    (0, typeorm_1.OneToMany)(() => personnage_entity_1.Personnage, (personngae) => personngae.serie),
    __metadata("design:type", Array)
], Serie.prototype, "personnages", void 0);
__decorate([
    (0, typeorm_1.OneToMany)(() => supertechnique_entity_1.Supertechnique, (supertechnique) => supertechnique.serie),
    __metadata("design:type", Array)
], Serie.prototype, "supertechniques", void 0);
__decorate([
    (0, typeorm_1.OneToMany)(() => equipe_entity_1.Equipe, (equipe) => equipe.serie),
    __metadata("design:type", Array)
], Serie.prototype, "equipes", void 0);
__decorate([
    (0, typeorm_1.OneToMany)(() => match_entity_1.Match, (match) => match.serie),
    __metadata("design:type", Array)
], Serie.prototype, "matchs", void 0);
__decorate([
    (0, typeorm_1.OneToMany)(() => supertactique_entity_1.Supertactique, (supertactique) => supertactique.serie),
    __metadata("design:type", Array)
], Serie.prototype, "supertactiques", void 0);
__decorate([
    (0, typeorm_1.OneToMany)(() => image_entity_1.Image, (image) => image.serie),
    __metadata("design:type", Array)
], Serie.prototype, "images", void 0);
exports.Serie = Serie = __decorate([
    (0, typeorm_1.Entity)()
], Serie);
//# sourceMappingURL=series.entity.js.map