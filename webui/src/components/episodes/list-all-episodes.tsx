import axios from "axios";
import { useEffect, useState } from "react";
import { Box, ImageListItem, ImageListItemBar, Typography, Grid } from "@mui/material";
import Slider from "react-slick";
import { Link } from "react-router-dom";
import { Episode } from "./episodedata";
import { MenuEpisode } from "./menu-episodes";

export function AllEpisodes() {
    const [episodes, setEpisodes] = useState<Episode[]>([]);

    useEffect(() => {
        const fetchEquipe = async () => {
            try {
                const apiUrl = import.meta.env.VITE_PUBLIC_API_URL;
                if (!apiUrl) {
                    console.error('API URL is not defined in environment variables');
                    return;
                }

                const response = await axios.get(`${apiUrl}/episodes`);
                if (response.data && Array.isArray(response.data)) {
                    const newEpisodes = response.data.map((equipe) => ({
                        id: equipe.id,
                        titre: equipe.titre,
                        titre_original: equipe.titre_original,
                        numepisode: equipe.numepisode,
                        saison: equipe.saison,
                        scenario: equipe.scenario,
                        diffusion_originale: equipe.diffusion_originale,
                        resume: equipe.resume,
                        note: equipe.note,
                        video: equipe.video,
                        supertechniques: equipe.supertechniques,
                        equipes: equipe.equipes,
                        serie: equipe.serie,
                        personnages: equipe.personnages,
                        matchs: equipe.matchs,
                        supertactiques: equipe.supertactiques,
                        images: equipe.images && equipe.images.length > 0 
                            ? equipe.images 
                            : [{ images: "https://www.mairie-valserres.fr/fileadmin/templates/default/images/no-image.png", note: "Pas d'image" }]
                    }));
                    setEpisodes(newEpisodes);
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
        <MenuEpisode />
        <Box sx={{ flexGrow: 1, display: "flex", flexDirection: "column", alignItems: "center" }}>
            <Typography variant="h3" gutterBottom>
                TOUTES LES EQUIPES
            </Typography>
        </Box><Box sx={{ flexGrow: 1, p: 2 }}>
                <Grid container spacing={2}>
                    {episodes.map((episode) => (
                        <Grid item xs={12} sm={6} md={4} lg={3} key={episode.id}>
                            <Link to={`/episodes/listEpisodes/${episode.id}`}>
                                <Box sx={{ height: "100%", p: 2, border: '1px solid #ccc', borderRadius: '8px' }}>
                                    <Typography variant="h6">{episode.titre}</Typography>
                                    <Typography variant="subtitle1">{episode.titre_original}</Typography>
                                    <Slider {...settings}>
                                        {episode.images.map((image, index) => (
                                            <ImageListItem key={index}>
                                                <img
                                                    src={`${image.images}?w=248&fit=crop&auto=format`}
                                                    alt={episode.titre}
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
