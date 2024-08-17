import { Box, Typography, Grid, TextField, Autocomplete, Button } from "@mui/material";
import axios from "axios";
import { useState, useEffect } from "react";
import { useForm, useFieldArray, Controller } from "react-hook-form";
import { ModalErrorMessage } from "../error-message";
import { EquipeForm } from "./equipedata";
import { MenuEquipe } from "./menu-equipes";
import { validationRules } from "./equiperules";

export function EquipeFormulaire() {
    const { register, handleSubmit, control, setValue, formState: { errors } } = useForm<EquipeForm>();

    const {
        fields: supertechniquesFields,
        append: appendSupertechnique,
        remove: removeSupertechnique
    } = useFieldArray({
        control,
        name: "supertechniques"
    });

    const {
        fields: capitaineFields,
        append: appendCapitaine,
        remove: removeCapitaine
    } = useFieldArray({
        control,
        name: "capitaines"
    });

    const {
        fields: joueurFields,
        append: appendJoueur,
        remove: removeJoueur
    } = useFieldArray({
        control,
        name: "joueurs"
    });

    const {
        fields: manageurFields,
        append: appendManageur,
        remove: removeManageur
    } = useFieldArray({
        control,
        name: "manageurs"
    });

    const {
        fields: supertactiqueFields,
        append: appendSupertactique,
        remove: removeSupertactique
    } = useFieldArray({
        control,
        name: "supertactiques"
    });

    const {
        fields: matchFields,
        append: appendMatch,
        remove: removeMatch
    } = useFieldArray({
        control,
        name: "matchs"
    });

    const {
        fields: entraîneurFields,
        append: appendEntraineur,
        remove: removeEntraineur
    } = useFieldArray({
        control,
        name: "entraineur"
    });

    const {
        fields: episodesFields,
        append: appendEpisode,
        remove: removeEpisode
    } = useFieldArray({
        control,
        name: "episodes"
    });

    const {
        fields: imagesFields,
        append: appendImage,
        remove: removeImage
    } = useFieldArray({
        control,
        name: "images"
    });

    const [supertechniquesOptions, setSupertechniquesOptions] = useState<{ id: string, nom_français_supertechniques: string }[]>([]);
    const [supertactiquesOptions, setSupertactiquesOptions] = useState<{ id: string, nom: string }[]>([]);
    const [personnagesOptions, setPersonnagesOptions] = useState<{ id: string, nom_français_personnage: string }[]>([]);
    const [matchsOptions, setMatchsOptions] = useState<{ id: string, equipes: string }[]>([]);
    const [episodesOptions, setEpisodesOptions] = useState<{ id: string, titre: string }[]>([]);
    const [imagesOptions, setImagesOptions] = useState<{ id: string, note: string, images: string }[]>([]);
    const [seriesOptions, setSeriesOptions] = useState<{ id: string, nom: string }[]>([]);

    useEffect(() => {
        const fetchOptions = async () => {
            try {
                const apiUrl = import.meta.env.VITE_PUBLIC_API_URL;
                if (!apiUrl) {
                    console.error('API URL is not defined in environment variables');
                    return;
                }

                const supertechniquesResponse = await axios.get(`${apiUrl}/supertechniques`);
                if (supertechniquesResponse.data && Array.isArray(supertechniquesResponse.data)) {
                    const newSupertechniques = supertechniquesResponse.data.map((supertechnique) => ({
                        id: supertechnique.id,
                        nom_français_supertechniques: supertechnique.nom_français_supertechniques
                    }));
                    setSupertechniquesOptions(newSupertechniques);
                } else {
                    alert("No supertechniques or incorrect data structure");
                }

                const personnagesResponse = await axios.get(`${apiUrl}/personnages`);
                if (personnagesResponse.data && Array.isArray(personnagesResponse.data)) {
                    const newPersonnages = personnagesResponse.data.map((personnage) => ({
                        id: personnage.id,
                        nom_français_personnage: personnage.nom_français_personnage
                    }));
                    setPersonnagesOptions(newPersonnages);
                } else {
                    alert("No personnages or incorrect data structure");
                }

                const episodesResponse = await axios.get(`${apiUrl}/episodes`);
                if (episodesResponse.data && Array.isArray(episodesResponse.data)) {
                    const newEpisodes = episodesResponse.data.map((episode) => ({
                        id: episode.id,
                        titre: episode.titre
                    }));
                    setEpisodesOptions(newEpisodes);
                } else {
                    alert("No episodes or incorrect data structure");
                }

                const imagesResponse = await axios.get(`${apiUrl}/images`);
                if (imagesResponse.data && Array.isArray(imagesResponse.data)) {
                    const newImages = imagesResponse.data.map((image) => ({
                        id: image.id,
                        note: image.note,
                        images: image.images
                    }));
                    setImagesOptions(newImages);
                } else {
                    alert("No images or incorrect data structure");
                }

                const seriesResponse = await axios.get(`${apiUrl}/series`);
                if (seriesResponse.data && Array.isArray(seriesResponse.data)) {
                    const newSerie = seriesResponse.data.map((serie) => ({
                        id: serie.id,
                        nom: serie.nom
                    }));
                    setSeriesOptions(newSerie);
                } else {
                    alert("No series or incorrect data structure");
                }

                const supertactiquesResponse = await axios.get(`${apiUrl}/supertactiques`);
                if (supertactiquesResponse.data && Array.isArray(supertactiquesResponse.data)) {
                    const newSupertactique = supertactiquesResponse.data.map((supertactique) => ({
                        id: supertactique.id,
                        nom: supertactique.nom
                    }));
                    setSupertactiquesOptions(newSupertactique);
                } else {
                    alert("No supertactiques or incorrect data structure");
                }

                const matchsResponse = await axios.get(`${apiUrl}/matchs`);
                if (matchsResponse.data && Array.isArray(matchsResponse.data)) {
                    const newMatch = matchsResponse.data.map((match) => ({
                        id: match.id,
                        equipes: `${match.id_equipe_1.nom_francais_equipe} vs ${match.id_equipe_2.nom_francais_equipe}`
                    }));
                    setMatchsOptions(newMatch);
                } else {
                    alert("No supertactiques or incorrect data structure");
                }
            } catch (error) {
                console.error('Error fetching data:', error);
            }
        };
        fetchOptions();
    }, []);

    const onSubmit = async (data: EquipeForm) => {            
        if (data.nom_original_equipe === "") {
            data.nom_original_equipe = null;
        }
        if (data.note === "") {
            data.note = null;
        }
        if (data.capitaines?.length === undefined) {
            data.capitaines = null;
        }
        if (data.joueurs?.length === undefined) {
            data.joueurs = null;
        }
        if (data.manageurs?.length === undefined) {
            data.manageurs = null;
        }
        if (data.supertactiques?.length === 0) {
            data.supertactiques = null;
        }
        if (data.supertechniques?.length === 0) {
            data.supertechniques = null;
        }
        if (data.matchs?.length === 0) {
            data.matchs = null;
        }    
        if (data.episodes?.length === 0) {
            data.episodes = null;
        }
        if (data.entraineur?.length === undefined) {
            data.entraineur = null;
        }
        if (data.images?.length === 0) {
            data.images = null;
        }
    
        const apiUrl = import.meta.env.VITE_PUBLIC_API_URL;
        try {
            await axios.post(`${apiUrl}/equipes`, {
                nom_francais_equipe: data.nom_francais_equipe,
                nom_original_equipe: data.nom_original_equipe,
                note: data.note,
                capitaines: data.capitaines,
                joueurs: data.joueurs,
                manageurs: data.manageurs,
                supertactiques: data.supertactiques,
                supertechniques: data.supertechniques,
                matchs: data.matchs,
                serie: data.serie,
                episodes: data.episodes,
                entraineur: data.entraineur,
                images: data.images
            });
        } catch (error) {
            console.error('Erreur lors de la connexion :', error);
        }
        console.log(data);
    };
    

    return (
        <>
        <MenuEquipe />
        <Box sx={{ flexGrow: 1, display: "flex", flexDirection: "column", alignItems: "center" }}>
            <Typography variant="h3" gutterBottom>
                Ajouter une équipe
            </Typography>
        </Box>
        <Box sx={{ display: "flex", padding: "10px" }}>
            <form onSubmit={handleSubmit(onSubmit)} style={{ width: "100%" }}>
                <Grid container spacing={2} columns={16}>
                    <Grid item xs={8}>
                        <Box sx={{ paddingBottom: "10px" }}>
                            <TextField
                                InputLabelProps={{ shrink: true }}
                                sx={{ width: "90%" }}
                                label="Nom français de l'équipe"
                                variant="outlined"
                                {...register("nom_francais_equipe", validationRules.nom_francais_equipe)} />
                        </Box>
                        <Box>
                            {errors.nom_francais_equipe && (
                                <ModalErrorMessage message={errors.nom_francais_equipe.message} />
                            )}
                        </Box>
                        <Box sx={{ paddingBottom: "10px" }}>
                            <TextField
                                InputLabelProps={{ shrink: true }}
                                sx={{ width: "90%" }}
                                label="Nom original de l'équipe"
                                variant="outlined"
                                {...register("nom_original_equipe")} />
                        </Box>
                        <Box sx={{ paddingBottom: "10px" }}>
                            <Controller
                                name="note"
                                control={control}
                                render={({ field }) => (
                                    <TextField
                                        {...field}
                                        InputLabelProps={{ shrink: true }}
                                        id="standard-multiline-flexible"
                                        label="Notes"
                                        multiline
                                        sx={{ width: "90%" }}
                                        rows={4}
                                        onChange={(e) => {
                                            const newValue = e.target.value.trim() === "" ? null : e.target.value;
                                            setValue("note", newValue);
                                        }}
                                        value={field.value || ""}
                                    />
                                )}
                            />
                        </Box>
                        <Box>
                            <Typography variant="h4" gutterBottom>
                                Ajouter un capitaine
                            </Typography>
                            {capitaineFields.map((item, index) => (
                                <Box key={item.id} sx={{ display: "flex", alignItems: "center", paddingBottom: "10px" }}>
                                    <Controller
                                        name={`capitaines.${index}.id`}
                                        control={control}
                                        render={({ field }) => (
                                            <Autocomplete
                                                options={personnagesOptions}
                                                sx={{ width: "90%" }}
                                                getOptionLabel={(option) => option.nom_français_personnage}
                                                value={personnagesOptions.find(option => option.id === field.value) || null}
                                                onChange={(_, value) => field.onChange(value ? value.id : null)}
                                                renderInput={(params) => <TextField {...params} label="Capitaines" />} />
                                        )} />
                                    <Button onClick={() => removeCapitaine(index)} sx={{ marginLeft: "10px" }}>Supprimer</Button>
                                </Box>
                            ))}
                            <Button onClick={() => appendCapitaine({ 
                                id: '', 
                                nom_français_personnage: '', 
                                nom_original_personnage: '', 
                                note: '',
                                position_personnage: ''
                            })} sx={{ marginBottom: "10px" }}>Ajouter un capitaine</Button>
                        </Box>
                        <Box>
                            <Typography variant="h4" gutterBottom>
                                Ajouter un joueur
                            </Typography>
                            {joueurFields.map((item, index) => (
                                <Box key={item.id} sx={{ display: "flex", alignItems: "center", paddingBottom: "10px" }}>
                                    <Controller
                                        name={`joueurs.${index}.id`}
                                        control={control}
                                        render={({ field }) => (
                                            <Autocomplete
                                                options={personnagesOptions}
                                                sx={{ width: "90%" }}
                                                getOptionLabel={(option) => option.nom_français_personnage}
                                                value={personnagesOptions.find(option => option.id === field.value) || null}
                                                onChange={(_, value) => field.onChange(value ? value.id : null)}
                                                renderInput={(params) => <TextField {...params} label="Joueurs" />} />
                                        )} />
                                    <Button onClick={() => removeJoueur(index)} sx={{ marginLeft: "10px" }}>Supprimer</Button>
                                </Box>
                            ))}
                            <Button onClick={() => appendJoueur({ 
                                id: '', 
                                nom_français_personnage: '', 
                                nom_original_personnage: '', 
                                note: '', 
                                position_personnage: ''
                            })} sx={{ marginBottom: "10px" }}>Ajouter un joueur</Button>
                        </Box>
                        <Box>
                            <Typography variant="h4" gutterBottom>
                                Ajouter un manageur
                            </Typography>
                            {manageurFields.map((item, index) => (
                                <Box key={item.id} sx={{ display: "flex", alignItems: "center", paddingBottom: "10px" }}>
                                    <Controller
                                        name={`manageurs.${index}.id`}
                                        control={control}
                                        render={({ field }) => (
                                            <Autocomplete
                                                options={personnagesOptions}
                                                sx={{ width: "90%" }}
                                                getOptionLabel={(option) => option.nom_français_personnage}
                                                value={personnagesOptions.find(option => option.id === field.value) || null}
                                                onChange={(_, value) => field.onChange(value ? value.id : null)}
                                                renderInput={(params) => <TextField {...params} label="Manageur" />} />
                                        )} />
                                    <Button onClick={() => removeManageur(index)} sx={{ marginLeft: "10px" }}>Supprimer</Button>
                                </Box>
                            ))}
                            <Button onClick={() => appendManageur({ 
                                id: '', 
                                nom_français_personnage: '', 
                                nom_original_personnage: '', 
                                note: '', 
                                position_personnage: ''
                            })} sx={{ marginBottom: "10px" }}>Ajouter un manageur</Button>
                        </Box>
                        <Box>
                            <Typography variant="h4" gutterBottom>
                                Ajouter une supertactique
                            </Typography>
                            {supertactiqueFields.map((item, index) => (
                                <Box key={item.id} sx={{ display: "flex", alignItems: "center", paddingBottom: "10px" }}>
                                    <Controller
                                        name={`supertactiques.${index}.id`}
                                        control={control}
                                        render={({ field }) => (
                                            <Autocomplete
                                                options={supertactiquesOptions}
                                                sx={{ width: "90%" }}
                                                getOptionLabel={(option) => option.nom}
                                                value={supertactiquesOptions.find(option => option.id === field.value) || null}
                                                onChange={(_, value) => field.onChange(value ? value.id : null)}
                                                renderInput={(params) => <TextField {...params} label="Supertactique" />} />
                                        )} />
                                    <Button onClick={() => removeSupertactique(index)} sx={{ marginLeft: "10px" }}>Supprimer</Button>
                                </Box>
                            ))}
                            <Button onClick={() => appendSupertactique({ 
                                id: '', 
                                nom: '', 
                                video: []
                            })} sx={{ marginBottom: "10px" }}>Ajouter une supertactique</Button>
                        </Box>
                    </Grid>
                    <Grid item xs={8}>
                        <Box>
                            <Typography variant="h4" gutterBottom>
                                Ajouter un épisode
                            </Typography>
                            {episodesFields.map((item, index) => (
                                <Box key={item.id} sx={{ display: "flex", alignItems: "center", paddingBottom: "10px" }}>
                                    <Controller
                                        name={`episodes.${index}.id`}
                                        control={control}
                                        render={({ field }) => (
                                            <Autocomplete
                                                options={episodesOptions}
                                                sx={{ width: "90%" }}
                                                getOptionLabel={(option) => option.titre}
                                                value={episodesOptions.find(option => option.id === field.value) || null}
                                                onChange={(_, value) => field.onChange(value ? value.id : null)}
                                                renderInput={(params) => <TextField {...params} label="Episode" />} />
                                        )} />
                                    <Button onClick={() => removeEpisode(index)} sx={{ marginLeft: "10px" }}>Supprimer</Button>
                                </Box>
                            ))}
                            <Button onClick={() => appendEpisode({ id: '', titre: '', titre_original: '', numepisode: 0, saison: 0, scenario: '', diffusion_originale: new Date('2024-01-01'), resume: '', note: '', video: '' })} sx={{ marginBottom: "10px" }}>Ajouter un épisode</Button>
                        </Box>
                        <Box>
                            <Typography variant="h4" gutterBottom>
                                Ajouter une image
                            </Typography>
                            {imagesFields.map((item, index) => (
                                <Box key={item.id} sx={{ display: "flex", alignItems: "center", paddingBottom: "10px" }}>
                                    <Controller
                                        name={`images.${index}.id`}
                                        control={control}
                                        render={({ field }) => (
                                            <Autocomplete
                                                options={imagesOptions}
                                                sx={{ width: "90%" }}
                                                getOptionLabel={(option) => option.note}
                                                value={imagesOptions.find(option => option.id === field.value) || null}
                                                onChange={(_, value) => field.onChange(value ? value.id : null)}
                                                renderOption={(props, option) => (
                                                    <li {...props} style={{ display: 'flex', alignItems: 'center' }}>
                                                        <img src={option.images} alt={option.note} style={{ width: 50, height: 50, marginRight: 8 }} />
                                                        {option.note}
                                                    </li>
                                                )}
                                                renderInput={(params) => <TextField {...params} label="Images" />} />
                                        )} />
                                    <Button onClick={() => removeImage(index)} sx={{ marginLeft: "10px" }}>Supprimer</Button>
                                </Box>
                            ))}
                            <Button onClick={() => appendImage({ id: '', note: '', images: '' })} sx={{ marginBottom: "10px" }}>Ajouter une image</Button>
                        </Box>
                        <Box>
                            <Typography variant="h4" gutterBottom>
                                Série
                            </Typography>
                            <Controller
                                name="serie"
                                control={control}
                                rules={validationRules.serie}
                                render={({ field }) => (
                                    <Autocomplete
                                        options={seriesOptions}
                                        sx={{ width: "90%" }}
                                        getOptionLabel={(option) => option.nom}
                                        value={seriesOptions.find(option => option.id === field.value?.id) || null}
                                        onChange={(_, value) => field.onChange(value)}
                                        renderInput={(params) => <TextField {...params} label="Série" />}
                                    />
                                )}
                            />
                        </Box>
                        {errors.serie && (
                            <ModalErrorMessage message={errors.serie.message} />
                        )}
                        <Box>
                            <Typography variant="h4" gutterBottom>
                                Ajouter une supertechnique
                            </Typography>
                            {supertechniquesFields.map((item, index) => (
                                <Box key={item.id} sx={{ display: "flex", alignItems: "center", paddingBottom: "10px" }}>
                                    <Controller
                                        name={`supertechniques.${index}.id`}
                                        control={control}
                                        render={({ field }) => (
                                            <Autocomplete
                                                options={supertechniquesOptions}
                                                sx={{ width: "90%" }}
                                                getOptionLabel={(option) => option.nom_français_supertechniques}
                                                value={supertechniquesOptions.find(option => option.id === field.value) || null}
                                                onChange={(_, value) => field.onChange(value ? value.id : null)}
                                                renderInput={(params) => <TextField {...params} label="Supertechnique" />} />
                                        )} />
                                    <Button onClick={() => removeSupertechnique(index)} sx={{ marginLeft: "10px" }}>Supprimer</Button>
                                </Box>
                            ))}
                            <Button onClick={() => appendSupertechnique({ 
                                id: '', 
                                nom_français_supertechniques: '', 
                                nom_original_supertechniques: '', 
                                type_supertechniques: '', 
                                notes_supertechniques: '', 
                                obtention_supertechniques: '', 
                                video: []
                            })} sx={{ marginBottom: "10px" }}>Ajouter une supertechnique</Button>
                        </Box>
                        <Box>
                            <Typography variant="h4" gutterBottom>
                                Ajouter un match
                            </Typography>
                            {matchFields.map((item, index) => (
                                <Box key={item.id} sx={{ display: "flex", alignItems: "center", paddingBottom: "10px" }}>
                                    <Controller
                                        name={`matchs.${index}.id`}
                                        control={control}
                                        render={({ field }) => (
                                            <Autocomplete
                                                options={matchsOptions}
                                                sx={{ width: "90%" }}
                                                getOptionLabel={(option) => option.equipes}
                                                value={matchsOptions.find(option => option.id === field.value) || null}
                                                onChange={(_, value) => field.onChange(value ? value.id : null)}
                                                renderInput={(params) => <TextField {...params} label="Match" />} />
                                        )} />
                                    <Button onClick={() => removeMatch(index)} sx={{ marginLeft: "10px" }}>Supprimer</Button>
                                </Box>
                            ))}
                            <Button onClick={() => appendMatch({ 
                                id: '', 
                                id_equipe_1: { id: '', nom_francais_equipe: '', nom_original_equipe: '', note: '' }, 
                                id_equipe_2: { id: '', nom_francais_equipe: '', nom_original_equipe: '', note: '' }, 
                                notes: '', 
                                compo_equipe_1: '', 
                                compo_equipe_2: ''
                            })} sx={{ marginBottom: "10px" }}>Ajouter un match</Button>
                        </Box>
                        <Box>
                            <Typography variant="h4" gutterBottom>
                                Ajouter un entraîneur
                            </Typography>
                            {entraîneurFields.map((item, index) => (
                                <Box key={item.id} sx={{ display: "flex", alignItems: "center", paddingBottom: "10px" }}>
                                    <Controller
                                        name={`entraineur.${index}.id`}
                                        control={control}
                                        render={({ field }) => (
                                            <Autocomplete
                                                options={personnagesOptions}
                                                sx={{ width: "90%" }}
                                                getOptionLabel={(option) => option.nom_français_personnage}
                                                value={personnagesOptions.find(option => option.id === field.value) || null}
                                                onChange={(_, value) => field.onChange(value ? value.id : null)}
                                                renderInput={(params) => <TextField {...params} label="Entraineur" />} />
                                        )} />
                                    <Button onClick={() => removeEntraineur(index)} sx={{ marginLeft: "10px" }}>Supprimer</Button>
                                </Box>
                            ))}
                            <Button onClick={() => appendEntraineur({ 
                                 id: '', 
                                 nom_français_personnage: '', 
                                 nom_original_personnage: '', 
                                 note: '',
                                 position_personnage: ''
                            })} sx={{ marginBottom: "10px" }}>Ajouter un entraineur</Button>
                        </Box>
                    </Grid>
                </Grid>
                <Box sx={{ justifyContent: "center", display: "flex", paddingTop: "10px" }}>
                    <Button variant="outlined" type="submit">Enregistrer</Button>
                </Box>
            </form>
        </Box>
        </>
    );
}
