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
exports.EquipesController = void 0;
const common_1 = require("@nestjs/common");
const equipes_service_1 = require("./equipes.service");
const create_equipe_dto_1 = require("./dto/create-equipe.dto");
const update_equipe_dto_1 = require("./dto/update-equipe.dto");
let EquipesController = class EquipesController {
    constructor(equipesService) {
        this.equipesService = equipesService;
    }
    create(createEquipeDto) {
        return this.equipesService.create(createEquipeDto);
    }
    findAll() {
        return this.equipesService.findAll();
    }
    findOne(id) {
        return this.equipesService.findOne(id);
    }
    update(id, updateEquipeDto) {
        return this.equipesService.update(id, updateEquipeDto);
    }
    remove(id) {
        return this.equipesService.remove(id);
    }
};
exports.EquipesController = EquipesController;
__decorate([
    (0, common_1.Post)(),
    __param(0, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [create_equipe_dto_1.CreateEquipeDto]),
    __metadata("design:returntype", void 0)
], EquipesController.prototype, "create", null);
__decorate([
    (0, common_1.Get)(),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", []),
    __metadata("design:returntype", void 0)
], EquipesController.prototype, "findAll", null);
__decorate([
    (0, common_1.Get)(':id'),
    __param(0, (0, common_1.Param)('id')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String]),
    __metadata("design:returntype", void 0)
], EquipesController.prototype, "findOne", null);
__decorate([
    (0, common_1.Patch)(':id'),
    __param(0, (0, common_1.Param)('id')),
    __param(1, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String, update_equipe_dto_1.UpdateEquipeDto]),
    __metadata("design:returntype", void 0)
], EquipesController.prototype, "update", null);
__decorate([
    (0, common_1.Delete)(':id'),
    __param(0, (0, common_1.Param)('id')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String]),
    __metadata("design:returntype", void 0)
], EquipesController.prototype, "remove", null);
exports.EquipesController = EquipesController = __decorate([
    (0, common_1.Controller)('equipes'),
    __metadata("design:paramtypes", [equipes_service_1.EquipesService])
], EquipesController);
//# sourceMappingURL=equipes.controller.js.map