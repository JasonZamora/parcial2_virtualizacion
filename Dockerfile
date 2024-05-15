#servidor ngnix
FROM nginx:alpine

# Copia el contenido al directorio de trabajo de nginx
COPY index.html /usr/share/nginx/html/index.html

# Expón el puerto en el que la aplicación se ejecuta
EXPOSE 5000