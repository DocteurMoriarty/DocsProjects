# Dockerisation du projet DocsProjects

Ce projet a été dockerisé pour faciliter le développement et le déploiement.

## Fichiers Docker créés

- `Dockerfile` : Configuration de l'image Docker
- `docker-compose.yml` : Orchestration des services
- `.dockerignore` : Fichiers à ignorer lors du build Docker

## Commandes disponibles

### Développement
```bash
# Démarrer le serveur de développement
npm run docker:dev

# Ou directement avec docker-compose
docker-compose up docs
```

### Production
```bash
# Démarrer le serveur de production
npm run docker:prod

# Ou directement avec docker-compose
docker-compose --profile production up docs-prod
```

### Gestion des conteneurs
```bash
# Construire les images
npm run docker:build

# Arrêter les conteneurs
npm run docker:down
```

## Accès aux services

- **Développement** : http://localhost:4173
- **Production** : http://localhost:4174

## Fonctionnalités

- **Hot reload** : Les modifications du code sont automatiquement rechargées
- **Volumes montés** : Le code source est monté pour le développement
- **Optimisé** : Utilise Bun pour des performances améliorées
- **Multi-environnement** : Support développement et production

## Prérequis

- Docker
- Docker Compose
- Node.js 18+ (pour les scripts npm)

## Notes

- Le service de développement monte le code source en volume pour permettre le hot reload
- Le service de production build et sert les fichiers statiques
- Les ports 4173 et 4174 sont exposés pour éviter les conflits
