#=
Exercice de traitement d'image : Transition Rouge-Vert

Le rouge est la couleur d'une pomme bien mûre, mais mission du jour : on va lui donner un petit air de feuille fraîche! 

Instructions de l'exercice (et ce coup-ci, c'est sans filet de code!) :

Ouverture de l'image : Choisis une image comportant des pixels rouges à volonté, qui n'attendent que de devenir verts.

Traque du rouge : Repère ces petits pixels rouges malicieux. Heureusement, ils ne sont pas difficiles à trouver, regarde simplement si la composante rouge (R) domine ses frères verts (G) et bleus (B).

Transformation rouge en vert : À chaque fois que tu rencontres un pixel rouge, tu dois inverser la valeur entre le rouge et le vert. Ainsi, le rouge deviendra vert et le vert deviendra rouge.

Sauvegarde de l'image métamorphosée : Une fois que tu as repeint l'image en couleurs plus verdoyantes, sauve ta création sous un nouveau nom.

Avec cet exercice, tu vas vraiment te familiariser avec le travail sur les composants individuels des couleurs des pixels en image numérique. Une fois que tu auras réussi cette mission, n'hésite pas à partager ta toute nouvelle forêt verdoyante sur le serveur Geek Zone. DomiGeek sera sûrement impressionné par tes talents de transformation colorimétrique! 🟥🍀🎨
=#

using Images
using ImageMagick

# la fonction qui change les pixels rouges en verts
function changer_pixel_rouge_en_vert(img::Array{RGBA{N0f8}, 2})
    for index in CartesianIndices(img)
        i, j = Tuple(index)
        pixel = img[i, j]
        if pixel.r > pixel.g && pixel.r > pixel.b
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
changer_pixel_rouge_en_vert(img)

# Sauvegarder l'image modifiée
save("$dossier/rouge_to_vert.png", img)