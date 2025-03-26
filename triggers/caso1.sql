-- Implementar un trigger BEFORE INSERT para evitar ventas con cantidad mayor al stock disponible.
CREATE TABLE productos (
id INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(50),
stock INT
);
CREATE TABLE ventas (
id INT PRIMARY KEY AUTO_INCREMENT,
id_producto INT,
cantidad INT,
FOREIGN KEY (id_producto) REFERENCES productos(id)
);

DELIMITER //

CREATE TRIGGER before_insert_stock
BEFORE INSERT ON ventas
FOR EACH ROW
BEGIN
IF NEW.cantidad > (SELECT stock FROM productos WHERE id = NEW.id_producto) THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No hay suficiente stock para realizar la venta';
END IF;
END //

DELIMITER ;

INSERT INTO productos (nombre, stock) VALUES ('Producto 1', 10);
INSERT INTO ventas (id_producto, cantidad) VALUES (1, 10);