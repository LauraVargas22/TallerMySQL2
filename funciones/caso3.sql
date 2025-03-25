--Dar formato (XXX) XXX-XXXX al número telefónico
DELIMITER //

CREATE FUNCTION formatear_telefono(numero VARCHAR(10)) RETURNS VARCHAR(14)
DETERMINISTIC
BEGIN
    RETURN CONCAT('(', LEFT(numero,3), ') ', MID(numero, 4,3), '-', RIGHT(numero,4));
END //

DELIMITER ;

SELECT formatear_telefono('3208121078');