#=
Exercice de traitement d'image: Conversion Vert-Rouge

Ton objectif pour cette mission verte est de transformer les pixels verts d'une image en rouge, enflamme cette verdure et fais-nous une belle tomate pixelisée!

Voici ta mission photo-synthétique (sans code, pour préserver l'aventure) :

Importation de l'image : Trouve une belle image colorée qui te servira de terrain de jeu pixelisé pour cette expérience chromatique.

Repérage du vert : Chaque pixel possède trois composants : rouge (R), vert (G) et bleu (B). Tu devras identifier ceux où le green règne en maître.

Transformation verte : Chacun de ces pixels verts détectés doit muter en rouge. Tu vas devoir ajuster les niveaux de rouge et de vert en conséquence.

Ajustement précis : Tu peux choisir d'appliquer cette métamorphose uniquement aux pixels d'une certaine intensité de vert ou à tous ceux qui contiennent une touche de cette couleur.

Enregistrement de la nouvelle création : Une fois que tu as fait voir rouge à tous ces pixels verts, il est temps de sauvegarder ton œuvre pour l'immortaliser.

Prends en compte le fait que la manière dont tu détectes et modifies la couleur verte peut varier. Tu pourrais choisir un seuil spécifique pour définir ce qui est "assez vert" ou travailler avec une plage de valeurs.
=#

using Images
using ImageMagick

# la fonction qui change les pixels verts en rouges
function changer_pixel_vert_en_rouge(img::Array{RGBA{N0f8}, 2})
    for index in CartesianIndices(img)
        i, j = Tuple(index)
        pixel = img[i, j]
        if pixel.g > pixel.r && pixel.g > pixel.b
            img[i, j] = RGB(1, 0, 0)
        end
    end
end

# Charger l'image
img = load("test.png")

# Pas besoin de convertir en RGB
# if eltype(img) == RGBA{N0f8}
#     img = RGB.(img)
# end

# Appliquer la fonction sur l'image
changer_pixel_vert_en_rouge(img)

# Sauvegarder l'image modifiée
save("vert_to_rouge.png", img)