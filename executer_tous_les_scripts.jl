using Images
using ImageMagick

# Obtenir le chemin du dossier courant du script
dossier_courant = @__DIR__

println("Chemin du dossier courant : $dossier_courant")

# Liste des scripts à exécuter
scripts = [
    "changer_couleur_pixel_en gris.jl",
    "changer_pixel_bleu_en_rouge.jl",
    "changer_pixel_bleu_to_vert.jl",
    "changer_pixel_rouge_en_bleu.jl",
    "changer_pixel_rouge_to_vert.jl",
    "changer_pixel_vert_en_bleu.jl",
    "changer_pixel_vert_to_rouge.jl"
]

# Exécuter chaque script
for script in scripts
    chemin_script = joinpath(dossier_courant, script)
    println("Exécution de $chemin_script...")
    include(chemin_script)
end

println("Tous les scripts ont été exécutés.")
