import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { SupertechniquesService } from './supertechniques.service';
import { CreateSupertechniqueDto } from './dto/create-supertechnique.dto';
import { UpdateSupertechniqueDto } from './dto/update-supertechnique.dto';

@Controller('supertechniques')
export class SupertechniquesController {
  constructor(
    private readonly supertechniquesService: SupertechniquesService,
  ) {}

  @Post()
  create(@Body() createSupertechniqueDto: CreateSupertechniqueDto) {
    return this.supertechniquesService.create(createSupertechniqueDto);
  }

  @Get()
  findAll() {
    return this.supertechniquesService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.supertechniquesService.findOne(id);
  }

  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() updateSupertechniqueDto: UpdateSupertechniqueDto,
  ) {
    return this.supertechniquesService.update(id, updateSupertechniqueDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.supertechniquesService.remove(id);
  }
}
