#=
Exercice : Conversion des pixels bleus en rouges

Instructions :

Chargement de l'image: Charge une image en couleur dans ton programme Julia.

Détection du bleu: Détermine une manière de repérer les pixels bleus. Les pixels d'une image en couleur sont généralement représentés par des valeurs de rouge (R), vert (G) et bleu (B), regroupées dans un tuple ou structure similaire. Tu vas devoir identifier les pixels dont la composante bleue est significativement plus élevée que les autres.

Modification des pixels: Change la couleur des pixels identifiés comme bleus. Tu dois modifier la valeur de leur composante bleue et éventuellement ajuster les composantes rouges et vertes pour les transformer en rouge.

Gestion de l'intensité du bleu: Décide si tu veux que ton changement de couleur s'applique à tous les pixels avec une certaine quantité de bleu ou seulement à ceux qui sont majoritairement bleus.

Sauvegarde de l'image modifiée: Enregistre la nouvelle image avec les modifications apportées.

Voici quelques conseils pour l'exercice :

Pense à manipuler les composantes de couleur comme des valeurs numériques comprises entre 0 et 255.
Fais attention à la performance, car traiter chaque pixel un par un peut être assez lent sur de grandes images.
Teste ton programme avec différentes images pour voir comment il gère diverses nuances de bleu.
=#

using Images
using ImageMagick

# la fonction qui change les pixels bleus en rouges
function changer_pixel_bleu_en_rouge(img::Array{RGBA{N0f8}, 2})
    for (i, j) in CartesianIndices(img)
        pixel = img[i, j]
        if pixel.b > pixel.r && pixel.b > pixel.g
            img[i, j] = RGBA(1, 0, 0, pixel.alpha)
        end
    end
end

# Charger l'image
img = load("test.png")

# Convertir en RGB si nécessaire
if eltype(img) == RGBA{N0f8}
    img = RGB.(img)
end

# Appliquer la fonction sur l'image
changer_pixel_bleu_en_rouge(img)

# Sauvegarder l'image modifiée
save("rouge_to_bleu.png", img)