
-- Base de datos: jeniferdb

-- Tabla usuarios
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL
);

-- Tabla categorias
CREATE TABLE categorias (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Tabla anuncios
CREATE TABLE anuncios (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    descripcion TEXT NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    imagen VARCHAR(255),
    usuario_id INTEGER REFERENCES usuarios(id),
    categoria_id INTEGER REFERENCES categorias(id),
    habilitado BOOLEAN DEFAULT TRUE,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla favoritos
CREATE TABLE favoritos (
    id SERIAL PRIMARY KEY,
    usuario_id INTEGER REFERENCES usuarios(id),
    anuncio_id INTEGER REFERENCES anuncios(id)
);

-- Tabla mensajes
CREATE TABLE mensajes (
    id SERIAL PRIMARY KEY,
    anuncio_id INTEGER REFERENCES anuncios(id),
    emisor_id INTEGER REFERENCES usuarios(id),
    receptor_id INTEGER REFERENCES usuarios(id),
    contenido TEXT NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
