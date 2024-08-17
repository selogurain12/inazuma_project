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
exports.UpdateSupertechniqueDto = void 0;
const swagger_1 = require("@nestjs/swagger");
const create_supertechnique_dto_1 = require("./create-supertechnique.dto");
const class_validator_1 = require("class-validator");
class UpdateSupertechniqueDto extends (0, swagger_1.PartialType)(create_supertechnique_dto_1.CreateSupertechniqueDto) {
}
exports.UpdateSupertechniqueDto = UpdateSupertechniqueDto;
__decorate([
    (0, swagger_1.ApiProperty)({
        description: 'Nom français de la supertechnique',
    }),
    (0, class_validator_1.IsOptional)(),
    (0, class_validator_1.IsString)(),
    __metadata("design:type", String)
], UpdateSupertechniqueDto.prototype, "nom_fran\u00E7ais_supertechniques", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: 'Nom original de la supertechnique',
    }),
    (0, class_validator_1.IsOptional)(),
    (0, class_validator_1.IsString)(),
    __metadata("design:type", String)
], UpdateSupertechniqueDto.prototype, "nom_original_supertechniques", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: 'Type de la supertechnique',
    }),
    (0, class_validator_1.IsOptional)(),
    (0, class_validator_1.IsString)(),
    __metadata("design:type", String)
], UpdateSupertechniqueDto.prototype, "type_supertechniques", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: 'Note(s) sur la supertechnique',
    }),
    (0, class_validator_1.IsOptional)(),
    (0, class_validator_1.IsString)(),
    __metadata("design:type", String)
], UpdateSupertechniqueDto.prototype, "notes_supertechniques", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: 'Obtention de la supertechnique',
    }),
    (0, class_validator_1.IsOptional)(),
    (0, class_validator_1.IsString)(),
    __metadata("design:type", String)
], UpdateSupertechniqueDto.prototype, "obtention_supertechniques", void 0);
__decorate([
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", Array)
], UpdateSupertechniqueDto.prototype, "equipes", void 0);
__decorate([
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", Array)
], UpdateSupertechniqueDto.prototype, "personnages", void 0);
__decorate([
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", Array)
], UpdateSupertechniqueDto.prototype, "episodes", void 0);
__decorate([
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", Array)
], UpdateSupertechniqueDto.prototype, "matchs", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: 'Id de la série',
    }),
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", String)
], UpdateSupertechniqueDto.prototype, "serieId", void 0);
__decorate([
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", Array)
], UpdateSupertechniqueDto.prototype, "video", void 0);
//# sourceMappingURL=update-supertechnique.dto.js.map