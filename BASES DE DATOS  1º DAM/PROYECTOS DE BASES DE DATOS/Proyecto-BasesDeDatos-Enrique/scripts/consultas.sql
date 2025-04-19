### CONSULTA SIMPLE DE LAS DIFERENTES TABLAS
USE carrentalx;

SELECT * FROM sucursales;
SELECT * FROM empleados;
SELECT * FROM vehiculos;
SELECT * FROM clientes;
SELECT * FROM reservas;

### CONSULTAS CON FILTROS 
### Seleccionar la información de un cliente con un nombre concreto
SELECT * FROM clientes WHERE nombreCliente = "Alice";

### Seleccionar las sucursales cuyo telefono empiece con 922
SELECT idSucursal, nombreSucursal, telefonoSucursal FROM sucursales WHERE telefonoSucursal LIKE '922%';

### Seleccionar empleados cuyo nombre contenga una 'l'
SELECT idEmpleado, nombreEmpleado AS "EMPLEADO" FROM empleados WHERE nombreEmpleado LIKE '%l%';

### Seleccionar las reservas que han finalizado
SELECT idReserva, estadoReserva AS "ESTADO RESERVA" FROM reservas WHERE estadoReserva="finalizada";

### Seleccionar los vehiculos cuyo kilometraje esté entre 0 y 50.000KM y que se ordene de menor a mayor
SELECT idVehiculo, kilometraje FROM vehiculos WHERE kilometraje BETWEEN 0 AND 50000 ORDER BY kilometraje ASC;


### CONSULTAS CON FUNCIONES
### Calcular el costo diario de todos los vehiculos del sistema
SELECT SUM(precioDiario) AS TOTAL_DIARIO FROM vehiculos;

### Contar el número total de empleados que tenemos
SELECT COUNT(idEmpleado) AS TOTAL_EMPLEADOS FROM empleados;

### Calcular el número total de clientes que se han registrado con pasaporte
SELECT COUNT(tipoIdentificadorCliente) AS EXTRANJEROS FROM clientes WHERE tipoIdentificadorCliente = "pasaporte";

### Calcular la media de los precios de alquiler de los vehículos del sistema redondeado
SELECT ROUND(AVG(precioDiario)) AS MEDIA_PRECIO_DIARIO FROM vehiculos;

### Calcular cuantas reservas se han realizado para los vehiculos con id 10 y 1
SELECT COUNT(idVehiculo) AS RESERVAS_CONCRETAS from reservas WHERE idVehiculo = 10 OR idVehiculo = 1;

### Calcular el número de reservas que fueron realizadas despues del 2025-03-31 23:59:59
SELECT COUNT(fechaInicio) AS TOTAL_RESERVAS FROM Reservas WHERE fechaInicio > '2025-03-31 23:59:59';


### CONSULTAS CON JOIN
### Seleccionar el nombre y apellido de la persona que ha hecho cada reserva en orden ascendente
SELECT r.idReserva, c.nombreCliente, c.apellidoCliente FROM reservas r
INNER JOIN clientes c ON r.idCliente = c.idCliente ORDER BY idReserva ASC;

### Seleccionar el número total de reservas que ha realizado cada cliente
SELECT c.idCliente, c.nombreCliente, c.apellidoCliente, COUNT(r.idReserva) AS totalReservas
FROM clientes c 
LEFT JOIN reservas r ON c.idCliente = r.idCliente
GROUP BY c.idCliente, c.nombreCliente, c.apellidoCliente
ORDER BY totalReservas DESC;

### Seleccionar cuanto se ha gastado un cliente en total en días alquilados de una reserva
SELECT r.idReserva, v.idVehiculo, v.precioDiario,
    DATEDIFF(r.fechaFinal, r.fechaInicio) AS diasAlquiler,
    DATEDIFF(r.fechaFinal, r.fechaInicio) * v.precioDiario AS totalRecaudado
FROM reservas r
INNER JOIN vehiculos v ON r.idVehiculo = v.idVehiculo
WHERE r.idReserva = 1;


### CONSULTAS CON UPDATE
### Cambiar el tamaño admitido para los telefonos de los clientes a INT(20)
ALTER TABLE Clientes MODIFY COLUMN telefonoCliente INT(20);

### Cambiar el tipo de Vehiculo a uno más interesante
UPDATE Vehiculos SET tipoVehiculo = 'Máquina del Tiempo'
WHERE idVehiculo = 2;

SELECT * FROM vehiculos;

### Queremos añadir una nueva columna a las reservas ya que nos llegan clientes muy adinerados
ALTER TABLE reservas ADD COLUMN prioridad ENUM('Con Prioridad', 'Sin Prioridad') DEFAULT 'Sin Prioridad';
SELECT * FROM reservas;

ALTER TABLE reservas DROP COLUMN prioridad;

### Queremos añadir una nueva columna a los empleados para ver su salario anual
ALTER TABLE empleados ADD COLUMN salario DECIMAL(10,2) DEFAULT 0.99;
SELECT * FROM empleados;

ALTER TABLE empleados DROP COLUMN salario;

