import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateSupertechniqueDto } from './dto/create-supertechnique.dto';
import { UpdateSupertechniqueDto } from './dto/update-supertechnique.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { Supertechnique } from './entities/supertechnique.entity';
import { Repository } from 'typeorm';

@Injectable()
export class SupertechniquesService {
  constructor(
    @InjectRepository(Supertechnique)
    private readonly supertechniqueRepository: Repository<Supertechnique>,
  ) {}
  async create(createSupertechniqueDto: CreateSupertechniqueDto) {
    const newSupertechnique = this.supertechniqueRepository.create(
      createSupertechniqueDto,
    );
    const saveSupertechnique =
      await this.supertechniqueRepository.save(newSupertechnique);
    return saveSupertechnique;
  }

  async findAll() {
    return await this.supertechniqueRepository.find({
      relations: ['equipes', 'episodes', 'matchs', 'serie', 'personnages'],
    });
  }

  async findOne(id: string) {
    return await this.supertechniqueRepository.findOne({
      where: {
        id,
      },
      relations: ['equipes', 'episodes', 'matchs', 'serie', 'personnages'],
    });
  }

  async update(id: string, updateSupertechniqueDto: UpdateSupertechniqueDto) {
    const supertechnique = await this.supertechniqueRepository.findOne({
      where: { id },
      relations: ['equipes', 'episodes', 'matchs', 'serie', 'personnages'],
    });
    if (!supertechnique) {
      throw new NotFoundException(`Supertechnique with ID ${id} not found`);
    }
    if (updateSupertechniqueDto.nom_français_supertechniques) {
      supertechnique.nom_français_supertechniques =
        updateSupertechniqueDto.nom_français_supertechniques;
    }
    if (updateSupertechniqueDto.nom_original_supertechniques) {
      supertechnique.nom_original_supertechniques =
        updateSupertechniqueDto.nom_original_supertechniques;
    }
    if (updateSupertechniqueDto.type_supertechniques) {
      supertechnique.type_supertechniques =
        updateSupertechniqueDto.type_supertechniques;
    }
    if (updateSupertechniqueDto.notes_supertechniques) {
      supertechnique.notes_supertechniques =
        updateSupertechniqueDto.notes_supertechniques;
    }
    if (updateSupertechniqueDto.obtention_supertechniques) {
      supertechnique.obtention_supertechniques =
        updateSupertechniqueDto.obtention_supertechniques;
    }
    if (updateSupertechniqueDto.equipes) {
      supertechnique.equipes = [
        ...supertechnique.equipes,
        ...updateSupertechniqueDto.equipes,
      ];
    }
    if (updateSupertechniqueDto.personnages) {
      supertechnique.personnages = [
        ...supertechnique.personnages,
        ...updateSupertechniqueDto.personnages,
      ];
    }
    if (updateSupertechniqueDto.episodes) {
      supertechnique.episodes = [
        ...supertechnique.episodes,
        ...updateSupertechniqueDto.episodes,
      ];
    }
    if (updateSupertechniqueDto.matchs) {
      supertechnique.matchs = [
        ...supertechnique.matchs,
        ...updateSupertechniqueDto.matchs,
      ];
    }
    if (updateSupertechniqueDto.video) {
      supertechnique.video = [
        ...supertechnique.video,
        ...updateSupertechniqueDto.video,
      ];
    }
    if (updateSupertechniqueDto.serieId) {
      supertechnique.serie.id = updateSupertechniqueDto.serieId;
    }
    return this.supertechniqueRepository.save(supertechnique);
  }

  async remove(id: string) {
    const deleteSupertechnique = await this.supertechniqueRepository.findOne({
      where: {
        id,
      },
    });
    if (!deleteSupertechnique) {
      throw new NotFoundException(`Supertechnique with ID ${id} not found`);
    }
    await this.supertechniqueRepository.delete(deleteSupertechnique.id);
    return `This action removes a #${id} supertechnique`;
  }
}
