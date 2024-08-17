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
exports.EpisodesController = void 0;
const common_1 = require("@nestjs/common");
const episodes_service_1 = require("./episodes.service");
const create_episode_dto_1 = require("./dto/create-episode.dto");
const update_episode_dto_1 = require("./dto/update-episode.dto");
let EpisodesController = class EpisodesController {
    constructor(episodesService) {
        this.episodesService = episodesService;
    }
    create(createEpisodeDto) {
        return this.episodesService.create(createEpisodeDto);
    }
    findAll() {
        return this.episodesService.findAll();
    }
    findOne(id) {
        return this.episodesService.findOne(id);
    }
    update(id, updateEpisodeDto) {
        return this.episodesService.update(id, updateEpisodeDto);
    }
    remove(id) {
        return this.episodesService.remove(id);
    }
};
exports.EpisodesController = EpisodesController;
__decorate([
    (0, common_1.Post)(),
    __param(0, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [create_episode_dto_1.CreateEpisodeDto]),
    __metadata("design:returntype", void 0)
], EpisodesController.prototype, "create", null);
__decorate([
    (0, common_1.Get)(),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", []),
    __metadata("design:returntype", void 0)
], EpisodesController.prototype, "findAll", null);
__decorate([
    (0, common_1.Get)(':id'),
    __param(0, (0, common_1.Param)('id')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String]),
    __metadata("design:returntype", void 0)
], EpisodesController.prototype, "findOne", null);
__decorate([
    (0, common_1.Patch)(':id'),
    __param(0, (0, common_1.Param)('id')),
    __param(1, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String, update_episode_dto_1.UpdateEpisodeDto]),
    __metadata("design:returntype", void 0)
], EpisodesController.prototype, "update", null);
__decorate([
    (0, common_1.Delete)(':id'),
    __param(0, (0, common_1.Param)('id')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String]),
    __metadata("design:returntype", void 0)
], EpisodesController.prototype, "remove", null);
exports.EpisodesController = EpisodesController = __decorate([
    (0, common_1.Controller)('episodes'),
    __metadata("design:paramtypes", [episodes_service_1.EpisodesService])
], EpisodesController);
//# sourceMappingURL=episodes.controller.js.map