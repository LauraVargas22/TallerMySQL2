# Taller Funciones Definidas
Desarrollo de triggers y varias funciones definidas por el usuario (UDFs) en MySQL para resolver problemas comunes en bases de datos.

## Funciones Definidas:
- [Caso 1](funciones/caso1.sql): Función para evaluar la bonificación del empleado de acuerdo al sueldo.
- [Caso 2](funciones/caso2.sql): Función para calcular la edad del cliente de acuerdo a la fecha de nacimiento.
- [Caso 3](funciones/caso3.sql): Función para formatear el número de teléfono.
- [Caso 4](funciones/caso4.sql): Función para clasificar el precio del producto.

## Triggers:
- [Caso 1](triggers/caso1.sql): -- Trigger BEFORE INSERT para evitar ventas con cantidad mayor al stock disponible.
- [Caso 2](triggers/caso2.sql): -- Trigger BEFORE UPDATE que registre cualquier cambio en el salario.
- [Caso 3](triggers/caso3.sql): -- Trigger AFTER DELETE para registrar los clientes eliminados.
- [Caso 4](triggers/caso4.sql): -- Trigger BEFORE DELETE para evitar la eliminación de pedidos pendientes.