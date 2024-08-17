"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.PersonnagesModule = void 0;
const common_1 = require("@nestjs/common");
const personnages_service_1 = require("./personnages.service");
const personnages_controller_1 = require("./personnages.controller");
const typeorm_1 = require("@nestjs/typeorm");
const personnage_entity_1 = require("./entities/personnage.entity");
let PersonnagesModule = class PersonnagesModule {
};
exports.PersonnagesModule = PersonnagesModule;
exports.PersonnagesModule = PersonnagesModule = __decorate([
    (0, common_1.Module)({
        imports: [typeorm_1.TypeOrmModule.forFeature([personnage_entity_1.Personnage])],
        controllers: [personnages_controller_1.PersonnagesController],
        providers: [personnages_service_1.PersonnagesService],
    })
], PersonnagesModule);
//# sourceMappingURL=personnages.module.js.map