### VISTAS

## Vista de clientes locales (usan dni) con reservas confirmadas
CREATE VIEW vista_locales_reserva_confirmada AS
SELECT
c.idCliente, c.nombreCliente, c.apellidoCliente, c.tipoIdentificadorCliente, c.identificadorCliente,
r.idReserva, r.estadoReserva, r.fechaInicio, r.fechaFinal
FROM clientes c
JOIN Reservas r ON c.idCliente = r.idCliente
WHERE c.tipoIdentificadorCliente = 'dni' AND r.estadoReserva = 'confirmada';

SELECT * FROM vista_locales_reserva_confirmada;


## Vista para ver a los empleados y de la sucursal en la que trabajan
CREATE VIEW vista_empleados_por_sucursal AS
SELECT
e.idEmpleado, e.nombreEmpleado, e.apellidoEmpleado, e.telefonoEmpleado, e.emailEmpleado, e.cargoEmpleado,
s.idSucursal, s.nombreSucursal, s.direccionSucursal
FROM Empleados e
JOIN Sucursales s ON e.idSucursal = s.idSucursal;

SELECT * FROM vista_empleados_por_sucursal;


## Vista para ver las reservas con el Sedán como vehículo solicitado
CREATE VIEW vista_reservas_sedan AS
SELECT 
r.idReserva, r.fechaInicio, r.fechaFinal, r.estadoReserva,
v.idVehiculo, v.tipoVehiculo, v.matricula
FROM reservas r
JOIN vehiculos v ON r.idVehiculo = v.idVehiculo
WHERE v.tipoVehiculo = 'sedán';

SELECT * FROM vista_reservas_sedan;


## Vista para ver a los cliente que han realizado un pago superior a 130.00€
CREATE VIEW vista_clientes_pago_superior_130 AS
SELECT
c.idCliente, c.nombreCliente, c.apellidoCliente, c.emailCliente,
p.idReserva, p.idPago, p.cantidadPago
FROM clientes c
JOIN reservas r ON c.idCliente = r.idCliente
JOIN pagos p ON r.idReserva = p.idReserva
WHERE p.cantidadPago > 130.00;

SELECT * FROM vista_clientes_pago_superior_130;


## Vista para ver los clientes con reservas de vehículos disponibles
CREATE VIEW vista_clientes_reservas_vehiculos_disponibles AS
SELECT
c.idCliente, c.nombreCliente, c.apellidoCliente,
r.idReserva, r.estadoReserva, r.fechaInicio,r.fechaFinal,
v.idVehiculo, v.tipoVehiculo, v.estadoVehiculo
FROM clientes c
JOIN reservas r ON c.idCliente = r.idCliente
JOIN vehiculos v ON r.idVehiculo = v.idVehiculo
WHERE v.estadoVehiculo = 'disponible';

SELECT * FROM vista_clientes_reservas_vehiculos_disponibles;


### TRIGGERS

DELIMITER $$

## Trigger para actualizar el estado del vehiculo de la reserva a disponible
CREATE TRIGGER trigger_actualizar_estado_vehiculo_disponible
AFTER UPDATE ON Reservas
FOR EACH ROW
BEGIN
  IF NEW.estadoReserva = 'finalizada' AND OLD.estadoReserva != 'finalizada' THEN
    UPDATE Vehiculos
    SET estadoVehiculo = 'disponible'
    WHERE idVehiculo = NEW.idVehiculo;
  END IF;
END $$


## Trigger para actualizar el estado del vehiculo de la reserva a alquilado
CREATE TRIGGER trigger_actualizar_estado_vehiculo_alquilado
AFTER UPDATE ON Reservas
FOR EACH ROW
BEGIN
  -- Solo actuamos si la reserva pasa a 'confirmada'
  IF NEW.estadoReserva = 'confirmada' AND OLD.estadoReserva != 'confirmada' THEN
    UPDATE Vehiculos
    SET estadoVehiculo = 'alquilado'
    WHERE idVehiculo = NEW.idVehiculo;
  END IF;
END $$


## Trigger para asignar automaticamente el salario correspondiente a los empleados de tenerife
CREATE TRIGGER trigger_salario_sucursal_tenerife
BEFORE INSERT ON Empleados
FOR EACH ROW
BEGIN
  IF NEW.idSucursal = 2 THEN
    SET NEW.salario = 33000.99;
  END IF;
END $$

DELIMITER ;

## Probar el nuevo trigger
INSERT INTO Empleados (idEmpleado, nombreEmpleado, apellidoEmpleado, telefonoEmpleado, emailEmpleado, cargoEmpleado, idSucursal)
VALUES (10, 'Ana', 'González', '666555444', 'ana.gonzalez@sucursal.com', 'Contable', 2);

