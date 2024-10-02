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
