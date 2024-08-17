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
exports.UpdatePersonnageDto = void 0;
const swagger_1 = require("@nestjs/swagger");
const create_personnage_dto_1 = require("./create-personnage.dto");
const class_validator_1 = require("class-validator");
class UpdatePersonnageDto extends (0, swagger_1.PartialType)(create_personnage_dto_1.CreatePersonnageDto) {
}
exports.UpdatePersonnageDto = UpdatePersonnageDto;
__decorate([
    (0, swagger_1.ApiProperty)({
        description: 'Nom français du personnage',
    }),
    (0, class_validator_1.IsOptional)(),
    (0, class_validator_1.IsString)(),
    __metadata("design:type", String)
], UpdatePersonnageDto.prototype, "nom_fran\u00E7ais_personnage", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: 'Nom original du personnage',
    }),
    (0, class_validator_1.IsOptional)(),
    (0, class_validator_1.IsString)(),
    __metadata("design:type", String)
], UpdatePersonnageDto.prototype, "nom_original_personnage", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: 'Position du personnage',
    }),
    (0, class_validator_1.IsOptional)(),
    (0, class_validator_1.IsString)(),
    __metadata("design:type", String)
], UpdatePersonnageDto.prototype, "position_personnage", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: 'Note sur le personnage',
    }),
    (0, class_validator_1.IsOptional)(),
    (0, class_validator_1.IsString)(),
    __metadata("design:type", String)
], UpdatePersonnageDto.prototype, "note", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: 'Supertechniques de personnage',
    }),
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", Array)
], UpdatePersonnageDto.prototype, "supertechniques", void 0);
__decorate([
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", Array)
], UpdatePersonnageDto.prototype, "episode", void 0);
__decorate([
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", Array)
], UpdatePersonnageDto.prototype, "equipes", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: 'Id de la série',
    }),
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", String)
], UpdatePersonnageDto.prototype, "serieId", void 0);
__decorate([
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", Array)
], UpdatePersonnageDto.prototype, "images", void 0);
//# sourceMappingURL=update-personnage.dto.js.map