import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { SupertactiquesService } from './supertactiques.service';
import { CreateSupertactiqueDto } from './dto/create-supertactique.dto';
import { UpdateSupertactiqueDto } from './dto/update-supertactique.dto';

@Controller('supertactiques')
export class SupertactiquesController {
  constructor(private readonly supertactiquesService: SupertactiquesService) {}

  @Post()
  create(@Body() createSupertactiqueDto: CreateSupertactiqueDto) {
    return this.supertactiquesService.create(createSupertactiqueDto);
  }

  @Get()
  findAll() {
    return this.supertactiquesService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.supertactiquesService.findOne(id);
  }

  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() updateSupertactiqueDto: UpdateSupertactiqueDto,
  ) {
    return this.supertactiquesService.update(id, updateSupertactiqueDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.supertactiquesService.remove(id);
  }
}
