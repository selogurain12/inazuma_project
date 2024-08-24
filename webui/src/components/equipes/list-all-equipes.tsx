import axios from "axios";
import { useEffect, useState } from "react";
import { Box, ImageListItem, ImageListItemBar, Typography, Grid } from "@mui/material";
import Slider from "react-slick";
import { Link } from "react-router-dom";
import { Equipe } from "./equipedata";
import { MenuEquipe } from "./menu-equipes";

export function AllEquipes() {
    const [equipes, setEquipes] = useState<Equipe[]>([]);

    useEffect(() => {
        const fetchEquipe = async () => {
            try {
                const apiUrl = import.meta.env.VITE_PUBLIC_API_URL;
                if (!apiUrl) {
                    console.error('API URL is not defined in environment variables');
                    return;
                }

                const response = await axios.get(`${apiUrl}/equipes`);
                if (response.data && Array.isArray(response.data)) {
                    const newEquipes = response.data.map((equipe) => ({
                        id: equipe.id,
                        nom_francais_equipe: equipe.nom_francais_equipe,
                        nom_original_equipe: equipe.nom_original_equipe,
                        note: equipe.note === null ? "Pas de notes" : equipe.note,
                        capitaines: equipe.capitaines,
                        joueurs: equipe.joueurs,
                        manageurs: equipe.manageurs,
                        supertactiques: equipe.supertactiques,
                        supertechniques: equipe.supertechniques,
                        matchs: equipe.matchs,
                        serie: equipe.serie,
                        episodes: equipe.episodes,
                        entraineur: equipe.entraineur,
                        images: equipe.images && equipe.images.length > 0 
                            ? equipe.images 
                            : [{ images: "https://www.mairie-valserres.fr/fileadmin/templates/default/images/no-image.png", note: "Pas d'image" }]
                    }));
                    setEquipes(newEquipes);
                } else {
                    alert("No equipes or incorrect data structure");
                }
            } catch (error) {
                console.error('Error fetching equipes:', error);
            }
        };
        fetchEquipe();
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
        <>
        <MenuEquipe/>
        <Box sx={{ flexGrow: 1, display: "flex", flexDirection: "column", alignItems: "center" }}>
            <Typography variant="h3" gutterBottom>
                TOUTES LES EQUIPES
            </Typography>
        </Box><Box sx={{ flexGrow: 1, p: 2 }}>
                <Grid container spacing={2}>
                    {equipes.map((equipe) => (
                        <Grid item xs={12} sm={6} md={4} lg={3} key={equipe.id}>
                            <Link to={`/equipes/listEquipes/${equipe.id}`}>
                                <Box sx={{ height: "100%", p: 2, border: '1px solid #ccc', borderRadius: '8px' }}>
                                    <Typography variant="h6">{equipe.nom_francais_equipe}</Typography>
                                    <Typography variant="subtitle1">{equipe.nom_original_equipe}</Typography>
                                    <Slider {...settings}>
                                        {equipe.images.map((image, index) => (
                                            <ImageListItem key={index}>
                                                <img
                                                    src={`${image.images}?w=248&fit=crop&auto=format`}
                                                    alt={equipe.nom_francais_equipe}
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
