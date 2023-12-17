# Dockerfile
FROM  --platform=linux/arm64 nginx:latest

# Copier les fichiers de configuration
COPY ./nginx-template.conf /etc/nginx/nginx-template.conf

# Définir la variable d'environnement APP_NAME
ENV APP_NAME=default_app_name

# CMD reste inchangé
CMD /bin/sh -c "envsubst '\$APP_NAME' < /etc/nginx/nginx-template.conf > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"