#=
Exercice en Julia : Effet de seuillage sur une image en nuances de gris

Objectifs :

Chargement d'une image : Commence par charger une image de ton choix. Cette image devrait être colorée pour que tu puisses voir la transformation.

Conversion en nuances de gris : Transforme cette image en une image en nuances de gris. Cela t'aidera à simplifier l'effet de seuillage par la suite.

Application d'un effet de seuil : Définis une valeur de seuil. Pour chaque pixel de ton image en nuances de gris, tu devras déterminer si sa valeur est au-dessus ou en dessous de ce seuil.

Création d'une image binaire : Basé sur ce seuil, chaque pixel devra être mis soit en noir, soit en blanc, créant ainsi une image avec seulement deux couleurs.

Sauvegarde de l'image : Enregistre ton oeuvre sous un nouveau fichier pour pouvoir admirer ton travail et le partager fièrement avec les membres de Geek Zone.

Le challenge ici est de comprendre comment ces étapes interagissent et comment les implémenter dans le langage Julia, en utilisant les bibliothèques et les structures de données appropriées. Cela va sans doute nécessiter un peu de recherche et beaucoup de tâtonnements, mais n'est-ce pas là tout le fun de la programmation ?

Bonne chance, et que la force du code soit avec toi ! 🖖💻
=#

using Images
using ImageMagick

# Charger l'image
img = load("test.png")

# Convertir en nuances de gris
img_gray = Gray.(img)

# Appliquer l'effet de seuil
threshold_value = 0.5 # Tu peux ajuster cette valeur
binary_img = img_gray .> threshold_value

# Sauvegarde l'image résultante
save("nuance_de_gris.png", binary_img)