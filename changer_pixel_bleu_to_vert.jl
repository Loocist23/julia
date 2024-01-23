#=
Exercice de traitement d'image : Conversion Bleu-Vert

Ton défi, si tu l'acceptes, sera de peindre en vert les pixels bleus de ton choix dans l'image. Vois-le comme une sorte de conversion digitale de l'eau en terre, transforme les vagues en collines!

Voici ton plan écologique (et toujours sans aucoté code) :

Préliminaires: Ouvre une image colorée, pleine de pixels bleus prêts pour une révolution chromatique.

Exploration des Profondeurs: Identifie les pixels bleus. Un pixel a des composantes de couleur rouge (R), verte (G) et bleue (B). Focus sur les pixels où B éclipse R et G.

Métamorphose Aquatique: Modifie ces pixels en augmentant la valeur verte et en diminuant la bleue pour convertir le bleu en vert. Garde en tête que la modification de la couleur verte peut impliquer des ajustements des autres couleurs pour obtenir la teinte de vert désirée.

Enregistrement du Viridisme: Après avoir insufflé la verdure dans cette mer de pixels, sauvegarde l'image. Elle témoignera de ta main verte dans le domaine du RGB.

Bonus Écoresponsable: (Facultatif) Mets en place une variable d'intensité qui te permettra de régler la force de la conversion. Transformation douce ou radicale? Les forêts tropicales de pixels ou les prairies naissantes? À toi de jouer!

N'oublie pas, après avoir semé tes nouvelles prairies numériques, de montrer les fruits de ton travail sur Geek Zone. Qui sait, peut-être que grâce à toi, le serveur prendra des teintes plus écolo! 🍃💻🖼️
=#

using Images
using ImageMagick

# la fonction qui change les pixels bleus en verts
function changer_pixel_bleu_en_vert(img::Array{RGBA{N0f8}, 2})
    for index in CartesianIndices(img)
        i, j = Tuple(index)
        pixel = img[i, j]
        if pixel.b > pixel.r && pixel.b > pixel.g
            img[i, j] = RGB(0, 1, 0)
        end
    end
end

# dossier de l'image
dossier = "images/"

# Charger l'image
img = load("$dossier/test.png")

# Pas besoin de convertir en RGB
# if eltype(img) == RGBA{N0f8}
#     img = RGB.(img)
# end

# Appliquer la fonction sur l'image
changer_pixel_bleu_en_vert(img)

# Sauvegarder l'image modifiée
save("$dossier/bleu_to_vert.png", img)