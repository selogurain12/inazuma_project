"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.MatchsModule = void 0;
const common_1 = require("@nestjs/common");
const matchs_service_1 = require("./matchs.service");
const matchs_controller_1 = require("./matchs.controller");
const typeorm_1 = require("@nestjs/typeorm");
const match_entity_1 = require("./entities/match.entity");
const equipe_entity_1 = require("../equipes/entities/equipe.entity");
let MatchsModule = class MatchsModule {
};
exports.MatchsModule = MatchsModule;
exports.MatchsModule = MatchsModule = __decorate([
    (0, common_1.Module)({
        imports: [typeorm_1.TypeOrmModule.forFeature([match_entity_1.Match, equipe_entity_1.Equipe])],
        controllers: [matchs_controller_1.MatchsController],
        providers: [matchs_service_1.MatchsService],
    })
], MatchsModule);
//# sourceMappingURL=matchs.module.js.map