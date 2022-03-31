# Les Regex

C'est très rigolo !
On va s'en servir principalement pour effectuer deux types d'opération :

- trouver une aiguille dans une botte de foin
- valider le format d'un string

Par exemple en informatique :

- effectuer une recherche dans une BDD via une requête SQL
- valider le texte entré dans un champ INPUT d'une page HTML (on utilisera le javascript)
- dans express, pour écrire des routes
- ...

## Principe

Une regex est une expression qui va permettre de créer des mots à partir de celle-ci.

Par exemple dans le cas d'une adresse mail, on peut diviser dans un premier temps celle-ci par @.

La regex s'écrirait :

```
.*@.*
```

`.` désigne n'importe quel caractère.
`*` désigne la répétition de ce qui est avant 0 ou une infiné de fois.

Si on souhaite maintenant travailler sur la partie de droite, on peut intégrer la séparation entre l'extension du nom de domaine et celui-ci :

```
.*@[a-z0-9\-]+(\.[a-z]{1,63})?
```

Les `[]` désignent un ensemble du caractère à afficher.
`+` désigne la répétition de ce qui est avant 1 ou une infiné de fois.
`?` désigne la répétition de ce qui est avant 0 ou 1 fois.

Les `{}` permettent de préciser le nombre de fois que le caractère précédent est répété. On peut préciser un min et un max (1 et 63 ici).

`\` est le caractère d'échappement, il permet d'échapper le premier sens d'un caractère au niveau de la regex. Par exemple, le `.` ne correspond plus à tout mais au `.` en tant que caractère.

Si on souhaite prendre en compte des domaines liés aux adresses nationales (fr, en ...), on peut ajouter ceci à notre regex :

```
.*@[a-z0-9\-]+(\.[a-z]{1,63})?\p{Ll}{1,3}
```

`\p{Ll}` est un raccourci pour les lettres de l'alphabet latin en minuscule.

## Liens utiles

https://fr.wikipedia.org/wiki/Expression_r%C3%A9guli%C3%A8re

https://regex101.com/