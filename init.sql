-- Crear la base de datos si no existe
CREATE DATABASE IF NOT EXISTS Concesionario;
USE Concesionario;

-- Tabla de vehiculos
CREATE TABLE IF NOT EXISTS vehiculos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    anio INT NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de clientes
CREATE TABLE IF NOT EXISTS clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefono VARCHAR(15),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP  -- Corregido: TIMESTAMP -> TIMESTAMP
);

-- Tabla de ventas
CREATE TABLE IF NOT EXISTS ventas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    vehiculo_id INT NOT NULL,
    cliente_id INT NOT NULL,
    fecha_venta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- Corregido: TIMESTAMP -> TIMESTAMP
    precio_venta DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (vehiculo_id) REFERENCES vehiculos(id),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- Insertar datos de ejemplo (opcional)
INSERT INTO vehiculos (marca, modelo, anio, precio) VALUES
('Toyota', 'Corolla', 2022, 25000.00),
('Ford', 'Mustang', 2021, 45000.00),
('Honda', 'Civic', 2023, 22000.00);

INSERT INTO clientes (nombre, email, telefono) VALUES
('Juan Pérez', 'juan@example.com', '123-456-7890'),
('Ana Gómez', 'ana@example.com', '987-654-3210');

INSERT INTO ventas (vehiculo_id, cliente_id, precio_venta) VALUES
(1, 1, 24500.00),
(2, 2, 44000.00);