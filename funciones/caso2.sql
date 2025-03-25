--Evaluar la edad de los clientes con su fecha de nacimiento
CREATE TABLE clientes (
id INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(50),
fecha_nacimiento DATE
);
INSERT INTO clientes (nombre, fecha_nacimiento) VALUES
('Luis Martínez', '1990-06-15'),
('María López', '1985-09-20'),
('Pedro Gómez', '2000-03-10');

DELIMITER //
CREATE FUNCTION calcular_edad(fecha_nacimiento DATE) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE edad INT;
    SET edad = YEAR(CURDATE()) - YEAR(fecha_nacimiento);

    RETURN edad;
END //

DELIMITER ;

SELECT calcular_edad('1990-06-15');