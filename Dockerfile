# Utiliser Node.js 18 Alpine comme image de base
FROM node:18-alpine

# Définir le répertoire de travail
WORKDIR /app

# Copier les fichiers de dépendances
COPY package.json bun.lock ./

# Installer Bun (plus rapide que npm)
RUN npm install -g bun

# Installer les dépendances
RUN bun install

# Copier le reste du code source
COPY . .

# Exposer le port 4173 (port par défaut de RSPress preview)
EXPOSE 4173

# Commande par défaut pour le développement
CMD ["bun", "run", "dev", "--host", "0.0.0.0"]
