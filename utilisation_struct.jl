#=

Exercice : Arbre des dépendances de modules

Dans l'univers du développement logiciel, il est courant de travailler avec des modules qui dépendent les uns des autres. Tes talents de Julia sont donc sollicités pour créer un programme qui manipule les dépendances de modules.

Voici la tâche :

Écris un programme en Julia qui définit un module comme une structure comprenant un nom et une liste de dépendances (les noms des modules dont il dépend). Puis, implémente les fonctions suivantes :

ajouter_module(modules, nom, dépendances): ajoute un nouveau module (si ce module n'existe pas déjà) à une collection existante de modules.
retirer_module(modules, nom): retire un module de la collection, s'il existe, et toutes les dépendances qui pointent vers lui.
afficher_dépendances(modules, nom): affiche la liste des dépendances pour un module donné.
afficher_modules(modules): affiche tous les modules dans la collection avec leurs dépendances.

Pour corser un peu le défi :

Tu peux t'assurer que lors de l'ajout d'un module, si les dépendances mentionnées n'existent pas, elles soient créées sans dépendances.
Si tu retires un module, vérifie également que les modules qui dépendent uniquement de ce module soient également retirés ou leurs dépendances mises à jour.
Gère les erreurs potentielles comme les noms de modules invalides.

Cet exercice te permet de travailler avec des collections, des structures, des chaînes de caractères et plus encore. Tu apprendras également à gérer la complexité au fur et à mesure que le graphe des dépendances se complexifie.

Que la force des algos soit avec toi, loocist ! Et si jamais tu te sens perdu dans la forêt des arbres binaires, n'hésite pas à envoyer un signal de détresse ! 🌲📡

=#

# Définition de la structure mutable pour un module
mutable struct MonModule
    nom::String
    dépendances::Vector{String}
end

# Fonction pour ajouter un module à la collection
function ajouter_module(modules::Dict{String, MonModule}, nom::String, dépendances::Vector{String})
    # Mettre à jour les dépendances si le module existe déjà
    if haskey(modules, nom)
        module_existant = modules[nom]
        module_existant.dépendances = unique(vcat(module_existant.dépendances, dépendances))
    else
        # Sinon, créer un nouveau module
        modules[nom] = MonModule(nom, dépendances)
    end

    # S'assurer que toutes les dépendances existent comme modules
    for dep in dépendances
        if !haskey(modules, dep)
            modules[dep] = MonModule(dep, [])
        end
    end
end

# Fonction pour afficher tous les modules avec leurs dépendances
function afficher_modules(modules::Dict{String, MonModule})
    for (nom, _module) in modules
        println("MonModule $nom avec dépendances: $(_module.dépendances)")
    end
end

# Fonction pour retirer un module de la collection et ses dépendances
function retirer_module(modules::Dict{String, MonModule}, nom::String)
    if haskey(modules, nom)
        # Récupérer le module à retirer
        module_a_retirer = modules[nom]

        # Retirer le module de la collection
        delete!(modules, nom)

        # Retirer toutes les dépendances qui pointent vers le module
        for (nom_module, _module) in modules
            if nom in _module.dépendances
                _module.dépendances = filter(x -> x != nom, _module.dépendances)
            end
        end
    end
end

# Fonction pour afficher les dépendances d'un module donné
function afficher_dépendances(modules::Dict{String, MonModule}, nom::String)
    if haskey(modules, nom)
        module_cible = modules[nom]
        println("Dépendances du module $nom:")
        println(module_cible.dépendances)
    else
        println("Le module $nom n'existe pas.")
    end
end

# Fonction principale pour tester les fonctionnalités
function main()
    modules = Dict{String, MonModule}()

    ajouter_module(modules, "A", ["B", "C"])
    ajouter_module(modules, "B", ["C"])
    ajouter_module(modules, "C", ["D"])
    ajouter_module(modules, "D", ["A"])

    println("Modules initiaux:")
    afficher_modules(modules)
    println("Les dépendances de A sont:")
    afficher_dépendances(modules, "A")

    retirer_module(modules, "A")

    println("Modules après retrait de A:")
    afficher_modules(modules)
    println("Les dépendances de A sont:")
    afficher_dépendances(modules, "A")


end

# Exécuter la fonction principale
main()
