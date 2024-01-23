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

# Fonction principale pour tester les fonctionnalités
function main()
    modules = Dict{String, MonModule}()

    ajouter_module(modules, "A", ["B", "C"])
    ajouter_module(modules, "B", ["C"])
    ajouter_module(modules, "C", ["D"])
    ajouter_module(modules, "D", ["A"])

    afficher_modules(modules)
end

# Exécuter la fonction principale
main()
