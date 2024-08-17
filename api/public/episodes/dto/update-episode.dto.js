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
exports.UpdateEpisodeDto = void 0;
const swagger_1 = require("@nestjs/swagger");
const create_episode_dto_1 = require("./create-episode.dto");
const class_validator_1 = require("class-validator");
class UpdateEpisodeDto extends (0, swagger_1.PartialType)(create_episode_dto_1.CreateEpisodeDto) {
}
exports.UpdateEpisodeDto = UpdateEpisodeDto;
__decorate([
    (0, swagger_1.ApiProperty)({
        description: "Le titre de l'épisode",
    }),
    (0, class_validator_1.IsString)(),
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", String)
], UpdateEpisodeDto.prototype, "titre", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: "Le titre de l'épisode",
    }),
    (0, class_validator_1.IsString)(),
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", String)
], UpdateEpisodeDto.prototype, "titre_original", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: "Le numéro de l'épisode",
        minimum: 1,
    }),
    (0, class_validator_1.IsNumber)(),
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", Number)
], UpdateEpisodeDto.prototype, "numepisode", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: 'Le numéro de la saison',
        minimum: 1,
    }),
    (0, class_validator_1.IsNumber)(),
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", Number)
], UpdateEpisodeDto.prototype, "saison", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: "Le scénariste de l'épisode",
    }),
    (0, class_validator_1.IsString)(),
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", String)
], UpdateEpisodeDto.prototype, "scenario", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: "Diffusion originale de l'épisode",
    }),
    (0, class_validator_1.IsDateString)(),
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", String)
], UpdateEpisodeDto.prototype, "diffusion_originale", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: "Le résumé de l'épisode",
    }),
    (0, class_validator_1.IsString)(),
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", String)
], UpdateEpisodeDto.prototype, "resume", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: "Note(s) sur l'épisode",
    }),
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", String)
], UpdateEpisodeDto.prototype, "note", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: 'Lien vers la vidéo',
    }),
    (0, class_validator_1.IsString)(),
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", String)
], UpdateEpisodeDto.prototype, "video", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: 'Id de la série',
    }),
    __metadata("design:type", String)
], UpdateEpisodeDto.prototype, "serieId", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: "Equipes présentent dans l'épisode",
    }),
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", Array)
], UpdateEpisodeDto.prototype, "equipes", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: "Personnages présents lors de l'épisode",
    }),
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", Array)
], UpdateEpisodeDto.prototype, "personnages", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: "Match de l'épisode",
    }),
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", Array)
], UpdateEpisodeDto.prototype, "matchs", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: "Supertactiques de l'épisode",
    }),
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", Array)
], UpdateEpisodeDto.prototype, "supertactiques", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: "Supertechniques de l'épisode",
    }),
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", Array)
], UpdateEpisodeDto.prototype, "supertechniques", void 0);
__decorate([
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", Array)
], UpdateEpisodeDto.prototype, "images", void 0);
//# sourceMappingURL=update-episode.dto.js.map