import { Injectable, NotFoundException } from '@nestjs/common';
import { CreatePersonnageDto } from './dto/create-personnage.dto';
import { UpdatePersonnageDto } from './dto/update-personnage.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { Personnage } from './entities/personnage.entity';
import { Repository } from 'typeorm';

@Injectable()
export class PersonnagesService {
  constructor(
    @InjectRepository(Personnage)
    private readonly personnageRepository: Repository<Personnage>,
  ) {}
  async create(createPersonnageDto: CreatePersonnageDto) {
    const newPersonnage = this.personnageRepository.create(createPersonnageDto);
    const savePersonnage = await this.personnageRepository.save(newPersonnage);
    return savePersonnage;
  }

  async findAll() {
    return await this.personnageRepository.find({
      relations: ['equipes', 'serie', 'episode', 'supertechniques', 'images'],
    });
  }

  async findOne(id: string) {
    return await this.personnageRepository.findOne({
      where: {
        id,
      },
      relations: ['equipes', 'serie', 'episode', 'supertechniques', 'images'],
    });
  }

  async update(id: string, updatePersonnageDto: UpdatePersonnageDto) {
    const personnage = await this.personnageRepository.findOne({
      where: { id },
      relations: ['equipes', 'serie', 'episode', 'supertechniques', 'images'],
    });
    if (!personnage) {
      throw new NotFoundException(`Personnage with ID ${id} not found`);
    }
    if(updatePersonnageDto.note === null) {
      personnage.note = null
    }
    if(updatePersonnageDto.nom_original_personnage === null) {
      personnage.nom_original_personnage = null
    }
    if (updatePersonnageDto.nom_français_personnage) {
      personnage.nom_français_personnage =
        updatePersonnageDto.nom_français_personnage;
    }
    if (updatePersonnageDto.nom_original_personnage) {
      personnage.nom_original_personnage =
        updatePersonnageDto.nom_original_personnage;
    }
    if (updatePersonnageDto.position_personnage) {
      personnage.position_personnage = updatePersonnageDto.position_personnage;
    }
    if (updatePersonnageDto.note) {
      personnage.note = updatePersonnageDto.note;
    }
    if (updatePersonnageDto.serieId) {
      personnage.serie.id = updatePersonnageDto.serieId;
    }
    if (updatePersonnageDto.supertechniques !== null) {
      personnage.supertechniques = updatePersonnageDto.supertechniques;
    } else {
      personnage.supertechniques = null
    }
    if (updatePersonnageDto.episode !== null ) {
      personnage.episode = updatePersonnageDto.episode;
    }else {
      personnage.episode = null
    }
    if (updatePersonnageDto.equipes !== null) {
      personnage.equipes = updatePersonnageDto.equipes;
    }else {
      personnage.equipes = null
    }
    if (updatePersonnageDto.images !== null) {
      personnage.images = updatePersonnageDto.images;
    }else {
      personnage.images = null
    }
    return this.personnageRepository.save(personnage);
  }

  async remove(id: string) {
    const deletePersonnage = await this.personnageRepository.findOne({
      where: {
        id,
      },
    });
    if (!deletePersonnage) {
      throw new NotFoundException(`Personnage with ID ${id} not found`);
    }
    await this.personnageRepository.delete(deletePersonnage.id);
    return `This action removes a #${id} personnage`;
  }
}
