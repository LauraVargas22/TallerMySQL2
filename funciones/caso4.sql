--Clasificar el precio del producto
CREATE TABLE IF NOT EXISTS productos(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(40),
    precio DECIMAL(10,2)
);
INSERT INTO productos (nombre, precio) VALUES('Tables Asus', 500), ('Laptop', 400.08), ('Microfono', 80);
DELIMITER //

CREATE FUNCTION clasificar_precio(id INT) RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
DECLARE clasificar VARCHAR(10);
DECLARE precio DECIMAL(10,2);

SELECT precio INTO precio
FROM productos
WHERE productos.id = id;

IF precio < 50 THEN
    SET clasificar = 'Bajo';
ELSEIF precio > 50 AND precio < 200 THEN
    SET clasificar = 'Medio';
ELSE 
    SET clasificar = 'Alto';
END IF;
RETURN clasificar;
END //

DELIMITER ;

SELECT clasificar_precio(2);