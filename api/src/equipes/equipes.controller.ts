import { EquipesService } from './equipes.service';
import { CreateEquipeDto } from './dto/create-equipe.dto';
import { UpdateEquipeDto } from './dto/update-equipe.dto';
import { Controller, Post, Body, Get, Param, Patch, Delete } from '@nestjs/common';
@Controller('equipes')
export class EquipesController {
  constructor(private readonly equipesService: EquipesService) {}
  @Post()
  create(@Body() createEquipeDto: CreateEquipeDto) {
    return this.equipesService.create(createEquipeDto);
  }
  @Get()
  findAll() {
    return this.equipesService.findAll();
  }
  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.equipesService.findOne(id);
  }

  @Get(':id/episodes')
  findOneEpisode(@Param('id') id: string) {
    return this.equipesService.findOneEpisode(id);
  }

  @Get(':id/members')
  findOneMembers(@Param('id') id: string) {
    return this.equipesService.findOneMembers(id);
  }

  @Get(':id/supertechniques')
  findOneSupertechniques(@Param('id') id: string) {
    return this.equipesService.findOneSupertechniques(id);
  }

  @Get(':id/supertactiques')
  findOneSupertactiques(@Param('id') id: string) {
    return this.equipesService.findOneSupertactiques(id);
  }

  @Get(':id/images')
  findOneImages(@Param('id') id: string) {
    return this.equipesService.findOneImages(id);
  }

  @Get(':id/matchs')
  findOneMatchs(@Param('id') id: string) {
    return this.equipesService.findOneMatchs(id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateEquipeDto: UpdateEquipeDto) {
    return this.equipesService.update(id, updateEquipeDto);
  }
  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.equipesService.remove(id);
  }
}