# Projet Ruby on Rails - Test Technique

Ce projet a pour objectif de répondre au test https://github.com/jpmagido/challenge-cash-register. Vous pouvez consulter la liste complète des magasins ou un magasin spécifique grâce aux routes `/` et `/markets/:id`.

## Prérequis

- Ruby 3.x.x
- Rails 7.x.x
- PostgreSQL (ou un autre SGBD compatible)

## Installation

Clonez le projet sur votre machine locale :

```bash
git clone https://github.com/YanisDahmane/jp-test.git
cd jp-test
```

Installez les dépendances :

```bash
bundle install
```

## Configuration de la base de données

1. Créez la base de données :

```bash
rails db:create
```

2. Appliquez les migrations :

```bash
rails db:migrate
```

3. Ajoutez des données initiales (seed) :

```bash
rails db:seed
```

## Lancer le serveur

Démarrez le serveur Rails :

```bash
./bin/dev
```

Accédez à l'application dans votre navigateur à l'adresse suivante : `http://localhost:3000/`

## Tests

Si des tests sont disponibles, vous pouvez les exécuter avec :

```bash
rails test
```

## Routes principales

- `GET /` : Retourne la liste de tous les magasins.
- `GET /markets/:id` : Retourne les détails d'un magasin spécifique en fonction de l'ID.

---