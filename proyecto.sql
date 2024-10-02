-- Crear la base de datos SysPrint
CREATE DATABASE SysPrint;

-- Usar la base de datos SysPrint
USE SysPrint;

-- Crear la tabla de Clientes
CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    direccion VARCHAR(255)
);

-- Crear la tabla de Pedidos
CREATE TABLE Pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    fecha_pedido DATE NOT NULL,
    estado_pedido VARCHAR(50) NOT NULL,
    costo_total DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

-- Crear la tabla de Productos
CREATE TABLE Productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    descripcion TEXT,
    archivo_modelo VARCHAR(255),
    dimensiones VARCHAR(100),
    peso_estimado DECIMAL(10, 2)
);

-- Crear la tabla de Materiales
CREATE TABLE Materiales (
    id_material INT AUTO_INCREMENT PRIMARY KEY,
    nombre_material VARCHAR(100) NOT NULL,
    color VARCHAR(50),
    precio_por_gramo DECIMAL(10, 2),
    resistencia VARCHAR(50)
);

-- Crear la tabla de Impresoras
CREATE TABLE Impresoras (
    id_impresora INT AUTO_INCREMENT PRIMARY KEY,
    modelo_impresora VARCHAR(100),
    tipo_impresora VARCHAR(50),
    estado_impresora VARCHAR(50)
);

-- Crear la tabla de Técnicos
CREATE TABLE Tecnicos (
    id_tecnico INT AUTO_INCREMENT PRIMARY KEY,
    nombre_tecnico VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    especialidad VARCHAR(100)
);

-- Crear la tabla de Detalles del Pedido
CREATE TABLE DetallesPedido (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_producto INT NOT NULL,
    id_material INT NOT NULL,
    id_impresora INT NOT NULL,
    id_tecnico INT NOT NULL,
    cantidad INT NOT NULL,
    peso_real DECIMAL(10, 2),
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto),
    FOREIGN KEY (id_material) REFERENCES Materiales(id_material),
    FOREIGN KEY (id_impresora) REFERENCES Impresoras(id_impresora),
    FOREIGN KEY (id_tecnico) REFERENCES Tecnicos(id_tecnico)
);

-- Insertar registros en la tabla Clientes
INSERT INTO Clientes (nombre, email, telefono, direccion) 
VALUES 
('Carlos Pérez', 'carlos.perez@example.com', '555-1234', 'Av. Central 123'),
('María López', 'maria.lopez@example.com', '555-5678', 'Calle Mayor 456'),
('Juan Gómez', 'juan.gomez@example.com', '555-9876', 'Paseo de la Reforma 789');

-- Insertar registros en la tabla Pedidos
INSERT INTO Pedidos (id_cliente, fecha_pedido, estado_pedido, costo_total) 
VALUES 
(1, '2024-09-01', 'En proceso', 1500.00),
(2, '2024-09-02', 'Completado', 2000.00),
(3, '2024-09-03', 'Pendiente', 1200.00);

-- Insertar registros en la tabla Productos
INSERT INTO Productos (nombre_producto, descripcion, archivo_modelo, dimensiones, peso_estimado) 
VALUES 
('Producto A', 'Producto de prueba A', 'modelo_a.stl', '10x10x10 cm', 200.00),
('Producto B', 'Producto de prueba B', 'modelo_b.stl', '15x15x15 cm', 300.00),
('Producto C', 'Producto de prueba C', 'modelo_c.stl', '20x20x20 cm', 500.00);

-- Insertar registros en la tabla Materiales
INSERT INTO Materiales (nombre_material, color, precio_por_gramo, resistencia) 
VALUES 
('PLA', 'Rojo', 0.05, 'Alta'),
('ABS', 'Azul', 0.10, 'Media'),
('Nylon', 'Negro', 0.15, 'Baja');

-- Insertar registros en la tabla Impresoras
INSERT INTO Impresoras (modelo_impresora, tipo_impresora, estado_impresora) 
VALUES 
('Ender 3 V2', 'FDM', 'Operativa'),
('Prusa i3 MK3', 'FDM', 'Operativa'),
('Anycubic Photon', 'Resina', 'En mantenimiento');

-- Insertar registros en la tabla Técnicos
INSERT INTO Tecnicos (nombre_tecnico, email, especialidad) 
VALUES 
('Luis Torres', 'luis.torres@example.com', 'FDM'),
('Ana García', 'ana.garcia@example.com', 'Resina'),
('Pedro Martínez', 'pedro.martinez@example.com', 'SLS');

-- Insertar registros en la tabla DetallesPedido
INSERT INTO DetallesPedido (id_pedido, id_producto, id_material, id_impresora, id_tecnico, cantidad, peso_real) 
VALUES 
(1, 1, 1, 1, 1, 2, 400.00),
(2, 2, 2, 2, 2, 1, 300.00),
(3, 3, 3, 3, 3, 5, 2500.00);
