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
exports.UpdateEquipeDto = void 0;
const swagger_1 = require("@nestjs/swagger");
const create_equipe_dto_1 = require("./create-equipe.dto");
const class_validator_1 = require("class-validator");
class UpdateEquipeDto extends (0, swagger_1.PartialType)(create_equipe_dto_1.CreateEquipeDto) {
}
exports.UpdateEquipeDto = UpdateEquipeDto;
__decorate([
    (0, swagger_1.ApiProperty)({ description: "Nom français de l'équipe" }),
    (0, class_validator_1.IsOptional)(),
    (0, class_validator_1.IsString)(),
    __metadata("design:type", String)
], UpdateEquipeDto.prototype, "nom_francais_equipe", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({ description: "Nom original de l'équipe" }),
    (0, class_validator_1.IsString)(),
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", String)
], UpdateEquipeDto.prototype, "nom_original_equipe", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({ description: "Note sur l'équipe" }),
    (0, class_validator_1.IsString)(),
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", String)
], UpdateEquipeDto.prototype, "note", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({ description: "Capitaine de l'équipe" }),
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", Array)
], UpdateEquipeDto.prototype, "capitaines", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({ description: "Joueurs de l'équipe" }),
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", Array)
], UpdateEquipeDto.prototype, "joueurs", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({ description: "Manageur de l'équipe" }),
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", Array)
], UpdateEquipeDto.prototype, "manageurs", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({ description: "Supertactique utilisé par l'équipe" }),
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", Array)
], UpdateEquipeDto.prototype, "supertactiques", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({ description: "Supertechnique utilisé par l'équipe" }),
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", Array)
], UpdateEquipeDto.prototype, "supertechniques", void 0);
__decorate([
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", Array)
], UpdateEquipeDto.prototype, "matchs", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: 'Id de la série',
    }),
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", String)
], UpdateEquipeDto.prototype, "serieId", void 0);
__decorate([
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", Array)
], UpdateEquipeDto.prototype, "episodes", void 0);
__decorate([
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", Array)
], UpdateEquipeDto.prototype, "entraineur", void 0);
__decorate([
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", Array)
], UpdateEquipeDto.prototype, "images", void 0);
//# sourceMappingURL=update-equipe.dto.js.map