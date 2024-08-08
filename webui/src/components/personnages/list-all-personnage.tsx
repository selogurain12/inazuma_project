import axios from "axios";
import { useEffect, useState } from "react";
import { Box, ImageListItem, ImageListItemBar, Typography, Grid } from "@mui/material";
import Slider from "react-slick";
import { Personnage } from "./personnagedata";
import { Link } from "react-router-dom";

export function AllPersonnages() {
    const [personnages, setPersonnages] = useState<Personnage[]>([]);

    useEffect(() => {
        const fetchPersonnage = async () => {
            try {
                const apiUrl = import.meta.env.VITE_PUBLIC_API_URL;
                if (!apiUrl) {
                    console.error('API URL is not defined in environment variables');
                    return;
                }

                const response = await axios.get(`${apiUrl}/personnages`);
                if (response.data && Array.isArray(response.data)) {
                    const newPersonnages = response.data.map((personnage) => ({
                        id: personnage.id,
                        nom_français_personnage: personnage.nom_français_personnage,
                        nom_original_personnage: personnage.nom_original_personnage,
                        position_personnage: personnage.position_personnage,
                        note: personnage.note === null ? "Pas de notes" : personnage.note,
                        supertechniques: personnage.supertechniques,
                        episode: personnage.episode,
                        equipes: personnage.equipes,
                        serie: personnage.serie,
                        images: personnage.images.length > 0 ? personnage.images : [{ images: "https://www.mairie-valserres.fr/fileadmin/templates/default/images/no-image.png", note: "Pas d'image" }]
                    }));
                    setPersonnages(newPersonnages);
                } else {
                    alert("No personnages or incorrect data structure");
                }
            } catch (error) {
                console.error('Error fetching personnages:', error);
            }
        };
        fetchPersonnage();
    }, []);

    const settings = {
        infinite: true,
        speed: 500,
        slidesToShow: 1,
        slidesToScroll: 1,
        autoplay: true,
        autoplaySpeed: 2000,
        adaptiveHeight: true
    };

    return (
        <><Box sx={{ flexGrow: 1, display: "flex", flexDirection: "column", alignItems: "center" }}>
            <Typography variant="h3" gutterBottom>
                TOUS LES PERSONNAGES
            </Typography>
        </Box><Box sx={{ flexGrow: 1, p: 2 }}>
                <Grid container spacing={2}>
                    {personnages.map((personnage) => (
                        <Grid item xs={12} sm={6} md={4} lg={3} key={personnage.id}>
                            <Link to={`/personnages/listPersonnages/${personnage.id}`}>
                                <Box sx={{ height: "100%", p: 2, border: '1px solid #ccc', borderRadius: '8px' }}>
                                    <Typography variant="h6">{personnage.nom_français_personnage}</Typography>
                                    <Typography variant="subtitle1">{personnage.nom_original_personnage}</Typography>
                                    <Slider {...settings}>
                                        {personnage.images.map((image, index) => (
                                            <ImageListItem key={index}>
                                                <img
                                                    src={`${image.images}?w=248&fit=crop&auto=format`}
                                                    alt={personnage.nom_français_personnage}
                                                    loading="lazy"
                                                    style={{
                                                        width: '100%',
                                                        height: '25 0px',
                                                        objectFit: 'cover'
                                                    }} />
                                                <ImageListItemBar
                                                    title={<Typography style={{ whiteSpace: 'pre-wrap' }}>{image.note}</Typography>}
                                                    position="below"
                                                    sx={{
                                                        height: '80px'
                                                    }} />
                                            </ImageListItem>
                                        ))}
                                    </Slider>
                                </Box>
                            </Link>
                        </Grid>
                    ))}
                </Grid>
            </Box></>
    );
}
