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
exports.SupertechniquesController = void 0;
const common_1 = require("@nestjs/common");
const supertechniques_service_1 = require("./supertechniques.service");
const create_supertechnique_dto_1 = require("./dto/create-supertechnique.dto");
const update_supertechnique_dto_1 = require("./dto/update-supertechnique.dto");
let SupertechniquesController = class SupertechniquesController {
    constructor(supertechniquesService) {
        this.supertechniquesService = supertechniquesService;
    }
    create(createSupertechniqueDto) {
        return this.supertechniquesService.create(createSupertechniqueDto);
    }
    findAll() {
        return this.supertechniquesService.findAll();
    }
    findOne(id) {
        return this.supertechniquesService.findOne(id);
    }
    update(id, updateSupertechniqueDto) {
        return this.supertechniquesService.update(id, updateSupertechniqueDto);
    }
    remove(id) {
        return this.supertechniquesService.remove(id);
    }
};
exports.SupertechniquesController = SupertechniquesController;
__decorate([
    (0, common_1.Post)(),
    __param(0, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [create_supertechnique_dto_1.CreateSupertechniqueDto]),
    __metadata("design:returntype", void 0)
], SupertechniquesController.prototype, "create", null);
__decorate([
    (0, common_1.Get)(),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", []),
    __metadata("design:returntype", void 0)
], SupertechniquesController.prototype, "findAll", null);
__decorate([
    (0, common_1.Get)(':id'),
    __param(0, (0, common_1.Param)('id')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String]),
    __metadata("design:returntype", void 0)
], SupertechniquesController.prototype, "findOne", null);
__decorate([
    (0, common_1.Patch)(':id'),
    __param(0, (0, common_1.Param)('id')),
    __param(1, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String, update_supertechnique_dto_1.UpdateSupertechniqueDto]),
    __metadata("design:returntype", void 0)
], SupertechniquesController.prototype, "update", null);
__decorate([
    (0, common_1.Delete)(':id'),
    __param(0, (0, common_1.Param)('id')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String]),
    __metadata("design:returntype", void 0)
], SupertechniquesController.prototype, "remove", null);
exports.SupertechniquesController = SupertechniquesController = __decorate([
    (0, common_1.Controller)('supertechniques'),
    __metadata("design:paramtypes", [supertechniques_service_1.SupertechniquesService])
], SupertechniquesController);
//# sourceMappingURL=supertechniques.controller.js.map