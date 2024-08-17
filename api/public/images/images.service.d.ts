import { CreateImageDto } from './dto/create-image.dto';
import { UpdateImageDto } from './dto/update-image.dto';
import { Image } from './entities/image.entity';
import { Repository } from 'typeorm';
export declare class ImagesService {
    private readonly imageRepository;
    constructor(imageRepository: Repository<Image>);
    create(createImageDto: CreateImageDto): Promise<Image>;
    findAll(): Promise<Image[]>;
    findOne(id: string): Promise<Image>;
    update(id: string, updateImageDto: UpdateImageDto): Promise<Image>;
    remove(id: string): Promise<string>;
}
