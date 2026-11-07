-- Habilita trabajo con llaves foráneas
PRAGMA foreign_keys = ON; 

-- Tabla Libro
CREATE TABLE IF NOT EXISTS libro(
  id_libro INTEGER PRIMARY KEY,
  titulo TEXT NOT NULL,
  descripcion TEXT,
  isbn TEXT NOT NULL,
  fecha TEXT NOT NULL
);

-- Tabla Autor
CREATE TABLE IF NOT EXISTS autor(
  id_autor INTEGER PRIMARY KEY,
  nombre TEXT NOT NULL,
  apellido TEXT NOT NULL,
  nacionalidad TEXT NOT NULL
);

-- Tabla libro - autor
CREATE TABLE IF NOT EXISTS libro_autor(
  libro_id INTEGER NOT NULL,
  autor_id INTEGER NOT NULL,
  FOREIGN KEY(libro_id) REFERENCES libro(id_libro),
  FOREIGN KEY(autor_id) REFERENCES autor(id_autor),
  PRIMARY KEY(libro_id, autor_id)
);

-- Insertar libro
INSERT INTO libro(
  titulo, 
  descripcion, 
  isbn, 
  fecha
)
VALUES('La fiesta del chivo', 'Novela política', 'ABC-001', '01-11-2018');


-- Insertar libro
INSERT INTO libro(
  titulo, 
  descripcion, 
  isbn, 
  fecha
)
VALUES(
  'Desarrollo Web con PHP y Mysql', 
  'Programación', 
  'ABC-002', '01-01-2016'
);

-- Insertar autores

INSERT INTO autor(nombre, apellido, nacionalidad)
VALUES('Mario', 'Vargas LLosa', 'Peruana');

INSERT INTO autor(nombre, apellido, nacionalidad)
VALUES('Luke', 'Welling', 'Estadounidense');

INSERT INTO autor(nombre, apellido, nacionalidad)
VALUES('Laura', 'Thomson', 'Estadounidense');

-- Insertar Libro / Autor
INSERT INTO libro_autor(libro_id, autor_id)
VALUES(2, 3);

-- Consultar libros y autores con INNER JOIN
SELECT 
  nombre, 
  apellido, 
  titulo AS 'libro' 
FROM libro_autor
  INNER JOIN autor ON 
    libro_autor.autor_id = autor.id_autor
  INNER JOIN libro ON 
    libro_autor.libro_id = libro.id_libro;