# Periodic Table Database Project

Ce projet est une base de données PostgreSQL et un script Bash permettant d’interroger les éléments chimiques de la table périodique. Projet développé sur freeCodeCamp dans le but d'obtenir le certificat Relational Database.

## Fichiers requis
- `periodic_table.sql` : Dump SQL complet pour créer et remplir la base de données.
- `element.sh` : Script Bash pour afficher les informations d’un élément (par numéro atomique, symbole ou nom).

## Utilisation

### 1. Restaurer la base de données
```bash
psql -U postgres < periodic_table.sql
```

### 2. Rendre le script exécutable
```bash
chmod +x element.sh
```

### 3. Exemples d’utilisation
- Sans argument :
  ```bash
  ./element.sh
  # Affiche : Please provide an element as an argument.
  ```
- Avec un élément existant :
  ```bash
  ./element.sh 1
  ./element.sh H
  ./element.sh Hydrogen
  # Affiche les infos de l’élément
  ```
- Avec un élément inexistant :
  ```bash
  ./element.sh Xyz
  # Affiche : I could not find that element in the database.
  ```
