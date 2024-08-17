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
exports.SeriesController = void 0;
const common_1 = require("@nestjs/common");
const series_service_1 = require("./series.service");
const create_series_dto_1 = require("./dto/create-series.dto");
const update_series_dto_1 = require("./dto/update-series.dto");
let SeriesController = class SeriesController {
    constructor(seriesService) {
        this.seriesService = seriesService;
    }
    create(createseriesDto) {
        return this.seriesService.create(createseriesDto);
    }
    findAll() {
        return this.seriesService.findAll();
    }
    findOne(id) {
        return this.seriesService.findOne(id);
    }
    update(id, updateseriesDto) {
        return this.seriesService.update(id, updateseriesDto);
    }
    remove(id) {
        return this.seriesService.remove(id);
    }
};
exports.SeriesController = SeriesController;
__decorate([
    (0, common_1.Post)(),
    __param(0, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [create_series_dto_1.CreateSerieDto]),
    __metadata("design:returntype", void 0)
], SeriesController.prototype, "create", null);
__decorate([
    (0, common_1.Get)(),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", []),
    __metadata("design:returntype", void 0)
], SeriesController.prototype, "findAll", null);
__decorate([
    (0, common_1.Get)(':id'),
    __param(0, (0, common_1.Param)('id')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String]),
    __metadata("design:returntype", void 0)
], SeriesController.prototype, "findOne", null);
__decorate([
    (0, common_1.Patch)(':id'),
    __param(0, (0, common_1.Param)('id')),
    __param(1, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String, update_series_dto_1.UpdateSerieDto]),
    __metadata("design:returntype", void 0)
], SeriesController.prototype, "update", null);
__decorate([
    (0, common_1.Delete)(':id'),
    __param(0, (0, common_1.Param)('id')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String]),
    __metadata("design:returntype", void 0)
], SeriesController.prototype, "remove", null);
exports.SeriesController = SeriesController = __decorate([
    (0, common_1.Controller)('series'),
    __metadata("design:paramtypes", [series_service_1.SeriesService])
], SeriesController);
//# sourceMappingURL=series.controller.js.map