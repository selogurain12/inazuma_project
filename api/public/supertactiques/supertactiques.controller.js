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
exports.SupertactiquesController = void 0;
const common_1 = require("@nestjs/common");
const supertactiques_service_1 = require("./supertactiques.service");
const create_supertactique_dto_1 = require("./dto/create-supertactique.dto");
const update_supertactique_dto_1 = require("./dto/update-supertactique.dto");
let SupertactiquesController = class SupertactiquesController {
    constructor(supertactiquesService) {
        this.supertactiquesService = supertactiquesService;
    }
    create(createSupertactiqueDto) {
        return this.supertactiquesService.create(createSupertactiqueDto);
    }
    findAll() {
        return this.supertactiquesService.findAll();
    }
    findOne(id) {
        return this.supertactiquesService.findOne(id);
    }
    update(id, updateSupertactiqueDto) {
        return this.supertactiquesService.update(id, updateSupertactiqueDto);
    }
    remove(id) {
        return this.supertactiquesService.remove(id);
    }
};
exports.SupertactiquesController = SupertactiquesController;
__decorate([
    (0, common_1.Post)(),
    __param(0, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [create_supertactique_dto_1.CreateSupertactiqueDto]),
    __metadata("design:returntype", void 0)
], SupertactiquesController.prototype, "create", null);
__decorate([
    (0, common_1.Get)(),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", []),
    __metadata("design:returntype", void 0)
], SupertactiquesController.prototype, "findAll", null);
__decorate([
    (0, common_1.Get)(':id'),
    __param(0, (0, common_1.Param)('id')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String]),
    __metadata("design:returntype", void 0)
], SupertactiquesController.prototype, "findOne", null);
__decorate([
    (0, common_1.Patch)(':id'),
    __param(0, (0, common_1.Param)('id')),
    __param(1, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String, update_supertactique_dto_1.UpdateSupertactiqueDto]),
    __metadata("design:returntype", void 0)
], SupertactiquesController.prototype, "update", null);
__decorate([
    (0, common_1.Delete)(':id'),
    __param(0, (0, common_1.Param)('id')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String]),
    __metadata("design:returntype", void 0)
], SupertactiquesController.prototype, "remove", null);
exports.SupertactiquesController = SupertactiquesController = __decorate([
    (0, common_1.Controller)('supertactiques'),
    __metadata("design:paramtypes", [supertactiques_service_1.SupertactiquesService])
], SupertactiquesController);
//# sourceMappingURL=supertactiques.controller.js.map