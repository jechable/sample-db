-- /home/vbox1/sample-db/operaciones.sql

-- Inserciones a diferentes tablas
INSERT INTO Clientes (nombre, email, telefono, direccion)
VALUES ('Juan Lopez', 'juan@gmail.com', '996 101 8694', 'Calle 13 entre Reforma y Zanzibar');

INSERT INTO Tecnicos (nombre_tecnico, email, especialidad)
VALUES ('Luis Pech', 'lc2453@gmail.com', 'mantenimiento');

INSERT INTO Impresoras (modelo_impresora, tipo_impresora, estado_impresora)
VALUES ('Proteus 9000', 'Multifuncional', 'Operativa');

INSERT INTO Impresoras (modelo_impresora, tipo_impresora, estado_impresora)
VALUES ('Thinker Pro', 'Multifuncional', 'Descompuesta');


-- Actualizaciones
UPDATE Clientes SET nombre = 'Carlos Gonzalez' 
WHERE id_cliente = 1;

UPDATE Impresoras SET tipo_impresora = 'Resina' 
WHERE id_impresora = 2;

UPDATE Productos SET nombre_producto = 'Bellota de resina', descripcion = 'Precisión máxima' 
WHERE id_producto = 3;

-- Borrado
DELETE FROM Clientes
WHERE id_cliente = 6;

DELETE FROM Impresoras
WHERE modelo_impresora = 'Thinker Pro';

DELETE FROM Tecnicos
WHERE id_tecnico = 3;
