const express = require('express');
const app = express();
const port = process.env.PORT || 3001;
app.use(express.json());
app.use(express.static('src/public'));
const usuarioRouter = require('./routes/usuarioRouter');
const anuncioRouter = require('./routes/anuncioRouter');
app.use('/api/usuario', usuarioRouter);
app.use('/api/anuncio', anuncioRouter);
app.listen(port, () => console.log(`Servidor corriendo en puerto ${port}`));