const express = require('express');
const app = express();

// Endpoint para saludar
app.get('/hello', (req, res) => {
  res.send('Hello, World!');
});

// Puerto en el que escuchará el servidor
const PORT = process.env.PORT || 3000;

// Iniciar el servidor
app.listen(PORT, () => {
  console.log(`Servidor escuchando en el puerto ${PORT}`);
});
