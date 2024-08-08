import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateMatchDto } from './dto/create-match.dto';
import { UpdateMatchDto } from './dto/update-match.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { Match } from './entities/match.entity';
import { Repository } from 'typeorm';
import { Equipe } from 'src/equipes/entities/equipe.entity';

@Injectable()
export class MatchsService {
  constructor(
    @InjectRepository(Match)
    private readonly matchRepository: Repository<Match>,
    @InjectRepository(Equipe)
    private readonly equipeRepository: Repository<Equipe>,
  ) {}

  async create(createMatchDto: CreateMatchDto) {
    const equipe1 = await this.equipeRepository.findOne({
      where: { id: createMatchDto.id_equipe_1 },
    });
    const equipe2 = await this.equipeRepository.findOne({
      where: { id: createMatchDto.id_equipe_2 },
    });

    if (!equipe1) {
      throw new NotFoundException(
        `Equipe with ID ${createMatchDto.id_equipe_1} not found`,
      );
    }
    if (!equipe2) {
      throw new NotFoundException(
        `Equipe with ID ${createMatchDto.id_equipe_2} not found`,
      );
    }

    const newMatch = this.matchRepository.create({
      ...createMatchDto,
      id_equipe_1: equipe1,
      id_equipe_2: equipe2,
    });

    return await this.matchRepository.save(newMatch);
  }

  async findAll() {
    return await this.matchRepository.find({
      relations: [
        'id_equipe_1',
        'id_equipe_2',
        'episodes',
        'supertechniques',
        'supertactiques',
        'serie',
      ],
    });
  }

  async findOne(id: string) {
    const match = await this.matchRepository.findOne({
      where: { id },
      relations: [
        'id_equipe_1',
        'id_equipe_2',
        'episodes',
        'supertechniques',
        'supertactiques',
        'serie',
      ],
    });

    if (!match) {
      throw new NotFoundException(`Match with ID ${id} not found`);
    }

    return match;
  }

  async update(id: string, updateMatchDto: UpdateMatchDto) {
    const match = await this.matchRepository.findOne({
      where: { id },
      relations: ['episodes', 'supertechniques', 'supertactiques'],
    });

    if (!match) {
      throw new NotFoundException(`Match with ID ${id} not found`);
    }

    if (updateMatchDto.id_equipe_1) {
      match.id_equipe_1.id = updateMatchDto.id_equipe_1;
    }
    if (updateMatchDto.id_equipe_2) {
      match.id_equipe_2.id = updateMatchDto.id_equipe_2;
    }
    if (updateMatchDto.notes) {
      match.notes = updateMatchDto.notes;
    }
    if (updateMatchDto.episodes) {
      match.episodes = [...match.episodes, ...updateMatchDto.episodes];
    }
    if (updateMatchDto.supertechniques) {
      match.supertechniques = [
        ...match.supertechniques,
        ...updateMatchDto.supertechniques,
      ];
    }
    if (updateMatchDto.supertactiques) {
      match.supertactiques = [
        ...match.supertactiques,
        ...updateMatchDto.supertactiques,
      ];
    }
    if (updateMatchDto.serieId) {
      match.serie.id = updateMatchDto.serieId;
    }
    if (updateMatchDto.compo_equipe_1) {
      match.compo_equipe_1 = updateMatchDto.compo_equipe_1;
    }
    if (updateMatchDto.compo_equipe_2) {
      match.compo_equipe_2 = updateMatchDto.compo_equipe_2;
    }

    return this.matchRepository.save(match);
  }

  async remove(id: string) {
    const match = await this.matchRepository.findOne({ where: { id } });
    if (!match) {
      throw new NotFoundException(`Match with ID ${id} not found`);
    }
    await this.matchRepository.delete(id);
    return `Match with ID ${id} removed`;
  }
}
