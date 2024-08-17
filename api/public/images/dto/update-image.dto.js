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
exports.UpdateImageDto = void 0;
const swagger_1 = require("@nestjs/swagger");
const create_image_dto_1 = require("./create-image.dto");
const class_validator_1 = require("class-validator");
class UpdateImageDto extends (0, swagger_1.PartialType)(create_image_dto_1.CreateImageDto) {
}
exports.UpdateImageDto = UpdateImageDto;
__decorate([
    (0, swagger_1.ApiProperty)({ description: "Note sur l'équipe" }),
    (0, class_validator_1.IsString)(),
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", String)
], UpdateImageDto.prototype, "note", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: 'Id de la série',
    }),
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", String)
], UpdateImageDto.prototype, "serieId", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: "Id de l'épisode",
    }),
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", String)
], UpdateImageDto.prototype, "episodeId", void 0);
__decorate([
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", String)
], UpdateImageDto.prototype, "images", void 0);
__decorate([
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", Array)
], UpdateImageDto.prototype, "equipe", void 0);
__decorate([
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", Array)
], UpdateImageDto.prototype, "personnages", void 0);
//# sourceMappingURL=update-image.dto.js.map