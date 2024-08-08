import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateSupertactiqueDto } from './dto/create-supertactique.dto';
import { UpdateSupertactiqueDto } from './dto/update-supertactique.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { Supertactique } from './entities/supertactique.entity';
import { Repository } from 'typeorm';

@Injectable()
export class SupertactiquesService {
  constructor(
    @InjectRepository(Supertactique)
    private readonly supertactiqueRepository: Repository<Supertactique>,
  ) {}
  async create(createSupertactiqueDto: CreateSupertactiqueDto) {
    const newSupertactique = this.supertactiqueRepository.create(
      createSupertactiqueDto,
    );
    const saveSupertactique =
      await this.supertactiqueRepository.save(newSupertactique);
    return saveSupertactique;
  }

  async findAll() {
    return await this.supertactiqueRepository.find({
      relations: ['equipes', 'episodes', 'matchs', 'serie'],
    });
  }

  async findOne(id: string) {
    return await this.supertactiqueRepository.findOne({
      where: {
        id,
      },
      relations: ['equipes', 'episodes', 'matchs', 'serie'],
    });
  }

  async update(id: string, updateSupertactiqueDto: UpdateSupertactiqueDto) {
    const supertactique = await this.supertactiqueRepository.findOne({
      where: { id },
      relations: ['equipes', 'episodes', 'matchs', 'serie'],
    });
    if (!supertactique) {
      throw new NotFoundException(`Supertactique with ID ${id} not found`);
    }
    if (updateSupertactiqueDto.nom) {
      supertactique.nom = updateSupertactiqueDto.nom;
    }
    if (updateSupertactiqueDto.serieId) {
      supertactique.serie.id = updateSupertactiqueDto.serieId;
    }
    if (updateSupertactiqueDto.equipes) {
      supertactique.equipes = [
        ...supertactique.equipes,
        ...updateSupertactiqueDto.equipes,
      ];
    }
    if (updateSupertactiqueDto.matchs) {
      supertactique.matchs = [
        ...supertactique.matchs,
        ...updateSupertactiqueDto.matchs,
      ];
    }
    if (updateSupertactiqueDto.episodes) {
      supertactique.episodes = [
        ...supertactique.episodes,
        ...updateSupertactiqueDto.episodes,
      ];
    }
    if (updateSupertactiqueDto.video) {
      supertactique.video = [
        ...supertactique.video,
        ...updateSupertactiqueDto.video,
      ];
    }
    return this.supertactiqueRepository.save(supertactique);
  }

  async remove(id: string) {
    const deleteSupertactique = await this.supertactiqueRepository.findOne({
      where: {
        id,
      },
    });
    if (!deleteSupertactique) {
      throw new NotFoundException(`Supertactique with ID ${id} not found`);
    }
    await this.supertactiqueRepository.delete(deleteSupertactique.id);
    return `This action removes a #${id} supertactique`;
  }
}
