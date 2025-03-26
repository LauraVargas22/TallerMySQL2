--1. Crear las tablas clientes y clientes_auditoria .
CREATE TABLE clientes (
id INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(50),
email VARCHAR(50)
);
CREATE TABLE clientes_auditoria (
id INT PRIMARY KEY AUTO_INCREMENT,
id_cliente INT,
nombre VARCHAR(50),
email VARCHAR(50),
fecha_eliminacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

--2. Implementar un trigger AFTER DELETE para registrar los clientes eliminados.
DELIMITER //
CREATE TRIGGER after_delete_cliente
AFTER DELETE ON clientes
FOR EACH ROW 
BEGIN
INSERT INTO clientes_auditoria (id_cliente, nombre, email) VALUES (OLD.id, OLD.nombre, OLD.email);
END //
DELIMITER ;

--Probar trigger
INSERT INTO clientes (nombre, email) VALUES ('Juan Perez', 'juanperez@gmail.com');
DELETE FROM clientes WHERE id = 1;
SELECT * FROM clientes_auditoria;

