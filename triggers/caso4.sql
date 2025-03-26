--Crear las tablas pedidos
CREATE TABLE pedidos (
id INT PRIMARY KEY AUTO_INCREMENT,
cliente VARCHAR(100),
estado ENUM('pendiente', 'completado')
);

--2. Implementar un trigger BEFORE DELETE para evitar la eliminación de pedidos pendientes.
DELIMITER //
CREATE TRIGGER after_delete_pedido
AFTER DELETE ON pedidos
FOR EACH ROW
BEGIN
IF OLD.estado = 'pendiente' THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se puede eliminar el pedido en estado "pendiente"';
END IF;
END //
DELIMITER ;

--Probar trigger
INSERT INTO pedidos (cliente, estado) VALUES ('Juan Perez', 'pendiente');
DELETE FROM pedidos WHERE id = 1;