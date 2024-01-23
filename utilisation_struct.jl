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
