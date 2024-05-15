# Usa la imagen oficial de Node.js como base
FROM node:18.13.0

# Establece el directorio de trabajo en la carpeta de la aplicación
WORKDIR /app

# Copia los archivos del proyecto al contenedor
COPY package.json ./
COPY app.js ./

# Instala las dependencias
RUN npm install

# Expón el puerto en el que la aplicación se ejecuta
EXPOSE 3000

# Comando para ejecutar la aplicación
CMD ["node", "app.js"]