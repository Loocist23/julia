#= 

Exercice : Analyseur de fréquence des mots

Crée un petit programme en Julia qui analyse le texte d'un paragraphe et détermine la fréquence de chaque mot. Voici ce que tu dois faire :

Lire une chaîne de texte qui sera ton paragraphe d'analyse. Tu peux soit saisir ce texte manuellement, soit le lire depuis un fichier, soit tout simplement l'initialiser dans ton script.

Nettoie ton texte pour enlever la ponctuation et les majuscules, de sorte que "Bonjour," et "bonjour" ou "bonjour." soient considérés comme le même mot.

Compte la fréquence de chaque mot unique et stocke le résultat dans une collection appropriée.

Trie les mots par ordre décroissant de fréquence et affiche les mots ainsi que leur fréquence.

Pour ajouter un peu de piment :

Identifie et affiche le mot le plus fréquent.
Gère les éventuels caractères spéciaux ou chiffres s'ils ne doivent pas être considérés comme des mots.

Je suis certain que tu vas t'amuser avec les strings et les collections dans cet exercice. Et si jamais ça devient trop facile, tu pourrais toujours y ajouter un petit bout de GUI pour afficher les résultats d'une manière plus colorée et interactive. Mais n'allons pas mettre la charrue avant les boeufs virtuels !

=#

# Définition de la chaîne de caractères à analyser
texte = """
    Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n'a pas fait que survivre cinq siècles, mais s'est aussi adapté à la bureautique informatique, sans que son contenu n'en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.
"""

# Fonction pour nettoyer le texte
function nettoyer_texte(texte::String)
    # Remplacer les caractères spéciaux par des espaces
    texte = replace(texte, r"[^a-zA-Z0-9]" => " ")
    # Remplacer les majuscules par des minuscules
    texte = lowercase(texte)
    # Retourner le texte nettoyé
    return texte
end

# Fonction pour compter la fréquence des mots
function compter_fréquence(texte::String)
    # Nettoyer le texte
    texte = nettoyer_texte(texte)
    # Créer un dictionnaire vide pour stocker les mots et leur fréquence
    fréquence = Dict{String, Int64}()
    # Parcourir tous les mots du texte
    for mot in split(texte)
        # Si le mot existe déjà dans le dictionnaire, incrémenter sa fréquence
        if haskey(fréquence, mot)
            fréquence[mot] += 1
        # Sinon, ajouter le mot au dictionnaire avec une fréquence de 1
        else
            fréquence[mot] = 1
        end
    end
    # Retourner le dictionnaire de fréquence
    return fréquence
end

# Fonction pour afficher les mots par ordre décroissant de fréquence
function afficher_fréquence(fréquence::Dict{String, Int64})
    # Trier les mots par ordre décroissant de fréquence
    mots = sort(collect(keys(fréquence)), by=x->fréquence[x], rev=true)
    # Afficher les mots et leur fréquence
    for mot in mots
        println("$mot: $(fréquence[mot])")
    end
end

# Compter la fréquence des mots dans le texte
fréquence = compter_fréquence(texte)

# Afficher les mots par ordre décroissant de fréquence
afficher_fréquence(fréquence)

# Afficher le mot le plus fréquent
mots = sort(collect(keys(fréquence)), by=x->fréquence[x], rev=true)

println("Le mot le plus fréquent est $(mots[1]) avec une fréquence de $(fréquence[mots[1]])")