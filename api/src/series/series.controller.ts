import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { SeriesService } from './series.service';
import { CreateSerieDto } from './dto/create-series.dto';
import { UpdateSerieDto } from './dto/update-series.dto';

@Controller('series')
export class SeriesController {
  constructor(private readonly seriesService: SeriesService) {}

  @Post()
  create(@Body() createseriesDto: CreateSerieDto) {
    return this.seriesService.create(createseriesDto);
  }

  @Get()
  findAll() {
    return this.seriesService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.seriesService.findOne(id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateseriesDto: UpdateSerieDto) {
    return this.seriesService.update(id, updateseriesDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.seriesService.remove(id);
  }
}
