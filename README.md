# API Express + Node + Postgres

```
app/
  config/
  migrations/
  scripts/
  src-server/
  package.json
  README.md
  .env.example
  .gitignore
```


>**Vous n'aurez à modifier aucun code existant de l'application afin de réaliser ce projet !**

## Pré-requis
Vous aurez besoin des versions suivantes pour lancer le projet
* [node v8 ou plus](https://nodejs.org/en/download/)
* npm v5 ou plus
* [PostgreSQL](https://www.postgresql.org/download/)

## Installation
>**Vous n'aurez à modifier aucun code existant de l'application afin de réaliser ce projet !**
1. Lancez `npm install` une fois dans le dossier.
2. Créez `.env` et définissez ses valeurs en prennant comme example le contenu de `.env.example`
3. Lancez les seed de votre application `npm run seed` (nécessite d'avoir une BDD dispo)
4. Démarrez l'enrivonnement de dev `npm run server:dev`
4. Ou bien démarrez l'environnement de prod `npm run server:prod` ou bien avec `npm run start`


### Scripts à disposition
* `$ npm run start`: Démarrer l'environnement de prod
* `$ npm run server:dev`: Démarrer l'environnement en mode développement
* `$ npm run lint`: Lancer le lint de code
* `$ npm run seed`: Lancer les migrations et seeds de la base de données
* `$ npm run test:server`: Lancer les tests 
* `$ npm run db:migrate`: Lancer les migrations

## API Endpoints (/api/*)

### `GET /api/posts`: Get all Posts
Récupère la liste des posts existants en base de données.

Si le code HTTP "200" apparaît ou bien "ok" dans la réponse c'est que la requête est réussie et donc que l'application fonctionne correctement. 

Format de la réponse :
```
let response = {
    statusCode: 200,
    body: [
            Post1,
            Post2,
            ...
            PostN
        ]
    }
```

### `GET /api/posts/:id`: Get a Post by ID
Récupère un post en particulier en remplaçant l'id de l'url par celui d'un post existant.
