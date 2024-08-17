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
exports.CreatePersonnageDto = void 0;
const swagger_1 = require("@nestjs/swagger");
const class_validator_1 = require("class-validator");
const series_entity_1 = require("../../series/entities/series.entity");
class CreatePersonnageDto {
}
exports.CreatePersonnageDto = CreatePersonnageDto;
__decorate([
    (0, swagger_1.ApiProperty)({
        description: 'Nom français du personnage',
    }),
    (0, class_validator_1.IsNotEmpty)(),
    (0, class_validator_1.IsString)(),
    __metadata("design:type", String)
], CreatePersonnageDto.prototype, "nom_fran\u00E7ais_personnage", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: 'Nom original du personnage',
    }),
    (0, class_validator_1.IsOptional)(),
    (0, class_validator_1.IsString)(),
    __metadata("design:type", String)
], CreatePersonnageDto.prototype, "nom_original_personnage", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: 'Position du personnage',
    }),
    (0, class_validator_1.IsOptional)(),
    (0, class_validator_1.IsString)(),
    __metadata("design:type", String)
], CreatePersonnageDto.prototype, "position_personnage", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: 'Note sur le personnage',
    }),
    (0, class_validator_1.IsOptional)(),
    (0, class_validator_1.IsString)(),
    __metadata("design:type", String)
], CreatePersonnageDto.prototype, "note", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: 'Supertechniques de personnage',
    }),
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", Array)
], CreatePersonnageDto.prototype, "supertechniques", void 0);
__decorate([
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", Array)
], CreatePersonnageDto.prototype, "episode", void 0);
__decorate([
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", Array)
], CreatePersonnageDto.prototype, "equipes", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: 'Id de la série',
    }),
    (0, class_validator_1.IsNotEmpty)(),
    __metadata("design:type", series_entity_1.Serie)
], CreatePersonnageDto.prototype, "serie", void 0);
__decorate([
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", Array)
], CreatePersonnageDto.prototype, "images", void 0);
//# sourceMappingURL=create-personnage.dto.js.map