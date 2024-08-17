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
var __param = (this && this.__param) || function (paramIndex, decorator) {
    return function (target, key) { decorator(target, key, paramIndex); }
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.PersonnagesController = void 0;
const common_1 = require("@nestjs/common");
const personnages_service_1 = require("./personnages.service");
const create_personnage_dto_1 = require("./dto/create-personnage.dto");
const update_personnage_dto_1 = require("./dto/update-personnage.dto");
let PersonnagesController = class PersonnagesController {
    constructor(personnagesService) {
        this.personnagesService = personnagesService;
    }
    create(createPersonnageDto) {
        return this.personnagesService.create(createPersonnageDto);
    }
    findAll() {
        return this.personnagesService.findAll();
    }
    findOne(id) {
        return this.personnagesService.findOne(id);
    }
    update(id, updatePersonnageDto) {
        return this.personnagesService.update(id, updatePersonnageDto);
    }
    remove(id) {
        return this.personnagesService.remove(id);
    }
};
exports.PersonnagesController = PersonnagesController;
__decorate([
    (0, common_1.Post)(),
    __param(0, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [create_personnage_dto_1.CreatePersonnageDto]),
    __metadata("design:returntype", void 0)
], PersonnagesController.prototype, "create", null);
__decorate([
    (0, common_1.Get)(),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", []),
    __metadata("design:returntype", void 0)
], PersonnagesController.prototype, "findAll", null);
__decorate([
    (0, common_1.Get)(':id'),
    __param(0, (0, common_1.Param)('id')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String]),
    __metadata("design:returntype", void 0)
], PersonnagesController.prototype, "findOne", null);
__decorate([
    (0, common_1.Patch)(':id'),
    __param(0, (0, common_1.Param)('id')),
    __param(1, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String, update_personnage_dto_1.UpdatePersonnageDto]),
    __metadata("design:returntype", void 0)
], PersonnagesController.prototype, "update", null);
__decorate([
    (0, common_1.Delete)(':id'),
    __param(0, (0, common_1.Param)('id')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String]),
    __metadata("design:returntype", void 0)
], PersonnagesController.prototype, "remove", null);
exports.PersonnagesController = PersonnagesController = __decorate([
    (0, common_1.Controller)('personnages'),
    __metadata("design:paramtypes", [personnages_service_1.PersonnagesService])
], PersonnagesController);
//# sourceMappingURL=personnages.controller.js.map