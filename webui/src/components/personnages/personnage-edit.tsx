import { Box, Typography, Grid, TextField, Autocomplete, Button } from "@mui/material";
import axios from "axios";
import { useState, useEffect } from "react";
import { useForm, useFieldArray, Controller } from "react-hook-form";
import { ModalErrorMessage } from "../error-message";
import { MenuPersonnage } from "./menu-personnages";
import { Personnage, PersonnageForm } from "./personnagedata";
import { validationRules } from "./personnagerules";
import { useParams } from "react-router-dom";

const positions = [
    { label: "Gardien", value: "Gardien" },
    { label: "Défenseur", value: "Défenseur" },
    { label: "Milieu", value: "Milieu" },
    { label: "Attaquant", value: "Attaquant" },
    { label: "Ne joue pas", value: null }
];

export function PersonnageEdit() {
    const { id } = useParams<{ id: string }>();
    const { register, handleSubmit, control, reset, setValue, formState: { errors } } = useForm<PersonnageForm>();

    const {
        fields: supertechniquesFields,
        append: appendSupertechnique,
        remove: removeSupertechnique
    } = useFieldArray({
        control,
        name: "supertechniques"
    });

    const {
        fields: equipesFields,
        append: appendEquipe,
        remove: removeEquipe
    } = useFieldArray({
        control,
        name: "equipes"
    });

    const {
        fields: episodesFields,
        append: appendEpisode,
        remove: removeEpisode
    } = useFieldArray({
        control,
        name: "episode"
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
    const [equipesOptions, setEquipesOptions] = useState<{ id: string, nom_francais_equipe: string }[]>([]);
    const [episodesOptions, setEpisodesOptions] = useState<{ id: string, titre: string }[]>([]);
    const [imagesOptions, setImagesOptions] = useState<{ id: string, note: string, images: string }[]>([]);
    const [seriesOptions, setSeriesOptions] = useState<{ id: string, nom: string }[]>([]);
    const [personnage, setPersonnage] = useState<Personnage>();

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

                const equipesResponse = await axios.get(`${apiUrl}/equipes`);
                if (equipesResponse.data && Array.isArray(equipesResponse.data)) {
                    const newEquipes = equipesResponse.data.map((equipe) => ({
                        id: equipe.id,
                        nom_francais_equipe: equipe.nom_francais_equipe
                    }));
                    setEquipesOptions(newEquipes);
                } else {
                    alert("No equipes or incorrect data structure");
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

                const personnageResponse = await axios.get(`${apiUrl}/personnages/${id}`);
                setPersonnage(personnageResponse.data);
                if (personnageResponse.data) {
                    reset({
                        nom_français_personnage: personnageResponse.data.nom_français_personnage || "",
                        nom_original_personnage: personnageResponse.data.nom_original_personnage || "",
                        position_personnage: personnageResponse.data.position_personnage || null,
                        note: personnageResponse.data.note || "",
                        supertechniques: personnageResponse.data.supertechniques || [],
                        episode: personnageResponse.data.episode || [],
                        equipes: personnageResponse.data.equipes || [],
                        serie: personnageResponse.data.serie || null,
                        images: personnageResponse.data.images || []
                    });
                }
            } catch (error) {
                console.error('Error fetching data:', error);
            }
        };
        fetchOptions();
    }, [id, reset]);

    const onSubmit = async (data: PersonnageForm) => {        
        // Assurez-vous que les tableaux vides sont transformés en null
        if (data.supertechniques?.length === 0) {
            data.supertechniques = null;
        }
    
        if (data.equipes?.length === 0) {
            data.equipes = null;
        }
    
        if (data.episode?.length === 0) {
            data.episode = null;
        }
    
        if (data.images?.length === 0) {
            data.images = null;
        }
    
        // Assurez-vous que les champs vides sont transformés en null
        if (data.nom_original_personnage === "") {
            data.nom_original_personnage = null;
        }
        if (data.note === "") {
            data.note = null;
        }
        if (data.position_personnage === undefined) {
            data.position_personnage = null;
        }
    
        const apiUrl = import.meta.env.VITE_PUBLIC_API_URL;
        try {
            await axios.patch(`${apiUrl}/personnages/${id}`, {
                nom_français_personnage: data.nom_français_personnage,
                nom_original_personnage: data.nom_original_personnage,
                position_personnage: data.position_personnage,
                note: data.note,
                supertechniques: data.supertechniques,
                episode: data.episode,
                equipes: data.equipes,
                serie: data.serie,
                images: data.images
            });
        } catch (error) {
            console.error('Erreur lors de la connexion :', error);
        }
        console.log(data);
    };
    

    return (
        <>
        <MenuPersonnage />
        <Box sx={{ flexGrow: 1, display: "flex", flexDirection: "column", alignItems: "center" }}>
            <Typography variant="h3" gutterBottom>
                Modifier {personnage?.nom_français_personnage}
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
                                label="Nom français du personnage"
                                variant="outlined"
                                {...register("nom_français_personnage", validationRules.nom_français_personnage)} />
                        </Box>
                        <Box>
                            {errors.nom_français_personnage && (
                                <ModalErrorMessage message={errors.nom_français_personnage.message} />
                            )}
                        </Box>
                        <Box sx={{ paddingBottom: "10px" }}>
                            <TextField
                                InputLabelProps={{ shrink: true }}
                                sx={{ width: "90%" }}
                                label="Nom original du personnage"
                                variant="outlined"
                                {...register("nom_original_personnage")} />
                        </Box>
                        <Box sx={{ paddingBottom: "10px" }}>
                            <Controller
                                name="position_personnage"
                                control={control}
                                render={({ field }) => (
                                    <Autocomplete
                                        options={positions}
                                        sx={{ width: "90%" }}
                                        getOptionLabel={(option) => option.label}
                                        value={positions.find(option => option.value === field.value) || null}
                                        onChange={(_, value) => field.onChange(value ? value.value : null)}
                                        renderInput={(params) => <TextField {...params} label="Position" />} />
                                )} />
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
                                obtention_supertechniques: '', 
                                notes_supertechniques: '', 
                                video: [] 
                            })} sx={{ marginBottom: "10px" }}>Ajouter une supertechnique</Button>
                        </Box>
                    </Grid>
                    <Grid item xs={8}>
                        <Box>
                            <Typography variant="h4" gutterBottom>
                                Ajouter une équipe
                            </Typography>
                            {equipesFields.map((item, index) => (
                                <Box key={item.id} sx={{ display: "flex", alignItems: "center", paddingBottom: "10px" }}>
                                    <Controller
                                        name={`equipes.${index}.id`}
                                        control={control}
                                        render={({ field }) => (
                                            <Autocomplete
                                                options={equipesOptions}
                                                sx={{ width: "90%" }}
                                                getOptionLabel={(option) => option.nom_francais_equipe}
                                                value={equipesOptions.find(option => option.id === field.value) || null}
                                                onChange={(_, value) => field.onChange(value ? value.id : null)}
                                                renderInput={(params) => <TextField {...params} label="Equipe" />} />
                                        )} />
                                    <Button onClick={() => removeEquipe(index)} sx={{ marginLeft: "10px" }}>Supprimer</Button>
                                </Box>
                            ))}
                            <Button onClick={() => appendEquipe({ id: '', nom_francais_equipe: '', nom_original_equipe: '', note: '' })} sx={{ marginBottom: "10px" }}>Ajouter une équipe</Button>
                        </Box>
                        <Box>
                            <Typography variant="h4" gutterBottom>
                                Ajouter un épisode
                            </Typography>
                            {episodesFields.map((item, index) => (
                                <Box key={item.id} sx={{ display: "flex", alignItems: "center", paddingBottom: "10px" }}>
                                    <Controller
                                        name={`episode.${index}.id`}
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
