import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateSerieDto } from './dto/create-series.dto';
import { UpdateSerieDto } from './dto/update-series.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { Serie } from './entities/series.entity';
import { Repository } from 'typeorm';

@Injectable()
export class SeriesService {
  constructor(
    @InjectRepository(Serie)
    private readonly serieRepository: Repository<Serie>,
  ) {}
  async create(createSerieDto: CreateSerieDto) {
    const newSerie = this.serieRepository.create(createSerieDto);
    const saveSerie = await this.serieRepository.save(newSerie);
    return saveSerie;
  }

  async findAll() {
    return await this.serieRepository.find();
  }

  async findOne(id: string) {
    return await this.serieRepository.findOne({
      where: {
        id,
      },
      relations: [
        'equipes',
        'episodes',
        'matchs',
        'personnages',
        'supertactiques',
        'supertechniques',
        'images',
      ],
    });
  }

  async update(id: string, updateSerieDto: UpdateSerieDto) {
    const serie = await this.serieRepository.findOne({
      where: { id },
      relations: [
        'equipes',
        'episodes',
        'matchs',
        'personnages',
        'supertactiques',
        'supertechniques',
        'images',
      ],
    });
    if (!serie) {
      throw new NotFoundException(`Serie with ID ${id} not found`);
    }
    if (updateSerieDto.nom) {
      serie.nom = updateSerieDto.nom;
    }
    if (updateSerieDto.episodes) {
      serie.episodes = [...serie.episodes, ...updateSerieDto.episodes];
    }
    if (updateSerieDto.personnages) {
      serie.personnages = [...serie.personnages, ...updateSerieDto.personnages];
    }
    if (updateSerieDto.supertechniques) {
      serie.supertechniques = [
        ...serie.supertechniques,
        ...updateSerieDto.supertechniques,
      ];
    }
    if (updateSerieDto.equipes) {
      serie.equipes = [...serie.equipes, ...updateSerieDto.equipes];
    }
    if (updateSerieDto.matchs) {
      serie.matchs = [...serie.matchs, ...updateSerieDto.matchs];
    }
    if (updateSerieDto.matchs) {
      serie.matchs = [...serie.matchs, ...updateSerieDto.matchs];
    }
    if (updateSerieDto.supertactiques) {
      serie.supertactiques = [
        ...serie.supertactiques,
        ...updateSerieDto.supertactiques,
      ];
    }
    if (updateSerieDto.images) {
      serie.images = [...serie.images, ...updateSerieDto.images];
    }
    return this.serieRepository.save(serie);
  }

  async remove(id: string) {
    const deleteSerie = await this.serieRepository.findOne({
      where: {
        id,
      },
    });
    if (!deleteSerie) {
      throw new NotFoundException(`Serie with ID ${id} not found`);
    }
    await this.serieRepository.delete(deleteSerie.id);
    return `This action removes a #${id} serie`;
  }
}
