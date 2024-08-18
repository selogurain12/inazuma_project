import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateEquipeDto } from './dto/create-equipe.dto';
import { UpdateEquipeDto } from './dto/update-equipe.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { Equipe } from './entities/equipe.entity';
import { Repository } from 'typeorm';

@Injectable()
export class EquipesService {
  constructor(
    @InjectRepository(Equipe)
    private readonly equipeRepository: Repository<Equipe>,
  ) {}
  async create(createEquipeDto: CreateEquipeDto) {
    const newEquipe = this.equipeRepository.create(createEquipeDto);
    const saveEquipe = await this.equipeRepository.save(newEquipe);
    return saveEquipe;
  }

  async findAll() {
    return await this.equipeRepository.find({
      relations: [
        'serie',
        'episodes',
      ],
    });
  }

  async findOne(id: string) {
    return await this.equipeRepository.findOne({
      where: {
        id,
      },
      relations: [
        'episodes',
        'capitaines',
        'supertactiques',
        'supertechniques',
        'images',
        'joueurs',
        'manageurs',
        'entraineur',
      ],
    });
  }

  async update(id: string, updateEquipeDto: UpdateEquipeDto) {
    const equipe = await this.equipeRepository.findOne({
      where: { id },
      relations: [
        'serie',
        'episodes',
        'capitaines',
        'matchs',
        'supertactiques',
        'supertechniques',
        'images',
        'joueurs',
        'manageurs',
        'entraineur',
      ],
    });
    if (!equipe) {
      throw new NotFoundException(`Equipe with ID ${id} not found`);
    }
    if (updateEquipeDto.nom_francais_equipe) {
      equipe.nom_francais_equipe = updateEquipeDto.nom_francais_equipe;
    }
    if (updateEquipeDto.nom_original_equipe) {
      equipe.nom_original_equipe = updateEquipeDto.nom_original_equipe;
    }
    if (updateEquipeDto.note) {
      equipe.note = updateEquipeDto.note;
    }
    if (updateEquipeDto.capitaines) {
      equipe.capitaines = [...equipe.capitaines, ...updateEquipeDto.capitaines];
    }
    if (updateEquipeDto.joueurs) {
      equipe.joueurs = [...equipe.joueurs, ...updateEquipeDto.joueurs];
    }
    if (updateEquipeDto.manageurs) {
      equipe.manageurs = [...equipe.manageurs, ...updateEquipeDto.manageurs];
    }
    if (updateEquipeDto.supertactiques) {
      equipe.supertactiques = [
        ...equipe.supertactiques,
        ...updateEquipeDto.supertactiques,
      ];
    }
    if (updateEquipeDto.supertechniques) {
      equipe.supertechniques = [
        ...equipe.supertechniques,
        ...updateEquipeDto.supertechniques,
      ];
    }
    if (updateEquipeDto.matchs) {
      equipe.matchs = [...equipe.matchs, ...updateEquipeDto.matchs];
    }
    if (updateEquipeDto.serieId) {
      equipe.serie.id = updateEquipeDto.serieId;
    }
    if (updateEquipeDto.episodes) {
      equipe.episodes = [...equipe.episodes, ...updateEquipeDto.episodes];
    }
    if (updateEquipeDto.entraineur) {
      equipe.entraineur = [...equipe.entraineur, ...updateEquipeDto.entraineur];
    }
    if (updateEquipeDto.images) {
      equipe.images = [...equipe.images, ...updateEquipeDto.images];
    }
    return this.equipeRepository.save(equipe);
  }

  async remove(id: string) {
    const deleteEquipe = await this.equipeRepository.findOne({
      where: {
        id,
      },
    });
    if (!deleteEquipe) {
      throw new NotFoundException(`Equipe with ID ${id} not found`);
    }
    await this.equipeRepository.delete(deleteEquipe.id);
    return `This action removes a #${id} equipe`;
  }
}
