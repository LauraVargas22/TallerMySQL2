--1. Crear las tablas empleados y historial_salarios .

CREATE TABLE empleados (
id INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(50),
salario DECIMAL(10,2)
);
CREATE TABLE historial_salarios (
id INT PRIMARY KEY AUTO_INCREMENT,
id_empleado INT,
salario_anterior DECIMAL(10,2),
salario_nuevo DECIMAL(10,2),
fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (id_empleado) REFERENCES empleados(id)
);

--2. Implementar un trigger BEFORE UPDATE que registre cualquier cambio en el salario.
DELIMITER //
CREATE TRIGGER before_update_salario
BEFORE UPDATE ON empleados
FOR EACH ROW
BEGIN
INSERT INTO historial_salarios (id_empleado, salario_anterior, salario_nuevo) VALUES(OLD.id, OLD.salario, NEW.salario);

END //
DELIMITER ;

INSERT INTO empleados(nombre, salario) VALUES ('Isabella Galvis', 2400000);
UPDATE empleados SET salario = 2500000 WHERE id = 1;

SELECT * FROM historial_salarios;