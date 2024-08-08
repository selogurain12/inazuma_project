import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { PersonnagesService } from './personnages.service';
import { CreatePersonnageDto } from './dto/create-personnage.dto';
import { UpdatePersonnageDto } from './dto/update-personnage.dto';

@Controller('personnages')
export class PersonnagesController {
  constructor(private readonly personnagesService: PersonnagesService) {}

  @Post()
  create(@Body() createPersonnageDto: CreatePersonnageDto) {
    return this.personnagesService.create(createPersonnageDto);
  }

  @Get()
  findAll() {
    return this.personnagesService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.personnagesService.findOne(id);
  }

  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() updatePersonnageDto: UpdatePersonnageDto,
  ) {
    return this.personnagesService.update(id, updatePersonnageDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.personnagesService.remove(id);
  }
}
