#=
Exercice en traitement d'image : Inversion Rouge-Bleu

Ton objectif est de créer un petit programme de traitement d'image qui va inverser les composants rouge et bleu de chaque pixel dans une image. En d'autres termes, là où c'était rouge, ça va devenir bleu, et vice versa !

Voici ce que tu dois faire, mais sans code, parce que... tu sais, la fosse aux lions et tout ça :

Charger une image : Ouvre une image colorée pour pouvoir jouer avec ses pixels. Cette image doit avoir un format qui te permet de d'obtenir des valeurs individuelles de rouge, vert et bleu pour chaque pixel.

Analyser l'image : Passe en revue chaque pixel de l'image et extrait ses composantes de couleur — particulièrement rouge et bleue.

Échanger les couleurs : Pour chaque pixel, échange la valeur de la composante rouge avec celle de la composante bleue. Le vert, quant à lui, ne bouge pas, le pauvre a déjà assez à faire avec la photosynthèse.

Sauvegarder le résultat : Une fois que tous les pixels ont été ajustés, sauvegarde l'image modifiée sous un nouveau nom pour pouvoir comparer avec l'originale.

Petit rappel supplémentaire sans trop rentrer dans le code: en codant en Julia, tu te serviras probablement des bibliothèques spécialisées dans le traitement d'images, alors assure-toi de les avoir à portée de main.
=#

using Images
using ImageMagick

# Charger l'image*
img = load("test.png")

# Inverser les composantes rouge et bleu
for index in CartesianIndices(img)
    i, j = Tuple(index)
    pixel = img[i, j]
    img[i, j] = RGB(pixel.b, pixel.g, pixel.r)
end

# Sauvegarder l'image modifiée
save("rouge_to_bleu.png", img)