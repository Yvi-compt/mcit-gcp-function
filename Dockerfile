/*FROM python:3.9
WORKDIR /app
COPY . /app
RUN pip install -r requirements.txt
CMD ["gunicorn", "-b", "0.0.0.0:8080", "main:app"]# Utilisez une image de base Python*/

FROM python:3.9-slim
# Définissez le répertoire de travail dans le conteneur
WORKDIR /app

# Copiez le fichier requirements.txt dans le conteneur
COPY requirements.txt .

# Installez les dépendances
RUN pip install --no-cache-dir -r requirements.txt

# Copiez le reste du code de l'application
COPY . .

# Exposez le port 8080
EXPOSE 8080

# Commande pour exécuter l'application
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "main:app"]
