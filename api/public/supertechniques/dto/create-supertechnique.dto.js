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
exports.CreateSupertechniqueDto = void 0;
const swagger_1 = require("@nestjs/swagger");
const class_validator_1 = require("class-validator");
class CreateSupertechniqueDto {
}
exports.CreateSupertechniqueDto = CreateSupertechniqueDto;
__decorate([
    (0, swagger_1.ApiProperty)({
        description: 'Nom français de la supertechnique',
    }),
    (0, class_validator_1.IsNotEmpty)(),
    (0, class_validator_1.IsString)(),
    __metadata("design:type", String)
], CreateSupertechniqueDto.prototype, "nom_fran\u00E7ais_supertechniques", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: 'Nom original de la supertechnique',
    }),
    (0, class_validator_1.IsOptional)(),
    (0, class_validator_1.IsString)(),
    __metadata("design:type", String)
], CreateSupertechniqueDto.prototype, "nom_original_supertechniques", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: 'Type de la supertechnique',
    }),
    (0, class_validator_1.IsNotEmpty)(),
    (0, class_validator_1.IsString)(),
    __metadata("design:type", String)
], CreateSupertechniqueDto.prototype, "type_supertechniques", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: 'Note(s) sur la supertechnique',
    }),
    (0, class_validator_1.IsOptional)(),
    (0, class_validator_1.IsString)(),
    __metadata("design:type", String)
], CreateSupertechniqueDto.prototype, "notes_supertechniques", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: 'Obtention de la supertechnique',
    }),
    (0, class_validator_1.IsOptional)(),
    (0, class_validator_1.IsString)(),
    __metadata("design:type", String)
], CreateSupertechniqueDto.prototype, "obtention_supertechniques", void 0);
__decorate([
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", Array)
], CreateSupertechniqueDto.prototype, "equipes", void 0);
__decorate([
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", Array)
], CreateSupertechniqueDto.prototype, "personnages", void 0);
__decorate([
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", Array)
], CreateSupertechniqueDto.prototype, "episodes", void 0);
__decorate([
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", Array)
], CreateSupertechniqueDto.prototype, "matchs", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: 'Id de la série',
    }),
    (0, class_validator_1.IsNotEmpty)(),
    __metadata("design:type", String)
], CreateSupertechniqueDto.prototype, "serieId", void 0);
__decorate([
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", Array)
], CreateSupertechniqueDto.prototype, "video", void 0);
//# sourceMappingURL=create-supertechnique.dto.js.map