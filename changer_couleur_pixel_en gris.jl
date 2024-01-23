#=
Voici un exercice de manipulation d'image en Julia :

Objectif : Créer un filtre qui convertira une image en nuances de gris puis appliquera un effet de seuil, qui transformera chaque pixel soit en noir, soit en blanc, basé sur une valeur de seuil.

Pour commencer, tu auras besoin d'installer le package Images en Julia :

using Pkg
Pkg.add("Images")


Après avoir ajouté le package, voici un petit plan d'attaque pour ton script Julia :

Charge l'image originale en couleur.
Convertis l'image en nuances de gris.
Parcours chaque pixel de l'image en nuances de gris.
Si la valeur du pixel est supérieure à ton seuil (par exemple 0.5), convertis ce pixel en blanc.
Si la valeur est inférieure ou égale à ton seuil, convertis ce pixel en noir.
Sauvegarde l'image résultante.

Voici un exemple de code de base qui pourrait t'aider à démarrer :

using Images

# Charger l'image
img = load("chemin_vers_mon_image.jpg")

# Convertir en nuances de gris
img_gray = Gray.(img)

# Appliquer l'effet de seuil
threshold_value = 0.5 # Tu peux ajuster cette valeur
binary_img = img_gray .> threshold_value

# Sauvegarde l'image résultante
save("chemin_vers_mon_nouveau_fichier_image.jpg", binary_img)


N'oublie pas de remplacer "chemin_vers_mon_image.jpg" et "chemin_vers_mon_nouveau_fichier_image.jpg" par les chemins appropriés pour ton image.

Cela te donnera un bon départ pour jouer avec le traitement des images en Julia. Amuse-toi bien et j'espère que DomiGeek appréciera ton art numérique en nuances de Julia! 🎨👩‍🎨
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
save("test2.png", binary_img)