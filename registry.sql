
/*! How to make this proyect */

--database_name: `grades`

/*! How to create table for this proyect */
 
CREATE TABLE `cotizacion` (
  `folio` int AUTO_INCREMENT PRIMARY KEY,
  `n_vendedor` varchar(70) NOT NULL,
  `n_producto` varchar(70) NOT NULL,
  `codigo_p` int(30) NOT NULL,
  `desc_p` varchar(300) NOT NULL,
  `cantidad` int(8) NOT NULL,
  `precio_uni` decimal(10,2) NOT NULL,
  `importe` decimal(10,2) AS (cantidad*precio_uni),
  `subtotal` decimal(10,8),
  `iva` decimal(10,2) AS (subtotal*0.16),
  `total_general` decimal(10,2) AS (subtotal+iva),
  `fecha` date,
  `unidad_de_medida` varchar(15),
  `marca` varchar(20),
  `imagen` BLOB,
  `moneda` ENUM('Pesos_mexicanos','Dollars'),
  `tipo_de_cambio` decimal(4,2)

);

ALTER TABLE cotizacion
ADD subtotal INTEGER;

UPDATE cotizacion
SET subtotal = (SELECT SUM(value) FROM cotizacion);


--Add content to said table, in order to register students and their grades accordingly. 


INSERT INTO `cotizacion` (`n_vendedor`,  `n_producto`, `codigo_p`, `desc_p`, 
  `cantidad`,`precio_uni`,`importe`,`subtotal`,`iva`,`total_general`,`fecha`,
  `unidad_de_medida`,`marca`,`imagen`,`moneda`,`tipo_de_cambio`) VALUES ('Idalid', 'Tinte', '01025', 
  'Tinte para cabello azul', '2', '100', '', '', '', '', '2023-05-29', 'ml', 'Manic Panic',
  '', 'Pesos_mexicanos', '17.5');

/*
  CREATE TABLE `cotizacion` (
  `folio` int AUTO_INCREMENT PRIMARY KEY,
  `n_vendedor` varchar(70) NOT NULL,
  `n_producto` varchar(70) NOT NULL,
  `codigo_p` int(30) NOT NULL,
  `desc_p` varchar(300) NOT NULL,
  `cantidad` int(8) NOT NULL,
  `precio_uni` decimal(10,2) NOT NULL,
  `importe` decimal(10,2) AS (cantidad*precio_uni),
  `fecha` date,
  `unidad_de_medida` varchar(15),
  `marca` varchar(20),
  `imagen` BLOB,
  `moneda` ENUM('Pesos_mexicanos','Dollars'),
  `tipo_de_cambio` decimal(4,2)

);

ALTER TABLE cotizacion
ADD subtotal INTEGER;

UPDATE cotizacion
SET subtotal = (SELECT SUM(importe) FROM cotizacion);

  `subtotal` decimal(10,8),
  `iva` decimal(10,2) AS (subtotal*0.16),
  `total_general` decimal(10,2) AS (subtotal+iva),

(*/