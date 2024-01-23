#=
Exercice de traitement d’image : Mutation Chromatique de Vert à Bleu

Ton objectif est de transformer visuellement un feuillage numérique en une vague azurée. En bref, tu vas prendre les pixels verts d’une image et les rendre bleus.

Mission Pixel Bleu (sans le moindre soupçon de code) :

Chargement de l'artefact: Invoque une image colorée depuis les profondeurs de ton disque dur, ou télécharge un nouveau candidat pour cette métamorphose chromatique.

Détection du Vert: Fais appel à ta vision numérique pour repérer ceux qui se vêtent de vert en R, G, B. Tu devras identifier les pixels où le vert déborde de vie et prépare-toi à initier leur mue.

Invocation du Bleu: Convertis ces pixels verts en bleus. Ceci implique que tu devras ajuster les valeurs de leurs composants de couleur pour réduire le vert tout en élevant le bleu.

Décision de pureté: Décide toi-même des critères de pureté de vert nécessaire pour subir la conversion. Veux-tu transformer un vert doux en une douce brise bleue ou réserver cette transformation pour les verts les plus audacieux ?

Archivage de l'oeuvre alchimique: Une fois que tu as initié la grande bleuification de ton oeuvre, il est temps de phénixifier ton fichier pour l'éternité sous un nouveau nom.

Cette entreprise te donnera une compréhension approfondie du ballet des pixels en procession à travers leurs composantes colorées. 
=#

using Images
using ImageMagick

# la fonction qui change les pixels verts en bleus
function changer_pixel_vert_en_bleu(img::Array{RGBA{N0f8}, 2})
    for index in CartesianIndices(img)
        i, j = Tuple(index)
        pixel = img[i, j]
        if pixel.g > pixel.r && pixel.g > pixel.b
            img[i, j] = RGB(0, 0, 1)
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
changer_pixel_vert_en_bleu(img)

# Sauvegarder l'image modifiée
save("vert_to_bleu.png", img)