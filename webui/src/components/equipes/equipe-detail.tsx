import { Fragment, useEffect, useState } from "react";
import axios from "axios";
import { Box, Card, CardContent, Grid, Typography } from "@mui/material";
import { Link, useParams } from "react-router-dom";
import ModeEditIcon from '@mui/icons-material/ModeEdit';
import { Equipe } from "./equipedata";
import { MenuEquipe } from "./menu-equipes";

export function EquipeDetails() {
    const { id } = useParams<{ id: string }>();
    const [equipe, setEquipe] = useState<Equipe | null>(null);

    useEffect(() => {
        const fetchEquipe = async () => {
            try {
                const apiUrl = import.meta.env.VITE_PUBLIC_API_URL;
                if (!apiUrl) {
                    console.error('API URL is not defined in environment variables');
                    return;
                }

                const [episodeResponse, equipeResponse, membresResponse, supertechniquesResponse, supertactiquesResponse, imagesResponse, matchsResponse] = await Promise.all([
                    axios.get(`${apiUrl}/equipes/${id}/episodes`),
                    axios.get(`${apiUrl}/equipes/${id}`),
                    axios.get(`${apiUrl}/equipes/${id}/members`),
                    axios.get(`${apiUrl}/equipes/${id}/supertechniques`),
                    axios.get(`${apiUrl}/equipes/${id}/supertactiques`),
                    axios.get(`${apiUrl}/equipes/${id}/images`),
                    axios.get(`${apiUrl}/equipes/${id}/matchs`)
                ]);
                setEquipe({
                    id: equipeResponse.data.id,
                    nom_francais_equipe: equipeResponse.data.nom_francais_equipe,
                    nom_original_equipe: equipeResponse.data.nom_original_equipe,
                    note: equipeResponse.data.note,
                    capitaines: membresResponse.data.capitaines,
                    joueurs: membresResponse.data.joueurs,
                    manageurs: membresResponse.data.manageurs,
                    supertactiques: supertactiquesResponse.data.supertactiques,
                    supertechniques: supertechniquesResponse.data.supertechniques,
                    matchs: matchsResponse.data.matchs,
                    serie: matchsResponse.data.serie,
                    episodes: episodeResponse.data.episodes,
                    entraineur: membresResponse.data.entraineur,
                    images: imagesResponse.data.images
                });
            } catch (error) {
                console.error('Error fetching equipe:', error);
            }
        };
        fetchEquipe();
    }, [id]);

    const formattedDescription = equipe?.note?.split('\n').map((line, index) => (
        <Fragment key={index}>
            {line}
            <br />
        </Fragment>
    ));

    return (
        <>
        <MenuEquipe/>
            <Box sx={{ flexGrow: 1, display: "flex", flexDirection: "column", alignItems: "center" }}>
                <Typography variant="h3" gutterBottom>
                    {equipe?.nom_francais_equipe || "Nom inconnu"}
                </Typography>
            </Box>
            <Box sx={{ display: "flex", justifyContent: "center" }}>
                <Box sx={{ width: "80%", display: "flex", flexDirection: "column", backgroundColor: "white", p: 2, borderRadius: 1, boxShadow: 1 }}>
                    <Box sx={{display: "flex", justifyContent: "end"}}>
                        <Link to={`/equipes/editEquipes/${id}`}>
                            <ModeEditIcon sx={{color: "black"}} />
                        </Link>
                    </Box>
                    <Typography sx={{ padding: "5px", color: "black", position: "absolute" }}>
                        Nom original: {equipe?.nom_original_equipe || "Nom original inconnu"}
                    </Typography>
                    <Typography sx={{ padding: "5px", color: "black" }}>
                        Note(s): <br />{formattedDescription || "Pas de note"}
                    </Typography>
                    <Typography variant="h5" sx={{ color: "black" }}>
                        Supertechniques:
                    </Typography>
                    <Grid container spacing={2}>
                        {equipe?.supertechniques && equipe.supertechniques.length > 0 ? (
                            equipe.supertechniques.map((supertechnique, index) => (
                                <Grid item xs={12} sm={6} md={4} lg={3} key={index}>
                                    <Card sx={{ maxWidth: 345, mb: 2, height: 500 }}>
                                        {supertechnique.video && supertechnique.video.length > 0 ? (
                                            supertechnique.video.map((video, vidIndex) => (
                                                <div key={vidIndex}>
                                                    <iframe
                                                        width="100%"
                                                        height="auto"
                                                        src={`https://www.youtube.com/embed/${video}`}
                                                        title="YouTube video player"
                                                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                                                        allowFullScreen
                                                    ></iframe>
                                                </div>
                                            ))
                                        ) : (
                                            <div>
                                                <img
                                                    src="https://static.vecteezy.com/ti/vecteur-libre/p2/8127014-pas-d-enregistrement-de-camera-video-silhouette-noire-interdiction-icone-interdit-zone-de-production-de-films-film-rouge-symbole-d-arret-camescope-pas-de-zone-d-enregistrement-autorisee-interdit-pictogramme-isole-illustrationle-vectoriel.jpg"
                                                    alt="Pas de vidéo disponible"
                                                    style={{ width: "100%", height: "auto" }}
                                                />
                                            </div>
                                        )}
                                        <CardContent>
                                            <Typography gutterBottom variant="h5" component="div">
                                                {supertechnique.nom_français_supertechniques || "Supertechnique inconnue"}
                                            </Typography>
                                            <Typography variant="body2" color="text.secondary">
                                                {supertechnique.notes_supertechniques || "Pas de description disponible"}
                                            </Typography>
                                        </CardContent>
                                    </Card>
                                </Grid>
                            ))
                        ) : (
                            <Typography sx={{ padding: "5px", color: "black" }}>
                                Pas de supertechniques disponibles
                            </Typography>
                        )}
                    </Grid>
                </Box>
            </Box>
        </>
    );
}
