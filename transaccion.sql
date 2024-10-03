-- Transacción que inserta un cliente y le otorga un pedido

START TRANSACTION;

-- Inserción del cliente

INSERT INTO Clientes (nombre, email, telefono, direccion)
VALUES ('Edgar Cutz', 'edgarc2598@gmail.com', '9961053624', 'Calle 76 No. 2');

SAVEPOINT sp1;

-- Creación del pedido

INSERT INTO Pedidos (id_cliente, fecha_pedido, estado_pedido, costo_total)
VALUES (Clientes.LAST_INSERT_ID(), CURRENT_DATE(), 'En Proceso', 4500); 

ROLLBACK TO sp1;

COMMIT;