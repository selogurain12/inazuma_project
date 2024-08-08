import axios from "axios";
import { Personnage } from "./personnagedata";
import { Fragment, useEffect, useState } from "react";
import { Box, Card, CardContent, Grid, Typography } from "@mui/material";
import { Link, useParams } from "react-router-dom";
import ModeEditIcon from '@mui/icons-material/ModeEdit';
import "slick-carousel/slick/slick.css";
import "slick-carousel/slick/slick-theme.css";

export function PersonnageDetails() {
    const { id } = useParams<{ id: string }>();
    const [personnage, setPersonnage] = useState<Personnage | null>(null);

    useEffect(() => {
        const fetchPersonnage = async () => {
            try {
                const apiUrl = import.meta.env.VITE_PUBLIC_API_URL;
                if (!apiUrl) {
                    console.error('API URL is not defined in environment variables');
                    return;
                }

                const response = await axios.get(`${apiUrl}/personnages/${id}`);
                setPersonnage(response.data);
            } catch (error) {
                console.error('Error fetching personnage:', error);
            }
        };
        fetchPersonnage();
    }, [id]);

    const formattedDescription = personnage?.note?.split('\n').map((line, index) => (
        <Fragment key={index}>
            {line}
            <br />
        </Fragment>
    ));

    return (
        <>
            <Box sx={{ flexGrow: 1, display: "flex", flexDirection: "column", alignItems: "center" }}>
                <Typography variant="h3" gutterBottom>
                    {personnage?.nom_français_personnage || "Nom inconnu"}
                </Typography>
            </Box>
            <Box sx={{ display: "flex", justifyContent: "center" }}>
                <Box sx={{ width: "80%", display: "flex", flexDirection: "column", backgroundColor: "white", p: 2, borderRadius: 1, boxShadow: 1 }}>
                    <Box sx={{display: "flex", justifyContent: "end"}}>
                    <Link to={`/personnages/editPersonnages/${id}`}>
                        <ModeEditIcon sx={{color: "black"}} />
                        </Link>
                    </Box>
                    <Typography sx={{ padding: "5px", color: "black", position: "absolute" }}>
                        Nom original: {personnage?.nom_original_personnage || "Nom original inconnu"}
                    </Typography>
                    <Typography sx={{ padding: "5px", color: "black" }}>
                        Position du personnage: {personnage?.position_personnage || "Position inconnue"}
                    </Typography>
                    <Typography sx={{ padding: "5px", color: "black" }}>
                        Note(s): <br />{formattedDescription || "Pas de note"}
                    </Typography>
                    <Typography variant="h5" sx={{ color: "black" }}>
                        Supertechniques:
                    </Typography>
                    <Grid container spacing={2}>
                        {personnage?.supertechniques && personnage.supertechniques.length > 0 ? (
                            personnage.supertechniques.map((supertechnique, index) => (
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
