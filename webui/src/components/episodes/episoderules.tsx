export const validationRules = {
    titre: {
        required: {value: true, message: "Titre requis"}
    },
    serie: {
        required: {value: true, message: "Veuillez sélectionner une série"}
    },
    numepisode: {
        required: "Le numéro de l'épisode est requis",
        valueAsNumber: true,
        validate: (value: number) => !isNaN(value) || "Le numéro de l'épisode doit être un nombre"
    },
    saison: {
        required: "La saison est requise",
        valueAsNumber: true,
        validate: (value: number) => !isNaN(value) || "La saison doit être un nombre"
    }
}
