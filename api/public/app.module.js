"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.AppModule = void 0;
const common_1 = require("@nestjs/common");
const config_1 = require("@nestjs/config");
const typeorm_1 = require("@nestjs/typeorm");
const episodes_module_1 = require("./episodes/episodes.module");
const episode_entity_1 = require("./episodes/entities/episode.entity");
const personnage_entity_1 = require("./personnages/entities/personnage.entity");
const personnages_module_1 = require("./personnages/personnages.module");
const series_entity_1 = require("./series/entities/series.entity");
const series_module_1 = require("./series/series.module");
const equipe_entity_1 = require("./equipes/entities/equipe.entity");
const equipes_module_1 = require("./equipes/equipes.module");
const supertactique_entity_1 = require("./supertactiques/entities/supertactique.entity");
const supertactiques_module_1 = require("./supertactiques/supertactiques.module");
const match_entity_1 = require("./matchs/entities/match.entity");
const matchs_module_1 = require("./matchs/matchs.module");
const supertechnique_entity_1 = require("./supertechniques/entities/supertechnique.entity");
const supertechniques_module_1 = require("./supertechniques/supertechniques.module");
const image_entity_1 = require("./images/entities/image.entity");
const images_module_1 = require("./images/images.module");
let AppModule = class AppModule {
};
exports.AppModule = AppModule;
exports.AppModule = AppModule = __decorate([
    (0, common_1.Module)({
        imports: [
            config_1.ConfigModule.forRoot({ isGlobal: true }),
            typeorm_1.TypeOrmModule.forRootAsync({
                imports: [config_1.ConfigModule],
                useFactory: (configService) => ({
                    type: 'postgres',
                    host: configService.get('DB_HOST'),
                    port: +configService.get('DB_PORT'),
                    username: configService.get('DB_USERNAME'),
                    password: configService.get('DB_PASSWORD'),
                    database: configService.get('DB_NAME'),
                    entities: [
                        series_entity_1.Serie,
                        image_entity_1.Image,
                        supertactique_entity_1.Supertactique,
                        supertechnique_entity_1.Supertechnique,
                        episode_entity_1.Episode,
                        equipe_entity_1.Equipe,
                        match_entity_1.Match,
                        personnage_entity_1.Personnage,
                    ],
                    synchronize: true,
                }),
                inject: [config_1.ConfigService],
            }),
            episodes_module_1.EpisodesModule,
            equipes_module_1.EquipesModule,
            matchs_module_1.MatchsModule,
            personnages_module_1.PersonnagesModule,
            series_module_1.SeriesModule,
            supertactiques_module_1.SupertactiquesModule,
            supertechniques_module_1.SupertechniquesModule,
            images_module_1.ImagesModule,
        ],
        controllers: [],
        providers: [config_1.ConfigService],
    })
], AppModule);
//# sourceMappingURL=app.module.js.map