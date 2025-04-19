### AMPLIACIÓN DE LA BASE DE DATOS
use carrentalx;

### CREAR LA NUEVA TABLA DE PAGOS
CREATE TABLE pagos (
  idPago INT(10) NOT NULL AUTO_INCREMENT,
  idReserva INT(10) NOT NULL,
  fechaPago DATETIME NOT NULL,
  formaPago VARCHAR(45),         
  cantidadPago DECIMAL(10, 2) NOT NULL, 
  PRIMARY KEY (idPago),
  FOREIGN KEY (idReserva) REFERENCES reservas(idReserva)
);

### INSERCIONES DE LA NUEVA TABLA DE PAGOS
INSERT INTO pagos (idPago, idReserva, fechaPago, formaPago, cantidadPago) VALUES
(DEFAULT, 1, '2025-03-05 11:00:00', 'tarjeta', 100.00),
(DEFAULT, 2, '2025-03-15 10:30:00', 'transferencia', 125.00),
(DEFAULT, 3, '2025-04-07 12:00:00', 'efectivo', 140.00),
(DEFAULT, 5, '2025-04-20 09:45:00', 'sueños y esperanzas', 160.00),
(DEFAULT, 10, '2025-04-21 12:15:00', 'bizum', 180.00);

SELECT * FROM pagos;