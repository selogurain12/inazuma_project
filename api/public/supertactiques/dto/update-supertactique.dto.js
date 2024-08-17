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
exports.UpdateSupertactiqueDto = void 0;
const swagger_1 = require("@nestjs/swagger");
const create_supertactique_dto_1 = require("./create-supertactique.dto");
const class_validator_1 = require("class-validator");
class UpdateSupertactiqueDto extends (0, swagger_1.PartialType)(create_supertactique_dto_1.CreateSupertactiqueDto) {
}
exports.UpdateSupertactiqueDto = UpdateSupertactiqueDto;
__decorate([
    (0, swagger_1.ApiProperty)({
        description: 'Nom de la supertactique',
    }),
    (0, class_validator_1.IsOptional)(),
    (0, class_validator_1.IsString)(),
    __metadata("design:type", String)
], UpdateSupertactiqueDto.prototype, "nom", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: 'Id de la série',
    }),
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", String)
], UpdateSupertactiqueDto.prototype, "serieId", void 0);
__decorate([
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", Array)
], UpdateSupertactiqueDto.prototype, "equipes", void 0);
__decorate([
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", Array)
], UpdateSupertactiqueDto.prototype, "matchs", void 0);
__decorate([
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", Array)
], UpdateSupertactiqueDto.prototype, "episodes", void 0);
__decorate([
    (0, class_validator_1.IsString)(),
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", Array)
], UpdateSupertactiqueDto.prototype, "video", void 0);
//# sourceMappingURL=update-supertactique.dto.js.map