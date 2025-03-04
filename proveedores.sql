CREATE DATABASE ProveedoresBD;
USE Proveedores;

CREATE TABLE Proveedores (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    fecha_registro DATE NOT NULL,
    nombre_razon_social VARCHAR(255) NOT NULL,
    cedula_identidad VARCHAR(20),
    cedula_juridica VARCHAR(20),
    domicilio_legal TEXT,
    email VARCHAR(255),
    telefono VARCHAR(20),
    fax VARCHAR(20),
    tipo_proveedor ENUM('Fabricante', 'Distribuidor', 'Representante') NOT NULL
);

CREATE TABLE Concesion_Credito (
    id_credito INT AUTO_INCREMENT PRIMARY KEY,
    id_proveedor INT,
    plazo_credito ENUM('8 días', '15 días', '30 días', 'Otro') NOT NULL,
    otro_plazo VARCHAR(50),
    FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id_proveedor) ON DELETE CASCADE
);

CREATE TABLE Productos_Servicios (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    id_proveedor INT,
    descripcion TEXT NOT NULL,
    FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id_proveedor) ON DELETE CASCADE
);

INSERT INTO Proveedores (fecha_registro, nombre_razon_social, cedula_identidad, cedula_juridica, domicilio_legal, email, telefono, fax, tipo_proveedor)
VALUES 
('2025-03-04', 'Tech Solutions S.A.', '12345678', 'J-12345678-9', 'Av. Principal 123, Nuevo Chimbote', 'contacto@techsolutions.com', '987654321', '043-123456', 'Fabricante'),
('2025-03-04', 'Distribuidora Global S.A.C.', '87654321', 'J-98765432-1', 'Calle Secundaria 456, Chimbote', 'ventas@distribuidoraglobal.com', '912345678', NULL, 'Distribuidor');

INSERT INTO Concesion_Credito (id_proveedor, plazo_credito, otro_plazo)
VALUES 
(1, '30 días', NULL),
(2, 'Otro', '45 días');

INSERT INTO Productos_Servicios (id_proveedor, descripcion)
VALUES 
(1, 'Servidores de alto rendimiento para data centers'),
(1, 'Licencias de software empresarial'),
(2, 'Suministros tecnológicos para oficinas'),
(2, 'Mantenimiento de equipos de cómputo');
