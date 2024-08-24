import { CreateEquipeDto } from './dto/create-equipe.dto';
import { UpdateEquipeDto } from './dto/update-equipe.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { Equipe } from './entities/equipe.entity';
import { Repository } from 'typeorm';
import { Injectable, NotFoundException } from '@nestjs/common';
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
  async findOneEpisode(id: string) {
    return await this.equipeRepository.findOne({
      where: {
        id,
      },
      relations: [
        'episodes',
      ],
    });
  }
  async findOne(id: string) {
    return await this.equipeRepository.findOne({
      where: {
        id,
      },
    });
  }
  async findOneMembers(id: string) {
    return await this.equipeRepository.findOne({
      where: {
        id,
      },
      relations: [
        'capitaines',
        'joueurs',
        'manageurs',
        'entraineur',
      ],
    });
  }
  async findOneSupertechniques(id: string) {
    return await this.equipeRepository.findOne({
      where: {
        id,
      },
      relations: [
        'supertechniques',
      ],
    });
  }
  async findOneSupertactiques(id: string) {
    return await this.equipeRepository.findOne({
      where: {
        id,
      },
      relations: [
        'supertactiques',
      ],
    });
  }
  async findOneImages(id: string) {
    return await this.equipeRepository.findOne({
      where: {
        id,
      },
      relations: [
        'images',
        'serie',
        'matchs'
      ],
    });
  }
  async findOneMatchs(id: string) {
    return await this.equipeRepository.findOne({
      where: {
        id,
      },
      relations: [
        'matchs',
        'serie'
      ],
    });
  }
  async update(id: string, updateEquipeDto: UpdateEquipeDto) {
    const equipe = await this.equipeRepository.findOne({
      where: { id },
      relations: [
        'images',
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
    if (updateEquipeDto.images) {
      equipe.images = [...equipe.images, ...updateEquipeDto.images];
    }
    return this.equipeRepository.save(equipe);
  }
  async updateEpisodes(id: string, updateEquipeDto: UpdateEquipeDto) {
    const equipeEpisode = await this.equipeRepository.findOne({
      where: { id },
      relations: [
        'episodes',
      ],
    });
    if (!equipeEpisode) {
      throw new NotFoundException(`Equipe with ID ${id} not found`);
    }
    if (updateEquipeDto.episodes) {
      equipeEpisode.episodes = [...equipeEpisode.episodes, ...updateEquipeDto.episodes];
    }
    return this.equipeRepository.save(equipeEpisode);
  }
  async updateMembers(id: string, updateEquipeDto: UpdateEquipeDto) {
    const equipeMembers = await this.equipeRepository.findOne({
      where: { id },
      relations: [
        'capitaines',
        'joueurs',
        'manageurs',
        'entraineur',
      ],
    });
    if (!equipeMembers) {
      throw new NotFoundException(`Equipe with ID ${id} not found`);
    }
    if (updateEquipeDto.entraineur) {
      equipeMembers.entraineur = [...equipeMembers.entraineur, ...updateEquipeDto.entraineur];
    }
    if (updateEquipeDto.capitaines) {
      equipeMembers.capitaines = [...equipeMembers.capitaines, ...updateEquipeDto.capitaines];
    }
    if (updateEquipeDto.joueurs) {
      equipeMembers.joueurs = [...equipeMembers.joueurs, ...updateEquipeDto.joueurs];
    }
    if (updateEquipeDto.manageurs) {
      equipeMembers.manageurs = [...equipeMembers.manageurs, ...updateEquipeDto.manageurs];
    }
    return this.equipeRepository.save(equipeMembers);
  }
  async updateMatchSerie(id: string, updateEquipeDto: UpdateEquipeDto) {
    const equipeMatchSerie = await this.equipeRepository.findOne({
      where: { id },
      relations: [
        'serie',
        'matchs',
      ],
    });
    if (!equipeMatchSerie) {
      throw new NotFoundException(`Equipe with ID ${id} not found`);
    }
    if (updateEquipeDto.matchs) {
      equipeMatchSerie.matchs = [...equipeMatchSerie.matchs, ...updateEquipeDto.matchs];
    }
    return this.equipeRepository.save(equipeMatchSerie);
  }
  async updateSupertechniques(id: string, updateEquipeDto: UpdateEquipeDto) {
    const equipeSupertechniques = await this.equipeRepository.findOne({
      where: { id },
      relations: [
        'supertechniques',
      ],
    });
    if (!equipeSupertechniques) {
      throw new NotFoundException(`Equipe with ID ${id} not found`);
    }
    if (updateEquipeDto.supertechniques) {
      equipeSupertechniques.supertechniques = [
        ...equipeSupertechniques.supertechniques,
        ...updateEquipeDto.supertechniques,
      ];
    }
    return this.equipeRepository.save(equipeSupertechniques);
  }
  async updateSupertactique(id: string, updateEquipeDto: UpdateEquipeDto) {
    const equipeSupertactiques = await this.equipeRepository.findOne({
      where: { id },
      relations: [
        'supertactiques',
      ],
    });
    if (!equipeSupertactiques) {
      throw new NotFoundException(`Equipe with ID ${id} not found`);
    }
    if (updateEquipeDto.supertactiques) {
      equipeSupertactiques.supertactiques = [
        ...equipeSupertactiques.supertactiques,
        ...updateEquipeDto.supertactiques,
      ];
    }
    return this.equipeRepository.save(equipeSupertactiques);
  }
  async updateImages(id: string, updateEquipeDto: UpdateEquipeDto) {
    const equipeImages = await this.equipeRepository.findOne({
      where: { id },
      relations: [
        'images',
      ],
    });
    if (!equipeImages) {
      throw new NotFoundException(`Equipe with ID ${id} not found`);
    }
    if (updateEquipeDto.images) {
      equipeImages.images = [...equipeImages.images, ...updateEquipeDto.images];
    }
    return this.equipeRepository.save(equipeImages);
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