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
exports.CreateEquipeDto = void 0;
const swagger_1 = require("@nestjs/swagger");
const class_validator_1 = require("class-validator");
const series_entity_1 = require("../../series/entities/series.entity");
class CreateEquipeDto {
}
exports.CreateEquipeDto = CreateEquipeDto;
__decorate([
    (0, swagger_1.ApiProperty)({ description: "Nom français de l'équipe" }),
    (0, class_validator_1.IsNotEmpty)(),
    (0, class_validator_1.IsString)(),
    __metadata("design:type", String)
], CreateEquipeDto.prototype, "nom_francais_equipe", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({ description: "Nom original de l'équipe" }),
    (0, class_validator_1.IsString)(),
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", String)
], CreateEquipeDto.prototype, "nom_original_equipe", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({ description: "Note sur l'équipe" }),
    (0, class_validator_1.IsString)(),
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", String)
], CreateEquipeDto.prototype, "note", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({ description: "Capitaine de l'équipe" }),
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", Array)
], CreateEquipeDto.prototype, "capitaines", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({ description: "Joueurs de l'équipe" }),
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", Array)
], CreateEquipeDto.prototype, "joueurs", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({ description: "Manageur de l'équipe" }),
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", Array)
], CreateEquipeDto.prototype, "manageurs", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({ description: "Supertactique utilisé par l'équipe" }),
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", Array)
], CreateEquipeDto.prototype, "supertactiques", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({ description: "Supertechnique utilisé par l'équipe" }),
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", Array)
], CreateEquipeDto.prototype, "supertechniques", void 0);
__decorate([
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", Array)
], CreateEquipeDto.prototype, "matchs", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: 'Id de la série',
    }),
    (0, class_validator_1.IsNotEmpty)(),
    __metadata("design:type", series_entity_1.Serie)
], CreateEquipeDto.prototype, "serie", void 0);
__decorate([
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", Array)
], CreateEquipeDto.prototype, "episodes", void 0);
__decorate([
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", Array)
], CreateEquipeDto.prototype, "entraineur", void 0);
__decorate([
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", Array)
], CreateEquipeDto.prototype, "images", void 0);
//# sourceMappingURL=create-equipe.dto.js.map