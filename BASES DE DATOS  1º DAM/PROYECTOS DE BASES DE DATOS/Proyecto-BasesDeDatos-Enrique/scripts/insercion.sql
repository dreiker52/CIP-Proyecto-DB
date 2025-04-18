use carrentalx;

### INSERCIONES DE LOS VEHICULOS
INSERT INTO Vehiculos (idVehiculo, matricula, kilometraje, tipoVehiculo, estadoVehiculo, precioDiario) VALUES
(1, 'ABC1234', 45200, 'Sedán', 'disponible', 25.99),
(2, 'XYZ5678', 102300, 'SUV', 'alquilado', 29.50),
(3, 'DEF9012', 0, 'Compacto', 'reservado', 19.99),
(4, 'GHI3456', 58900, 'Familiar', 'mantenimiento', 27.00),
(5, 'JKL7890', 6996, 'Deportivo', 'disponible', 30.00),
(6, 'MNO2345', 72000, 'Furgoneta', 'disponible', 28.75),
(7, 'PQR6789', 31000, 'Sedán', 'reservado', 22.50),
(8, 'STU0123', 8800, 'Compacto', 'disponible', 14.99),
(9, 'VWX4567', 44500, 'SUV', 'alquilado', 26.25),
(10, 'YZA8901', 2, 'Furgoneta', 'mantenimiento', 23.90);


### INSERCIONES DE LOS CLIENTES
INSERT INTO Clientes (idCliente, nombreCliente, apellidoCliente, emailCliente, 
					  telefonoCliente, tipoIdentificadorCliente, identificadorCliente, licenciaConduccion) VALUES
(1, 'Laura', 'Martínez', 'laura.martinez@example.com', '612345678', 'dni', '12345678A', 'B1234567'),
(2, 'Carlos', 'Gómez', 'carlos.gomez@example.com', '623456789', 'dni', '23456789B', 'C2345678'),
(3, 'Emily', 'Smith', 'emily.smith@example.com', '734567890', 'pasaporte', 'X1234567', 'D3456789'),
(4, 'Miguel', 'Ruiz', 'miguel.ruiz@example.com', '645678901', 'dni', '45678901D', 'E4567890'),
(5, 'Hans', 'Schneider', 'hans.schneider@example.com', '512345678', 'pasaporte', 'Y2345678', 'F5678901'),
(6, 'Javier', 'López', 'javier.lopez@example.com', '667890123', 'dni', '67890123F', 'G6789012'),
(7, 'Patricia', 'Fernández', 'patricia.fernandez@example.com', '678901234', 'dni', '78901234G', 'H7890123'),
(8, 'Sergio', 'Morales', 'sergio.morales@example.com', '689012345', 'dni', '89012345H', 'I8901234'),
(9, 'Alice', 'Johnson', 'alice.johnson@example.com', '790123456', 'pasaporte', 'Z3456789', 'J9012345'),
(10, 'Daniel', 'Ortega', 'daniel.ortega@example.com', '601234567', 'dni', '01234567J', 'K0123456'),
(11, 'Sophie', 'Müller', 'sophie.mueller@example.com', '601234567', 'pasaporte', 'X7654321', 'L1123456'),
(12, 'David', 'Romero', 'david.romero@example.com', '621234567', 'dni', '21234567L', 'M2123456'),
(13, 'Liam', 'Taylor', 'liam.taylor@example.com', '760123456', 'pasaporte', 'Y5678901', 'N3123456'),
(14, 'Rubén', 'Molina', 'ruben.molina@example.com', '641234567', 'dni', '41234567N', 'O4123456'),
(15, 'Beatriz', 'Vargas', 'beatriz.vargas@example.com', '651234567', 'dni', '51234567O', 'P5123456'),
(16, 'Alberto', 'Nieto', 'alberto.nieto@example.com', '661234567', 'dni', '61234567P', 'Q6123456'),
(17, 'Natalie', 'Fischer', 'natalie.fischer@example.com', '711234567', 'pasaporte', 'Z9876543', 'R7123456'),
(18, 'Raúl', 'Delgado', 'raul.delgado@example.com', '681234567', 'dni', '81234567R', 'S8123456'),
(19, 'Sofía', 'León', 'sofia.leon@example.com', '691234567', 'dni', '91234567S', 'T9123456'),
(20, 'James', 'Brown', 'james.brown@example.com', '701234564', 'pasaporte', 'W1234987', 'U0132456');


### INSERCIONES DE RESERVAS
INSERT INTO Reservas (idReserva, fechaInicio, fechaFinal, estadoReserva, idCliente, idVehiculo) VALUES
(1, '2025-03-01 10:00:00', '2025-03-05 10:00:00', 'finalizada', 1, 3),
(2, '2025-03-10 09:30:00', '2025-03-15 09:30:00', 'finalizada', 2, 5),
(3, '2025-04-01 14:00:00', '2025-04-07 10:00:00', 'confirmada', 3, 2),
(4, '2025-04-08 08:00:00', '2025-04-12 10:00:00', 'tramitando', 4, 1),
(5, '2025-04-15 12:00:00', '2025-04-20 10:00:00', 'confirmada', 5, 7),
(6, '2025-03-20 16:00:00', '2025-03-22 10:00:00', 'cancelada', 6, 6),
(7, '2025-04-05 09:00:00', '2025-04-09 10:00:00', 'finalizada', 3, 4),
(8, '2025-04-10 13:00:00', '2025-04-13 10:00:00', 'confirmada', 7, 8),
(9, '2025-04-14 08:00:00', '2025-04-18 08:00:00', 'tramitando', 8, 9),
(10, '2025-04-16 11:00:00', '2025-04-21 11:00:00', 'confirmada', 9, 10),
(11, '2025-04-02 10:00:00', '2025-04-03 10:00:00', 'cancelada', 10, 1),
(12, '2025-04-04 10:00:00', '2025-04-06 10:00:00', 'finalizada', 1, 5),
(13, '2025-04-10 10:00:00', '2025-04-14 10:00:00', 'tramitando', 11, 6),
(14, '2025-04-17 08:00:00', '2025-04-22 10:00:00', 'confirmada', 12, 3),
(15, '2025-04-18 09:00:00', '2025-04-24 10:00:00', 'tramitando', 13, 2),
(16, '2025-04-20 08:00:00', '2025-04-25 10:00:00', 'confirmada', 2, 4),
(17, '2025-04-01 08:00:00', '2025-04-05 08:00:00', 'finalizada', 14, 7),
(18, '2025-04-05 08:00:00', '2025-04-08 08:00:00', 'finalizada', 14, 8),
(19, '2025-04-10 10:00:00', '2025-04-12 10:00:00', 'cancelada', 15, 9),
(20, '2025-04-15 08:00:00', '2025-04-20 08:00:00', 'confirmada', 16, 10);