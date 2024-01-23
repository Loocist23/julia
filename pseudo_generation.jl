#=
Consigne d'exercice : Créateur de pseudo

Ta mission, si tu l'acceptes, est de créer un petit programme qui génère des pseudonymes pour les membres de Geek Zone. On veut du cool, du funky, et du totalement aléatoire! Voici les critères :

Le pseudo doit commencer par une syllabe aléatoire.
Il doit être suivi d'un chiffre de 0 à 99.
Enfin, il se termine par un suffixe qui donne du peps, comme "Thor", "Ninja", "Master" ou ce qui te vient en tête.

Tu pourrais commencer par créer plusieurs listes qui contiennent ces éléments, puis piocher aléatoirement dans chacune pour former le pseudo. 
Pense à montrer ton code à DomiGeek après, on sait jamais, tu pourrais finir par réellement implémenter ça pour divertir la troupe!

Alors, tente de coder ce bijou et montre-nous ce que tu peux faire, et si tu veux rendre ton code plus élégant, pense à le refactorer après avoir une première version qui fonctionne. 
Piège à bugs évité, gloire de coder assuré! 💻🚀
=#

# Définition des listes de syllabes, de suffixes et de chiffres
syllabes = ["lo", "mo", "ro", "do", "po", "co", "bo", "fo", "zo", "go", "to", "no", "so", "vo", "ko", "ho", "yo", "wo", "xo", "jo"]
chiffres = [i for i in 0:99]

suffixes = ["Master", "Ninja", "Thor", "Geek", "Gamer", "Hacker", "Coder", "Warrior", "Wizard", "Pirate", "Samurai", "Viking", "Jedi", "Nerd", "Guru", "Goth", "Punk", "Rocker", "Dude", "Bro", "Diva", "Queen", "Princess", "Prince", "King", "Hero", "Villain", "Hunter", "Sniper", "Assassin", "Agent", "Spy", "Ranger", "Trooper", "Soldier", "Captain", "Commander", "Chief", "Boss", "Lord", "Lady", "Dame", "Knight", "Squire", "Baron", "Baroness", "Count", "Countess", "Duke", "Duchess", "Emperor", "Empress", "Prince", "Princess", "Pharaoh", "God", "Goddess", "Angel", "Demon", "Saint", "Sinner", "Monk", "Bishop", "Pope", "Priest", "Prophet", "Oracle", "Sage", "Shaman", "Druid", "Witch", "Warlock", "Wizard", "Alchemist", "Magician", "Conjurer", "Enchanter", "Illusionist", "Necromancer", "Sorcerer", "Summoner", "Thaumaturge", "Adept", "Apprentice", "Novice", "Student", "Teacher", "Master", "Grandmaster", "Sensei", "Padawan", "Jedi", "Nerd", "Guru", "Goth", "Punk", "Rocker", "Dude", "Bro", "Diva", "Queen", "Princess", "Prince", "King", "Hero", "Villain", "Hunter", "Sniper", "Assassin", "Agent", "Spy", "Ranger", "Trooper", "Soldier", "Captain", "Commander", "Chief", "Boss", "Lord", "Lady", "Dame", "Knight", "Squire", "Baron", "Baroness", "Count", "Countess", "Duke", "Duchess", "Emperor", "Empress", "Prince", "Princess", "Pharaoh", "God", "Goddess", "Angel", "Demon", "Saint", "Sinner", "Monk", "Bishop", "Pope", "Priest", "Prophet", "Oracle", "Sage", "Shaman", "Druid", "Witch", "Warlock", "Wizard", "Alchemist", "Magician", "Conjurer", "Enchanter", "Illusionist", "Necromancer", "Sorcerer", "Summoner", "Thaumaturge", "Adept", "Apprentice", "Novice", "Student", "Teacher", "Master", "Grandmaster", "Sensei", "Padawan", "Jedi"]

# Fonction pour générer un pseudo aléatoire
function générer_pseudo()
    # Piocher une syllabe aléatoire
    syllabe = rand(syllabes)
    # Piocher un chiffre aléatoire
    chiffre = rand(chiffres)
    # Piocher un suffixe aléatoire
    suffixe = rand(suffixes)
    # Retourner le pseudo
    return "$syllabe$chiffre$suffixe"
end

# Générer 10 pseudos aléatoires
for i in 1:10
    println(générer_pseudo())
end