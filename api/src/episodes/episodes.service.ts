import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateEpisodeDto } from './dto/create-episode.dto';
import { UpdateEpisodeDto } from './dto/update-episode.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { Episode } from './entities/episode.entity';
import { Repository } from 'typeorm';

@Injectable()
export class EpisodesService {
  constructor(
    @InjectRepository(Episode)
    private readonly episodeRepository: Repository<Episode>,
  ) {}
  async create(createEpisodeDto: CreateEpisodeDto) {
    const newEpisode = this.episodeRepository.create(createEpisodeDto);
    const saveEpisode = await this.episodeRepository.save(newEpisode);
    return saveEpisode;
  }

  async findAll() {
    return await this.episodeRepository.find({
      relations: [
        'serie',
        'equipes',
        'personnages',
        'matchs',
        'supertactiques',
        'supertechniques',
        'images',
      ],
    });
  }

  async findOne(id: string) {
    return await this.episodeRepository.findOne({
      where: {
        id,
      },
      relations: [
        'serie',
        'equipes',
        'personnages',
        'matchs',
        'supertactiques',
        'supertechniques',
        'images',
      ],
    });
  }

  async update(id: string, updateEpisodeDto: UpdateEpisodeDto) {
    const episode = await this.episodeRepository.findOne({
      // eslint-disable-next-line prettier/prettier
      where: { id },
      relations: [
        'serie',
        'equipes',
        'personnages',
        'matchs',
        'supertactiques',
        'supertechniques',
        'images',
      ],
    });
    if (!episode) {
      throw new NotFoundException(`Episode with ID ${id} not found`);
    }
    if (updateEpisodeDto.titre) {
      episode.titre = updateEpisodeDto.titre;
    }
    if (updateEpisodeDto.titre_original) {
      episode.titre_original = updateEpisodeDto.titre_original;
    }
    if (updateEpisodeDto.numepisode) {
      episode.numepisode = updateEpisodeDto.numepisode;
    }
    if (updateEpisodeDto.saison) {
      episode.saison = updateEpisodeDto.saison;
    }
    if (updateEpisodeDto.scenario) {
      episode.scenario = updateEpisodeDto.scenario;
    }
    if (updateEpisodeDto.diffusion_originale) {
      episode.scenario = updateEpisodeDto.diffusion_originale;
    }
    if (updateEpisodeDto.resume) {
      episode.resume = updateEpisodeDto.resume;
    }
    if (updateEpisodeDto.note) {
      episode.note = updateEpisodeDto.note;
    }
    if (updateEpisodeDto.video) {
      episode.video = updateEpisodeDto.video;
    }
    if (updateEpisodeDto.serieId) {
      episode.serie.id = updateEpisodeDto.serieId;
    }
    if (updateEpisodeDto.equipes) {
      episode.equipes = [...episode.equipes, ...updateEpisodeDto.equipes];
    }
    if (updateEpisodeDto.personnages) {
      episode.personnages = [
        ...episode.personnages,
        ...updateEpisodeDto.personnages,
      ];
    }
    if (updateEpisodeDto.supertactiques) {
      episode.supertactiques = [
        ...episode.supertactiques,
        ...updateEpisodeDto.supertactiques,
      ];
    }
    if (updateEpisodeDto.matchs) {
      episode.matchs = [...episode.matchs, ...updateEpisodeDto.matchs];
    }
    if (updateEpisodeDto.supertechniques) {
      episode.supertechniques = [
        ...episode.supertechniques,
        ...updateEpisodeDto.supertechniques,
      ];
    }
    if (updateEpisodeDto.images) {
      episode.images = [...episode.images, ...updateEpisodeDto.images];
    }
    return this.episodeRepository.save(episode);
  }

  async remove(id: string) {
    const deleteEpisode = await this.episodeRepository.findOne({
      where: {
        id,
      },
    });
    if (!deleteEpisode) {
      throw new NotFoundException(`Episode with ID ${id} not found`);
    }
    await this.episodeRepository.delete(deleteEpisode.id);
    return `This action removes a #${id} episode`;
  }
}
