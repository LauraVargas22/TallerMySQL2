--Calcular bonificación de acuerdo al salario
CREATE TABLE empleados (
id INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(50),
salario DECIMAL(10,2)
);
INSERT INTO empleados (nombre, salario) VALUES
('Juan Pérez', 1500.00),
('Ana Gómez', 3000.00),
('Carlos Ruiz', 6000.00);

DELIMITER //
CREATE FUNCTION calcular_bonificacion(salario DECIMAL(10,2)) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE bonificacion DECIMAL(10,2);
    IF salario < 2000 THEN
    SET bonificacion = salario * 0.1;
    ELSEIF salario > 2000 AND salario < 5000 THEN
    SET bonificacion = salario * 0.07;
    ELSE 
    SET bonificacion = salario * 0.05;
    END IF;
    RETURN bonificacion;
END //

DELIMITER;

SELECT calcular_bonificacion(5500);