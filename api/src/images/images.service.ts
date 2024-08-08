import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateImageDto } from './dto/create-image.dto';
import { UpdateImageDto } from './dto/update-image.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { Image } from './entities/image.entity';
import { Repository } from 'typeorm';

@Injectable()
export class ImagesService {
  constructor(
    @InjectRepository(Image)
    private readonly imageRepository: Repository<Image>,
  ) {}
  async create(createImageDto: CreateImageDto) {
    const newImage = this.imageRepository.create(createImageDto);
    const saveImage = await this.imageRepository.save(newImage);
    return saveImage;
  }

  async findAll() {
    return await this.imageRepository.find({
      relations: ['serie', 'episode', 'personnages', 'equipe'],
    });
  }

  async findOne(id: string) {
    return await this.imageRepository.findOne({
      where: {
        id,
      },
      relations: ['serie', 'episode', 'personnages', 'equipe'],
    });
  }

  async update(id: string, updateImageDto: UpdateImageDto) {
    const image = await this.imageRepository.preload({
      id,
      ...updateImageDto,
    });
    if (!image) {
      throw new NotFoundException(`Image with ID ${id} not found`);
    }
    return this.imageRepository.save(image);
  }

  async remove(id: string) {
    const deleteImage = await this.imageRepository.findOne({
      where: {
        id,
      },
    });
    if (!deleteImage) {
      throw new NotFoundException(`Image with ID ${id} not found`);
    }
    await this.imageRepository.delete(deleteImage.id);
    return `This action removes a #${id} image`;
  }
}
