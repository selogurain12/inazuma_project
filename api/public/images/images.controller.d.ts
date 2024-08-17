import { ImagesService } from './images.service';
import { CreateImageDto } from './dto/create-image.dto';
import { UpdateImageDto } from './dto/update-image.dto';
export declare class ImagesController {
    private readonly imagesService;
    constructor(imagesService: ImagesService);
    create(createImageDto: CreateImageDto): Promise<import("./entities/image.entity").Image>;
    findAll(): Promise<import("./entities/image.entity").Image[]>;
    findOne(id: string): Promise<import("./entities/image.entity").Image>;
    update(id: string, updateImageDto: UpdateImageDto): Promise<import("./entities/image.entity").Image>;
    remove(id: string): Promise<string>;
}
