/*
 Navicat Premium Data Transfer

 Source Server         : magustec
 Source Server Type    : MySQL
 Source Server Version : 50565
 Source Host           : 165.227.187.1:3306
 Source Schema         : kanako

 Target Server Type    : MySQL
 Target Server Version : 50565
 File Encoding         : 65001

 Date: 25/01/2024 19:14:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for caja_chica
-- ----------------------------
DROP TABLE IF EXISTS `caja_chica`;
CREATE TABLE `caja_chica`  (
  `caja_chica_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_caja_empresa` int(11) NULL DEFAULT NULL,
  `hora` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `detalle` varchar(220) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tipo` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'f',
  `entrada` double(15, 2) NULL DEFAULT NULL,
  `salida` double(15, 2) NULL DEFAULT NULL,
  `metodo` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '1 = EFECTIVO 2 =TARJETAS 3 =TRANSFERENCIAS',
  PRIMARY KEY (`caja_chica_id`) USING BTREE,
  INDEX `id_caja_empresa`(`id_caja_empresa`) USING BTREE,
  CONSTRAINT `caja_chica_ibfk_1` FOREIGN KEY (`id_caja_empresa`) REFERENCES `caja_empresa` (`caja_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 120 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of caja_chica
-- ----------------------------
INSERT INTO `caja_chica` VALUES (116, 46, '10:09 AM', 'Apertura de caja', 'a', 500.00, 0.00, NULL);
INSERT INTO `caja_chica` VALUES (117, 46, '10:10 AM', 'pasaje esther', 'f', 0.00, 18.00, '1');
INSERT INTO `caja_chica` VALUES (118, 47, '05:34 PM', 'Apertura de caja', 'a', 20.00, 0.00, NULL);
INSERT INTO `caja_chica` VALUES (119, 47, '05:35 PM', 'pasaje de compra ', 'f', 0.00, 6.00, '1');

-- ----------------------------
-- Table structure for caja_empresa
-- ----------------------------
DROP TABLE IF EXISTS `caja_empresa`;
CREATE TABLE `caja_empresa`  (
  `caja_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` int(11) NULL DEFAULT NULL,
  `sucursal` int(11) NULL DEFAULT NULL,
  `detalle` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `fecha` date NULL DEFAULT NULL,
  `entrada` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `salida` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `estado` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '1',
  PRIMARY KEY (`caja_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of caja_empresa
-- ----------------------------
INSERT INTO `caja_empresa` VALUES (46, 12, 1, 'caja chica', '2023-12-16', '', '', '1');
INSERT INTO `caja_empresa` VALUES (47, 12, 1, 'pasajes ', '2023-12-20', '20', '6', '0');

-- ----------------------------
-- Table structure for cliente_venta
-- ----------------------------
DROP TABLE IF EXISTS `cliente_venta`;
CREATE TABLE `cliente_venta`  (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_cliente`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of cliente_venta
-- ----------------------------

-- ----------------------------
-- Table structure for clientes
-- ----------------------------
DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes`  (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `documento` varchar(11) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `datos` varchar(245) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `direccion` varchar(245) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `direccion2` varchar(220) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `telefono` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `telefono2` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `email` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  `ultima_venta` date NULL DEFAULT NULL,
  `total_venta` double(8, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id_cliente`) USING BTREE,
  INDEX `fk_clientes_empresas_idx`(`id_empresa`) USING BTREE,
  CONSTRAINT `fk_clientes_empresas` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 4667 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of clientes
-- ----------------------------
INSERT INTO `clientes` VALUES (4517, '42799312', 'MANUEL HIPOLITO AGUADO SIERRA', '', '', '', '', '', 12, '2023-08-28', 3383.62);
INSERT INTO `clientes` VALUES (4554, '10408695924', 'VALDEZ MORALES ALEXANDER', '-', '', '', '', '', 12, '2024-01-25', 12155.99);
INSERT INTO `clientes` VALUES (4555, '15610268878', 'BARRETO MUJICA GILBERTO JESUS', 'JR. EVARISTO SAN CRISTOBAL 1565 URB. EL PORVENIR INT. B209 LIMA-LIMA-LA VICTORIA', '', '914134003', '', '', 12, '2023-11-07', 4708.00);
INSERT INTO `clientes` VALUES (4556, '20610079581', 'IMPREGRAFIJOB S.A.C.', 'AV. UNIVERSITARIA SUR 1377 URB. OSCAR BENAVIDES LIMA-LIMA-LIMA', '', '988827235', '', '', 12, '2023-11-06', 440.00);
INSERT INTO `clientes` VALUES (4557, '10249994702', 'CANAL OSCCO NANCY', 'JR. JUNIN 102 URB. PUEBLO LIBRE COSTADO DE CREDISCOTIA APURIMAC-ABANCAY-ABANCAY', '', '941196500', '', '', 12, '2023-11-06', 320.00);
INSERT INTO `clientes` VALUES (4558, '10445913079', 'ROMERO MENDEZ JHONATAN', 'AV. ALFREDO BENAVIDES 5384 URB. LAS GARDENIAS ET. UNO INT. 161 LIMA-LIMA-SANTIAGO DE SURCO', '', '993291190', '', '', 12, '2024-01-04', 2682.50);
INSERT INTO `clientes` VALUES (4559, '20480731582', 'MASTER DIGITAL SERVICE EIRL.', 'AV. SALAVERRY 1883 ---- CERCADO 2DO.PISO,ALT. REST. FIESTAS X EL ESTADIO LAMBAYEQUE-CHICLAYO-CHICLAYO', '', '954642042', '', '', 12, '2024-01-20', 3065.00);
INSERT INTO `clientes` VALUES (4560, '20566397561', 'CORPORACION CASA CHINA S.A.C.', 'JR. JUNIN 1015 ---- BARR BARRIOS ALTOS LIMA-LIMA-LIMA', '', '947162095', '', '', 12, '2023-11-09', 1160.00);
INSERT INTO `clientes` VALUES (4561, '20555827424', 'MOSCOL S.A.C.', 'CAL. 7 MZA. H LOTE 05 URB. LAS VEGAS', '', '982656477', '', '', 12, '2023-11-13', 144.00);
INSERT INTO `clientes` VALUES (4562, '20606586079', 'ACB ESTUDIO INGENIERIA Y ARQUITECTURA S.A.C.', 'AV. REVOLUCION NRO S/N INT. 56 OTR. SECTOR 02 GRUPO 10', '', '992357440', '', '', 12, '2023-11-09', 480.00);
INSERT INTO `clientes` VALUES (4563, '10413720848', 'FLORES CAHUANA SERGIO FREDY', 'CAL. SAN IGNACIO DE LOYOLA 121 URB. SAN CESAR ET. UNO LIMALIMA-LA MOLINA', '', '941539179', '', '', 12, '2023-11-09', 400.00);
INSERT INTO `clientes` VALUES (4564, '10412751073', 'MORALES TICONA SILVIA MERCEDES', 'AV. BENAVIDES 5330 INT. 31 GALERIA SHOPPING CENTER LIMA-LIMA-SANTIAGO DE SURCO', '', '997197091', '', '', 12, '2023-11-16', 625.00);
INSERT INTO `clientes` VALUES (4565, '10103970844', 'RIVERA VELASQUEZ MARCO ANTONIO', '-	 AV. BENAVIDES 5330 URB. LAS GARDENIAS INT. 8 LIMA-LIMA-SANTIAGO DE SURCO', '', '987817777', '', '', 12, '2023-12-12', 4790.00);
INSERT INTO `clientes` VALUES (4566, '10405687947', 'FARFAN SILVA LIDIA', 'AV. BENAVIDES 5417 URB. LAS GARDENIAS INT. 03 LIMA-LIMA-SANTIAGO DE SURCO', '', '997405891', '', '', 12, '2023-11-10', 90.00);
INSERT INTO `clientes` VALUES (4567, '70924581', 'OSCAR EDUARDO GONZALES APON', '', '', '', '', '', 12, '2023-11-10', 160.00);
INSERT INTO `clientes` VALUES (4568, '10408981854', 'HUILLCA HUAMAN KATHY', 'AV. BENAVIDES 5330 TDA 43', '', '', '', '', 12, '2023-12-06', 1070.00);
INSERT INTO `clientes` VALUES (4569, '20604089566', 'PLOT & LASER SERVICIOS S.A.C', 'CAL. EL AMAUTA NRO 284 ', '', '', '', '', 12, '2023-12-12', 16835.50);
INSERT INTO `clientes` VALUES (4570, '10077045193', 'GONZALES ATOCHE OSCAR EDUARDO', 'AV LORETO 424---PIURA--CARCADO DE PIURA---PIURA', '', '', '', '', 12, '2023-12-09', 362.20);
INSERT INTO `clientes` VALUES (4571, '10104340429', 'RUIZ ROBLES JAKELINE ANITA', 'AV BENAVIDES 5330 STAND 23 AL COSTADO DEL MAC DONALD', '', '', '', '', 12, '2023-11-13', 120.00);
INSERT INTO `clientes` VALUES (4572, '10099348912', 'RUIZ ROBLES FLOR DE MARIA', ': AV. ALFREDO BENAVIDES 5330 URB. LAS GARDENIAS ET. UNO INT. 49', '', '', '', '', 12, '2024-01-18', 2890.00);
INSERT INTO `clientes` VALUES (4573, '10758508434', 'CACERES PICHARDE MARIA KIMBERLY', 'ICA', '', NULL, NULL, NULL, 12, NULL, NULL);
INSERT INTO `clientes` VALUES (4574, '10406149078', 'PALACIOS BADAJOS JENNY MARIA', 'AV. ALFREDO BENAVIDES 5330 URB. LAS GARDENIAS ET. UNO INT. 75 LIMA-LIMA-SANTIAGO DE SURCO', '', '', '', '', 12, '2024-01-10', 330.00);
INSERT INTO `clientes` VALUES (4575, '20609073251', 'ZAGA COPIADORAS Y PLOTTERS PERU SOCIEDAD COMERCIAL DE RESPONSABILIDAD LIMITADA', 'JR. CHAMAYA NRO 1258 URB. AZCONA ', '', '', '', '', 12, '2023-11-30', 3465.00);
INSERT INTO `clientes` VALUES (4576, '10461204711', 'FLORES CCAHUANA VIVIANA', 'AV CORONEL JUAN PASCAL PRING.1251 URB.PABLO BONER LA MOLINA', '', '', '', '', 12, '2023-11-14', 2091.00);
INSERT INTO `clientes` VALUES (4577, '20423925028', 'MODAS DIVERSAS DEL PERU SAC', 'AV. LURIGANCHO NRO 1349 URB. ZARATE ', '', NULL, NULL, NULL, 12, '2024-01-19', NULL);
INSERT INTO `clientes` VALUES (4578, '10413613847', 'ALFARO FLORES JOSE', 'AV VENAVIDES 5403  INT 01', '', '', '', '', 12, '2023-12-19', 320.00);
INSERT INTO `clientes` VALUES (4579, '10417854261', 'QUISPE HUACHO MARTIN JACOB', 'AV PROLONGACION PRIMAVERA 2261 URB MONTERRICO-UPC', '', '', '', '', 12, '2023-12-16', 2578.39);
INSERT INTO `clientes` VALUES (4580, '20601897246', 'MASTER COPY GRAFIC E.I.R.L.', 'AV. PRIMAVERA NRO 2359 URB. PARQUE PRIMAVERA ', '', '', '', '', 12, '2023-11-16', 407.67);
INSERT INTO `clientes` VALUES (4581, '20556947962', 'LEO GRAPHIC ARCHITECTURE Y DESIGN SAC', 'AV. PROLONGACION PRIMAVERA NRO 2349 ', '', '', '', '', 12, '2024-01-20', 1277.60);
INSERT INTO `clientes` VALUES (4582, '10464712491', 'PACHECO NEIRA LIZETH ALICIA', 'AV BENAVIDES 5388- STAND 131', '', '', '', '', 12, '2023-12-14', 2545.50);
INSERT INTO `clientes` VALUES (4583, '10033553591', 'APON PALACIOS SILENE BAMOY', 'PIURA', '', '', '', '', 12, '2023-11-18', 3941.60);
INSERT INTO `clientes` VALUES (4584, '10200164453', 'FLORES CAHUANA LUIS ALBERTO', 'AV. LA FONTANA 440 INT. 1087 LIMA-LIMA-LA MOLINA', '', '', '', '', 12, '2023-11-20', 1160.00);
INSERT INTO `clientes` VALUES (4585, '20473912962', 'COPIFEL E.I.R.L.', 'AV. AVIACION NRO 2438 URB. SAN BORJA NORTE ', '', '', '', '', 12, '2023-11-23', 540.00);
INSERT INTO `clientes` VALUES (4586, '10420078311', 'LEON BEDON MILAGROS KATHYUSCA', 'JR.ALBERTO GRIDILLA 467 HUARAZ', '', '', '', '', 12, '2023-12-16', 310.00);
INSERT INTO `clientes` VALUES (4587, '10036813062', 'TORRES RAMIREZ LUIS ENRIQUE', 'PIURA', '', '', '', '', 12, '2023-12-28', 4075.00);
INSERT INTO `clientes` VALUES (4588, '10096180671', 'MARCOS ORTEGA MARIA DEL PILAR', ' COMAS 15314', '', '', '', '', 12, '2023-12-16', 3044.00);
INSERT INTO `clientes` VALUES (4589, '20537189658', 'DISEÑO PLOTEO IMPRESIONES S.A.C', 'AV. ALFREDO BENAVIDES NRO 5384 INT. 164 URB. LAS GARDENIAS ET. UNO ', '', '', '', '', 12, '2024-01-03', 1200.00);
INSERT INTO `clientes` VALUES (4590, '20601598125', 'SERVICIOS YUVENI S.A.C.', 'MZA. L-6 LOTE 5 C.P. HUERTOS DE MANCHAY SECTOR ', '', '', '', '', 12, '2023-12-12', 9760.00);
INSERT INTO `clientes` VALUES (4591, '10769846773', 'VARGAS LOZANO JOSE ANDRES', 'Av. El Santuario 1616 sjl', '', NULL, NULL, NULL, 12, '2023-12-27', NULL);
INSERT INTO `clientes` VALUES (4592, '20601383765', 'CASA CROSS E.I.R.L.', 'CAL. PORTADA DEL SOL NRO 769 INT. 2 URB. AZCARRUNZ BAJO ', '', NULL, NULL, NULL, 12, NULL, NULL);
INSERT INTO `clientes` VALUES (4593, '20604444315', 'RENZO SOLUCIONES GRAFICAS S.A.C.', 'CAL. PORTA NRO 147 ', '', '', '', '', 12, '2023-11-23', 630.00);
INSERT INTO `clientes` VALUES (4594, '10081976193', 'QWISTGAARD FOSTER BLANCA', 'PIURA', '', '', '', '', 12, '2023-11-23', 859.50);
INSERT INTO `clientes` VALUES (4595, '10427599162', 'MENDOZA SOLIS EMILDA JUDITH', 'HUARAZ', '', '', '', '', 12, '2023-12-05', 2877.99);
INSERT INTO `clientes` VALUES (4596, 'SDXT68W', '', '', '', '', '', '', 12, '2023-11-23', 80.00);
INSERT INTO `clientes` VALUES (4597, '25768949', 'JULIO CESAR ALVAREZ GARCIA', '', '', '', '', '', 12, '2023-11-29', 2573.50);
INSERT INTO `clientes` VALUES (4598, '10415760847', 'RUIZ SONDOR DORIS YULICXA', 'CHICLAYO', '', '', '', '', 12, '2023-11-24', 240.00);
INSERT INTO `clientes` VALUES (4599, '20602279945', 'MYE SERVICIOS DIGITALES SOCIEDAD ANONIMA CERRADA - MESDI S.A.C.', 'AV. ALFREDO BENAVIDES NRO 5330 INT. 36 URB. LAS GARDENIAS ET. UNO ', '', '', '', '', 12, '2024-01-15', 1360.00);
INSERT INTO `clientes` VALUES (4600, '20553982759', 'PRINTEC CAD E.I.R.L.', 'AV. BENAVIDES NRO 5388 INT. 128 URB. LAS GARDENIAS ', '', '', '', '', 12, '2024-01-10', 360.00);
INSERT INTO `clientes` VALUES (4601, '20611556960', 'KANAKO PRINTCOPY S.A.C.', 'CAL. CALLE JOSE DIAZ NRO 258 DEP. 705 URB. URBANIZACIÓN SANTA BEATRI ', '', '', '', '', 12, '2023-11-28', 480.00);
INSERT INTO `clientes` VALUES (4602, '10431947876', 'ROQUE YDROGO ROSA ELVIRA', 'AV. ALFREDO BENAVIDES 5317 URB. LAS GARDENIAS ET. UNO INT. 3 LIMA-LIMA-SANTIAGO DE SURCO', '', '', '', '', 12, '2023-11-29', 170.00);
INSERT INTO `clientes` VALUES (4603, '20603641761', 'SIAR ARQUITECTOS E.I.R.L.', 'AV. ALFREDO BENAVIDES NRO 5330 INT. 13 URB. LAS GARDENIAS ET. UNO ', '', '', '', '', 12, '2023-11-29', 180.00);
INSERT INTO `clientes` VALUES (4604, '20601442648', 'IMPRENTA Y PUBLICIDAD ARIAN´NE S.A.C.', 'JR. BAUSATE Y MEZA MZA. L14 LOTE 25 URB. MRCAL CACERES ', '', '', '', '', 12, '2023-12-21', 2222.50);
INSERT INTO `clientes` VALUES (4605, '10484431341', 'HUAMANI PUQUIO MILAGROS', 'INT. 101, AV. ALFREDO BENAVIDES 5384, SANTIAGO DE SURCO 15039, PERú', '', '', '', '', 12, '2024-01-13', 170.00);
INSERT INTO `clientes` VALUES (4606, '10416124898', 'CALIXTRO CARRASCO KARLA ISABEL', '-', '', '', '', '', 12, '2023-11-30', 30.00);
INSERT INTO `clientes` VALUES (4607, '10724977818', 'PAITAN PAYTAN HUBBER JHON', '-', '', '', '', '', 12, '2023-11-30', 120.00);
INSERT INTO `clientes` VALUES (4608, '10448924772', 'RIVADENEIRA FLORES JAIRO', '', '', '', '', '', 12, '2023-11-30', 5216.74);
INSERT INTO `clientes` VALUES (4609, '10089206796', 'CARBAJAL TASAYCO MARGARITA MILAGROS', 'AV. REVOLUCION 19 VILLA EL SALVADOR', '', '', '', '', 12, '2023-12-02', 540.00);
INSERT INTO `clientes` VALUES (4610, '20600116275', 'INVERSIONES EDER E.I.R.L.', 'JR. MARISCAL AGUSTIN GAMARRA NRO 627 INT. K DEP. 202 URB. SAN PABLO ', '', '', '', '', 12, '2023-12-04', 2168.00);
INSERT INTO `clientes` VALUES (4611, '10406143614', 'REYNALDO VALLE GIOVANNA YRIS', '', '', '', '', '', 12, '2023-12-04', 205.00);
INSERT INTO `clientes` VALUES (4612, '10750780381', 'ATAJO CHUCTAYA ARNOL KEM', '-', '', '', '', '', 12, '2023-12-04', 250.00);
INSERT INTO `clientes` VALUES (4613, '10415822117', 'SALGADO LEZAMETA MICHAEL WINKLER', 'TDA. 315 - 316 GALERíA WILSON 1282', '', '', '', '', 12, '2023-12-04', 360.00);
INSERT INTO `clientes` VALUES (4614, '20608970577', 'CG ROMAN IMPORTACIONES E.I.R.L.', 'PJ. 4 MZA. J LOTE 6 A.H. SAN JOSE ', '', '', '', '', 12, '2023-12-04', 700.00);
INSERT INTO `clientes` VALUES (4615, '20604119627', 'LIENZO SOLUCIONES GRAFICAS S.A.C.', 'PRO. PRIMAVERA NRO 2345 ', '', '', '', '', 12, '2023-12-20', 3224.00);
INSERT INTO `clientes` VALUES (4616, '10754182780', 'LOPEZ MENESES ANDRE OMAR', '-', '', '', '', '', 12, '2023-12-05', 2145.00);
INSERT INTO `clientes` VALUES (4617, '20609941376', 'ROJAS & ROJAS SERVICIOS S.A.C.', 'CAL. EL AMAUTA NRO 284 URB. SAN JUAN BAUTISTA DE VILL ', '', '', '', '', 12, '2023-12-05', 2079.00);
INSERT INTO `clientes` VALUES (4618, '09955705', 'ALEX RICHARD NATIVIDAD SANDOVAL', '', '', '', '', '', 12, '2023-12-05', 500.00);
INSERT INTO `clientes` VALUES (4619, '10100218301', 'PINEDA CHAVEZ CHRISTIAN EINAR', '-', '', '', '', '', 12, '2024-01-25', 640.00);
INSERT INTO `clientes` VALUES (4620, '20603965338', 'PLOT ML S.R.L.', 'AV. ALFREDO BENAVIDES NRO 5330 ', '', '', '', '', 12, '2023-12-05', 90.00);
INSERT INTO `clientes` VALUES (4621, '10419928548', 'ORDEANO RIOS IVAN FERNANDO', '-', '', '', '', '', 12, '2023-12-05', 90.00);
INSERT INTO `clientes` VALUES (4622, '20605854002', 'GRUPO KENNY & MULTISERVICIOS S.A.C.', 'LOS CANARIOS NRO 152 INT. 101 URB. SAN CESAR II ETAPA ', '', '', '', '', 12, '2023-12-06', 421.10);
INSERT INTO `clientes` VALUES (4623, '20609286351', 'CORPORACION WEBER MAX S.A.C.', 'AV. ALFREDO MENDIOLA NRO 945 URB. PALAO ', '', '', '', '', 12, '2023-12-08', 2167.00);
INSERT INTO `clientes` VALUES (4624, '10076297423', 'BARTRA GOMEZ LUIS ALBERTO', '-', '', '', '', '', 12, '2023-12-08', 840.00);
INSERT INTO `clientes` VALUES (4625, '20550040132', 'PREDITEX S.A.C.', 'MZA. I LOTE 8 URB. 4TO PROGRAMA ', '', '', '', '', 12, '2023-12-11', 240.00);
INSERT INTO `clientes` VALUES (4626, '20608436376', 'POLOS & DISEÑOS E.I.R.L.', 'CAL. SEBASTIAN BARRANCA NRO 1670 INT. 227 URB. EL PORVENIR ', '', '', '', '', 12, '2023-12-12', 550.00);
INSERT INTO `clientes` VALUES (4627, '20601324971', 'SACRE INVERSIONES SOCIEDAD ANONIMA CERRADA - SACRE INVERSIONES S.A.C.', 'GRUPO 10 NRO F-4 SEC. 2 ', '', NULL, NULL, NULL, 12, '2023-12-20', NULL);
INSERT INTO `clientes` VALUES (4628, '10427997800', 'OJEDA ANTAHURCO MARIA ANGELA', '-', '', NULL, NULL, NULL, 12, '2023-12-20', NULL);
INSERT INTO `clientes` VALUES (4629, '20600851897', 'SEINAR CONSULTORES S.A.C.', 'CAL. GRANATE MZA. E LOTE 4 DEP. 301 URB. ASOCIACION DE VIVIENDA VI ', '', '', '', '', 12, '2023-12-20', 4379.40);
INSERT INTO `clientes` VALUES (4630, '20515512901', 'SOLUCIONES INFORMATICAS Y ASESORIA DE NEGOCIOS S.A.C.', 'AV. PROLONGACION PRIMAVERA NRO 2261 INT. 205 URB. LIMA POLO HUNT ', '', '', '', '', 12, '2023-12-23', 1110.00);
INSERT INTO `clientes` VALUES (4631, '20114035735', 'PUBLICIDAD GRAFICA MELENDEZ ABANTO EIRL', 'CAL. SIMON BOLIVAR NRO 1246 CENT JAEN ', '', '', '', '', 12, '2023-12-14', 420.00);
INSERT INTO `clientes` VALUES (4632, '20512779370', 'PERU PRINTEX CHAVEZ SOCIEDAD ANONIMA CERRADA', 'CAL. FELIPE BARGNA NRO 1084 URB. SAN LUIS ', '', '', '', '', 12, '2023-12-14', 240.00);
INSERT INTO `clientes` VALUES (4633, '', '', '', '', NULL, NULL, NULL, 12, NULL, NULL);
INSERT INTO `clientes` VALUES (4634, '10435697858', 'OSORIO CANTARO VICTOR NOEL', 'PIURA', '', '', '', '', 12, '2023-12-18', 560.00);
INSERT INTO `clientes` VALUES (4635, '20601553598', 'ESTAMPALO E.I.R.L.', 'AV. DE LOS HEROES NRO 188 INT. 225 URB. ENTEL ', '', '', '', '', 12, '2024-01-14', 690.00);
INSERT INTO `clientes` VALUES (4636, '45108803', 'LEDHER EVERT GUTIERREZ MENDOZA', '', '', '', '', '', 12, '2023-12-20', 80.00);
INSERT INTO `clientes` VALUES (4637, 'SDV5B47', '', '', '', '', '', '', 12, '2023-12-20', 80.00);
INSERT INTO `clientes` VALUES (4638, '10258533696', 'ROJAS QUISPE CHARLES ROBERT', '-', '', '', '', '', 12, '2023-12-22', 450.00);
INSERT INTO `clientes` VALUES (4639, '20513487020', 'DIMAFER REPRESENTACIONES Y PUBLICIDAD SOCIEDAD ANONIMA CERRADA - DIMAFER S.A.C', 'AV. LA MARINA NRO 862 ', '', '', '', '', 12, '2023-12-23', 150.00);
INSERT INTO `clientes` VALUES (4640, '10104210231', 'DELGADO PALOMINO ANGEL CLEMENTE', '-', '', '', '', '', 12, '2023-12-26', 2051.50);
INSERT INTO `clientes` VALUES (4641, '20609129442', 'SERGEL CONTRATISTAS S.A.C.', 'CAL. LAS CASUARINAS DE NARANJA MZA. A LOTE 4 RES. CALLE ', '', '', '', '', 12, '2023-12-27', 240.00);
INSERT INTO `clientes` VALUES (4642, '20522954757', 'INVERSIONES ROQUE S.A.C.', 'AV. AVIACION NRO 476 INT. 102 ', '', '', '', '', 12, '2023-12-27', 5035.50);
INSERT INTO `clientes` VALUES (4643, '10734835809', 'QUISPE BARRIENTOS MIRELLA LEIDY', 'GALERIA YUYI STAND 3127', '', '', '', '', 12, '2023-12-27', 5035.50);
INSERT INTO `clientes` VALUES (4644, '20100340438', 'REPRODATA S.A.C.', 'AV. REPÚBLICA DE PANAMA NRO 3517 INT. PI.8 URB. EL PALOMAR ', '', '', '', '', 12, '2023-12-28', 499.00);
INSERT INTO `clientes` VALUES (4645, '10722366803', 'REYES ORTEGA FRANKLIN ITALO', '.JR. SEBASTIáN BARRANCA 1673, LA VICTORIA 15018.. GALERíA:. VICELI.. PISO 3 .. N°301', '', '', '', '', 12, '2023-12-29', 120.00);
INSERT INTO `clientes` VALUES (4646, '20514215741', 'EMPRENDEDORA TEXTIL S.A.C.', 'JR. STA MONICA NRO 642 ', '', '', '', '', 12, '2024-01-03', 160.00);
INSERT INTO `clientes` VALUES (4647, '10070773169', 'CAHUANTICO OSTOS MANUEL', 'Calle Manuel del Pino 222, oficina 421, edificio point santa beatriz, lince,  altura de la 14 Av. Arequipa', '', NULL, NULL, NULL, 12, NULL, NULL);
INSERT INTO `clientes` VALUES (4648, '20606036605', 'TEXCROSS S.A.C.', 'CAL. PORTADA DEL SOL NRO 769 INT. 2 URB. AZCARRUNZ BAJO ', '', '', '', '', 12, '2024-01-06', 80.00);
INSERT INTO `clientes` VALUES (4649, '20608665928', 'JEKAOM S.A.C.', 'CAL. CENTENARIO NRO 1405 ', '', '', '', '', 12, '2024-01-08', 600.00);
INSERT INTO `clientes` VALUES (4650, '20536397397', 'MARCO CREATIVO SOCIEDAD ANONIMA CERRADA', 'CAL. ALBERTO PEREZ NRO 140 URB. SAN ROQUE ', '', '', '', '', 12, '2024-01-09', 381.00);
INSERT INTO `clientes` VALUES (4651, '10457595480', 'FLORES TAZE GUILLERMO CRISTIAN JARED', '-', '', '', '', '', 12, '2024-01-09', 80.00);
INSERT INTO `clientes` VALUES (4652, '10062562451', 'FLORES QUISPE MIGUEL FLORENCIO', 'EL AGUSTINO', '', '', '', '', 12, '2024-01-09', 350.00);
INSERT INTO `clientes` VALUES (4653, '20571184312', 'LIBRERIA E IMPRENTA LUNA SERVICE S.A.C.', 'AV. MARISCAL AGUSTIN GAMARRA NRO 613 URB. SAN FRANCISCO ', '', '', '', '', 12, '2024-01-10', 510.00);
INSERT INTO `clientes` VALUES (4654, '20100131359', 'DATACONT S.A.C.', 'AV. REPUBLICA DE PANAMA NRO 3517 INT. 9 URB. EL PALOMAR ', '', '', '', '', 12, '2024-01-11', 499.00);
INSERT INTO `clientes` VALUES (4655, '20100047056', 'TOPY TOP S A', 'AV. SANTUARIO NRO 1323 URB. ZARATE ', '', '', '', '', 12, '2024-01-15', 240.01);
INSERT INTO `clientes` VALUES (4656, '10406174056', 'FLORES CAHUANA FERNANDO', '-', '', '', '', '', 12, '2024-01-25', 1180.00);
INSERT INTO `clientes` VALUES (4657, '20514488470', 'CONSTRUCTORA SIGUAYRO PEÑA SOCIEDAD ANONIMA CERRADA', 'AV. CESAR CANEVARO MZA. M LOTE 16 ASC. TREBOL AZUL ', '', '', '', '', 12, '2024-01-17', 2650.00);
INSERT INTO `clientes` VALUES (4658, '10327798303', 'VASQUEZ VIERA JULIA MARGINA', '-', '', '', '', '', 12, '2024-01-18', 125.00);
INSERT INTO `clientes` VALUES (4659, '20521018322', 'COPY DATA E.I.R.L.', 'AV. BENAVIDES NRO 5330 INT. 62A URB. LAS GARDENIAS ', '', '', '', '', 12, '2024-01-18', 570.00);
INSERT INTO `clientes` VALUES (4660, '75240183', 'DEIVIS DAVID CORNELIO ZEVALLOS', '', '', '', '', '', 12, '2024-01-18', 77.00);
INSERT INTO `clientes` VALUES (4661, '20600648668', 'PLOTTER PERU S.A.C.', 'AV. CAMINOS DEL INCA NRO 2929 URB. PROLONGACION BENAVIDES ET ', '', '', '', '', 12, '2024-01-20', 120.00);
INSERT INTO `clientes` VALUES (4662, '20600071077', 'CONTRATISTAS GENERALES VIRGEN DE COCHARCAS PERU S.R.L.', 'AV. CIRCUNVALACIÓN DEL CLUB G NRO 202 DEP. 902 URB. CLUB DE GOLF LOS INCAS ', '', '', '', '', 12, '2024-01-22', 90.00);
INSERT INTO `clientes` VALUES (4663, '20610368418', 'CONSORCIO SUPERVISOR SAGARO', 'CAL. SCHELL NRO 343 INT. 604 ', '', '', '', '', 12, '2024-01-22', 180.00);
INSERT INTO `clientes` VALUES (4664, '20600881371', 'A & S INGENIERIA Y PROYECTOS S.A.C.', 'AV. GENERAL EUGENIO GARZON NRO 1283 INT. 807 FND. OYAGUE ', '', NULL, NULL, NULL, 12, NULL, NULL);
INSERT INTO `clientes` VALUES (4665, '10469322497', 'HUAROC CAMPOS LEONEL', '-', '', '', '', '', 12, '2024-01-25', 160.00);
INSERT INTO `clientes` VALUES (4666, '20602607012', 'AGROINDUSTRIA TAMBOPATA S.A.C.', 'JR. SINCHI ROCA MZA. 17H LOTE 01 ', '', '', '', '', 12, '2024-01-25', 670.00);

-- ----------------------------
-- Table structure for compras
-- ----------------------------
DROP TABLE IF EXISTS `compras`;
CREATE TABLE `compras`  (
  `id_compra` int(11) NOT NULL AUTO_INCREMENT,
  `id_tido` int(11) NULL DEFAULT NULL,
  `id_tipo_pago` int(11) NULL DEFAULT NULL,
  `id_proveedor` int(11) NULL DEFAULT NULL,
  `fecha_emision` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fecha_vencimiento` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `dias_pagos` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `direccion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `serie` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `numero` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `id_empresa` int(11) NULL DEFAULT NULL,
  `moneda` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sucursal` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_compra`) USING BTREE,
  INDEX `id_empresa`(`id_empresa`) USING BTREE,
  INDEX `id_tipo_pago`(`id_tipo_pago`) USING BTREE,
  INDEX `id_tido`(`id_tido`) USING BTREE,
  INDEX `id_proveedor`(`id_proveedor`) USING BTREE,
  CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`id_tipo_pago`) REFERENCES `tipo_pago` (`tipo_pago_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `compras_ibfk_3` FOREIGN KEY (`id_tido`) REFERENCES `documentos_sunat` (`id_tido`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `compras_ibfk_4` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`proveedor_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 233 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of compras
-- ----------------------------

-- ----------------------------
-- Table structure for cotizaciones
-- ----------------------------
DROP TABLE IF EXISTS `cotizaciones`;
CREATE TABLE `cotizaciones`  (
  `cotizacion_id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) NULL DEFAULT NULL,
  `id_tido` int(11) NOT NULL,
  `id_tipo_pago` int(11) NULL DEFAULT NULL,
  `fecha` date NULL DEFAULT NULL,
  `dias_pagos` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `direccion` varchar(220) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `id_cliente` int(11) NOT NULL,
  `total` double(10, 2) NULL DEFAULT NULL,
  `estado` char(1) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  `sucursal` int(11) NULL DEFAULT NULL,
  `usar_precio` int(11) NULL DEFAULT NULL,
  `moneda` int(11) NULL DEFAULT 1,
  `cm_tc` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cotizacion_id`) USING BTREE,
  INDEX `id_tido`(`id_tido`) USING BTREE,
  INDEX `id_tipo_pago`(`id_tipo_pago`) USING BTREE,
  INDEX `id_cliente`(`id_cliente`) USING BTREE,
  CONSTRAINT `cotizaciones_ibfk_1` FOREIGN KEY (`id_tido`) REFERENCES `documentos_sunat` (`id_tido`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `cotizaciones_ibfk_2` FOREIGN KEY (`id_tipo_pago`) REFERENCES `tipo_pago` (`tipo_pago_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `cotizaciones_ibfk_3` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 854 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of cotizaciones
-- ----------------------------
INSERT INTO `cotizaciones` VALUES (815, 1, 2, 1, '2023-11-08', '', '1', 4560, 440.00, '0', 12, 1, 1, 1, '');
INSERT INTO `cotizaciones` VALUES (816, 2, 2, 1, '2023-11-14', '', '1', 4573, 3690.00, '0', 12, 1, 1, 2, '');
INSERT INTO `cotizaciones` VALUES (817, 3, 2, 1, '2023-11-14', '', '1', 4573, 6190.00, '0', 12, 1, 5, 2, '');
INSERT INTO `cotizaciones` VALUES (818, 4, 2, 1, '2023-11-16', '', '1', 4577, 1976.00, '0', 12, 1, 5, 2, '3.8');
INSERT INTO `cotizaciones` VALUES (819, 1, 1, 1, '2023-11-16', '', '1', 4517, 40.00, '0', 13, 1, 5, 1, '3.80');
INSERT INTO `cotizaciones` VALUES (820, 5, 2, 1, '2023-11-16', '', '1', 4577, 30.00, '0', 12, 1, 5, 2, '');
INSERT INTO `cotizaciones` VALUES (821, 6, 2, 1, '2023-11-21', '', '1', 4590, 120.00, '0', 12, 1, 5, 1, '');
INSERT INTO `cotizaciones` VALUES (822, 7, 2, 1, '2023-11-21', '', '1', 4591, 2750.00, '0', 12, 1, 5, 2, '1');
INSERT INTO `cotizaciones` VALUES (823, 8, 2, 1, '2023-11-21', '', '1', 4592, 240.00, '0', 12, 1, 5, 1, '');
INSERT INTO `cotizaciones` VALUES (824, 9, 2, 1, '2023-11-24', '', '1', 4577, 280.00, '0', 12, 1, 5, 1, '');
INSERT INTO `cotizaciones` VALUES (825, 10, 2, 1, '2023-11-24', '', '1', 4577, 250.00, '0', 12, 1, 5, 1, '');
INSERT INTO `cotizaciones` VALUES (826, 11, 2, 1, '2023-11-24', '', '1', 4558, 260.00, '1', 12, 1, 5, 1, '');
INSERT INTO `cotizaciones` VALUES (827, 12, 2, 1, '2023-12-13', '', '1', 4627, 550.00, '0', 12, 1, 5, 2, '1');
INSERT INTO `cotizaciones` VALUES (828, 13, 2, 1, '2023-12-13', '', '1', 4628, 2000.00, '0', 12, 1, 3, 2, '1');
INSERT INTO `cotizaciones` VALUES (829, 14, 2, 1, '2023-12-15', '', '1', 4590, 120.00, '0', 12, 1, 5, 2, '1');
INSERT INTO `cotizaciones` VALUES (830, 15, 1, 1, '2023-12-15', '', '1', 4633, 180.00, '0', 12, 1, 1, 1, '');
INSERT INTO `cotizaciones` VALUES (831, 16, 2, 1, '2023-12-15', '', '1', 4577, 338.95, '0', 12, 1, 1, 1, '');
INSERT INTO `cotizaciones` VALUES (832, 17, 2, 1, '2023-12-16', '', '1', 4603, 2887.50, '0', 12, 1, 3, 2, '');
INSERT INTO `cotizaciones` VALUES (833, 18, 2, 1, '2023-12-16', '', '1', 4603, 2887.50, '0', 12, 1, 3, 2, '1');
INSERT INTO `cotizaciones` VALUES (834, 19, 2, 1, '2023-12-16', '', '1', 4603, 10943.62, '0', 12, 1, 5, 1, '');
INSERT INTO `cotizaciones` VALUES (835, 20, 2, 1, '2023-12-19', '', '1', 4577, 145.00, '0', 12, 1, 5, 1, '');
INSERT INTO `cotizaciones` VALUES (836, 21, 1, 1, '2023-12-20', '', '1', 4633, 381.00, '0', 12, 1, 3, 2, '');
INSERT INTO `cotizaciones` VALUES (837, 22, 1, 1, '2023-12-20', '', '1', 4633, 381.00, '1', 12, 1, 3, 2, '1');
INSERT INTO `cotizaciones` VALUES (838, 23, 2, 1, '2024-01-03', '', '1', 4554, 160.00, '0', 12, 1, 5, 1, '');
INSERT INTO `cotizaciones` VALUES (839, 24, 2, 1, '2024-01-05', '', '1', 4647, 570.00, '0', 12, 1, 1, 2, '1');
INSERT INTO `cotizaciones` VALUES (840, 25, 2, 1, '2024-01-05', '', '1', 4647, 2137.50, '0', 12, 1, 5, 1, '');
INSERT INTO `cotizaciones` VALUES (841, 26, 1, 1, '2024-01-08', '', '1', 4633, 570.00, '0', 12, 1, 1, 2, '1');
INSERT INTO `cotizaciones` VALUES (842, 27, 1, 1, '2024-01-08', '', '1', 4633, 550.00, '0', 12, 1, 5, 2, '1');
INSERT INTO `cotizaciones` VALUES (843, 28, 1, 1, '2024-01-08', '', '1', 4633, 0.00, '0', 12, 1, 1, 1, '');
INSERT INTO `cotizaciones` VALUES (844, 29, 2, 1, '2024-01-09', '', '1', 4600, 580.00, '0', 12, 1, 5, 2, '');
INSERT INTO `cotizaciones` VALUES (845, 30, 2, 1, '2024-01-09', '', '1', 4600, 580.00, '0', 12, 1, 5, 2, '1');
INSERT INTO `cotizaciones` VALUES (846, 31, 2, 1, '2024-01-12', '', '1', 4577, 580.00, '0', 12, 1, 5, 1, '');
INSERT INTO `cotizaciones` VALUES (847, 32, 1, 1, '2024-01-14', '', '1', 4633, 592.00, '0', 12, 1, 5, 2, '1');
INSERT INTO `cotizaciones` VALUES (848, 33, 2, 1, '2024-01-15', '', '1', 4655, 180.00, '0', 12, 1, 5, 2, '');
INSERT INTO `cotizaciones` VALUES (849, 34, 2, 1, '2024-01-15', '', '1', 4655, 180.00, '0', 12, 1, 5, 2, '1');
INSERT INTO `cotizaciones` VALUES (850, 35, 2, 1, '2024-01-15', '', '1', 4577, 420.00, '0', 12, 1, 5, 1, '');
INSERT INTO `cotizaciones` VALUES (851, 36, 2, 1, '2024-01-18', '', '1', 4590, 2379.00, '0', 12, 1, 5, 1, '');
INSERT INTO `cotizaciones` VALUES (852, 37, 2, 1, '2024-01-25', '', '1', 4664, 3800.00, '0', 12, 1, 5, 2, '1');
INSERT INTO `cotizaciones` VALUES (853, 38, 2, 1, '2024-01-25', '', '1', 4662, 550.00, '0', 12, 1, 5, 2, '1');

-- ----------------------------
-- Table structure for cuotas_cotizacion
-- ----------------------------
DROP TABLE IF EXISTS `cuotas_cotizacion`;
CREATE TABLE `cuotas_cotizacion`  (
  `cuota_coti_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_coti` int(11) NULL DEFAULT NULL,
  `monto` double(10, 3) NULL DEFAULT NULL,
  `fecha` date NULL DEFAULT NULL,
  `estado` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '0',
  PRIMARY KEY (`cuota_coti_id`) USING BTREE,
  INDEX `id_coti`(`id_coti`) USING BTREE,
  CONSTRAINT `cuotas_cotizacion_ibfk_1` FOREIGN KEY (`id_coti`) REFERENCES `cotizaciones` (`cotizacion_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of cuotas_cotizacion
-- ----------------------------

-- ----------------------------
-- Table structure for dias_compras
-- ----------------------------
DROP TABLE IF EXISTS `dias_compras`;
CREATE TABLE `dias_compras`  (
  `dias_compra_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_compra` int(11) NULL DEFAULT NULL,
  `monto` double(10, 3) NULL DEFAULT NULL,
  `fecha` date NULL DEFAULT NULL,
  `estado` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`dias_compra_id`) USING BTREE,
  INDEX `id_compra`(`id_compra`) USING BTREE,
  CONSTRAINT `dias_compras_ibfk_1` FOREIGN KEY (`id_compra`) REFERENCES `compras` (`id_compra`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of dias_compras
-- ----------------------------

-- ----------------------------
-- Table structure for dias_ventas
-- ----------------------------
DROP TABLE IF EXISTS `dias_ventas`;
CREATE TABLE `dias_ventas`  (
  `dias_venta_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_venta` int(11) NULL DEFAULT NULL,
  `monto` double(10, 3) NULL DEFAULT NULL,
  `fecha` date NULL DEFAULT NULL,
  `estado` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '0',
  PRIMARY KEY (`dias_venta_id`) USING BTREE,
  INDEX `id_venta`(`id_venta`) USING BTREE,
  CONSTRAINT `dias_ventas_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of dias_ventas
-- ----------------------------
INSERT INTO `dias_ventas` VALUES (3, 6369, 40.000, '2023-12-06', '0');
INSERT INTO `dias_ventas` VALUES (4, 6530, 120.000, '2024-01-30', '0');
INSERT INTO `dias_ventas` VALUES (5, 6531, 120.010, '2024-01-30', '0');
INSERT INTO `dias_ventas` VALUES (6, 6534, 579.990, '2024-01-30', '0');
INSERT INTO `dias_ventas` VALUES (7, 6535, 579.990, '2024-01-31', '0');
INSERT INTO `dias_ventas` VALUES (8, 6543, 420.000, '2024-02-02', '0');
INSERT INTO `dias_ventas` VALUES (9, 6544, 480.000, '2024-02-02', '0');
INSERT INTO `dias_ventas` VALUES (11, 6545, 419.990, '2024-02-03', '0');

-- ----------------------------
-- Table structure for documentos_empresas
-- ----------------------------
DROP TABLE IF EXISTS `documentos_empresas`;
CREATE TABLE `documentos_empresas`  (
  `id_empresa` int(11) NOT NULL,
  `id_tido` int(11) NOT NULL,
  `sucursal` int(11) NULL DEFAULT NULL,
  `serie` varchar(4) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `numero` int(6) NULL DEFAULT NULL,
  INDEX `fk_empresas_has_documentos_sunat_documentos_sunat1_idx`(`id_tido`) USING BTREE,
  INDEX `fk_empresas_has_documentos_sunat_empresas1_idx`(`id_empresa`) USING BTREE,
  CONSTRAINT `fk_empresas_has_documentos_sunat_documentos_sunat1` FOREIGN KEY (`id_tido`) REFERENCES `documentos_sunat` (`id_tido`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_empresas_has_documentos_sunat_empresas1` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of documentos_empresas
-- ----------------------------
INSERT INTO `documentos_empresas` VALUES (12, 1, 1, 'B001', 2);
INSERT INTO `documentos_empresas` VALUES (12, 2, 1, 'F001', 223);
INSERT INTO `documentos_empresas` VALUES (12, 3, 1, '0001', 1);
INSERT INTO `documentos_empresas` VALUES (12, 4, 1, 'F001', 1);
INSERT INTO `documentos_empresas` VALUES (12, 6, 1, 'NV01', 73);
INSERT INTO `documentos_empresas` VALUES (12, 11, 1, 'T001', 1);

-- ----------------------------
-- Table structure for documentos_sunat
-- ----------------------------
DROP TABLE IF EXISTS `documentos_sunat`;
CREATE TABLE `documentos_sunat`  (
  `id_tido` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `cod_sunat` varchar(2) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `abreviatura` varchar(3) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_tido`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of documentos_sunat
-- ----------------------------
INSERT INTO `documentos_sunat` VALUES (1, 'BOLETA DE VENTA', '03', 'BT');
INSERT INTO `documentos_sunat` VALUES (2, 'FACTURA', '01', 'FT');
INSERT INTO `documentos_sunat` VALUES (3, 'NOTA DE CREDITO', '07', 'NC');
INSERT INTO `documentos_sunat` VALUES (4, 'NOTA DE DEBITO', '08', 'ND');
INSERT INTO `documentos_sunat` VALUES (5, 'NOTA DE RECEPCION', '09', 'GR');
INSERT INTO `documentos_sunat` VALUES (6, 'NOTA DE VENTA', '00', 'NV');
INSERT INTO `documentos_sunat` VALUES (7, 'NOTA DE SEPARACION', '00', 'NS');
INSERT INTO `documentos_sunat` VALUES (8, 'NOTA DE TRASLADO', '00', 'NT');
INSERT INTO `documentos_sunat` VALUES (9, 'NOTA DE INVENTARIO', '00', 'NIV');
INSERT INTO `documentos_sunat` VALUES (10, 'NOTA DE INGRESO', '00', 'NIG');
INSERT INTO `documentos_sunat` VALUES (11, 'GUIA DE REMISION', '09', 'GR');
INSERT INTO `documentos_sunat` VALUES (12, 'NOTA DE COMPRA', '00', NULL);

-- ----------------------------
-- Table structure for empresas
-- ----------------------------
DROP TABLE IF EXISTS `empresas`;
CREATE TABLE `empresas`  (
  `id_empresa` int(11) NOT NULL AUTO_INCREMENT,
  `ruc` varchar(11) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `razon_social` varchar(245) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `comercial` varchar(245) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `cod_sucursal` varchar(4) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `direccion` varchar(245) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `email` varchar(145) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `telefono` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `estado` char(1) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `password` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `user_sol` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `clave_sol` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `logo` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `ubigeo` varchar(6) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `distrito` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `provincia` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `departamento` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `tipo_impresion` char(1) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `modo` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `igv` double(10, 2) NULL DEFAULT 0.18,
  `propaganda` varchar(250) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `telefono2` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `telefono3` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_empresa`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of empresas
-- ----------------------------
INSERT INTO `empresas` VALUES (12, '20611556960', 'KANAKO PRINTCOPY S.A.C.', 'KANAKO PRINTCOPY ', NULL, 'CAL. CALLE JOSE DIAZ NRO. 258 DPTO. 705 URB. URBANIZACION', 'ventas@kanakoprintcopy.com', '906007538', '1', NULL, 'MANUELSI', 'Sporade500', 'nUmdN40McVy2i1IZUthiXjhcyOSra7IEmu3sDwf3ZBcixKbYwQjxwR4KpF09xyaWsSxUWAtSQH4AXhc0.png', '150101', 'LIMA', 'LIMA', 'LIMA', NULL, 'production', 0.18, '', NULL, NULL);
INSERT INTO `empresas` VALUES (13, '10296471948', 'DE LA CRUZ COSI ENRIQUE', 'DE LA CRUZ COSI ENRIQUE', NULL, 'Calle San Juan De Dios 107 - Of. 1-B', 'ivonne.impresiones2@gmail.com', '962299094', '1', NULL, '', '', 'eMfpv2cukTd9RDhkkg957p7g6nUQhb6fwV6jkzbvMZafW2mQKT0PaDpN3VP4DxaVvF0xJE3CpXTLxolM.png', '040101', 'Arequipa', 'Arequipa', 'Arequipa', NULL, 'beta', 0.18, NULL, NULL, NULL);
INSERT INTO `empresas` VALUES (16, '10404530891', 'ARNICA MAMANI ALICIA MERY', 'ARNICA MAMANI ALICIA MERY', NULL, 'CAL. ESPERANZA NRO. S/N', 'aliciaarnica5@gmail.com', '', '1', NULL, '', '', '', '180208', 'Puquina', 'GENERAL SANCHEZ CERRO', 'MOQUEGUA', NULL, 'beta', 0.18, 'nueva propaasd', NULL, NULL);
INSERT INTO `empresas` VALUES (18, '20608579193', 'TRANSMUL MAXSAJ S.R.L.', 'TRANSMUL MAXSAJ S.R.L.', NULL, 'MZA. E LOTE 9 APV. AUGUSTO CHAVEZ BEDOYA', 'transmullutita@hotmail.com', '', '1', NULL, '', '', '', '040104', 'CERRO COLORADO', 'AREQUIPA', 'AREQUIPA', NULL, 'beta', 0.18, NULL, NULL, NULL);
INSERT INTO `empresas` VALUES (34, '10329257571', 'RAMOS ZAVALETA MARCO ROLANDO', 'RAMOS ZAVALETA MARCO ROLANDO', NULL, 'a', 'asd@asd.com', '1', '1', NULL, '', '', '', 'a', 'a', 'a', 'a', NULL, 'beta', 0.18, 'asd', '2', '3');

-- ----------------------------
-- Table structure for guia_detalles
-- ----------------------------
DROP TABLE IF EXISTS `guia_detalles`;
CREATE TABLE `guia_detalles`  (
  `guia_detalle_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_guia` int(11) NULL DEFAULT NULL,
  `id_producto` int(11) NULL DEFAULT NULL,
  `detalles` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `unidad` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `cantidad` int(11) NULL DEFAULT NULL,
  `precio` double(20, 5) NULL DEFAULT NULL,
  PRIMARY KEY (`guia_detalle_id`) USING BTREE,
  INDEX `id_guia`(`id_guia`) USING BTREE,
  CONSTRAINT `guia_detalles_ibfk_1` FOREIGN KEY (`id_guia`) REFERENCES `guia_remision` (`id_guia_remision`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2549 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of guia_detalles
-- ----------------------------

-- ----------------------------
-- Table structure for guia_remision
-- ----------------------------
DROP TABLE IF EXISTS `guia_remision`;
CREATE TABLE `guia_remision`  (
  `id_guia_remision` int(11) NOT NULL AUTO_INCREMENT,
  `id_venta` int(11) NOT NULL,
  `fecha_emision` date NULL DEFAULT NULL,
  `dir_llegada` varchar(245) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `ubigeo` varchar(6) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `tipo_transporte` char(1) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `ruc_transporte` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `razon_transporte` varchar(245) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `vehiculo` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `chofer_brevete` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `enviado_sunat` char(1) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `hash` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `nombre_xml` varchar(245) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `serie` varchar(4) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `numero` int(7) NULL DEFAULT NULL,
  `peso` double(8, 2) NULL DEFAULT NULL,
  `nro_bultos` int(4) NULL DEFAULT NULL,
  `estado` char(1) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `id_empresa` int(2) NULL DEFAULT NULL,
  `sucursal` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_guia_remision`) USING BTREE,
  INDEX `fk_guia_remision_ventas1_idx`(`id_venta`) USING BTREE,
  CONSTRAINT `fk_guia_remision_ventas1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 184 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of guia_remision
-- ----------------------------

-- ----------------------------
-- Table structure for guia_sunat
-- ----------------------------
DROP TABLE IF EXISTS `guia_sunat`;
CREATE TABLE `guia_sunat`  (
  `id_guia` int(11) NOT NULL,
  `hash` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nombre_xml` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `qr_data` varchar(220) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_guia`) USING BTREE,
  CONSTRAINT `guia_sunat_ibfk_1` FOREIGN KEY (`id_guia`) REFERENCES `guia_remision` (`id_guia_remision`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of guia_sunat
-- ----------------------------

-- ----------------------------
-- Table structure for ingreso_egreso
-- ----------------------------
DROP TABLE IF EXISTS `ingreso_egreso`;
CREATE TABLE `ingreso_egreso`  (
  `intercambio_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NULL DEFAULT NULL,
  `tipo` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cantidad` int(11) NULL DEFAULT NULL,
  `almacen_ingreso` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `almacen_egreso` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `id_usuario` int(11) NULL DEFAULT NULL,
  `estado` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '2' COMMENT '2 = solo ingreso',
  PRIMARY KEY (`intercambio_id`) USING BTREE,
  INDEX `id_usuario`(`id_usuario`) USING BTREE,
  INDEX `id_producto`(`id_producto`) USING BTREE,
  CONSTRAINT `ingreso_egreso_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`usuario_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ingreso_egreso_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 847 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ingreso_egreso
-- ----------------------------

-- ----------------------------
-- Table structure for mes
-- ----------------------------
DROP TABLE IF EXISTS `mes`;
CREATE TABLE `mes`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 13 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes
-- ----------------------------
INSERT INTO `mes` VALUES (1, 'Ene');
INSERT INTO `mes` VALUES (2, 'Feb');
INSERT INTO `mes` VALUES (3, 'Mar');
INSERT INTO `mes` VALUES (4, 'Abr');
INSERT INTO `mes` VALUES (5, 'May');
INSERT INTO `mes` VALUES (6, 'Jun');
INSERT INTO `mes` VALUES (7, 'Jul');
INSERT INTO `mes` VALUES (8, 'Ago');
INSERT INTO `mes` VALUES (9, 'Set');
INSERT INTO `mes` VALUES (10, 'Oct');
INSERT INTO `mes` VALUES (11, 'Nov');
INSERT INTO `mes` VALUES (12, 'Dic');

-- ----------------------------
-- Table structure for metodo_pago
-- ----------------------------
DROP TABLE IF EXISTS `metodo_pago`;
CREATE TABLE `metodo_pago`  (
  `id_metodo_pago` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `estado` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1',
  PRIMARY KEY (`id_metodo_pago`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of metodo_pago
-- ----------------------------
INSERT INTO `metodo_pago` VALUES (1, 'TRANSFERENCIA BANCO BCP', '1');
INSERT INTO `metodo_pago` VALUES (2, 'TRANSFERENCIA BANCO NACION', '1');
INSERT INTO `metodo_pago` VALUES (3, 'TRANSFERENCIA BANCO INTERBANK', '1');
INSERT INTO `metodo_pago` VALUES (4, 'TRANSFERENCIA BANCO BBVA', '1');
INSERT INTO `metodo_pago` VALUES (5, 'YAPE', '1');
INSERT INTO `metodo_pago` VALUES (6, 'PLIN', '1');
INSERT INTO `metodo_pago` VALUES (7, 'TARJETA DE CREDITO VISA', '1');
INSERT INTO `metodo_pago` VALUES (8, 'TARJETA DE CREDITO MASTERCARD', '1');
INSERT INTO `metodo_pago` VALUES (9, 'TARJETA DE CREDITO DINNERS CLUB', '1');
INSERT INTO `metodo_pago` VALUES (10, 'POS ', '1');
INSERT INTO `metodo_pago` VALUES (11, 'TRANSFERENCIA BANCO SCOTIABANK', '1');
INSERT INTO `metodo_pago` VALUES (12, 'EFECTIVO', '1');
INSERT INTO `metodo_pago` VALUES (13, 'CREDITO 15 DÍAS', '1');

-- ----------------------------
-- Table structure for motivo_documento
-- ----------------------------
DROP TABLE IF EXISTS `motivo_documento`;
CREATE TABLE `motivo_documento`  (
  `id_motivo` int(11) NOT NULL,
  `codigo` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `nombre` varchar(145) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `id_tido` int(11) NOT NULL,
  PRIMARY KEY (`id_motivo`) USING BTREE,
  INDEX `fk_motivo_documento_documentos_sunat1_idx`(`id_tido`) USING BTREE,
  CONSTRAINT `fk_motivo_documento_documentos_sunat1` FOREIGN KEY (`id_tido`) REFERENCES `documentos_sunat` (`id_tido`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of motivo_documento
-- ----------------------------
INSERT INTO `motivo_documento` VALUES (1, '01', 'Anulación de la operacion', 3);
INSERT INTO `motivo_documento` VALUES (2, '02', 'Anulación por error en el RUC', 3);
INSERT INTO `motivo_documento` VALUES (3, '03', 'Corrección por error en la descripción', 3);
INSERT INTO `motivo_documento` VALUES (4, '10', 'Otros Conceptos', 3);
INSERT INTO `motivo_documento` VALUES (5, '01', 'Intereses por mora', 4);
INSERT INTO `motivo_documento` VALUES (6, '02', 'Aumento en el valor', 4);
INSERT INTO `motivo_documento` VALUES (7, '03', 'Penalidades/ otros conceptos', 4);

-- ----------------------------
-- Table structure for notas_electronicas
-- ----------------------------
DROP TABLE IF EXISTS `notas_electronicas`;
CREATE TABLE `notas_electronicas`  (
  `nota_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_venta` int(11) NULL DEFAULT NULL,
  `id_empresa` int(11) NULL DEFAULT NULL,
  `sucursal` int(11) NULL DEFAULT NULL,
  `tido` int(11) NULL DEFAULT NULL,
  `fecha` date NULL DEFAULT NULL,
  `serie` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `numero` int(11) NULL DEFAULT NULL,
  `motivo` int(11) NULL DEFAULT NULL,
  `monto` double(15, 2) NULL DEFAULT NULL,
  `productos` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `estado_sunat` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '0',
  `estado` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '1',
  PRIMARY KEY (`nota_id`) USING BTREE,
  INDEX `tido`(`tido`) USING BTREE,
  INDEX `id_venta`(`id_venta`) USING BTREE,
  CONSTRAINT `notas_electronicas_ibfk_1` FOREIGN KEY (`tido`) REFERENCES `documentos_sunat` (`id_tido`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `notas_electronicas_ibfk_2` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of notas_electronicas
-- ----------------------------

-- ----------------------------
-- Table structure for notas_electronicas_sunat
-- ----------------------------
DROP TABLE IF EXISTS `notas_electronicas_sunat`;
CREATE TABLE `notas_electronicas_sunat`  (
  `id_notas_electronicas` int(11) NOT NULL,
  `hash` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nombre_xml` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `qr_data` varchar(220) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_notas_electronicas`) USING BTREE,
  CONSTRAINT `notas_electronicas_sunat_ibfk_1` FOREIGN KEY (`id_notas_electronicas`) REFERENCES `notas_electronicas` (`nota_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of notas_electronicas_sunat
-- ----------------------------

-- ----------------------------
-- Table structure for orden_trabajo
-- ----------------------------
DROP TABLE IF EXISTS `orden_trabajo`;
CREATE TABLE `orden_trabajo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcliente` int(11) NULL DEFAULT 0,
  `idproducto` int(11) NULL DEFAULT 0,
  `num_factura` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `idorden` int(11) NULL DEFAULT 0,
  `num_orden` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `departamento` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `provincia` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `distrito` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `marca` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `equipo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `modelo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `serie_aquina` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `serie_motor` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `horometro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `lugar` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_update` datetime NULL DEFAULT NULL,
  `estado` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of orden_trabajo
-- ----------------------------
INSERT INTO `orden_trabajo` VALUES (35, 4537, 0, 'COMPLEMENTARIO', 2, '20000005', '', '', '', 'JHON DEERE/LANDINI', '5090E', '5090E', '', '', '', 'INGENIO', '2023-11-04 23:28:57', NULL, 0);

-- ----------------------------
-- Table structure for orden_trabajo_tipo
-- ----------------------------
DROP TABLE IF EXISTS `orden_trabajo_tipo`;
CREATE TABLE `orden_trabajo_tipo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `serie` int(11) NULL DEFAULT 1,
  `num_orden` int(11) NULL DEFAULT 1,
  `siguiente_serie` varbinary(100) NULL DEFAULT 0,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_update` datetime NULL DEFAULT NULL,
  `estado` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of orden_trabajo_tipo
-- ----------------------------
INSERT INTO `orden_trabajo_tipo` VALUES (1, 'PREVENTIVO', 1, 31, 0x3130303030303331, '2023-10-30 17:05:47', '2023-10-31 14:31:04', 0);
INSERT INTO `orden_trabajo_tipo` VALUES (2, 'CORRECTIVO', 2, 6, 0x3230303030303036, '2023-10-30 17:05:53', '2023-11-04 23:28:57', 0);

-- ----------------------------
-- Table structure for productos
-- ----------------------------
DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos`  (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `cod_barra` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `descripcion` varchar(245) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `precio` double(10, 4) NULL DEFAULT NULL,
  `costo` double(10, 4) NULL DEFAULT NULL,
  `cantidad` int(11) NULL DEFAULT NULL,
  `iscbp` int(2) NULL DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  `sucursal` int(11) NULL DEFAULT NULL,
  `ultima_salida` date NOT NULL,
  `codsunat` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `usar_barra` char(1) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT '0',
  `precio_mayor` double(10, 4) NULL DEFAULT NULL,
  `precio_menor` double(10, 4) NULL DEFAULT NULL,
  `razon_social` varchar(250) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `ruc` varchar(11) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `estado` char(1) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT '1',
  `almacen` char(1) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `precio2` double(10, 4) NULL DEFAULT 0.0000,
  `precio3` double(10, 4) NULL DEFAULT 0.0000,
  `precio4` double(10, 4) NULL DEFAULT 0.0000,
  `precio_unidad` double(10, 4) NULL DEFAULT NULL,
  `codigo` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `costop` double(10, 4) NULL DEFAULT NULL,
  PRIMARY KEY (`id_producto`) USING BTREE,
  INDEX `fk_productos_empresas1_idx`(`id_empresa`) USING BTREE,
  CONSTRAINT `fk_productos_empresas1` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 36891 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of productos
-- ----------------------------
INSERT INTO `productos` VALUES (35486, '', 'Filtro de aceite de motor', 89.0200, 80.9300, 0, 0, 12, 1, '1000-01-01', 'MIU800650', '0', 89.0200, 89.0200, 'IPESA S.A.C.', '20101639275', '0', '1', 0.0000, 0.0000, 89.0200, 89.0200, 'JDMIU800650', NULL);
INSERT INTO `productos` VALUES (35487, '', 'Filtro de combustible', 151.2500, 137.9000, 0, 0, 12, 1, '1000-01-01', 'MIU801090', '0', 151.2500, 151.2500, 'IPESA S.A.C.', '20101639275', '0', '1', 0.0000, 0.0000, 151.2500, 151.2500, 'JDMIU801090', NULL);
INSERT INTO `productos` VALUES (35488, '', 'Filtro separador', 53.8600, 48.9600, 0, 0, 12, 1, '1000-01-01', 'MIU801025', '0', 53.8600, 53.8600, 'IPESA S.A.C.', '20101639275', '0', '1', 0.0000, 0.0000, 53.8600, 53.8600, 'JDMIU801025', NULL);
INSERT INTO `productos` VALUES (35489, '', 'Cartucho de filtro de aire primario ', 267.9300, 243.5700, 0, 0, 12, 1, '1000-01-01', 'AT338105', '0', 267.9300, 267.9300, 'IPESA S.A.C.', '20101639275', '0', '1', 0.0000, 0.0000, 267.9300, 267.9300, 'JDAT338105', NULL);
INSERT INTO `productos` VALUES (35490, '', 'Cartucho de filtro de aire secundario', 211.2000, 192.0000, 0, 0, 12, 1, '1000-01-01', 'AT336803', '0', 211.2000, 211.2000, 'IPESA S.A.C.', '20101639275', '0', '1', 0.0000, 0.0000, 211.2000, 211.2000, 'JDAT336803', NULL);
INSERT INTO `productos` VALUES (35572, '', 'FILTRO DE ACEITE MOTOR', 124.9200, 113.5600, -4, 0, 12, 1, '1000-01-01', 'JDRE504836', '0', 124.9200, 124.9200, 'IPESA S.A.C.', '20101639275', '0', '1', 0.0000, 0.0000, 105.8600, 105.8600, 'JDRE504836', NULL);
INSERT INTO `productos` VALUES (35573, '', 'FILTRO RACORD DE COMBUSTIBLE', 253.5800, 230.5200, -4, 0, 12, 1, '1000-01-01', 'JDAT365870', '0', 253.5800, 253.5800, 'IPESA S.A.C.', '20101639275', '0', '1', 0.0000, 0.0000, 214.9000, 214.9000, 'JDAT365870', NULL);
INSERT INTO `productos` VALUES (35574, '', 'CARTUCHO DE FILTRO', 303.4900, 275.9000, -2, 0, 12, 1, '1000-01-01', 'JDRE544394', '0', 303.4900, 303.4900, 'IPESA S.A.C.', '20101639275', '0', '1', 0.0000, 0.0000, 257.1900, 257.1900, 'JDRE544394', NULL);
INSERT INTO `productos` VALUES (35575, '', 'FILTRO DE ACEITE HIDRÁULICO.', 461.1400, 419.2200, -1, 0, 12, 1, '1000-01-01', 'JDAT367840', '0', 461.1400, 461.1400, 'IPESA S.A.C.', '20101639275', '0', '1', 0.0000, 0.0000, 390.8000, 390.8000, 'JDAT367840', NULL);
INSERT INTO `productos` VALUES (35576, '', 'RESPIRADERO(EJETRASERO Y TQ.HIDRÁULICO).', 42.7300, 38.8500, -1, 0, 12, 1, '1000-01-01', 'JDAT101565', '0', 42.7300, 42.7300, 'IPESA S.A.C.', '20101639275', '0', '1', 0.0000, 0.0000, 36.2100, 36.2100, 'JDAT101565', NULL);
INSERT INTO `productos` VALUES (35577, '', 'FILTRO DE AIRE PRINCIPAL', 304.8200, 277.1100, -5, 0, 12, 1, '1000-01-01', 'JDAT332908', '0', 304.8200, 304.8200, 'IPESA S.A.C.', '20101639275', '0', '1', 0.0000, 0.0000, 258.3200, 258.3200, 'JDAT332908', NULL);
INSERT INTO `productos` VALUES (35578, '', 'FILTRO SECUNDARIO DE AIRE', 139.1500, 126.5000, -4, 0, 12, 1, '1000-01-01', 'JDAT332909', '0', 139.1500, 139.1500, 'IPESA S.A.C.', '20101639275', '0', '1', 0.0000, 0.0000, 117.9200, 117.9200, 'JDAT332909', NULL);
INSERT INTO `productos` VALUES (35579, '', 'RESPIRADERO DE COMBUSTIBLE', 166.9500, 151.7700, -1, 0, 12, 1, '1000-01-01', 'JDH216169', '0', 166.9500, 166.9500, 'IPESA S.A.C.', '20101639275', '0', '1', 0.0000, 0.0000, 141.4800, 141.4800, 'JDH216169', NULL);
INSERT INTO `productos` VALUES (35580, '', 'FILTRO DE ACEITE', 493.9900, 449.0800, -1, 0, 12, 1, '1000-01-01', 'JDAT466863', '0', 493.9900, 493.9900, 'IPESA S.A.C.', '20101639275', '0', '1', 0.0000, 0.0000, 418.6400, 418.6400, 'JDAT466863', NULL);
INSERT INTO `productos` VALUES (35584, '', 'ACEITE HIDRÁULICO HYDRAU - 05 GL', 676.9200, 644.7000, -4, 0, 12, 1, '1000-01-01', 'JDTY27367', '0', 676.9200, 676.9200, 'IPESA S.A.C.', '20101639275', '0', '1', 0.0000, 0.0000, 573.6600, 573.6600, 'JDTY27367', NULL);
INSERT INTO `productos` VALUES (35585, '', 'ACEITE HY-GARD - 5 GL', 465.9600, 442.6600, -3, 0, 12, 1, '1000-01-01', 'JDAR69444', '0', 465.9600, 465.9600, 'IPESA S.A.C.', '20101639275', '0', '1', 0.0000, 0.0000, 392.9500, 392.9500, 'JDAR69444', NULL);
INSERT INTO `productos` VALUES (35586, '', 'Filtro de aceite de motor', 105.0500, 95.5000, 0, 0, 12, 1, '1000-01-01', 'JDMIU800650', '0', 105.0400, 105.0400, 'IPESA S.A.C.', '20101639275', '0', '1', 89.0200, 89.0200, 89.0200, 89.0200, 'JDMIU800650', NULL);
INSERT INTO `productos` VALUES (35587, '', 'Filtro de combustible', 178.4800, 162.2500, 0, 0, 12, 1, '1000-01-01', 'JDMIU801090', '0', 178.4800, 178.4800, 'IPESA S.A.C.', '20101639275', '0', '1', 151.2500, 151.2500, 151.2500, 151.2500, 'JDMIU801090', NULL);
INSERT INTO `productos` VALUES (35588, '', 'Filtro separador', 63.5500, 57.7700, 0, 0, 12, 1, '1000-01-01', 'JDMIU801025', '0', 63.5500, 63.5500, 'IPESA S.A.C.', '20101639275', '0', '1', 53.8600, 53.8600, 53.8600, 53.8600, 'JDMIU801025', NULL);
INSERT INTO `productos` VALUES (35589, '', 'Cartucho de filtro de aire primario', 316.1600, 287.4100, 0, 0, 12, 1, '1000-01-01', 'JDAT338105', '0', 316.1600, 316.1600, 'IPESA S.A.C.', '20101639275', '0', '1', 267.9300, 267.9300, 267.9300, 267.9300, 'JDAT338105', NULL);
INSERT INTO `productos` VALUES (35590, '', 'Cartucho de filtro de aire secundario', 249.2200, 226.5600, 0, 0, 12, 1, '1000-01-01', 'JDAT336803', '0', 249.2200, 249.2200, 'IPESA S.A.C.', '20101639275', '0', '1', 211.2000, 211.2000, 211.2000, 211.2000, 'JDAT336803', NULL);
INSERT INTO `productos` VALUES (35591, '', 'SERVICIO DE MANTENIMIENTO DE RETROEXCAVADORA', 500.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'RETROTRAC SOLUCIONES Y SERVICIOS S.A.C.', '20611265787', '0', '1', 0.0000, 0.0000, 0.0000, 500.0000, 'SERVICIO', NULL);
INSERT INTO `productos` VALUES (35592, '', 'FILTRO DE COMBUSTIBLE FINAL', 103.6200, 94.2000, -2, 0, 12, 1, '1000-01-01', 'JDRE509031', '0', 103.6200, 103.6200, 'IPESA S.A.C.', '20101639275', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'JDRE509031', NULL);
INSERT INTO `productos` VALUES (35594, '', 'Aceite Plus 50 II 15W40 - 5 GL', 433.3400, 393.9400, -1, 0, 12, 1, '1000-01-01', 'JDTY26679', '0', 433.3400, 433.3400, 'IPESA S.A.C.', '20101639275', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'JDTY26679', NULL);
INSERT INTO `productos` VALUES (35613, '', 'EVALUACION DE TRACTOR AGRICOLA 5090E', 0.0000, 0.0000, -3, 0, 12, 1, '1000-01-01', 'SERVMTPREV', '0', 0.0000, 0.0000, 'RETROTRAC SOLUCIONES Y SERVICIOS S.A.C.', '20611265787', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'SERVICIO', NULL);
INSERT INTO `productos` VALUES (35621, '', 'SERVICIO DE CAMBIO DE ROTULAS DE DIRECCION Y CAMBIO DE CASQUILLOS DE PUENTE DELANTERO', 238.9500, 0.0000, 9999, 0, 12, 1, '1000-01-01', '', '0', 238.9500, 238.9500, 'RETROTRAC SOLUCIONES Y SERVICIOS S.A.C.', '20611265787', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'SERVICIO', NULL);
INSERT INTO `productos` VALUES (35623, NULL, 'SENSOR DE PRESION DE ACEITE', 353.2700, 294.4000, 1, 0, 12, 1, '1000-01-01', '', '0', 353.2700, 353.2700, 'HURTADO ESPINOZA MIGUEL ANGEL', '10424020457', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'CU3967251', NULL);
INSERT INTO `productos` VALUES (35633, '', 'SEPARADOR DE COMBUSTIBLE', 32.9100, 28.6200, -1, 0, 12, 1, '1000-01-01', 'FLGFS1280', '0', 32.9100, 32.9100, 'IPESA S.A.C.', '20101639275', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'FLGFS1280', NULL);
INSERT INTO `productos` VALUES (35635, NULL, 'FILTRO DE ACEITE', 42.3900, 36.8600, -1, 0, 12, 1, '1000-01-01', 'FLGLF3345', '0', 42.3900, 42.3900, 'IPESA S.A.C.', '20101639275', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'FLGLF3345', NULL);
INSERT INTO `productos` VALUES (35637, NULL, 'FILTRO DE COMBUSTIBLE', 37.3200, 32.4500, 0, 0, 12, 1, '1000-01-01', 'FLGFF5052', '0', 37.3200, 37.3200, 'IPESA S.A.C.', '20101639275', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'FLGFF5052', NULL);
INSERT INTO `productos` VALUES (35639, NULL, 'FILTRO DE AIRE AF PKG', 283.3300, 246.3700, -1, 0, 12, 1, '1000-01-01', 'FLGAF1811', '0', 283.3300, 283.3300, 'IPESA S.A.C.', '20101639275', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'FLGAF1811', NULL);
INSERT INTO `productos` VALUES (35641, '', 'ACEITE DE MOTOR MOBIL DELVAC MX 15W40 CK-4 X 5GL', 383.8400, 360.0000, -7, 0, 12, 1, '1000-01-01', 'MODELVACCK4', '0', 396.0000, 396.0000, 'INVERSIONES TOPAB E.I.R.L', '20609956136', '0', '1', 0.0000, 0.0000, 0.0000, 0.0000, 'MODELVACCK4', NULL);
INSERT INTO `productos` VALUES (35661, NULL, 'Junta tórica (empaque de balancines)', 141.6000, 0.0000, 0, 0, 12, 1, '1000-01-01', 'JDR524499', '0', 141.6000, 141.6000, 'IPESA S.A.C.', '20101639275', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'JDR524499', NULL);
INSERT INTO `productos` VALUES (35669, NULL, 'Cartucho de filtro', 115.1600, 104.6900, -1, 0, 12, 1, '1000-01-01', 'JDRE522868', '0', 115.1600, 115.1600, 'IPESA S.A.C.', '20101639275', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'JDRE522868', NULL);
INSERT INTO `productos` VALUES (35673, NULL, 'Filtro De Aire Secundario', 63.5500, 57.7700, 0, 0, 12, 1, '1000-01-01', 'JDAT171854', '0', 63.5500, 63.5500, 'IPESA S.A.C.', '20101639275', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'JDAT171854', NULL);
INSERT INTO `productos` VALUES (35675, NULL, 'Filtro de aceite', 255.3700, 232.1500, -3, 0, 12, 1, '1000-01-01', 'JDRE45864', '0', 255.3700, 255.3700, 'IPESA S.A.C.', '20101639275', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'JDRE45864', NULL);
INSERT INTO `productos` VALUES (35677, NULL, 'Filtro de aceite', 128.6200, 116.9300, -2, 0, 12, 1, '1000-01-01', 'JDSJ28834', '0', 128.6200, 128.6200, 'IPESA S.A.C.', '20101639275', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'JDSJ28834', NULL);
INSERT INTO `productos` VALUES (35683, NULL, 'Interruptor giratorio', 339.4400, 308.5800, -1, 0, 12, 1, '1000-01-01', 'JDRE61717', '0', 339.4400, 339.4400, 'IPESA S.A.C.', '20101639275', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'JDRE61717', NULL);
INSERT INTO `productos` VALUES (35699, NULL, 'Manguera hidráulica', 352.1200, 270.8600, -1, 0, 12, 1, '1000-01-01', 'NAAT426176', '0', 352.1200, 352.1200, 'ICAFREN E.I.R.L.', '20534788089', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'NAAT426176', NULL);
INSERT INTO `productos` VALUES (35701, NULL, 'Manguera hidráulica', 218.2500, 167.8800, -1, 0, 12, 1, '1000-01-01', 'NAAT426177', '0', 218.2500, 218.2500, 'ICAFREN E.I.R.L.', '20534788089', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'NAAT426177', NULL);
INSERT INTO `productos` VALUES (35703, NULL, 'Manguera hidráulica', 97.3500, 74.8800, -1, 0, 12, 1, '1000-01-01', 'NAAT434161', '0', 97.3500, 97.3500, 'ICAFREN E.I.R.L.', '20534788089', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'NAAT434161', NULL);
INSERT INTO `productos` VALUES (35705, NULL, 'Manguera hidráulica', 260.9800, 200.7500, -1, 0, 12, 1, '1000-01-01', 'NAAT434025', '0', 260.9800, 260.9800, 'ICAFREN E.I.R.L.', '20534788089', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'NAAT434025', NULL);
INSERT INTO `productos` VALUES (35707, NULL, 'Manguera hidráulica', 130.0200, 100.0200, -1, 0, 12, 1, '1000-01-01', 'NAAT370708', '0', 130.0200, 130.0200, 'ICAFREN E.I.R.L.', '20534788089', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'NAAT370708', NULL);
INSERT INTO `productos` VALUES (35709, NULL, 'Manguera hidráulica', 153.6300, 118.1800, -1, 0, 12, 1, '1000-01-01', 'NAAT434024', '0', 153.6300, 153.6300, 'ICAFREN E.I.R.L.', '20534788089', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'NAAT434024', NULL);
INSERT INTO `productos` VALUES (35711, NULL, 'Manguera hidráulica', 347.6600, 267.4300, -1, 0, 12, 1, '1000-01-01', 'NAAT433772', '0', 347.6600, 347.6600, 'ICAFREN E.I.R.L.', '20534788089', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'NAAT433772', NULL);
INSERT INTO `productos` VALUES (35713, NULL, 'Interruptor', 1029.2000, 935.6300, -2, 0, 12, 1, '1000-01-01', 'JDAT159811', '0', 1029.2000, 1029.2000, 'ICAFREN E.I.R.L.', '20534788089', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'JDAT159811', NULL);
INSERT INTO `productos` VALUES (35715, NULL, 'Manguera hidráulica', 313.3500, 223.8200, -1, 0, 12, 1, '1000-01-01', 'NAAT426350', '0', 313.3500, 313.3500, 'ICAFREN E.I.R.L.', '20534788089', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'NAAT426350', NULL);
INSERT INTO `productos` VALUES (35717, NULL, 'SERVICIO DE MANTENIMIENTO', 0.0000, 0.0000, -5, 0, 12, 1, '1000-01-01', 'SERVICIO', '0', 0.0000, 0.0000, 'RETROTRAC SOLUCIONES Y SERVICIOS S.A.C.', '20611265787', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'SERVICIO', NULL);
INSERT INTO `productos` VALUES (35721, '', 'Sensor de restricción de aire', 370.0900, 352.4600, -1, 0, 12, 1, '1000-01-01', 'JDAT178542', '0', 370.0900, 370.0900, 'IPESA S.A.C.', '20101639275', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'JDAT178542', NULL);
INSERT INTO `productos` VALUES (35725, NULL, 'Aceite mobilfluid 424, 19L', 372.9600, 310.8300, -4, 0, 12, 1, '1000-01-01', 'MOBIL424', '0', 372.9600, 372.9600, 'LUBRICACIÓN Y TECNOLOGÍA S.A.C.', '20602951422', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'MOBIL424', NULL);
INSERT INTO `productos` VALUES (35727, NULL, 'Deposito y deshumectador', 430.6500, 391.4700, -2, 0, 12, 1, '1000-01-01', 'JDAT162848', '0', 430.6500, 430.6500, 'IPESA S.A.C.', '20101639275', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'JDAT162848', NULL);
INSERT INTO `productos` VALUES (35729, NULL, 'SERVICIO DE EVALUACION Y RECARGA DE AIRE ACONDICIONADO RETROEXCAVADORA 310SL', 413.0000, 0.0000, -1, 0, 12, 1, '1000-01-01', 'SERVICIO', '0', 413.0000, 413.0000, 'RETROTRAC SOLUCIONES Y SERVICIOS S.A.C.', '20611265787', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'SERVICIO', NULL);
INSERT INTO `productos` VALUES (35731, NULL, 'Cartucho de filtro', 235.9100, 214.4700, -1, 0, 12, 1, '1000-01-01', 'JDRE541922', '0', 235.9100, 235.9100, 'IPESA S.A.C.', '20101639275', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'JDRE541922', NULL);
INSERT INTO `productos` VALUES (35739, '', 'Oil Filter Cellul', 97.1900, 73.7500, 20, 0, 12, 1, '1000-01-01', 'FLGLF16243', '0', 97.1900, 97.1900, 'RETROTRAC SOLUCIONES Y SERVICIOS S.A.C.', '20611265787', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'FLGLF16243', NULL);
INSERT INTO `productos` VALUES (35757, NULL, 'EVALUACION Y ESCANEO DE RETROEXCAVADORA 310SL', 413.0000, 0.0000, -1, 0, 12, 1, '1000-01-01', '', '0', 354.0000, 413.0000, 'RETROTRAC SOLUCIONES Y SERVICIOS S.A.C.', '20611265787', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'SERVICIO', NULL);
INSERT INTO `productos` VALUES (35763, NULL, 'FILTRO TRANSMIS.(STRAINER) MAGNETICO', 131.7100, 114.5300, 0, 0, 12, 1, '1000-01-01', '10023560AD', '0', 131.7100, 131.7100, 'MAQUINARIAS Y EQUIPOS DEL PERU S.A.', '20258797915', '0', '1', 0.0000, 0.0000, 0.0000, NULL, '10023560AD', NULL);
INSERT INTO `productos` VALUES (35765, NULL, 'FUEL FILTER KIT (MICO) 2 PCS', 61.2600, 53.2600, 0, 0, 12, 1, '1000-01-01', '10002726AA', '0', 61.2600, 61.2600, 'MAQUINARIAS Y EQUIPOS DEL PERU S.A.', '20258797915', '0', '1', 0.0000, 0.0000, 0.0000, NULL, '10002726AA', NULL);
INSERT INTO `productos` VALUES (35767, NULL, 'FILTRO STRAINER,HID. 160 MIC. (DI-20 --> 110HP)', 59.7300, 51.9300, 0, 0, 12, 1, '1000-01-01', '20002253AA', '0', 59.7300, 59.7300, 'MAQUINARIAS Y EQUIPOS DEL PERU S.A.', '20258797915', '0', '1', 0.0000, 0.0000, 0.0000, NULL, '20002253AA', NULL);
INSERT INTO `productos` VALUES (35769, '', 'FILTRO AIRE PRIMARIO (WT75-90 -75/90N)', 169.5400, 147.4200, 0, 0, 12, 1, '1000-01-01', '41000745AA', '0', 169.5400, 169.5400, 'MAQUINARIAS Y EQUIPOS DEL PERU S.A.', '20258797915', '0', '1', 0.0000, 0.0000, 0.0000, NULL, '41000745AA', NULL);
INSERT INTO `productos` VALUES (35771, '', 'FILTRO AIRE SECUNDARIO (WT75-90-75-90N)', 114.7100, 99.7500, 0, 0, 12, 1, '1000-01-01', '41000746AA', '0', 114.7100, 114.7100, 'MAQUINARIAS Y EQUIPOS DEL PERU S.A.', '20258797915', '0', '1', 0.0000, 0.0000, 0.0000, NULL, '41000746AA', NULL);
INSERT INTO `productos` VALUES (35773, NULL, 'FILTRO ACEITE MOTOR + INTERCAMBIADOR', 52.0700, 45.2800, 0, 0, 12, 1, '1000-01-01', '10004836AB', '0', 52.0700, 52.0700, 'MAQUINARIAS Y EQUIPOS DEL PERU S.A.', '20258797915', '0', '1', 0.0000, 0.0000, 0.0000, NULL, '10004836AB', NULL);
INSERT INTO `productos` VALUES (35775, NULL, 'FILTRO ACEITE HIDRAULICO', 93.4200, 81.2400, 0, 0, 12, 1, '1000-01-01', '10027339AB', '0', 93.4200, 93.4200, 'MAQUINARIAS Y EQUIPOS DEL PERU S.A.', '20258797915', '0', '1', 0.0000, 0.0000, 0.0000, NULL, '10027339AB', NULL);
INSERT INTO `productos` VALUES (35777, NULL, 'Mantenimiento de motor de trompo mezclador y plancha de 5HPcompactadora de terreno', 500.0000, 0.0000, -1, 0, 12, 1, '1000-01-01', '', '0', 500.0000, 500.0000, 'RETROTRAC SOLUCIONES Y SERVICIOS S.A.C.', '20611265787', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'SERVICIO', NULL);
INSERT INTO `productos` VALUES (35781, NULL, 'Electroválvula hidraulica', 1950.0000, 0.0000, -1, 0, 12, 1, '1000-01-01', 'JDAT310587', '0', 1950.0000, 1950.0000, 'IPESA S.A.C.', '20101639275', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'JDAT310587', NULL);
INSERT INTO `productos` VALUES (35783, NULL, 'Filtro de aceite de motor', 56.8700, 51.7000, -2, 0, 12, 1, '1000-01-01', 'FLGLF699', '0', 56.8700, 56.8700, 'IPESA S.A.C.', '20101639275', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'FLGLF699', NULL);
INSERT INTO `productos` VALUES (35785, NULL, 'Filtro de aceite de motor', 47.2700, 42.9800, -1, 0, 12, 1, '1000-01-01', 'FLGLF3795', '0', 47.2700, 47.2700, 'IPESA S.A.C.', '20101639275', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'FLGLF3795', NULL);
INSERT INTO `productos` VALUES (35787, NULL, 'Filtro de aceite de motor', 111.0400, 100.9500, -1, 0, 12, 1, '1000-01-01', 'FLGLF17556', '0', 111.0400, 111.0400, 'IPESA S.A.C.', '20101639275', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'FLGLF17556', NULL);
INSERT INTO `productos` VALUES (35791, NULL, 'Filtro de combustible', 181.0100, 164.5500, -1, 0, 12, 1, '1000-01-01', 'FLGFS20052', '0', 181.0100, 181.0100, 'IPESA S.A.C.', '20101639275', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'FLGFS20052', NULL);
INSERT INTO `productos` VALUES (35821, NULL, 'Mobilube HD 80W90 19L', 386.6100, 322.1800, 0, 0, 12, 1, '1000-01-01', 'MOLUBE80W90', '0', 386.6100, 386.6100, 'LUBRICANTES DE ALTURA S.A.C.', '20496651481', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'MOLUBE80W90', NULL);
INSERT INTO `productos` VALUES (35823, NULL, 'Electroválvula (2 cuerpos)', 1900.0000, 800.0000, -1, 0, 12, 1, '1000-01-01', 'JDAT310584', '0', 1900.0000, 1900.0000, 'RETROTRAC SOLUCIONES Y SERVICIOS S.A.C.', '20611265787', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'JDAT310584', NULL);
INSERT INTO `productos` VALUES (35831, NULL, 'Tensor de correa', 1092.9500, 993.6000, -1, 0, 12, 1, '1000-01-01', 'JDRE548027', '0', 1092.9500, 1092.9500, 'IPESA S.A.C.', '20101639275', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'JDRE548027', NULL);
INSERT INTO `productos` VALUES (35835, NULL, 'SERVICIO DE REPARACION DE TURBO', 0.0000, 0.0000, -1, 0, 12, 1, '1000-01-01', 'SERVICIO', '0', 0.0000, 0.0000, 'INYECCION Y TURBOCARGADORES PERU S.A.C.', '20511623660', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'SERVICIO', NULL);
INSERT INTO `productos` VALUES (35837, NULL, 'SERVICIO DE EVALUACION Y MONTAJEDE TURBOCOMPRESOR', 0.0000, 0.0000, -1, 0, 12, 1, '1000-01-01', 'SERVICIO', '0', 0.0000, 0.0000, 'RETROTRAC SOLUCIONES Y SERVICIOS S.A.C.', '20611265787', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'SERVICIO', NULL);
INSERT INTO `productos` VALUES (35841, '', 'REFRIGERANTE Mobil Heavy Duty 50/50 Prediluted Coolant Antifreeze 50/50', 71.5000, 65.0000, -3, 0, 12, 1, '1000-01-01', 'REFRIGERANTE', '0', 71.5000, 71.5000, 'INVERSIONES TOPAB E.I.R.L', '20609956136', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'REFRIGERANTE', NULL);
INSERT INTO `productos` VALUES (35843, NULL, 'FILTRO DE COMBUSTIBLE', 55.0000, 45.4700, -1, 0, 12, 1, '1000-01-01', 'FLGFF5461', '0', 55.0000, 55.0000, 'IPESA S.A.C.', '20101639275', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'FLGFF5461', NULL);
INSERT INTO `productos` VALUES (35851, NULL, 'Correa trapezoidal (2590mm)', 735.2500, 667.4600, -1, 0, 12, 1, '1000-01-01', 'JDT442655', '0', 735.2500, 735.2500, 'IPESA S.A.C.', '20101639275', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'JDT442655', NULL);
INSERT INTO `productos` VALUES (35859, NULL, 'Correa trapezoidal', 372.0200, 323.5000, -2, 0, 12, 1, '1000-01-01', 'JDR270966', '0', 372.0200, 372.0200, 'IPESA S.A.C.', '20101639275', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'JDR270966', NULL);
INSERT INTO `productos` VALUES (35861, NULL, 'Tensor de correa', 994.6500, 904.2300, -1, 0, 12, 1, '1000-01-01', 'JDRE518097', '0', 994.6500, 994.6500, 'IPESA S.A.C.', '20101639275', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'JDRE518097', NULL);
INSERT INTO `productos` VALUES (36139, NULL, 'SERVICIO DE REPARACION DE SISTEMA ELECTRICO DE TRACTOR 5090E', 18999.9100, 0.0000, 0, 0, 12, 1, '1000-01-01', 'SERVICIO', '0', 18999.9100, 18999.9100, 'RETROTRAC SOLUCIONES Y SERVICIOS S.A.C.', '20611265787', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'SERVICIO', NULL);
INSERT INTO `productos` VALUES (36233, '', 'cabezal PF-06', 550.0000, 520.0000, 1, 0, 12, 1, '1000-01-01', '', '0', 500.0000, 520.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '0', '1', 146.6700, 0.0000, 146.6700, 2070.7500, 'PF06', NULL);
INSERT INTO `productos` VALUES (36234, '', 'cabezal PF-06', 550.0000, 520.0000, 7, 0, 12, 1, '1000-01-01', '', '0', 500.0000, 520.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '1', '2', 146.6700, 0.0000, 146.6700, 2070.7500, 'PF06', 520.0000);
INSERT INTO `productos` VALUES (36235, NULL, 'TINTA YELLOW  TM 1/2L', 80.0000, 0.0000, 6, 0, 12, 1, '1000-01-01', '', '0', 75.0000, 80.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '0', '1', 0.0000, 0.0000, 0.0000, NULL, '0.5YTM', NULL);
INSERT INTO `productos` VALUES (36236, '', 'TINTA YELLOW  TM 1/2L', 80.0000, 0.0000, 10, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'KANAKO PRINTCOPY S.A.C.', '0', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'YTM0.5', 40.0000);
INSERT INTO `productos` VALUES (36237, NULL, 'TINTA BK  TM 1/2L', 80.0000, 0.0000, 7, 0, 12, 1, '1000-01-01', '', '0', 80.0000, 80.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '0', '1', 0.0000, 0.0000, 0.0000, NULL, '0.5BKTM', NULL);
INSERT INTO `productos` VALUES (36238, '', 'TINTA BK  TM 1/2L', 80.0000, 0.0000, 10, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'KANAKO PRINTCOPY S.A.C.', '0', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'BKTM0.5', 40.0000);
INSERT INTO `productos` VALUES (36239, NULL, 'TINTA CIAN  TM 1/2L', 80.0000, 0.0000, 6, 0, 12, 1, '1000-01-01', '', '0', 80.0000, 80.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '0', '1', 0.0000, 0.0000, 0.0000, NULL, '0.5CTM', NULL);
INSERT INTO `productos` VALUES (36240, '', 'TINTA CIAN  TM 1/2L', 80.0000, 0.0000, 10, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'KANAKO PRINTCOPY S.A.C.', '0', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'CTM0.5', 40.0000);
INSERT INTO `productos` VALUES (36241, NULL, 'TINTA MBK TM2 1/2L', 80.0000, 0.0000, 7, 0, 12, 1, '1000-01-01', '', '0', 80.0000, 80.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '0', '1', 0.0000, 0.0000, 0.0000, NULL, '0.5MBK2TM', NULL);
INSERT INTO `productos` VALUES (36242, NULL, 'TINTA MBK TM2 1/2L', 80.0000, 0.0000, 10, 0, 12, 1, '1000-01-01', '', '0', 80.0000, 80.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '1', '2', 0.0000, 0.0000, 0.0000, NULL, '0.5MBK2TM', 0.0000);
INSERT INTO `productos` VALUES (36243, NULL, 'TINTA MAGENTA  TM 1/2L', 80.0000, 0.0000, 5, 0, 12, 1, '1000-01-01', '', '0', 80.0000, 80.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '0', '1', 0.0000, 0.0000, 0.0000, NULL, '0.5MTM', NULL);
INSERT INTO `productos` VALUES (36244, '', 'TINTA MAGENTA  TM 1/2L', 80.0000, 0.0000, 10, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'KANAKO PRINTCOPY S.A.C.', '0', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'MTM0.5', 40.0000);
INSERT INTO `productos` VALUES (36245, NULL, 'JERINGA 60 Ml ', 5.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', 5.0000, 5.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'J60', NULL);
INSERT INTO `productos` VALUES (36246, NULL, 'JERINGA 60 Ml ', 5.0000, 0.0000, 4, 0, 12, 1, '1000-01-01', '', '0', 5.0000, 5.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'J60', 0.0000);
INSERT INTO `productos` VALUES (36247, NULL, 'AGUJA DE METAL', 5.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', 5.0000, 5.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'AM', NULL);
INSERT INTO `productos` VALUES (36248, '', 'AGUJA DE METAL', 5.0000, 0.0000, 4, 0, 12, 1, '1000-01-01', '', '0', 5.0000, 5.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'AGUJA', 1.0000);
INSERT INTO `productos` VALUES (36249, NULL, 'CHIP DE TINTA YELLOW 102', 30.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', 30.0000, 30.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'Y102', NULL);
INSERT INTO `productos` VALUES (36250, '', 'CHIP DE TINTA YELLOW 102', 30.0000, 4.4000, 1, 0, 12, 1, '1000-01-01', '', '0', 20.0000, 20.0000, 'KANAKO PRINTCOPY S.A.C.', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'CY102', 0.0000);
INSERT INTO `productos` VALUES (36251, NULL, 'CHIP DE TINTA MAGENTA 102', 30.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', 30.0000, 30.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'M102', NULL);
INSERT INTO `productos` VALUES (36252, NULL, 'CHIP DE TINTA MAGENTA 102', 30.0000, 0.0000, 1, 0, 12, 1, '1000-01-01', '', '0', 30.0000, 30.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'M102', 0.0000);
INSERT INTO `productos` VALUES (36253, NULL, 'TINTA YELLOW  IPF 1/2L', 80.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', 80.0000, 80.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '0', '1', 0.0000, 0.0000, 0.0000, NULL, '0.5YIPF', NULL);
INSERT INTO `productos` VALUES (36254, NULL, 'TINTA YELLOW  IPF 1/2L', 80.0000, 0.0000, 10, 0, 12, 1, '1000-01-01', '', '0', 80.0000, 80.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '1', '2', 0.0000, 0.0000, 0.0000, NULL, '0.5YIPF', 0.0000);
INSERT INTO `productos` VALUES (36255, NULL, 'TINTA CIAN IPF 1/2L', 80.0000, 0.0000, -1, 0, 12, 1, '1000-01-01', '', '0', 80.0000, 80.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '0', '1', 0.0000, 0.0000, 0.0000, NULL, '0.5CIPF', NULL);
INSERT INTO `productos` VALUES (36256, NULL, 'TINTA CIAN IPF 1/2L', 80.0000, 0.0000, 10, 0, 12, 1, '1000-01-01', '', '0', 80.0000, 80.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '1', '2', 0.0000, 0.0000, 0.0000, NULL, '0.5CIPF', 0.0000);
INSERT INTO `productos` VALUES (36257, NULL, 'TINTA BK IPF 1/2L', 80.0000, 0.0000, 4, 0, 12, 1, '1000-01-01', '', '0', 80.0000, 80.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '0', '1', 0.0000, 0.0000, 0.0000, NULL, '0.5BKIPF', NULL);
INSERT INTO `productos` VALUES (36258, '', 'TINTA BK IPF 1/2L', 80.0000, 0.0000, 10, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '1', '2', 0.0000, 0.0000, 0.0000, 90.0000, 'BKIPF0.5', 40.0000);
INSERT INTO `productos` VALUES (36259, NULL, 'TINTA MAGENTA  IPF 1/2L', 80.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', 80.0000, 80.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '0', '1', 0.0000, 0.0000, 0.0000, NULL, '0.5MIPF', NULL);
INSERT INTO `productos` VALUES (36260, '', 'TINTA MAGENTA  IPF 1/2L', 80.0000, 0.0000, 10, 0, 12, 1, '1000-01-01', '', '0', 180.0000, 180.0000, 'KANAKO PRINTCOPY S.A.C.', '10445913079', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'MIPF0.5', 40.0000);
INSERT INTO `productos` VALUES (36261, NULL, 'TINTA MBK IPF 1/2 L', 80.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', 80.0000, 80.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '0', '1', 0.0000, 0.0000, 0.0000, NULL, '0.5MBK2IPF', NULL);
INSERT INTO `productos` VALUES (36262, NULL, 'TINTA MBK IPF 1/2 L', 80.0000, 0.0000, 10, 0, 12, 1, '1000-01-01', '', '0', 80.0000, 80.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '1', '2', 0.0000, 0.0000, 0.0000, NULL, '0.5MBK2IPF', 0.0000);
INSERT INTO `productos` VALUES (36263, NULL, 'cARTUCHO DE TINTA 260ML + CHIP ', 90.0000, 0.0000, 4, 0, 12, 1, '1000-01-01', '', '0', 90.0000, 90.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'MBK107', NULL);
INSERT INTO `productos` VALUES (36264, NULL, 'cARTUCHO DE TINTA 260ML + CHIP ', 90.0000, 0.0000, 10, 0, 12, 1, '1000-01-01', '', '0', 90.0000, 90.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'MBK107', 0.0000);
INSERT INTO `productos` VALUES (36265, '', 'servicio de revisión y diagnostico', 80.0000, 0.0000, 993, 0, 12, 1, '1000-01-01', '', '0', 80.0000, 80.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'RM', NULL);
INSERT INTO `productos` VALUES (36266, '', 'servicio de revisión y diagnostico', 80.0000, 0.0000, 100000000, 0, 12, 1, '1000-01-01', '', '0', 80.0000, 80.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'RM', 0.0000);
INSERT INTO `productos` VALUES (36267, NULL, 'Servicio tecnico', 200.0000, 0.0000, 193, 0, 12, 1, '1000-01-01', '', '0', 200.0000, 200.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'ST', NULL);
INSERT INTO `productos` VALUES (36268, NULL, 'Servicio tecnico', 200.0000, 0.0000, 200, 0, 12, 1, '1000-01-01', '', '0', 200.0000, 200.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'ST', 0.0000);
INSERT INTO `productos` VALUES (36269, NULL, 'AM', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 4.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36270, NULL, 'PF06', 0.0000, 520.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 7.0000, 2.0000, NULL, 520.0000);
INSERT INTO `productos` VALUES (36271, NULL, 'MBK107', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 10.0000, 4.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36272, NULL, 'M102', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 1.0000, 1.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36273, NULL, 'Y102', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 1.0000, 1.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36274, NULL, 'J60', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 4.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36275, NULL, 'RM', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 999999.9999, 999999.9999, NULL, 0.0000);
INSERT INTO `productos` VALUES (36276, NULL, 'ST', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 200.0000, 200.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36277, NULL, 'JDRE518097', 0.0000, 904.2300, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, -2.0000, NULL, 904.2300);
INSERT INTO `productos` VALUES (36278, NULL, '0.5BKTM', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 10.0000, 9.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36279, NULL, '0.5BKIPF', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 10.0000, 9.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36280, NULL, '0.5CTM', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 10.0000, 9.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36281, NULL, '0.5CIPF', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 10.0000, 8.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36282, NULL, '0.5MIPF', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 10.0000, 8.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36283, NULL, '0.5MTM', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 10.0000, 9.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36284, NULL, '0.5MBK2IPF', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 10.0000, 7.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36285, NULL, '0.5MBK2TM', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 10.0000, 9.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36286, NULL, '0.5YIPF', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 10.0000, 8.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36287, NULL, '0.5YTM', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 10.0000, 9.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36288, NULL, 'T02Y4', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36289, NULL, 'T02M4', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36290, NULL, 'T02C4', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36291, NULL, 'T02BK4', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36292, NULL, 'T02Y16', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36293, NULL, 'T02M16', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36294, NULL, 'T02C16', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36295, NULL, 'T02BK16', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36296, NULL, 'PF04', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36297, NULL, 'YIPF1', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36298, NULL, 'MIPF1', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36299, NULL, 'CIPFL', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36300, NULL, 'BKIPF1', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36301, NULL, 'MBK2IPF1', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36302, NULL, 'MICAIPF1', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36303, NULL, 'MICATM1', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36304, NULL, 'MBK5IPF0.5', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36305, NULL, 'MBK5IPF1', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36306, NULL, 'CANON MC30/31', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36307, NULL, 'ALMHIPF', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36308, NULL, 'HP727', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36309, NULL, 'HP729', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36310, NULL, 'CANON MC10/7', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36311, NULL, 'EPSON L6171/91/61', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36312, NULL, 'EPSON F570', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36313, NULL, 'DYECIAN1L', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36314, NULL, 'DYEMAGE1L', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36315, NULL, 'DYEYELLOW1L', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36316, NULL, 'DYEPK1L', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36317, NULL, 'DYEMK1L', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36318, NULL, 'CARTCIAN26', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36319, NULL, 'CARTYELLOW26', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36320, NULL, 'CARTMAG26', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36321, NULL, 'CARTBK26', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36322, NULL, 'CARTMBK26', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36323, NULL, 'MBK120/130ML', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36324, NULL, 'BK120/90ML', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36325, NULL, 'YELLOW120/90ML', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36326, NULL, 'MAGEN120/90ML', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36327, NULL, 'BK107/130ML', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36328, NULL, 'MICA24P', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36329, NULL, 'MICA36P', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36330, NULL, 'CC120', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36331, NULL, 'CM120', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36332, NULL, 'CMBK120', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36333, NULL, 'CY120', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36334, NULL, 'CBK120', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36335, NULL, 'CC102', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36336, NULL, 'CBK102', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36337, NULL, 'CMBK102', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36338, NULL, 'CBK107', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36339, NULL, 'CCIAN107', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36340, NULL, 'CM107', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36341, NULL, 'CMBK107', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36342, NULL, 'CY107', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36343, NULL, 'MBK5TM0.5', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36344, NULL, 'MBK5TM1', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36345, NULL, 'R300ML', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36346, NULL, 'R130ML', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36347, NULL, 'UNITPURGE', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36348, NULL, 'UNITCAR', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36349, NULL, 'FIZQUI', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36350, NULL, 'FDERE', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', '', 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000);
INSERT INTO `productos` VALUES (36351, NULL, 'YELLOW TONER DE 400GR', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 125.0000, 'T02Y4', 0.0000);
INSERT INTO `productos` VALUES (36352, NULL, 'MAGENTA  TONER DE 400GR', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 125.0000, 'T02M4', 0.0000);
INSERT INTO `productos` VALUES (36353, NULL, 'CIAN TONER DE 400GR', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 125.0000, 'T02C4', 0.0000);
INSERT INTO `productos` VALUES (36354, NULL, 'BLACK TONER DE 400GR', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 125.0000, 'T02BK4', 0.0000);
INSERT INTO `productos` VALUES (36355, NULL, 'YELLOW TONER 1600GR', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 107.0000, 'T02Y16', 0.0000);
INSERT INTO `productos` VALUES (36356, NULL, 'MAGENTA TONER 1600GR', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 107.0000, 'T02M16', 0.0000);
INSERT INTO `productos` VALUES (36357, NULL, 'CIAN TONER 1600GR', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 107.0000, 'T02C16', 0.0000);
INSERT INTO `productos` VALUES (36358, NULL, 'BLACK TONER 1600GR', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 107.0000, 'T02BK16', 0.0000);
INSERT INTO `productos` VALUES (36359, NULL, 'CABEZAL PF04', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 520.0000, 'PF04', 0.0000);
INSERT INTO `productos` VALUES (36360, NULL, 'TINTA YELLOW  IPF 1L', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 160.0000, 'YIPF1', 0.0000);
INSERT INTO `productos` VALUES (36361, NULL, 'TINTA MAGENTA  IPF 1L', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 160.0000, 'MIPF1', 0.0000);
INSERT INTO `productos` VALUES (36362, NULL, 'TINTA CIAN  IPF 1L', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 160.0000, 'CIPFL', 0.0000);
INSERT INTO `productos` VALUES (36363, NULL, 'TINTA BK IPF 1L', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 160.0000, 'BKIPF1', 0.0000);
INSERT INTO `productos` VALUES (36364, NULL, 'TINTA MBK2 IPF 1L', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 160.0000, 'MBK2IPF1', 0.0000);
INSERT INTO `productos` VALUES (36365, NULL, 'TINTA MICA IPF  1L', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 160.0000, 'MICAIPF1', 0.0000);
INSERT INTO `productos` VALUES (36366, NULL, 'TINTA MICA TM  1L', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 160.0000, 'MICATM1', 0.0000);
INSERT INTO `productos` VALUES (36367, NULL, 'TINTA MBK IPF-5 1/2L', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 80.0000, 'MBK5IPF0.5', 0.0000);
INSERT INTO `productos` VALUES (36368, NULL, 'TINTA MBK IPF-5 1L', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 160.0000, 'MBK5IPF1', 0.0000);
INSERT INTO `productos` VALUES (36369, NULL, 'CHIP DE CATUCHO DE MANTENIMIENO  MC30/31, TM200-300-305/TX3000-4000/TA20-30', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 90.0000, 'CANON MC30/31', 0.0000);
INSERT INTO `productos` VALUES (36370, NULL, 'ALMOHADILLA PARA PURGA IPF 670/770/750/780', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 18.0000, 'ALMHIPF', 0.0000);
INSERT INTO `productos` VALUES (36371, NULL, 'CABEZAL HP 727', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 430.0000, 'HP727', 0.0000);
INSERT INTO `productos` VALUES (36372, NULL, 'CABEZAL HP 729', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 482.0000, 'HP729', 0.0000);
INSERT INTO `productos` VALUES (36373, NULL, 'CHIP DE CATUCHO DE MANTENIMIENO CANON IPF770-670-750-710-810-815-820-830-840-780-785', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 90.0000, 'CANON MC10/7', 0.0000);
INSERT INTO `productos` VALUES (36374, NULL, 'CAJA DE MANTENIMIENTO DE TINTA  L6171/91/61-L14150-M1180-M3181', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 90.0000, 'EPSON L6171/91/61', 0.0000);
INSERT INTO `productos` VALUES (36375, NULL, 'CAJA DE MANTENIMIENTO MC T2170/3170/5170/3170X', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 90.0000, 'EPSON F570', 0.0000);
INSERT INTO `productos` VALUES (36376, NULL, 'TINTA DYE CIAN  EPSON T3270/5270/7270/5470/3170X', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 160.0000, 'DYECIAN1L', 0.0000);
INSERT INTO `productos` VALUES (36377, NULL, 'TINTA DYE MAGENTA  EPSON T3270/5270/7270/5470/3170X', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 160.0000, 'DYEMAGE1L', 0.0000);
INSERT INTO `productos` VALUES (36378, NULL, 'TINTA DYE YELLOW  EPSON T3270/5270/7270/5470/3170X', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 160.0000, 'DYEYELLOW1L', 0.0000);
INSERT INTO `productos` VALUES (36379, NULL, 'TINTA DYE PK-BK  EPSON T3270/5270/7270/5470/3170X', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 160.0000, 'DYEPK1L', 0.0000);
INSERT INTO `productos` VALUES (36380, NULL, 'TINTA DYE MK  EPSON T3270/5270/7270/5470/3170X', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 160.0000, 'DYEMK1L', 0.0000);
INSERT INTO `productos` VALUES (36381, NULL, 'CARTUCHO DE TINTA  RECARGABLE CIAN 260ML', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 80.0000, 'CARTCIAN26', 0.0000);
INSERT INTO `productos` VALUES (36382, NULL, 'CARTUCHO DE TINTA  RECARGABLE YELLOW 260ML', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 80.0000, 'CARTYELLOW26', 0.0000);
INSERT INTO `productos` VALUES (36383, NULL, 'CARTUCHO DE TINTA  RECARGABLE MAGENTA 260ML', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 80.0000, 'CARTMAG26', 0.0000);
INSERT INTO `productos` VALUES (36384, NULL, 'CARTUCHO DE TINTA  RECARGABLE BK 260ML', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 80.0000, 'CARTBK26', 0.0000);
INSERT INTO `productos` VALUES (36385, NULL, 'CARTUCHO DE TINTA  RECARGABLE MBK 260ML', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 80.0000, 'CARTMBK26', 0.0000);
INSERT INTO `productos` VALUES (36386, NULL, 'CARTUCHO DE TINTA ORIGINAL 120-MBK DE  130ML', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 0.0000, 'MBK120/130ML', 0.0000);
INSERT INTO `productos` VALUES (36387, NULL, 'CARTUCHO DE TINTA ORIGINAL 120-BK DE  90ML', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 95.0000, 'BK120/90ML', 0.0000);
INSERT INTO `productos` VALUES (36388, NULL, 'CARTUCHO DE TINTA ORIGINAL 120-YELLOW DE  90ML', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 95.0000, 'YELLOW120/90ML', 0.0000);
INSERT INTO `productos` VALUES (36389, NULL, 'CARTUCHO DE TINTA ORIGINAL 120-MAGENTA DE  90ML', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 95.0000, 'MAGEN120/90ML', 0.0000);
INSERT INTO `productos` VALUES (36390, NULL, 'CARTUCHO DE TINTA ORIGINAL 107-BK DE  130ML', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 0.0000, 'BK107/130ML', 0.0000);
INSERT INTO `productos` VALUES (36391, NULL, 'ROLLO DE MICA 24 PULG 30 METROS', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 120.0000, 'MICA24P', 0.0000);
INSERT INTO `productos` VALUES (36392, NULL, 'ROLLO DE MICA 36 PULG 30 METROS', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 160.0000, 'MICA36P', 0.0000);
INSERT INTO `productos` VALUES (36393, NULL, 'CHIP DE TINTA CIAN 120', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 40.0000, 'CC120', 0.0000);
INSERT INTO `productos` VALUES (36394, NULL, 'CHIP DE TINTA MAGENTA 120', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 40.0000, 'CM120', 0.0000);
INSERT INTO `productos` VALUES (36395, NULL, 'CHIP DE TINTA MBK 120', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 40.0000, 'CMBK120', 0.0000);
INSERT INTO `productos` VALUES (36396, NULL, 'CHIP DE TINTA YELLOW 120', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 40.0000, 'CY120', 0.0000);
INSERT INTO `productos` VALUES (36397, NULL, 'CHIP DE TINTA BK 120', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 40.0000, 'CBK120', 0.0000);
INSERT INTO `productos` VALUES (36398, NULL, 'CHIP DE TINTA CIAN 102', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 30.0000, 'CC102', 0.0000);
INSERT INTO `productos` VALUES (36399, NULL, 'CHIP DE TINTA BK 102', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 30.0000, 'CBK102', 0.0000);
INSERT INTO `productos` VALUES (36400, NULL, 'CHIP DE TINTA MBK 102', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 30.0000, 'CMBK102', 0.0000);
INSERT INTO `productos` VALUES (36401, NULL, 'CHIP DE TINTA BK 107', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 30.0000, 'CBK107', 0.0000);
INSERT INTO `productos` VALUES (36402, NULL, 'CHIP DE TINTA CIAN 107', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 30.0000, 'CCIAN107', 0.0000);
INSERT INTO `productos` VALUES (36403, NULL, 'CHIP DE TINTA MAGENTA 107', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 30.0000, 'CM107', 0.0000);
INSERT INTO `productos` VALUES (36404, NULL, 'CHIP DE TINTA MBK 107', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 30.0000, 'CMBK107', 0.0000);
INSERT INTO `productos` VALUES (36405, NULL, 'CHIP DE TINTA YELLOW 107', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 30.0000, 'CY107', 0.0000);
INSERT INTO `productos` VALUES (36406, NULL, 'TINTA MBK5 TM 1/2L', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 80.0000, 'MBK5TM0.5', 0.0000);
INSERT INTO `productos` VALUES (36407, NULL, 'TINTA MBK5 TM 1L', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 160.0000, 'MBK5TM1', 0.0000);
INSERT INTO `productos` VALUES (36408, NULL, 'SERVICIO DE RECARGA DE CARTUCHO DE 300 ML', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 0.0000, 'R300ML', 0.0000);
INSERT INTO `productos` VALUES (36409, NULL, 'SERVICIO DE RECARGA DE CARTUCHO DE 130 ML', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 0.0000, 'R130ML', 0.0000);
INSERT INTO `productos` VALUES (36410, NULL, 'UNIDAD DE PURGA', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 0.0000, 'UNITPURGE', 0.0000);
INSERT INTO `productos` VALUES (36411, NULL, 'UNIDAD DE CARRUAGE', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 0.0000, 'UNITCAR', 0.0000);
INSERT INTO `productos` VALUES (36412, NULL, 'filtro izquierdo ', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 18.0000, 'FIZQUI', 0.0000);
INSERT INTO `productos` VALUES (36413, NULL, 'filtro derecho ', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 18.0000, 'FDERE', 0.0000);
INSERT INTO `productos` VALUES (36414, NULL, 'YELLOW TONER DE 400GR', 125.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'T02Y4', '0', NULL, NULL, NULL, NULL, '1', 'F', 125.0000, 125.0000, 125.0000, 125.0000, 'T02Y4', 0.0000);
INSERT INTO `productos` VALUES (36415, NULL, 'MAGENTA  TONER DE 400GR', 125.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'T02M4', '0', NULL, NULL, NULL, NULL, '1', 'F', 125.0000, 125.0000, 125.0000, 125.0000, 'T02M4', 0.0000);
INSERT INTO `productos` VALUES (36416, NULL, 'CIAN TONER DE 400GR', 125.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'T02C4', '0', NULL, NULL, NULL, NULL, '1', 'F', 125.0000, 125.0000, 125.0000, 125.0000, 'T02C4', 0.0000);
INSERT INTO `productos` VALUES (36417, NULL, 'BLACK TONER DE 400GR', 125.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'T02BK4', '0', NULL, NULL, NULL, NULL, '1', 'F', 125.0000, 125.0000, 125.0000, 125.0000, 'T02BK4', 0.0000);
INSERT INTO `productos` VALUES (36418, NULL, 'YELLOW TONER 1600GR', 107.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'T02Y16', '0', NULL, NULL, NULL, NULL, '1', 'F', 107.0000, 107.0000, 107.0000, 107.0000, 'T02Y16', 0.0000);
INSERT INTO `productos` VALUES (36419, NULL, 'MAGENTA TONER 1600GR', 107.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'T02M16', '0', NULL, NULL, NULL, NULL, '1', 'F', 107.0000, 107.0000, 107.0000, 107.0000, 'T02M16', 0.0000);
INSERT INTO `productos` VALUES (36420, NULL, 'CIAN TONER 1600GR', 107.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'T02C16', '0', NULL, NULL, NULL, NULL, '1', 'F', 107.0000, 107.0000, 107.0000, 107.0000, 'T02C16', 0.0000);
INSERT INTO `productos` VALUES (36421, NULL, 'BLACK TONER 1600GR', 107.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'T02BK16', '0', NULL, NULL, NULL, NULL, '1', 'F', 107.0000, 107.0000, 107.0000, 107.0000, 'T02BK16', 0.0000);
INSERT INTO `productos` VALUES (36422, NULL, 'CABEZAL PF04', 520.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'PF04', '0', NULL, NULL, NULL, NULL, '1', 'F', 520.0000, 520.0000, 520.0000, 520.0000, 'PF04', 0.0000);
INSERT INTO `productos` VALUES (36423, NULL, 'TINTA YELLOW  IPF 1L', 160.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'YIPF1', '0', NULL, NULL, NULL, NULL, '1', 'F', 160.0000, 160.0000, 160.0000, 160.0000, 'YIPF1', 0.0000);
INSERT INTO `productos` VALUES (36424, NULL, 'TINTA MAGENTA  IPF 1L', 160.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'MIPF1', '0', NULL, NULL, NULL, NULL, '1', 'F', 160.0000, 160.0000, 160.0000, 160.0000, 'MIPF1', 0.0000);
INSERT INTO `productos` VALUES (36425, NULL, 'TINTA CIAN  IPF 1L', 160.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'CIPFL', '0', NULL, NULL, NULL, NULL, '1', 'F', 160.0000, 160.0000, 160.0000, 160.0000, 'CIPFL', 0.0000);
INSERT INTO `productos` VALUES (36426, NULL, 'TINTA BK IPF 1L', 160.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'BKIPF1', '0', NULL, NULL, NULL, NULL, '1', 'F', 160.0000, 160.0000, 160.0000, 160.0000, 'BKIPF1', 0.0000);
INSERT INTO `productos` VALUES (36427, NULL, 'TINTA MBK2 IPF 1L', 160.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'MBK2IPF1', '0', NULL, NULL, NULL, NULL, '1', 'F', 160.0000, 160.0000, 160.0000, 160.0000, 'MBK2IPF1', 0.0000);
INSERT INTO `productos` VALUES (36428, NULL, 'TINTA MICA IPF  1L', 160.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'MICAIPF1', '0', NULL, NULL, NULL, NULL, '1', 'F', 160.0000, 160.0000, 160.0000, 160.0000, 'MICAIPF1', 0.0000);
INSERT INTO `productos` VALUES (36429, NULL, 'TINTA MICA TM  1L', 160.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'MICATM1', '0', NULL, NULL, NULL, NULL, '1', 'F', 160.0000, 160.0000, 160.0000, 160.0000, 'MICATM1', 0.0000);
INSERT INTO `productos` VALUES (36430, NULL, 'TINTA MBK IPF-5 1/2L', 80.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'MBK5IPF0.5', '0', NULL, NULL, NULL, NULL, '1', 'F', 80.0000, 80.0000, 80.0000, 80.0000, 'MBK5IPF0.5', 0.0000);
INSERT INTO `productos` VALUES (36431, NULL, 'TINTA MBK IPF-5 1L', 160.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'MBK5IPF1', '0', NULL, NULL, NULL, NULL, '1', 'F', 160.0000, 160.0000, 160.0000, 160.0000, 'MBK5IPF1', 0.0000);
INSERT INTO `productos` VALUES (36432, NULL, 'CHIP DE CATUCHO DE MANTENIMIENO  MC30/31, TM200-300-305/TX3000-4000/TA20-30', 90.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'CANON MC30/31', '0', NULL, NULL, NULL, NULL, '1', 'F', 90.0000, 90.0000, 90.0000, 90.0000, 'CANON MC30/31', 0.0000);
INSERT INTO `productos` VALUES (36433, NULL, 'ALMOHADILLA PARA PURGA IPF 670/770/750/780', 18.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'ALMHIPF', '0', NULL, NULL, NULL, NULL, '1', 'F', 18.0000, 18.0000, 18.0000, 18.0000, 'ALMHIPF', 0.0000);
INSERT INTO `productos` VALUES (36434, NULL, 'CABEZAL HP 727', 430.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'HP727', '0', NULL, NULL, NULL, NULL, '1', 'F', 430.0000, 430.0000, 430.0000, 430.0000, 'HP727', 0.0000);
INSERT INTO `productos` VALUES (36435, NULL, 'CABEZAL HP 729', 482.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'HP729', '0', NULL, NULL, NULL, NULL, '1', 'F', 482.0000, 482.0000, 482.0000, 482.0000, 'HP729', 0.0000);
INSERT INTO `productos` VALUES (36436, NULL, 'CHIP DE CATUCHO DE MANTENIMIENO CANON IPF770-670-750-710-810-815-820-830-840-780-785', 90.0000, 1.0000, -1, 0, 12, 1, '1000-01-01', 'CANON MC10/7', '0', NULL, NULL, NULL, NULL, '1', 'F', 90.0000, 90.0000, 90.0000, 90.0000, 'CANON MC10/7', 0.0000);
INSERT INTO `productos` VALUES (36437, NULL, 'CAJA DE MANTENIMIENTO DE TINTA  L6171/91/61-L14150-M1180-M3181', 90.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'EPSON L6171/91/61', '0', NULL, NULL, NULL, NULL, '1', 'F', 90.0000, 90.0000, 90.0000, 90.0000, 'EPSON L6171/91/61', 0.0000);
INSERT INTO `productos` VALUES (36438, NULL, 'CAJA DE MANTENIMIENTO MC T2170/3170/5170/3170X', 90.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'EPSON F570', '0', NULL, NULL, NULL, NULL, '1', 'F', 90.0000, 90.0000, 90.0000, 90.0000, 'EPSON F570', 0.0000);
INSERT INTO `productos` VALUES (36439, NULL, 'TINTA DYE CIAN  EPSON T3270/5270/7270/5470/3170X', 160.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'DYECIAN1L', '0', NULL, NULL, NULL, NULL, '1', 'F', 160.0000, 160.0000, 160.0000, 160.0000, 'DYECIAN1L', 0.0000);
INSERT INTO `productos` VALUES (36440, NULL, 'TINTA DYE MAGENTA  EPSON T3270/5270/7270/5470/3170X', 160.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'DYEMAGE1L', '0', NULL, NULL, NULL, NULL, '1', 'F', 160.0000, 160.0000, 160.0000, 160.0000, 'DYEMAGE1L', 0.0000);
INSERT INTO `productos` VALUES (36441, NULL, 'TINTA DYE YELLOW  EPSON T3270/5270/7270/5470/3170X', 160.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'DYEYELLOW1L', '0', NULL, NULL, NULL, NULL, '1', 'F', 160.0000, 160.0000, 160.0000, 160.0000, 'DYEYELLOW1L', 0.0000);
INSERT INTO `productos` VALUES (36442, NULL, 'TINTA DYE PK-BK  EPSON T3270/5270/7270/5470/3170X', 160.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'DYEPK1L', '0', NULL, NULL, NULL, NULL, '1', 'F', 160.0000, 160.0000, 160.0000, 160.0000, 'DYEPK1L', 0.0000);
INSERT INTO `productos` VALUES (36443, NULL, 'TINTA DYE MK  EPSON T3270/5270/7270/5470/3170X', 160.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'DYEMK1L', '0', NULL, NULL, NULL, NULL, '1', 'F', 160.0000, 160.0000, 160.0000, 160.0000, 'DYEMK1L', 0.0000);
INSERT INTO `productos` VALUES (36444, NULL, 'CARTUCHO DE TINTA  RECARGABLE CIAN 260ML', 80.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'CARTCIAN26', '0', NULL, NULL, NULL, NULL, '1', 'F', 80.0000, 80.0000, 80.0000, 80.0000, 'CARTCIAN26', 0.0000);
INSERT INTO `productos` VALUES (36445, NULL, 'CARTUCHO DE TINTA  RECARGABLE YELLOW 260ML', 80.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'CARTYELLOW26', '0', NULL, NULL, NULL, NULL, '1', 'F', 80.0000, 80.0000, 80.0000, 80.0000, 'CARTYELLOW26', 0.0000);
INSERT INTO `productos` VALUES (36446, NULL, 'CARTUCHO DE TINTA  RECARGABLE MAGENTA 260ML', 80.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'CARTMAG26', '0', NULL, NULL, NULL, NULL, '1', 'F', 80.0000, 80.0000, 80.0000, 80.0000, 'CARTMAG26', 0.0000);
INSERT INTO `productos` VALUES (36447, NULL, 'CARTUCHO DE TINTA  RECARGABLE BK 260ML', 80.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'CARTBK26', '0', NULL, NULL, NULL, NULL, '1', 'F', 80.0000, 80.0000, 80.0000, 80.0000, 'CARTBK26', 0.0000);
INSERT INTO `productos` VALUES (36448, NULL, 'CARTUCHO DE TINTA  RECARGABLE MBK 260ML', 80.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'CARTMBK26', '0', NULL, NULL, NULL, NULL, '1', 'F', 80.0000, 80.0000, 80.0000, 80.0000, 'CARTMBK26', 0.0000);
INSERT INTO `productos` VALUES (36449, NULL, 'CARTUCHO DE TINTA ORIGINAL 120-MBK DE  130ML', 0.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'MBK120/130ML', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 0.0000, 'MBK120/130ML', 1.0000);
INSERT INTO `productos` VALUES (36450, NULL, 'CARTUCHO DE TINTA ORIGINAL 120-BK DE  90ML', 95.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'BK120/90ML', '0', NULL, NULL, NULL, NULL, '1', 'F', 95.0000, 95.0000, 95.0000, 95.0000, 'BK120/90ML', 0.0000);
INSERT INTO `productos` VALUES (36451, NULL, 'CARTUCHO DE TINTA ORIGINAL 120-YELLOW DE  90ML', 95.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'YELLOW120/90ML', '0', NULL, NULL, NULL, NULL, '1', 'F', 95.0000, 95.0000, 95.0000, 95.0000, 'YELLOW120/90ML', 0.0000);
INSERT INTO `productos` VALUES (36452, NULL, 'CARTUCHO DE TINTA ORIGINAL 120-MAGENTA DE  90ML', 95.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'MAGEN120/90ML', '0', NULL, NULL, NULL, NULL, '1', 'F', 95.0000, 95.0000, 95.0000, 95.0000, 'MAGEN120/90ML', 0.0000);
INSERT INTO `productos` VALUES (36453, NULL, 'CARTUCHO DE TINTA ORIGINAL 107-BK DE  130ML', 0.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'BK107/130ML', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 0.0000, 'BK107/130ML', 1.0000);
INSERT INTO `productos` VALUES (36454, NULL, 'ROLLO DE MICA 24 PULG 30 METROS', 120.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'MICA24P', '0', NULL, NULL, NULL, NULL, '1', 'F', 120.0000, 120.0000, 120.0000, 120.0000, 'MICA24P', 0.0000);
INSERT INTO `productos` VALUES (36455, NULL, 'ROLLO DE MICA 36 PULG 30 METROS', 160.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'MICA36P', '0', NULL, NULL, NULL, NULL, '1', 'F', 160.0000, 160.0000, 160.0000, 160.0000, 'MICA36P', 0.0000);
INSERT INTO `productos` VALUES (36456, NULL, 'CHIP DE TINTA CIAN 120', 40.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'CC120', '0', NULL, NULL, NULL, NULL, '1', 'F', 40.0000, 40.0000, 40.0000, 40.0000, 'CC120', 0.0000);
INSERT INTO `productos` VALUES (36457, NULL, 'CHIP DE TINTA MAGENTA 120', 40.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'CM120', '0', NULL, NULL, NULL, NULL, '1', 'F', 40.0000, 40.0000, 40.0000, 40.0000, 'CM120', 0.0000);
INSERT INTO `productos` VALUES (36458, NULL, 'CHIP DE TINTA MBK 120', 40.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'CMBK120', '0', NULL, NULL, NULL, NULL, '1', 'F', 40.0000, 40.0000, 40.0000, 40.0000, 'CMBK120', 0.0000);
INSERT INTO `productos` VALUES (36459, NULL, 'CHIP DE TINTA YELLOW 120', 40.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'CY120', '0', NULL, NULL, NULL, NULL, '1', 'F', 40.0000, 40.0000, 40.0000, 40.0000, 'CY120', 0.0000);
INSERT INTO `productos` VALUES (36460, NULL, 'CHIP DE TINTA BK 120', 40.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'CBK120', '0', NULL, NULL, NULL, NULL, '1', 'F', 40.0000, 40.0000, 40.0000, 40.0000, 'CBK120', 0.0000);
INSERT INTO `productos` VALUES (36461, NULL, 'CHIP DE TINTA CIAN 102', 30.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'CC102', '0', NULL, NULL, NULL, NULL, '1', 'F', 30.0000, 30.0000, 30.0000, 30.0000, 'CC102', 0.0000);
INSERT INTO `productos` VALUES (36462, NULL, 'CHIP DE TINTA BK 102', 30.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'CBK102', '0', NULL, NULL, NULL, NULL, '1', 'F', 30.0000, 30.0000, 30.0000, 30.0000, 'CBK102', 0.0000);
INSERT INTO `productos` VALUES (36463, NULL, 'CHIP DE TINTA MBK 102', 30.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'CMBK102', '0', NULL, NULL, NULL, NULL, '1', 'F', 30.0000, 30.0000, 30.0000, 30.0000, 'CMBK102', 0.0000);
INSERT INTO `productos` VALUES (36464, NULL, 'CHIP DE TINTA BK 107', 30.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'CBK107', '0', NULL, NULL, NULL, NULL, '1', 'F', 30.0000, 30.0000, 30.0000, 30.0000, 'CBK107', 0.0000);
INSERT INTO `productos` VALUES (36465, NULL, 'CHIP DE TINTA CIAN 107', 30.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'CCIAN107', '0', NULL, NULL, NULL, NULL, '1', 'F', 30.0000, 30.0000, 30.0000, 30.0000, 'CCIAN107', 0.0000);
INSERT INTO `productos` VALUES (36466, NULL, 'CHIP DE TINTA MAGENTA 107', 30.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'CM107', '0', NULL, NULL, NULL, NULL, '1', 'F', 30.0000, 30.0000, 30.0000, 30.0000, 'CM107', 0.0000);
INSERT INTO `productos` VALUES (36467, NULL, 'CHIP DE TINTA MBK 107', 30.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'CMBK107', '0', NULL, NULL, NULL, NULL, '1', 'F', 30.0000, 30.0000, 30.0000, 30.0000, 'CMBK107', 0.0000);
INSERT INTO `productos` VALUES (36468, NULL, 'CHIP DE TINTA YELLOW 107', 30.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'CY107', '0', NULL, NULL, NULL, NULL, '1', 'F', 30.0000, 30.0000, 30.0000, 30.0000, 'CY107', 0.0000);
INSERT INTO `productos` VALUES (36469, NULL, 'TINTA MBK5 TM 1/2L', 80.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'MBK5TM0.5', '0', NULL, NULL, NULL, NULL, '1', 'F', 80.0000, 80.0000, 80.0000, 80.0000, 'MBK5TM0.5', 0.0000);
INSERT INTO `productos` VALUES (36470, NULL, 'TINTA MBK5 TM 1L', 160.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'MBK5TM1', '0', NULL, NULL, NULL, NULL, '1', 'F', 160.0000, 160.0000, 160.0000, 160.0000, 'MBK5TM1', 0.0000);
INSERT INTO `productos` VALUES (36471, NULL, 'SERVICIO DE RECARGA DE CARTUCHO DE 300 ML', 0.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'R300ML', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 0.0000, 'R300ML', 1.0000);
INSERT INTO `productos` VALUES (36472, NULL, 'SERVICIO DE RECARGA DE CARTUCHO DE 130 ML', 0.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'R130ML', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 0.0000, 'R130ML', 1.0000);
INSERT INTO `productos` VALUES (36473, NULL, 'UNIDAD DE PURGA', 0.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'UNITPURGE', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 0.0000, 'UNITPURGE', 1.0000);
INSERT INTO `productos` VALUES (36474, NULL, 'UNIDAD DE CARRUAGE', 0.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'UNITCAR', '0', NULL, NULL, NULL, NULL, '1', 'F', 0.0000, 0.0000, 0.0000, 0.0000, 'UNITCAR', 1.0000);
INSERT INTO `productos` VALUES (36475, NULL, 'filtro izquierdo ', 18.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'FIZQUI', '0', NULL, NULL, NULL, NULL, '1', 'F', 18.0000, 18.0000, 18.0000, 18.0000, 'FIZQUI', 0.0000);
INSERT INTO `productos` VALUES (36476, NULL, 'filtro derecho ', 18.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'FDERE', '0', NULL, NULL, NULL, NULL, '1', 'F', 18.0000, 18.0000, 18.0000, 18.0000, 'FDERE', 0.0000);
INSERT INTO `productos` VALUES (36477, NULL, 'YELLOW TONER DE 400GR', 125.0000, 1.0000, 0, 0, 12, 1, '1000-01-01', 'T02Y4', '0', NULL, NULL, NULL, NULL, '0', '1', 125.0000, 125.0000, 125.0000, 125.0000, 'T02Y4', NULL);
INSERT INTO `productos` VALUES (36478, NULL, 'MAGENTA  TONER DE 400GR', 125.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'T02M4', '0', NULL, NULL, NULL, NULL, '0', '1', 125.0000, 125.0000, 125.0000, 125.0000, 'T02M4', NULL);
INSERT INTO `productos` VALUES (36479, NULL, 'CIAN TONER DE 400GR', 125.0000, 1.0000, 0, 0, 12, 1, '1000-01-01', 'T02C4', '0', NULL, NULL, NULL, NULL, '0', '1', 125.0000, 125.0000, 125.0000, 125.0000, 'T02C4', NULL);
INSERT INTO `productos` VALUES (36480, NULL, 'BLACK TONER DE 400GR', 125.0000, 1.0000, -2, 0, 12, 1, '1000-01-01', 'T02BK4', '0', NULL, NULL, NULL, NULL, '0', '1', 125.0000, 125.0000, 125.0000, 125.0000, 'T02BK4', NULL);
INSERT INTO `productos` VALUES (36481, NULL, 'YELLOW TONER 1600GR', 107.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'T02Y16', '0', NULL, NULL, NULL, NULL, '0', '1', 107.0000, 107.0000, 107.0000, 107.0000, 'T02Y16', NULL);
INSERT INTO `productos` VALUES (36482, NULL, 'MAGENTA TONER 1600GR', 107.0000, 1.0000, 0, 0, 12, 1, '1000-01-01', 'T02M16', '0', NULL, NULL, NULL, NULL, '0', '1', 107.0000, 107.0000, 107.0000, 107.0000, 'T02M16', NULL);
INSERT INTO `productos` VALUES (36483, NULL, 'CIAN TONER 1600GR', 107.0000, 1.0000, 0, 0, 12, 1, '1000-01-01', 'T02C16', '0', NULL, NULL, NULL, NULL, '0', '1', 107.0000, 107.0000, 107.0000, 107.0000, 'T02C16', NULL);
INSERT INTO `productos` VALUES (36484, NULL, 'BLACK TONER 1600GR', 107.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'T02BK16', '0', NULL, NULL, NULL, NULL, '0', '1', 107.0000, 107.0000, 107.0000, 107.0000, 'T02BK16', NULL);
INSERT INTO `productos` VALUES (36485, NULL, 'CABEZAL PF04', 520.0000, 1.0000, 9, 0, 12, 1, '1000-01-01', 'PF04', '0', NULL, NULL, NULL, NULL, '0', '1', 520.0000, 520.0000, 520.0000, 520.0000, 'PF04', NULL);
INSERT INTO `productos` VALUES (36486, NULL, 'TINTA YELLOW  IPF 1L', 160.0000, 1.0000, 0, 0, 12, 1, '1000-01-01', 'YIPF1', '0', NULL, NULL, NULL, NULL, '0', '1', 160.0000, 160.0000, 160.0000, 160.0000, 'YIPF1', NULL);
INSERT INTO `productos` VALUES (36487, NULL, 'TINTA MAGENTA  IPF 1L', 160.0000, 1.0000, -1, 0, 12, 1, '1000-01-01', 'MIPF1', '0', NULL, NULL, NULL, NULL, '0', '1', 160.0000, 160.0000, 160.0000, 160.0000, 'MIPF1', NULL);
INSERT INTO `productos` VALUES (36488, NULL, 'TINTA CIAN  IPF 1L', 160.0000, 1.0000, 0, 0, 12, 1, '1000-01-01', 'CIPFL', '0', NULL, NULL, NULL, NULL, '0', '1', 160.0000, 160.0000, 160.0000, 160.0000, 'CIPFL', NULL);
INSERT INTO `productos` VALUES (36489, NULL, 'TINTA BK IPF 1L', 160.0000, 1.0000, -1, 0, 12, 1, '1000-01-01', 'BKIPF1', '0', NULL, NULL, NULL, NULL, '0', '1', 160.0000, 160.0000, 160.0000, 160.0000, 'BKIPF1', NULL);
INSERT INTO `productos` VALUES (36490, NULL, 'TINTA MBK2 IPF 1L', 160.0000, 1.0000, -1, 0, 12, 1, '1000-01-01', 'MBK2IPF1', '0', NULL, NULL, NULL, NULL, '0', '1', 160.0000, 160.0000, 160.0000, 160.0000, 'MBK2IPF1', NULL);
INSERT INTO `productos` VALUES (36491, NULL, 'TINTA MICA IPF  1L', 160.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'MICAIPF1', '0', NULL, NULL, NULL, NULL, '0', '1', 160.0000, 160.0000, 160.0000, 160.0000, 'MICAIPF1', NULL);
INSERT INTO `productos` VALUES (36492, NULL, 'TINTA MICA TM  1L', 160.0000, 1.0000, 0, 0, 12, 1, '1000-01-01', 'MICATM1', '0', NULL, NULL, NULL, NULL, '0', '1', 160.0000, 160.0000, 160.0000, 160.0000, 'MICATM1', NULL);
INSERT INTO `productos` VALUES (36493, NULL, 'TINTA MBK IPF-5 1/2L', 80.0000, 1.0000, -1, 0, 12, 1, '1000-01-01', 'MBK5IPF0.5', '0', NULL, NULL, NULL, NULL, '0', '1', 80.0000, 80.0000, 80.0000, 80.0000, 'MBK5IPF0.5', NULL);
INSERT INTO `productos` VALUES (36494, NULL, 'TINTA MBK IPF-5 1L', 160.0000, 1.0000, -1, 0, 12, 1, '1000-01-01', 'MBK5IPF1', '0', NULL, NULL, NULL, NULL, '0', '1', 160.0000, 160.0000, 160.0000, 160.0000, 'MBK5IPF1', NULL);
INSERT INTO `productos` VALUES (36495, NULL, 'CHIP DE CATUCHO DE MANTENIMIENO  MC30/31, TM200-300-305/TX3000-4000/TA20-30', 90.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'CANON MC30/31', '0', NULL, NULL, NULL, NULL, '0', '1', 90.0000, 90.0000, 90.0000, 90.0000, 'CANON MC30/31', NULL);
INSERT INTO `productos` VALUES (36496, NULL, 'ALMOHADILLA PARA PURGA IPF 670/770/750/780', 18.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'ALMHIPF', '0', NULL, NULL, NULL, NULL, '0', '1', 18.0000, 18.0000, 18.0000, 18.0000, 'ALMHIPF', NULL);
INSERT INTO `productos` VALUES (36497, NULL, 'CABEZAL HP 727', 430.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'HP727', '0', NULL, NULL, NULL, NULL, '0', '1', 430.0000, 430.0000, 430.0000, 430.0000, 'HP727', NULL);
INSERT INTO `productos` VALUES (36498, NULL, 'CABEZAL HP 729', 482.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'HP729', '0', NULL, NULL, NULL, NULL, '0', '1', 482.0000, 482.0000, 482.0000, 482.0000, 'HP729', NULL);
INSERT INTO `productos` VALUES (36499, NULL, 'CHIP DE CATUCHO DE MANTENIMIENO CANON IPF770-670-750-710-810-815-820-830-840-780-785', 90.0000, 1.0000, -2, 0, 12, 1, '1000-01-01', 'CANON MC10/7', '0', NULL, NULL, NULL, NULL, '0', '1', 90.0000, 90.0000, 90.0000, 90.0000, 'CANON MC10/7', NULL);
INSERT INTO `productos` VALUES (36500, NULL, 'CAJA DE MANTENIMIENTO DE TINTA  L6171/91/61-L14150-M1180-M3181', 90.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'EPSON L6171/91/61', '0', NULL, NULL, NULL, NULL, '0', '1', 90.0000, 90.0000, 90.0000, 90.0000, 'EPSON L6171/91/61', NULL);
INSERT INTO `productos` VALUES (36501, NULL, 'CAJA DE MANTENIMIENTO MC T2170/3170/5170/3170X', 90.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'EPSON F570', '0', NULL, NULL, NULL, NULL, '0', '1', 90.0000, 90.0000, 90.0000, 90.0000, 'EPSON F570', NULL);
INSERT INTO `productos` VALUES (36502, NULL, 'TINTA DYE CIAN  EPSON T3270/5270/7270/5470/3170X', 160.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'DYECIAN1L', '0', NULL, NULL, NULL, NULL, '0', '1', 160.0000, 160.0000, 160.0000, 160.0000, 'DYECIAN1L', NULL);
INSERT INTO `productos` VALUES (36503, NULL, 'TINTA DYE MAGENTA  EPSON T3270/5270/7270/5470/3170X', 160.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'DYEMAGE1L', '0', NULL, NULL, NULL, NULL, '0', '1', 160.0000, 160.0000, 160.0000, 160.0000, 'DYEMAGE1L', NULL);
INSERT INTO `productos` VALUES (36504, NULL, 'TINTA DYE YELLOW  EPSON T3270/5270/7270/5470/3170X', 160.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'DYEYELLOW1L', '0', NULL, NULL, NULL, NULL, '0', '1', 160.0000, 160.0000, 160.0000, 160.0000, 'DYEYELLOW1L', NULL);
INSERT INTO `productos` VALUES (36505, NULL, 'TINTA DYE PK-BK  EPSON T3270/5270/7270/5470/3170X', 160.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'DYEPK1L', '0', NULL, NULL, NULL, NULL, '0', '1', 160.0000, 160.0000, 160.0000, 160.0000, 'DYEPK1L', NULL);
INSERT INTO `productos` VALUES (36506, NULL, 'TINTA DYE MK  EPSON T3270/5270/7270/5470/3170X', 160.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'DYEMK1L', '0', NULL, NULL, NULL, NULL, '0', '1', 160.0000, 160.0000, 160.0000, 160.0000, 'DYEMK1L', NULL);
INSERT INTO `productos` VALUES (36507, NULL, 'CARTUCHO DE TINTA  RECARGABLE CIAN 260ML', 80.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'CARTCIAN26', '0', NULL, NULL, NULL, NULL, '0', '1', 80.0000, 80.0000, 80.0000, 80.0000, 'CARTCIAN26', NULL);
INSERT INTO `productos` VALUES (36508, NULL, 'CARTUCHO DE TINTA  RECARGABLE YELLOW 260ML', 80.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'CARTYELLOW26', '0', NULL, NULL, NULL, NULL, '0', '1', 80.0000, 80.0000, 80.0000, 80.0000, 'CARTYELLOW26', NULL);
INSERT INTO `productos` VALUES (36509, NULL, 'CARTUCHO DE TINTA  RECARGABLE MAGENTA 260ML', 80.0000, 1.0000, 0, 0, 12, 1, '1000-01-01', 'CARTMAG26', '0', NULL, NULL, NULL, NULL, '0', '1', 80.0000, 80.0000, 80.0000, 80.0000, 'CARTMAG26', NULL);
INSERT INTO `productos` VALUES (36510, NULL, 'CARTUCHO DE TINTA  RECARGABLE BK 260ML', 80.0000, 1.0000, 0, 0, 12, 1, '1000-01-01', 'CARTBK26', '0', NULL, NULL, NULL, NULL, '0', '1', 80.0000, 80.0000, 80.0000, 80.0000, 'CARTBK26', NULL);
INSERT INTO `productos` VALUES (36511, NULL, 'CARTUCHO DE TINTA  RECARGABLE MBK 260ML', 80.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'CARTMBK26', '0', NULL, NULL, NULL, NULL, '0', '1', 80.0000, 80.0000, 80.0000, 80.0000, 'CARTMBK26', NULL);
INSERT INTO `productos` VALUES (36512, NULL, 'CARTUCHO DE TINTA ORIGINAL 120-MBK DE  130ML', 0.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'MBK120/130ML', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 0.0000, 'MBK120/130ML', NULL);
INSERT INTO `productos` VALUES (36513, NULL, 'CARTUCHO DE TINTA ORIGINAL 120-BK DE  90ML', 95.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'BK120/90ML', '0', NULL, NULL, NULL, NULL, '0', '1', 95.0000, 95.0000, 95.0000, 95.0000, 'BK120/90ML', NULL);
INSERT INTO `productos` VALUES (36514, NULL, 'CARTUCHO DE TINTA ORIGINAL 120-YELLOW DE  90ML', 95.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'YELLOW120/90ML', '0', NULL, NULL, NULL, NULL, '0', '1', 95.0000, 95.0000, 95.0000, 95.0000, 'YELLOW120/90ML', NULL);
INSERT INTO `productos` VALUES (36515, NULL, 'CARTUCHO DE TINTA ORIGINAL 120-MAGENTA DE  90ML', 95.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'MAGEN120/90ML', '0', NULL, NULL, NULL, NULL, '0', '1', 95.0000, 95.0000, 95.0000, 95.0000, 'MAGEN120/90ML', NULL);
INSERT INTO `productos` VALUES (36516, NULL, 'CARTUCHO DE TINTA ORIGINAL 107-BK DE  130ML', 0.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'BK107/130ML', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 0.0000, 'BK107/130ML', NULL);
INSERT INTO `productos` VALUES (36517, NULL, 'ROLLO DE MICA 24 PULG 30 METROS', 120.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'MICA24P', '0', NULL, NULL, NULL, NULL, '0', '1', 120.0000, 120.0000, 120.0000, 120.0000, 'MICA24P', NULL);
INSERT INTO `productos` VALUES (36518, NULL, 'ROLLO DE MICA 36 PULG 30 METROS', 160.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'MICA36P', '0', NULL, NULL, NULL, NULL, '0', '1', 160.0000, 160.0000, 160.0000, 160.0000, 'MICA36P', NULL);
INSERT INTO `productos` VALUES (36519, NULL, 'CHIP DE TINTA CIAN 120', 40.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'CC120', '0', NULL, NULL, NULL, NULL, '0', '1', 40.0000, 40.0000, 40.0000, 40.0000, 'CC120', NULL);
INSERT INTO `productos` VALUES (36520, NULL, 'CHIP DE TINTA MAGENTA 120', 40.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'CM120', '0', NULL, NULL, NULL, NULL, '0', '1', 40.0000, 40.0000, 40.0000, 40.0000, 'CM120', NULL);
INSERT INTO `productos` VALUES (36521, NULL, 'CHIP DE TINTA MBK 120', 40.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'CMBK120', '0', NULL, NULL, NULL, NULL, '0', '1', 40.0000, 40.0000, 40.0000, 40.0000, 'CMBK120', NULL);
INSERT INTO `productos` VALUES (36522, NULL, 'CHIP DE TINTA YELLOW 120', 40.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'CY120', '0', NULL, NULL, NULL, NULL, '0', '1', 40.0000, 40.0000, 40.0000, 40.0000, 'CY120', NULL);
INSERT INTO `productos` VALUES (36523, NULL, 'CHIP DE TINTA BK 120', 40.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'CBK120', '0', NULL, NULL, NULL, NULL, '0', '1', 40.0000, 40.0000, 40.0000, 40.0000, 'CBK120', NULL);
INSERT INTO `productos` VALUES (36524, NULL, 'CHIP DE TINTA CIAN 102', 30.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'CC102', '0', NULL, NULL, NULL, NULL, '0', '1', 30.0000, 30.0000, 30.0000, 30.0000, 'CC102', NULL);
INSERT INTO `productos` VALUES (36525, NULL, 'CHIP DE TINTA BK 102', 30.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'CBK102', '0', NULL, NULL, NULL, NULL, '0', '1', 30.0000, 30.0000, 30.0000, 30.0000, 'CBK102', NULL);
INSERT INTO `productos` VALUES (36526, NULL, 'CHIP DE TINTA MBK 102', 30.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'CMBK102', '0', NULL, NULL, NULL, NULL, '0', '1', 30.0000, 30.0000, 30.0000, 30.0000, 'CMBK102', NULL);
INSERT INTO `productos` VALUES (36527, NULL, 'CHIP DE TINTA BK 107', 30.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'CBK107', '0', NULL, NULL, NULL, NULL, '0', '1', 30.0000, 30.0000, 30.0000, 30.0000, 'CBK107', NULL);
INSERT INTO `productos` VALUES (36528, '', 'CHIP DE TINTA CIAN 107', 30.0000, 17.3300, 0, 0, 12, 1, '1000-01-01', 'CCIAN107', '0', 30.0000, 30.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '0', '1', 30.0000, 30.0000, 30.0000, 30.0000, 'CCIAN107', 0.0000);
INSERT INTO `productos` VALUES (36529, '', 'CARTUCHO ORIGINAL DE  TINTA MAGENTA 107 DE 90 ML', 30.0000, 17.3300, 0, 0, 12, 1, '1000-01-01', 'CM107', '0', 30.0000, 30.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '1', '1', 30.0000, 30.0000, 30.0000, 30.0000, 'M107/90', 0.0000);
INSERT INTO `productos` VALUES (36530, '', 'CARTUCHO ORIGINAL DE TINTA MBK 107 DE 90 ML', 30.0000, 17.3300, 0, 0, 12, 1, '1000-01-01', 'CMBK107', '0', 30.0000, 30.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '1', '1', 30.0000, 30.0000, 30.0000, 30.0000, 'MBK107/90', 0.0000);
INSERT INTO `productos` VALUES (36531, '', 'CARTUCHO ORIGINAL DE TINTA YELLOW 107 DE 90 ML', 30.0000, 17.3300, 0, 0, 12, 1, '1000-01-01', 'CY107', '0', 30.0000, 30.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '1', '1', 30.0000, 30.0000, 30.0000, 30.0000, 'Y107/90', 0.0000);
INSERT INTO `productos` VALUES (36532, '', 'TINTA MBK5 TM 1/2L', 80.0000, 40.0000, 1, 0, 12, 1, '1000-01-01', 'MBK5TM0.5', '0', 80.0000, 80.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '0', '1', 80.0000, 80.0000, 80.0000, 80.0000, 'MBK5TM0.5', NULL);
INSERT INTO `productos` VALUES (36533, '', 'TINTA MBK5 TM 1L', 160.0000, 80.0000, 1, 0, 12, 1, '1000-01-01', 'MBK5TM1', '0', 160.0000, 160.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '0', '1', 160.0000, 160.0000, 160.0000, 160.0000, 'MBK5TM1', NULL);
INSERT INTO `productos` VALUES (36534, NULL, 'SERVICIO DE RECARGA DE CARTUCHO DE 300 ML', 0.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'R300ML', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 0.0000, 'R300ML', NULL);
INSERT INTO `productos` VALUES (36535, NULL, 'SERVICIO DE RECARGA DE CARTUCHO DE 130 ML', 0.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'R130ML', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 0.0000, 'R130ML', NULL);
INSERT INTO `productos` VALUES (36536, NULL, 'UNIDAD DE PURGA', 0.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'UNITPURGE', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 0.0000, 'UNITPURGE', NULL);
INSERT INTO `productos` VALUES (36537, NULL, 'UNIDAD DE CARRUAGE', 0.0000, 1.0000, 1, 0, 12, 1, '1000-01-01', 'UNITCAR', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 0.0000, 'UNITCAR', NULL);
INSERT INTO `productos` VALUES (36538, '', 'filtro izquierdo ', 18.0000, 15.0000, 0, 0, 12, 1, '1000-01-01', 'FIZQUI', '0', 18.0000, 18.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '0', '1', 18.0000, 18.0000, 18.0000, 18.0000, 'FIZQUI', 0.0000);
INSERT INTO `productos` VALUES (36539, '', 'filtro derecho ', 18.0000, 15.0000, 0, 0, 12, 1, '1000-01-01', 'FDERE', '0', 18.0000, 18.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '0', '1', 18.0000, 18.0000, 18.0000, 18.0000, 'FDERE', 0.0000);
INSERT INTO `productos` VALUES (36540, NULL, 'YELLOW TONER DE 400GR', 0.0000, 100.0000, 7, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 125.0000, 'T02Y4', NULL);
INSERT INTO `productos` VALUES (36541, NULL, 'MAGENTA  TONER DE 400GR', 0.0000, 100.0000, 9, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 125.0000, 'T02M4', NULL);
INSERT INTO `productos` VALUES (36542, NULL, 'CIAN TONER DE 400GR', 0.0000, 100.0000, 9, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 125.0000, 'T02C4', NULL);
INSERT INTO `productos` VALUES (36543, NULL, 'BLACK TONER DE 400GR', 0.0000, 100.0000, 6, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 125.0000, 'T02BK4', NULL);
INSERT INTO `productos` VALUES (36544, NULL, 'YELLOW TONER 1600GR', 0.0000, 360.8400, 10, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 107.0000, 'T02Y16', NULL);
INSERT INTO `productos` VALUES (36545, NULL, 'MAGENTA TONER 1600GR', 0.0000, 360.8400, 10, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 107.0000, 'T02M16', NULL);
INSERT INTO `productos` VALUES (36546, NULL, 'CIAN TONER 1600GR', 0.0000, 360.8400, 9, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 107.0000, 'T02C16', NULL);
INSERT INTO `productos` VALUES (36547, NULL, 'BLACK TONER 1600GR', 0.0000, 360.8400, 10, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 107.0000, 'T02BK16', NULL);
INSERT INTO `productos` VALUES (36548, '', 'CABEZAL PF04', 550.0000, 426.4300, 17, 0, 12, 1, '1000-01-01', '', '0', 550.0000, 550.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 2.0000, 550.0000, 530.0000, 520.0000, 'PF04', 0.0000);
INSERT INTO `productos` VALUES (36549, '', 'TINTA YELLOW  IPF 1L', 160.0000, 0.0000, 8, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, 160.0000, 'YIPF1', 80.0000);
INSERT INTO `productos` VALUES (36550, '', 'TINTA MAGENTA  IPF 1L', 160.0000, 0.0000, 5, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, 160.0000, 'MIPF1', 80.0000);
INSERT INTO `productos` VALUES (36551, '', 'TINTA CIAN  IPF 1L', 160.0000, 0.0000, 7, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, 160.0000, 'CIPFL', 80.0000);
INSERT INTO `productos` VALUES (36552, '', 'TINTA BK IPF 1L', 160.0000, 0.0000, 7, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, 160.0000, 'BKIPF1', 80.0000);
INSERT INTO `productos` VALUES (36553, '', 'TINTA MBK2 IPF 1L', 160.0000, 0.0000, 4, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, 160.0000, 'MBK2IPF1', 80.0000);
INSERT INTO `productos` VALUES (36554, '', 'TINTA MICA IPF  1L', 120.0000, 0.0000, 8, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 100.0000, 0.0000, 90.0000, 120.0000, 'MICAIPF1', 80.0000);
INSERT INTO `productos` VALUES (36555, '', 'TINTA MICA TM 1L', 120.0000, 0.0000, 3, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, 120.0000, 'MICATM1', 80.0000);
INSERT INTO `productos` VALUES (36556, '', 'TINTA MBK5 IPf 1/2L', 80.0000, 0.0000, 12, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, 80.0000, 'MBK5IPF0.5', 40.0000);
INSERT INTO `productos` VALUES (36557, '', 'TINTA MBK5 IPF 1L', 160.0000, 0.0000, 7, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'KANAKO PRINTCOPY S.A.C.', '0', '1', '1', 0.0000, 0.0000, 0.0000, 160.0000, 'MBK5IPF1', 80.0000);
INSERT INTO `productos` VALUES (36558, '', 'CHIP DE CATUCHO DE MANTENIMIENO  MC30/31, TM200-300-305/TX3000-4000/TA20-30', 90.0000, 8.3600, 88, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, 90.0000, 'CANON MC30/31', 0.0000);
INSERT INTO `productos` VALUES (36559, '', 'ALMOHADILLA PARA PURGA IPF 670/770/750/780', 0.0000, 15.0000, 10, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'KANAKO PRINTCOPY S.A.C.', '0', '1', '1', 0.0000, 18.0000, 0.0000, 18.0000, 'ALMHIPF', 0.0000);
INSERT INTO `productos` VALUES (36560, '', 'CABEZAL HP 727', 0.0000, 357.6300, 5, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'KANAKO PRINTCOPY S.A.C.', '0', '1', '1', 0.0000, 430.0000, 0.0000, 0.0000, 'HP727', 0.0000);
INSERT INTO `productos` VALUES (36561, '', 'CABEZAL HP 729', 482.0000, 467.6500, 5, 0, 12, 1, '1000-01-01', '', '0', 482.0000, 482.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, 482.0000, 'HP729', 0.0000);
INSERT INTO `productos` VALUES (36562, '', 'CHIP DE CATUCHO DE MANTENIMIENO CANON IPF770-670-750-710-810-815-820-830-840-780-785', 90.0000, 7.6000, 69, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, 90.0000, 'CANON MC10/7', 0.0000);
INSERT INTO `productos` VALUES (36563, '', 'CAJA DE MANTENIMIENTO DE TINTA  L6171/91/61-L14150-M1180-M3181', 90.0000, 5.7000, 10, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'KANAKO PRINTCOPY S.A.C.', '0', '1', '1', 0.0000, 0.0000, 0.0000, 90.0000, 'EPSON L6171/91/61', 0.0000);
INSERT INTO `productos` VALUES (36564, NULL, 'CAJA DE MANTENIMIENTO MC T2170/3170/5170/3170X', 90.0000, 5.7000, 10, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, 'KANAKO PRINTCOPY S.A.C.', NULL, '1', '1', 0.0000, 0.0000, 0.0000, 90.0000, 'EPSON F570', 5.7000);
INSERT INTO `productos` VALUES (36565, '', 'TINTA DYE CIAN  EPSON T3270/5270/7270/5470/3170X', 160.0000, 0.0000, 10, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, 160.0000, 'DYECIAN1L', 79.4100);
INSERT INTO `productos` VALUES (36566, '', 'TINTA DYE MAGENTA  EPSON T3270/5270/7270/5470/3170X', 160.0000, 0.0000, 10, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'KANAKO PRINTCOPY S.A.C.', '0', '1', '1', 0.0000, 0.0000, 0.0000, 160.0000, 'DYEMAGE1L', 79.4100);
INSERT INTO `productos` VALUES (36567, '', 'TINTA DYE YELLOW  EPSON T3270/5270/7270/5470/3170X', 160.0000, 0.0000, 10, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'KANAKO PRINTCOPY S.A.C.', '0', '1', '1', 0.0000, 0.0000, 0.0000, 160.0000, 'DYEYELLOW1L', 79.4100);
INSERT INTO `productos` VALUES (36568, '', 'TINTA DYE PK-BK  EPSON T3270/5270/7270/5470/3170X', 160.0000, 0.0000, 10, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'KANAKO PRINTCOPY S.A.C.', '0', '1', '1', 0.0000, 0.0000, 0.0000, 160.0000, 'DYEPK1L', 79.4100);
INSERT INTO `productos` VALUES (36569, '', 'TINTA DYE MK  EPSON T3270/5270/7270/5470/3170X', 160.0000, 0.0000, 10, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'KANAKO PRINTCOPY S.A.C.', '0', '1', '1', 0.0000, 0.0000, 0.0000, 160.0000, 'DYEMK1L', 79.4100);
INSERT INTO `productos` VALUES (36570, '', 'CARTUCHO DE TINTA  RECARGABLE CIAN 260ML', 80.0000, 0.0000, 14, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'KANAKO PRINTCOPY S.A.C.', '0', '1', '1', 0.0000, 0.0000, 0.0000, 80.0000, 'CARTCIAN26', 15.0000);
INSERT INTO `productos` VALUES (36571, '', 'CARTUCHO DE TINTA  RECARGABLE YELLOW 260ML', 80.0000, 0.0000, 10, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'KANAKO PRINTCOPY S.A.C.', '0', '1', '1', 0.0000, 0.0000, 0.0000, 80.0000, 'CARTYELLOW26', 15.0000);
INSERT INTO `productos` VALUES (36572, '', 'CARTUCHO DE TINTA  RECARGABLE MAGENTA 260ML', 80.0000, 0.0000, 10, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'KANAKO PRINTCOPY S.A.C.', '0', '1', '1', 0.0000, 0.0000, 0.0000, 80.0000, 'CARTMAG26', 15.0000);
INSERT INTO `productos` VALUES (36573, '', 'CARTUCHO DE TINTA  RECARGABLE BK 260ML', 80.0000, 0.0000, 9, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'KANAKO PRINTCOPY S.A.C.', '0', '1', '1', 0.0000, 0.0000, 0.0000, 80.0000, 'CARTBK26', 15.0000);
INSERT INTO `productos` VALUES (36574, '', 'CARTUCHO DE TINTA  RECARGABLE MBK 260ML', 80.0000, 0.0000, 13, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'KANAKO PRINTCOPY S.A.C.', '0', '1', '1', 0.0000, 0.0000, 0.0000, 80.0000, 'CARTMBK26', 15.0000);
INSERT INTO `productos` VALUES (36575, '', 'CARTUCHO DE TINTA ORIGINAL 120-MBK DE  90ML', 95.0000, 46.0000, 7, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'KANAKO PRINTCOPY S.A.C.', '0', '1', '1', 0.0000, 0.0000, 0.0000, 0.0000, 'MBK120/130ML', 0.0000);
INSERT INTO `productos` VALUES (36576, '', 'CARTUCHO DE TINTA ORIGINAL 120-BK DE  90ML', 95.0000, 46.0000, 8, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'KANAKO PRINTCOPY S.A.C.', '0', '1', '1', 0.0000, 0.0000, 0.0000, 95.0000, 'BK120/90ML', 0.0000);
INSERT INTO `productos` VALUES (36577, '', 'CARTUCHO DE TINTA ORIGINAL 120-YELLOW DE  90ML', 95.0000, 46.0000, 7, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'KANAKO PRINTCOPY S.A.C.', '0', '1', '1', 0.0000, 0.0000, 0.0000, 95.0000, 'YELLOW120/90ML', 0.0000);
INSERT INTO `productos` VALUES (36578, '', 'CARTUCHO DE TINTA ORIGINAL 120-MAGENTA DE  90ML', 95.0000, 46.0000, 7, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'KANAKO PRINTCOPY S.A.C.', '0', '1', '1', 0.0000, 0.0000, 0.0000, 95.0000, 'MAGEN120/90ML', 0.0000);
INSERT INTO `productos` VALUES (36579, '', 'CARTUCHO DE TINTA ORIGINAL 107-BK DE  130ML', 95.0000, 46.0000, 1, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'KANAKO PRINTCOPY S.A.C.', '0', '1', '1', 0.0000, 0.0000, 0.0000, 0.0000, 'O107BK', 0.0000);
INSERT INTO `productos` VALUES (36580, '', 'A1 ROLLO DE MICA 24 PULG 30 METROS', 120.0000, 0.0000, 12, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'KANAKO PRINTCOPY S.A.C.', '0', '1', '1', 0.0000, 0.0000, 0.0000, 120.0000, 'MICA24P', 71.1900);
INSERT INTO `productos` VALUES (36581, '', 'A0 ROLLO DE MICA 36 PULG 30 METROS', 160.0000, 0.0000, 1, 0, 12, 1, '1000-01-01', '', '0', 160.0000, 160.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '1', '1', 0.0000, 0.0000, 0.0000, 160.0000, 'MICA36P', 125.0000);
INSERT INTO `productos` VALUES (36582, '', 'CHIP DE TINTA CIAN 120', 40.0000, 6.6800, 38, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, 40.0000, 'CC120', 0.0000);
INSERT INTO `productos` VALUES (36583, '', 'CHIP DE TINTA MAGENTA 120', 40.0000, 6.6800, 35, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, 40.0000, 'CM120', 0.0000);
INSERT INTO `productos` VALUES (36584, '', 'CHIP DE TINTA MBK 120', 40.0000, 6.6800, 36, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'KANAKO PRINTCOPY S.A.C.', '0', '1', '1', 0.0000, 0.0000, 0.0000, 40.0000, 'CMBK120', 0.0000);
INSERT INTO `productos` VALUES (36585, '', 'CHIP DE TINTA YELLOW 120', 40.0000, 6.6800, 37, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'KANAKO PRINTCOPY S.A.C.', '0', '1', '1', 0.0000, 0.0000, 0.0000, 40.0000, 'CY120', 0.0000);
INSERT INTO `productos` VALUES (36586, '', 'CHIP DE TINTA BK 120', 40.0000, 6.6800, 35, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, 40.0000, 'CBK120', 0.0000);
INSERT INTO `productos` VALUES (36587, '', 'CHIP DE TINTA CIAN 102', 30.0000, 4.4000, 8, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'KANAKO PRINTCOPY S.A.C.', '0', '1', '1', 0.0000, 0.0000, 0.0000, 30.0000, 'CC102', 0.0000);
INSERT INTO `productos` VALUES (36588, '', 'CHIP DE TINTA BK 102', 30.0000, 4.4000, 8, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'KANAKO PRINTCOPY S.A.C.', '0', '1', '1', 0.0000, 0.0000, 0.0000, 30.0000, 'CBK102', 0.0000);
INSERT INTO `productos` VALUES (36589, '', 'CHIP DE TINTA MBK 102', 30.0000, 4.4000, 10, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'KANAKO PRINTCOPY S.A.C.', '0', '1', '1', 0.0000, 0.0000, 0.0000, 30.0000, 'CMBK102', 0.0000);
INSERT INTO `productos` VALUES (36590, '', 'CHIP DE TINTA BK 107', 30.0000, 4.4000, 20, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, 30.0000, 'CBK107', 0.0000);
INSERT INTO `productos` VALUES (36591, '', 'CHIP DE TINTA CIAN 107', 30.0000, 4.4000, 25, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, 30.0000, 'CCIAN107', 0.0000);
INSERT INTO `productos` VALUES (36592, '', 'CHIP DE TINTA MAGENTA 107', 30.0000, 4.4000, 27, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'KANAKO PRINTCOPY S.A.C.', '0', '1', '1', 0.0000, 0.0000, 0.0000, 30.0000, 'CM107', 0.0000);
INSERT INTO `productos` VALUES (36593, '', 'CHIP DE TINTA MBK 107', 30.0000, 4.4000, 29, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, 30.0000, 'CMBK107', 0.0000);
INSERT INTO `productos` VALUES (36594, '', 'CHIP DE TINTA YELLOW 107', 30.0000, 4.4000, 28, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'KANAKO PRINTCOPY S.A.C.', '0', '1', '1', 0.0000, 0.0000, 0.0000, 30.0000, 'CY107', 0.0000);
INSERT INTO `productos` VALUES (36595, '', 'SERVICIO DE RECARGA DE CARTUCHO DE 300 ML', 100.0000, 0.0000, 98, 0, 12, 1, '1000-01-01', '', '0', 100.0000, 100.0000, 'KANAKO PRINTCOPY S.A.C.', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, 0.0000, 'R300M', 34.0000);
INSERT INTO `productos` VALUES (36596, '', 'SERVICIO DE RECARGA DE CARTUCHO DE 130 ML', 50.0000, 0.0000, 94, 0, 12, 1, '1000-01-01', '', '0', 50.0000, 50.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, 0.0000, 'R130ML', 20.4000);
INSERT INTO `productos` VALUES (36597, '', 'UNIDAD DE PURGA', 290.0000, 270.0000, 8, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '1', '1', 0.0000, 0.0000, 0.0000, 0.0000, 'UNITPURGE', 0.0000);
INSERT INTO `productos` VALUES (36598, '', 'UNIDAD DE CARRUAGE', 0.0000, 225.7000, 10, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '1', '1', 0.0000, 0.0000, 0.0000, 0.0000, 'UNITCAR', 0.0000);
INSERT INTO `productos` VALUES (36599, '', 'filtro izquierdo', 0.0000, 15.0000, 10, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'KANAKO PRINTCOPY S.A.C.', '0', '1', '1', 0.0000, 18.0000, 0.0000, 18.0000, 'FIZQUI', 0.0000);
INSERT INTO `productos` VALUES (36600, '', 'filtro derecho', 0.0000, 15.0000, 10, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'KANAKO PRINTCOPY S.A.C.', '0', '1', '1', 0.0000, 18.0000, 0.0000, 18.0000, 'FDERE', 0.0000);
INSERT INTO `productos` VALUES (36601, '', 'CHIP DE MANTENIMIENTO EPSON 570', 5.0000, 2.1700, 3, 0, 12, 1, '1000-01-01', '', '0', 5.0000, 5.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, 18.0000, 'EPS570', 0.0000);
INSERT INTO `productos` VALUES (36602, '', 'TINTA MBK2 TM 1L', 160.0000, 0.0000, 7, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'KANAKO PRINTCOPY S.A.C.', '0', '1', '1', 0.0000, 0.0000, 0.0000, 0.0000, 'MBK2TM1', 80.0000);
INSERT INTO `productos` VALUES (36603, '', 'TINTA HP MK DE 1/2L', 80.0000, 0.0000, 4, 0, 12, 1, '1000-01-01', '', '0', 90.0000, 90.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '1', '1', 0.0000, 0.0000, 0.0000, 0.0000, 'HPMK', 40.0000);
INSERT INTO `productos` VALUES (36604, '', 'WASING 1/2 L', 40.0000, 0.0000, 37, 0, 12, 1, '1000-01-01', '', '0', 40.0000, 40.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '1', '1', 0.0000, 0.0000, 0.0000, 0.0000, 'w0.5', 0.0000);
INSERT INTO `productos` VALUES (36605, '', 'MANGUERA PEQUEÑA DE SILICONA', 3.0000, 0.0000, 100, 0, 12, 1, '1000-01-01', '', '0', 3.0000, 3.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '1', '1', 0.0000, 0.0000, 0.0000, 0.0000, 'MSIL', 1.0000);
INSERT INTO `productos` VALUES (36606, '', 'TINTA MAGENTA TM 1L', 160.0000, 0.0000, 5, 0, 12, 1, '1000-01-01', '', '0', 10.0000, 160.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '1', '1', 0.0000, 0.0000, 0.0000, 0.0000, 'MTM1', 80.0000);
INSERT INTO `productos` VALUES (36607, '', 'TINTA YELLOW TM 1L', 160.0000, 0.0000, 5, 0, 12, 1, '1000-01-01', '90', '0', 80.0000, 80.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '1', '1', 0.0000, 0.0000, 0.0000, 0.0000, 'YTM1', 80.0000);
INSERT INTO `productos` VALUES (36608, '', 'TINTA CIAN TM 1L', 160.0000, 0.0000, 3, 0, 12, 1, '1000-01-01', '90', '0', 160.0000, 160.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '1', '1', 0.0000, 0.0000, 0.0000, 0.0000, 'CIANTM1', 80.0000);
INSERT INTO `productos` VALUES (36609, '', 'TINTA BK TM 1L', 160.0000, 0.0000, 7, 0, 12, 1, '1000-01-01', '', '0', 160.0000, 160.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '1', '1', 0.0000, 0.0000, 0.0000, 0.0000, 'BKTM1', 80.0000);
INSERT INTO `productos` VALUES (36610, '', 'tarjeta que lee chips de la unidad de tanque de tinta', 122.2000, 36.7540, 0, 0, 12, 1, '1000-01-01', '', '0', 122.2000, 122.2000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '1', '1', 0.0000, 0.0000, 0.0000, 0.0000, 'TQC', 36.7540);
INSERT INTO `productos` VALUES (36611, '', 'SCANNER L36', 3490.0000, 2947.7800, 10, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '1', '1', 0.0000, 0.0000, 0.0000, 0.0000, 'L36', 0.0000);
INSERT INTO `productos` VALUES (36612, '', 'SCANNER L24', 2490.0000, 2056.2700, 10, 0, 12, 1, '1000-01-01', '', '0', 2490.0000, 2490.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '1', '1', 0.0000, 0.0000, 0.0000, 0.0000, 'L24', 0.0000);
INSERT INTO `productos` VALUES (36613, '', 'PLOTTER TM-200 A1', 1200.0000, 0.0000, 5, 0, 12, 1, '1000-01-01', '', '0', 1200.0000, 1200.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '1', '1', 0.0000, 0.0000, 0.0000, 0.0000, 'TM200', 0.0000);
INSERT INTO `productos` VALUES (36614, '', 'PLOTTER TM-300 A0', 0.0000, 2000.0000, 10, 0, 12, 1, '1000-01-01', '', '0', 2700.0000, 2700.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '1', '1', 0.0000, 2700.0000, 0.0000, 0.0000, 'TM300', 0.0000);
INSERT INTO `productos` VALUES (36615, '', 'TONER PARA COPIADORA  8295 GPR-37 compatible', 190.0000, 0.0000, 9, 0, 12, 1, '1000-01-01', '', '0', 190.0000, 190.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '1', '1', 0.0000, 0.0000, 0.0000, 0.0000, 'GPR37', 145.0000);
INSERT INTO `productos` VALUES (36616, '', 'MOTOR AVANCE DE PAPEL', 197.6000, 38.5300, 0, 0, 12, 1, '1000-01-01', '', '0', 197.6000, 197.6000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '1', '1', 0.0000, 0.0000, 0.0000, 0.0000, 'MP', 38.5300);
INSERT INTO `productos` VALUES (36617, '', 'tarjeta m/c relay pcb', 35.0000, 0.0000, 4, 0, 12, 1, '1000-01-01', '', '0', 35.0000, 35.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '1', '1', 0.0000, 0.0000, 0.0000, 0.0000, 'm/c', 35.0000);
INSERT INTO `productos` VALUES (36618, '', 'cable de tarjeta m/c relay pcb', 20.0000, 0.0000, 10, 0, 12, 1, '1000-01-01', '', '0', 20.0000, 20.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '1', '2', 0.0000, 0.0000, 0.0000, 0.0000, 'cable', 0.0000);
INSERT INTO `productos` VALUES (36619, '', 'CARTUCHO ORIGINAL VACIO ', 40.0000, 0.0000, 17, 0, 12, 1, '1000-01-01', '', '0', 40.0000, 40.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '1', '1', 0.0000, 0.0000, 0.0000, 0.0000, 'cartorig', 5.0000);
INSERT INTO `productos` VALUES (36620, '', 'cartucho recargado hp761 mbk 775ml', 0.0000, 20.0000, 20, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '1', '2', 0.0000, 0.0000, 0.0000, 0.0000, 'hp', 20.0000);
INSERT INTO `productos` VALUES (36621, '', 'REPARACION DE TARJETA IPF 770', 180.0000, 0.0000, 50, 0, 12, 1, '1000-01-01', '', '0', 180.0000, 180.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '1', '1', 0.0000, 0.0000, 0.0000, 0.0000, 'reparación', 30.0000);
INSERT INTO `productos` VALUES (36622, '', 'YELLOW TONER DE 400GR', 125.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', 120.0000, 125.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, 125.0000, 'T02Y4', 100.0000);
INSERT INTO `productos` VALUES (36623, '', 'MAGENTA  TONER DE 400GR', 125.0000, 0.0000, 11, 0, 12, 1, '1000-01-01', '', '0', 3490.0000, 3490.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '1', '1', 0.0000, 0.0000, 0.0000, 125.0000, 'T02M4', 100.0000);
INSERT INTO `productos` VALUES (36624, '', 'CIAN TONER DE 400GR', 125.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', 120.0000, 125.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, 125.0000, 'T02C4', 100.0000);
INSERT INTO `productos` VALUES (36625, '', 'BLACK TONER DE 400GR', 125.0000, 0.0000, 6, 0, 12, 1, '1000-01-01', '', '0', 2490.0000, 2490.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '1', '1', 0.0000, 0.0000, 0.0000, 125.0000, 'T02BK4', 100.0000);
INSERT INTO `productos` VALUES (36626, '', 'YELLOW TONER 1600GR', 107.0000, 360.8400, 0, 0, 12, 1, '1000-01-01', '', '0', 2490.0000, 2490.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '1', '2', 0.0000, 0.0000, 0.0000, 125.0000, 'T02Y16', 360.8400);
INSERT INTO `productos` VALUES (36627, '', 'MAGENTA TONER 1600GR', 107.0000, 97.0000, 6, 0, 12, 1, '1000-01-01', '', '0', 1200.0000, 1200.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '1', '1', 0.0000, 0.0000, 0.0000, 107.0000, 'T02M16', 0.0000);
INSERT INTO `productos` VALUES (36628, NULL, 'CIAN TONER 1600GR', 107.0000, 360.8400, 0, 0, 12, 1, '1000-01-01', '', '0', 1200.0000, 1200.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '1', '2', 0.0000, 0.0000, 0.0000, 107.0000, 'T02C16', 360.8400);
INSERT INTO `productos` VALUES (36629, '', 'BLACK TONER 1600GR', 107.0000, 97.0000, 5, 0, 12, 1, '1000-01-01', '', '0', 2700.0000, 2700.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '1', '1', 0.0000, 0.0000, 0.0000, 107.0000, 'T02BK16', 0.0000);
INSERT INTO `productos` VALUES (36630, NULL, 'CABEZAL PF 03', 550.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', 2700.0000, 2700.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '1', '2', 0.0000, 0.0000, 0.0000, 0.0000, 'PF03', 0.0000);
INSERT INTO `productos` VALUES (36631, '', 'CABEZAL PF 06', 550.0000, 426.4300, 1, 0, 12, 1, '1000-01-01', '', '0', 190.0000, 190.0000, 'KANAKO PRINTCOPY S.A.C.', '20600181484', '1', '1', 0.0000, 0.0000, 0.0000, 0.0000, 'PF06', 0.0000);
INSERT INTO `productos` VALUES (36632, '', 'CABEZAL HP 711 ', 0.0000, 251.9600, 0, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, 0.0000, 'HP711', 0.0000);
INSERT INTO `productos` VALUES (36633, '', 'CARTUCHO DE TINTA ORIGINAL 120-CIAN DE  90ML', 95.0000, 46.0000, 7, 0, 12, 1, '1000-01-01', '', '0', 197.6000, 197.6000, 'KANAKO PRINTCOPY S.A.C.', '20556947962', '1', '1', 0.0000, 0.0000, 0.0000, 0.0000, 'O120C', 46.0000);
INSERT INTO `productos` VALUES (36634, NULL, 'CARTUCHO DE TINTA ORIGINAL 107-MBK DE  130ML', 95.0000, 46.0000, 0, 0, 12, 1, '1000-01-01', '', '0', 197.6000, 197.6000, 'KANAKO PRINTCOPY S.A.C.', '20556947962', '1', '2', 0.0000, 0.0000, 0.0000, 0.0000, 'O107MBK', 46.0000);
INSERT INTO `productos` VALUES (36635, '', 'CARTUCHO DE TINTA ORIGINAL 107-CIAN DE  130ML', 95.0000, 80.0000, 1, 0, 12, 1, '1000-01-01', '', '0', 550.0000, 550.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '1', '1', 0.0000, 0.0000, 0.0000, 0.0000, 'O107C', 0.0000);
INSERT INTO `productos` VALUES (36636, '', 'CARTUCHO DE TINTA ORIGINAL 107-MAGENTA DE  90ML', 95.0000, 46.0000, 0, 0, 12, 1, '1000-01-01', '', '0', 550.0000, 550.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '1', '2', 0.0000, 0.0000, 0.0000, 0.0000, 'O107M', 46.0000);
INSERT INTO `productos` VALUES (36637, '', 'CARTUCHO DE TINTA ORIGINAL 107-YELLOW DE  130ML', 95.0000, 80.0000, 1, 0, 12, 1, '1000-01-01', '', '0', 35.0000, 35.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '1', '1', 0.0000, 95.0000, 0.0000, 0.0000, 'O107Y', 0.0000);
INSERT INTO `productos` VALUES (36638, NULL, 'CHIP DE TINTA MAGENTA 102', 30.0000, 17.3300, 0, 0, 12, 1, '1000-01-01', '', '0', 35.0000, 35.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '1', '2', 0.0000, 0.0000, 0.0000, 0.0000, 'CM102', 17.3300);
INSERT INTO `productos` VALUES (36639, '', 'CHIP DE TINTA YELLOW 102', 30.0000, 4.4000, 8, 0, 12, 1, '1000-01-01', '', '0', 20.0000, 20.0000, 'KANAKO PRINTCOPY S.A.C.', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, 0.0000, 'CY102', 0.0000);
INSERT INTO `productos` VALUES (36640, NULL, 'JERINGA 60ML', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', 20.0000, 20.0000, 'KANAKO PRINTCOPY S.A.C.', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, 0.0000, 'J60', 0.0000);
INSERT INTO `productos` VALUES (36641, '', 'JERINGA 20ML', 0.0000, 1.0000, 100, 0, 12, 1, '1000-01-01', '', '0', 40.0000, 40.0000, 'KANAKO PRINTCOPY S.A.C.', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, 0.0000, 'J20', 1.0000);
INSERT INTO `productos` VALUES (36642, '', 'AGUJA DE METAL', 5.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', 5.0000, 5.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '1', '2', 0.0000, 0.0000, 0.0000, 0.0000, 'AGUJA', 1.0000);
INSERT INTO `productos` VALUES (36643, '', 'TINTA BK IPF 1/2L', 80.0000, 0.0000, 3, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '1', '1', 0.0000, 0.0000, 0.0000, 90.0000, 'BKIPF0.5', 40.0000);
INSERT INTO `productos` VALUES (36644, NULL, 'TINTA YELLOW  IPF 1/2L', 80.0000, 40.0000, 0, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '1', '2', 0.0000, 0.0000, 0.0000, 0.0000, 'YIPF0.5', 40.0000);
INSERT INTO `productos` VALUES (36645, '', 'TINTA MAGENTA  IPF 1/2L', 80.0000, 0.0000, 7, 0, 12, 1, '1000-01-01', '', '0', 180.0000, 180.0000, 'KANAKO PRINTCOPY S.A.C.', '10445913079', '1', '1', 0.0000, 0.0000, 0.0000, 0.0000, 'MIPF0.5', 40.0000);
INSERT INTO `productos` VALUES (36646, NULL, 'TINTA CIAN  IPF 1/2L', 80.0000, 40.0000, 0, 0, 12, 1, '1000-01-01', '', '0', 180.0000, 180.0000, 'KANAKO PRINTCOPY S.A.C.', '10445913079', '1', '2', 0.0000, 0.0000, 0.0000, 0.0000, 'CIPF0.5', 40.0000);
INSERT INTO `productos` VALUES (36647, '', 'TINTA MBK2  IPF 1/2L', 80.0000, 0.0000, 19, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'KANAKO PRINTCOPY S.A.C.', '0', '1', '1', 0.0000, 0.0000, 0.0000, 90.0000, 'MBK2IPF0.5', 40.0000);
INSERT INTO `productos` VALUES (36648, '', 'TINTA BK  TM 1/2L', 80.0000, 0.0000, 11, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'KANAKO PRINTCOPY S.A.C.', '0', '1', '1', 0.0000, 0.0000, 0.0000, 0.0000, 'BKTM0.5', 40.0000);
INSERT INTO `productos` VALUES (36649, '', 'TINTA CIAN  TM 1/2L', 80.0000, 0.0000, 6, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'KANAKO PRINTCOPY S.A.C.', '0', '1', '1', 0.0000, 0.0000, 0.0000, 0.0000, 'CTM0.5', 40.0000);
INSERT INTO `productos` VALUES (36650, '', 'TINTA YELLOW  TM 1/2L', 80.0000, 0.0000, 4, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'KANAKO PRINTCOPY S.A.C.', '0', '1', '1', 0.0000, 0.0000, 0.0000, 0.0000, 'YTM0.5', 40.0000);
INSERT INTO `productos` VALUES (36651, '', 'TINTA MAGENTA  TM 1/2L', 80.0000, 0.0000, 6, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'KANAKO PRINTCOPY S.A.C.', '0', '1', '1', 0.0000, 0.0000, 0.0000, 0.0000, 'MTM0.5', 40.0000);
INSERT INTO `productos` VALUES (36652, '', 'TINTA MBK2  TM 1/2L', 80.0000, 0.0000, 7, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'KANAKO PRINTCOPY S.A.C.', '0', '1', '1', 0.0000, 0.0000, 0.0000, 0.0000, 'MBK2TM0.5', 40.0000);
INSERT INTO `productos` VALUES (36653, '', 'SERVICIO DE REVISIO Y DIAGNOSTICO', 80.0000, 0.0000, 985, 0, 12, 1, '1000-01-01', '', '0', 80.0000, 80.0000, 'TAMAY GUEVARA MARIA VILMA', '10408689592', '1', '1', 0.0000, 0.0000, 0.0000, 0.0000, 'RD', 30.0000);
INSERT INTO `productos` VALUES (36654, '', 'SERVICIO DE MANTENIMIENTO', 200.0000, 0.0000, 984, 0, 12, 1, '1000-01-01', '', '0', 200.0000, 200.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, 0.0000, 'SM', 30.0000);
INSERT INTO `productos` VALUES (36655, '', 'PANEL DE CONTROL', 0.0000, 0.0000, 2, 0, 12, 1, '1000-01-01', '', '0', 15.0000, 15.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 15.0000, 0.0000, 0.0000, 'PANEL', 40.0000);
INSERT INTO `productos` VALUES (36656, NULL, 'TINTA YELLOW  IPF 1L', 0.0000, 80.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 160.0000, 'YIPF1', NULL);
INSERT INTO `productos` VALUES (36657, NULL, 'TINTA MAGENTA  IPF 1L', 0.0000, 80.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 160.0000, 'MIPF1', NULL);
INSERT INTO `productos` VALUES (36658, NULL, 'TINTA CIAN  IPF 1L', 0.0000, 80.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 160.0000, 'CIPFL', NULL);
INSERT INTO `productos` VALUES (36659, NULL, 'TINTA BK IPF 1L', 0.0000, 80.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 160.0000, 'BKIPF1', NULL);
INSERT INTO `productos` VALUES (36660, NULL, 'TINTA MBK2 IPF 1L', 0.0000, 80.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 160.0000, 'MBK2IPF1', NULL);
INSERT INTO `productos` VALUES (36661, NULL, 'TINTA MICA IPF  1L', 0.0000, 80.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 160.0000, 'MICAIPF1', NULL);
INSERT INTO `productos` VALUES (36662, NULL, 'TINTA MICA TM  1L', 0.0000, 80.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 160.0000, 'MICATM1', NULL);
INSERT INTO `productos` VALUES (36663, NULL, 'TINTA MBK IPF-5 1/2L', 0.0000, 40.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 80.0000, 'MBK5IPF0.5', NULL);
INSERT INTO `productos` VALUES (36664, NULL, 'TINTA MBK IPF-5 1L', 0.0000, 80.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 160.0000, 'MBK5IPF1', NULL);
INSERT INTO `productos` VALUES (36665, NULL, 'CHIP DE CATUCHO DE MANTENIMIENO  MC30/31, TM200-300-305/TX3000-4000/TA20-30', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 90.0000, 'CANON MC30/31', NULL);
INSERT INTO `productos` VALUES (36666, NULL, 'ALMOHADILLA PARA PURGA IPF 670/770/750/780', 0.0000, 15.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 18.0000, 'ALMHIPF', NULL);
INSERT INTO `productos` VALUES (36667, NULL, 'CABEZAL HP 727', 0.0000, 338.3700, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 430.0000, 'HP727', NULL);
INSERT INTO `productos` VALUES (36668, NULL, 'CABEZAL HP 729', 0.0000, 438.5000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 482.0000, 'HP729', NULL);
INSERT INTO `productos` VALUES (36669, NULL, 'CHIP DE CATUCHO DE MANTENIMIENO CANON IPF770-670-750-710-810-815-820-830-840-780-785', 0.0000, 7.6000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 90.0000, 'CANON MC10/7', NULL);
INSERT INTO `productos` VALUES (36670, NULL, 'CAJA DE MANTENIMIENTO DE TINTA  L6171/91/61-L14150-M1180-M3181', 0.0000, 5.7000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 90.0000, 'EPSON L6171/91/61', NULL);
INSERT INTO `productos` VALUES (36671, NULL, 'CAJA DE MANTENIMIENTO MC T2170/3170/5170/3170X', 0.0000, 5.7000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 90.0000, 'EPSON F570', NULL);
INSERT INTO `productos` VALUES (36672, NULL, 'TINTA DYE CIAN  EPSON T3270/5270/7270/5470/3170X', 0.0000, 80.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 160.0000, 'DYECIAN1L', NULL);
INSERT INTO `productos` VALUES (36673, NULL, 'TINTA DYE MAGENTA  EPSON T3270/5270/7270/5470/3170X', 0.0000, 80.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 160.0000, 'DYEMAGE1L', NULL);
INSERT INTO `productos` VALUES (36674, NULL, 'TINTA DYE YELLOW  EPSON T3270/5270/7270/5470/3170X', 0.0000, 80.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 160.0000, 'DYEYELLOW1L', NULL);
INSERT INTO `productos` VALUES (36675, NULL, 'TINTA DYE PK-BK  EPSON T3270/5270/7270/5470/3170X', 0.0000, 80.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 160.0000, 'DYEPK1L', NULL);
INSERT INTO `productos` VALUES (36676, NULL, 'TINTA DYE MK  EPSON T3270/5270/7270/5470/3170X', 0.0000, 80.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 160.0000, 'DYEMK1L', NULL);
INSERT INTO `productos` VALUES (36677, NULL, 'CARTUCHO DE TINTA  RECARGABLE CIAN 260ML', 0.0000, 15.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 80.0000, 'CARTCIAN26', NULL);
INSERT INTO `productos` VALUES (36678, NULL, 'CARTUCHO DE TINTA  RECARGABLE YELLOW 260ML', 0.0000, 15.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 80.0000, 'CARTYELLOW26', NULL);
INSERT INTO `productos` VALUES (36679, NULL, 'CARTUCHO DE TINTA  RECARGABLE MAGENTA 260ML', 0.0000, 15.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 80.0000, 'CARTMAG26', NULL);
INSERT INTO `productos` VALUES (36680, NULL, 'CARTUCHO DE TINTA  RECARGABLE BK 260ML', 0.0000, 15.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 80.0000, 'CARTBK26', NULL);
INSERT INTO `productos` VALUES (36681, NULL, 'CARTUCHO DE TINTA  RECARGABLE MBK 260ML', 0.0000, 15.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 80.0000, 'CARTMBK26', NULL);
INSERT INTO `productos` VALUES (36682, NULL, 'CARTUCHO DE TINTA ORIGINAL 120-MBK DE  130ML', 0.0000, 46.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 95.0000, 'MBK120/130ML', NULL);
INSERT INTO `productos` VALUES (36683, NULL, 'CARTUCHO DE TINTA ORIGINAL 120-BK DE  90ML', 0.0000, 46.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 95.0000, 'BK120/90ML', NULL);
INSERT INTO `productos` VALUES (36684, NULL, 'CARTUCHO DE TINTA ORIGINAL 120-YELLOW DE  90ML', 0.0000, 46.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 95.0000, 'YELLOW120/90ML', NULL);
INSERT INTO `productos` VALUES (36685, NULL, 'CARTUCHO DE TINTA ORIGINAL 120-MAGENTA DE  90ML', 0.0000, 46.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 95.0000, 'MAGEN120/90ML', NULL);
INSERT INTO `productos` VALUES (36686, NULL, 'CARTUCHO DE TINTA ORIGINAL 107-BK DE  130ML', 0.0000, 46.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 95.0000, 'BK107/130ML', NULL);
INSERT INTO `productos` VALUES (36687, NULL, 'ROLLO DE MICA 24 PULG 30 METROS', 0.0000, 71.1900, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 120.0000, 'MICA24P', NULL);
INSERT INTO `productos` VALUES (36688, NULL, 'ROLLO DE MICA 36 PULG 30 METROS', 0.0000, 107.6300, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 160.0000, 'MICA36P', NULL);
INSERT INTO `productos` VALUES (36689, NULL, 'CHIP DE TINTA CIAN 120', 0.0000, 25.4200, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 40.0000, 'CC120', NULL);
INSERT INTO `productos` VALUES (36690, NULL, 'CHIP DE TINTA MAGENTA 120', 0.0000, 25.4200, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 40.0000, 'CM120', NULL);
INSERT INTO `productos` VALUES (36691, NULL, 'CHIP DE TINTA MBK 120', 0.0000, 25.4200, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 40.0000, 'CMBK120', NULL);
INSERT INTO `productos` VALUES (36692, NULL, 'CHIP DE TINTA YELLOW 120', 0.0000, 25.4200, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 40.0000, 'CY120', NULL);
INSERT INTO `productos` VALUES (36693, NULL, 'CHIP DE TINTA BK 120', 0.0000, 25.4200, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 40.0000, 'CBK120', NULL);
INSERT INTO `productos` VALUES (36694, NULL, 'CHIP DE TINTA CIAN 102', 0.0000, 17.3300, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 30.0000, 'CC102', NULL);
INSERT INTO `productos` VALUES (36695, NULL, 'CHIP DE TINTA BK 102', 0.0000, 17.3300, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 30.0000, 'CBK102', NULL);
INSERT INTO `productos` VALUES (36696, NULL, 'CHIP DE TINTA MBK 102', 0.0000, 17.3300, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 30.0000, 'CMBK102', NULL);
INSERT INTO `productos` VALUES (36697, NULL, 'CHIP DE TINTA BK 107', 0.0000, 17.3300, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 30.0000, 'CBK107', NULL);
INSERT INTO `productos` VALUES (36698, NULL, 'CHIP DE TINTA CIAN 107', 0.0000, 17.3300, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 30.0000, 'CCIAN107', NULL);
INSERT INTO `productos` VALUES (36699, NULL, 'CHIP DE TINTA MAGENTA 107', 0.0000, 17.3300, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 30.0000, 'CM107', NULL);
INSERT INTO `productos` VALUES (36700, NULL, 'CHIP DE TINTA MBK 107', 0.0000, 17.3300, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 30.0000, 'CMBK107', NULL);
INSERT INTO `productos` VALUES (36701, NULL, 'CHIP DE TINTA YELLOW 107', 0.0000, 17.3300, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 30.0000, 'CY107', NULL);
INSERT INTO `productos` VALUES (36702, NULL, 'TINTA MBK5 TM 1/2L', 0.0000, 40.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 80.0000, 'MBK5TM0.5', NULL);
INSERT INTO `productos` VALUES (36703, NULL, 'TINTA MBK5 TM 1L', 0.0000, 80.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 160.0000, 'MBK5TM1', NULL);
INSERT INTO `productos` VALUES (36704, NULL, 'SERVICIO DE RECARGA DE CARTUCHO DE 300 ML', 0.0000, 20.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 100.0000, 'R300ML', NULL);
INSERT INTO `productos` VALUES (36705, NULL, 'SERVICIO DE RECARGA DE CARTUCHO DE 130 ML', 0.0000, 20.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 50.0000, 'R130ML', NULL);
INSERT INTO `productos` VALUES (36706, NULL, 'UNIDAD DE PURGA', 0.0000, 270.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 290.0000, 'UNITPURGE', NULL);
INSERT INTO `productos` VALUES (36707, NULL, 'UNIDAD DE CARRUAGE', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 0.0000, 'UNITCAR', NULL);
INSERT INTO `productos` VALUES (36708, NULL, 'filtro izquierdo ', 0.0000, 15.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 18.0000, 'FIZQUI', NULL);
INSERT INTO `productos` VALUES (36709, NULL, 'filtro derecho ', 0.0000, 15.0000, 0, 0, 12, 1, '1000-01-01', '', '0', NULL, NULL, NULL, NULL, '0', '1', 0.0000, 0.0000, 0.0000, 18.0000, 'FDERE', NULL);
INSERT INTO `productos` VALUES (36710, NULL, 'panel de control ', 20.0000, 0.0000, 9, 0, 12, 1, '1000-01-01', '', '0', 20.0000, 20.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'panel ', NULL);
INSERT INTO `productos` VALUES (36711, '', 'PANEL DE CONTROL', 0.0000, 0.0000, 10, 0, 12, 1, '1000-01-01', '', '0', 15.0000, 15.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 15.0000, 0.0000, 0.0000, 'PANEL', 40.0000);
INSERT INTO `productos` VALUES (36712, NULL, 'tinta morada', 80.0000, 40.0000, 1, 0, 12, 1, '1000-01-01', '', '0', 80.0000, 80.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'morado', NULL);
INSERT INTO `productos` VALUES (36713, NULL, 'tinta morada', 80.0000, 40.0000, 2, 0, 12, 1, '1000-01-01', '', '0', 80.0000, 80.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'morado', 40.0000);
INSERT INTO `productos` VALUES (36714, '', 'AGUJA DE METAL', 5.0000, 0.0000, 7, 0, 12, 1, '1000-01-01', '', '0', 5.0000, 5.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'AGUJA', 1.0000);
INSERT INTO `productos` VALUES (36715, '', 'AGUJA DE METAL', 5.0000, 0.0000, 10, 0, 12, 1, '1000-01-01', '', '0', 5.0000, 5.0000, 'KANAKO PRINTCOPY S.A.C.', '20611556960', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'AGUJA', 1.0000);
INSERT INTO `productos` VALUES (36716, '', 'RECARGA DE CARTUCHO HP 761 ', 220.0000, 0.0000, 47, 0, 12, 1, '1000-01-01', '', '0', 220.0000, 220.0000, 'MYE SERVICIOS DIGITALES SOCIEDAD ANONIMA CERRADA - MESDI S.A.C.', '20602279945', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'recargahp', 200.0000);
INSERT INTO `productos` VALUES (36717, '', 'RECARGA DE CARTUCHO HP 761 ', 220.0000, 0.0000, 50, 0, 12, 1, '1000-01-01', '', '0', 220.0000, 220.0000, 'MYE SERVICIOS DIGITALES SOCIEDAD ANONIMA CERRADA - MESDI S.A.C.', '20602279945', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'recargahp', 200.0000);
INSERT INTO `productos` VALUES (36718, '', ' TINTA CIAN IPF DE 1/2L', 80.0000, 0.0000, 7, 0, 12, 1, '1000-01-01', '', '0', 80.0000, 80.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'CIPF0.5', 40.0000);
INSERT INTO `productos` VALUES (36719, '', ' TINTA CIAN IPF DE 1/2L', 80.0000, 0.0000, 10, 0, 12, 1, '1000-01-01', '', '0', 80.0000, 80.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'CIPF0.5', 40.0000);
INSERT INTO `productos` VALUES (36720, '', 'TINTA YELLOW IPF DE 1/2 L ', 80.0000, 0.0000, 13, 0, 12, 1, '1000-01-01', '', '0', 80.0000, 80.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'YUPF0.5', 40.0000);
INSERT INTO `productos` VALUES (36721, '', 'TINTA YELLOW IPF DE 1/2 L ', 80.0000, 0.0000, 10, 0, 12, 1, '1000-01-01', '', '0', 80.0000, 80.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'YUPF0.5', 40.0000);
INSERT INTO `productos` VALUES (36722, '', 'CHIP DE TINTA IPF 710 MAGENTA', 90.0000, 13.0800, 3, 0, 12, 1, '1000-01-01', '', '0', 90.0000, 90.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'M710ipf', 0.0000);
INSERT INTO `productos` VALUES (36723, '', 'CHIP DE TINTA IPF 710 MAGENTA', 90.0000, 13.0800, 10, 0, 12, 1, '1000-01-01', '', '0', 90.0000, 90.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'M710ipf', 0.0000);
INSERT INTO `productos` VALUES (36724, '', 'CHIP DE TINTA IPF 710 CIAN', 90.0000, 13.0800, 3, 0, 12, 1, '1000-01-01', '', '0', 90.0000, 90.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'C710IPF', 0.0000);
INSERT INTO `productos` VALUES (36725, '', 'CHIP DE TINTA IPF 710 CIAN', 90.0000, 13.0800, 10, 0, 12, 1, '1000-01-01', '', '0', 90.0000, 90.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'C710IPF', 0.0000);
INSERT INTO `productos` VALUES (36726, '', 'CHIP DE TINTA IPF 710 YELLOW', 90.0000, 13.0800, 3, 0, 12, 1, '1000-01-01', '', '0', 90.0000, 90.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'Y710IPF', 0.0000);
INSERT INTO `productos` VALUES (36727, '', 'CHIP DE TINTA IPF 710 YELLOW', 90.0000, 13.0800, 10, 0, 12, 1, '1000-01-01', '', '0', 90.0000, 90.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'Y710IPF', 0.0000);
INSERT INTO `productos` VALUES (36728, '', 'CHIP DE TINTA IPF 710 BK', 90.0000, 13.0800, 3, 0, 12, 1, '1000-01-01', '', '0', 90.0000, 90.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'BK710IPF', 0.0000);
INSERT INTO `productos` VALUES (36729, '', 'CHIP DE TINTA IPF 710 BK', 90.0000, 13.0800, 10, 0, 12, 1, '1000-01-01', '', '0', 90.0000, 90.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'BK710IPF', 0.0000);
INSERT INTO `productos` VALUES (36730, '', 'CHIP DE TINTA IPF 710 MBK', 90.0000, 13.0800, 3, 0, 12, 1, '1000-01-01', '', '0', 90.0000, 90.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'MBK710IPF', 0.0000);
INSERT INTO `productos` VALUES (36731, '', 'CHIP DE TINTA IPF 710 MBK', 90.0000, 13.0800, 10, 0, 12, 1, '1000-01-01', '', '0', 90.0000, 90.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'MBK710IPF', 0.0000);
INSERT INTO `productos` VALUES (36732, NULL, 'tinta rosada ', 80.0000, 40.0000, 10, 0, 12, 1, '1000-01-01', '', '0', 80.0000, 80.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'tintaro', NULL);
INSERT INTO `productos` VALUES (36733, NULL, 'tinta rosada ', 80.0000, 40.0000, 10, 0, 12, 1, '1000-01-01', '', '0', 80.0000, 80.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'tintaro', 40.0000);
INSERT INTO `productos` VALUES (36734, NULL, 'tinta azul ', 80.0000, 40.0000, 10, 0, 12, 1, '1000-01-01', '', '0', 80.0000, 80.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '0', '1', 0.0000, 0.0000, 0.0000, NULL, 'tintaazul', NULL);
INSERT INTO `productos` VALUES (36735, NULL, 'tinta azul ', 80.0000, 40.0000, 10, 0, 12, 1, '1000-01-01', '', '0', 80.0000, 80.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'tintaazul', 40.0000);
INSERT INTO `productos` VALUES (36736, '', 'CARTUCHO DE TINTA ORIGINAL 107 MAGENTA DE 130ML', 95.0000, 80.0000, 1, 0, 12, 1, '1000-01-01', '', '0', 95.0000, 95.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'O107M', 0.0000);
INSERT INTO `productos` VALUES (36737, '', 'CARTUCHO DE TINTA ORIGINAL 107 MAGENTA DE 130ML', 95.0000, 80.0000, 10, 0, 12, 1, '1000-01-01', '', '0', 95.0000, 95.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'O107M', 0.0000);
INSERT INTO `productos` VALUES (36738, '', 'CARTUCHO DE TINTA ORIGINAL 107 MBK DE 130 ML', 0.0000, 80.0000, 1, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 95.0000, 0.0000, NULL, 'O107MBK', 0.0000);
INSERT INTO `productos` VALUES (36739, '', 'CARTUCHO DE TINTA ORIGINAL 107 MBK DE 130 ML', 0.0000, 80.0000, 10, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 95.0000, 0.0000, NULL, 'O107MBK', 0.0000);
INSERT INTO `productos` VALUES (36740, '', 'YELLOW TONER DE 400GR', 125.0000, 0.0000, 7, 0, 12, 1, '1000-01-01', '', '0', 120.0000, 125.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'T02Y4', 100.0000);
INSERT INTO `productos` VALUES (36741, '', 'YELLOW TONER DE 400GR', 125.0000, 0.0000, 125, 0, 12, 1, '1000-01-01', '', '0', 120.0000, 125.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'T02Y4', 100.0000);
INSERT INTO `productos` VALUES (36742, '', 'CIAN TONER DE 400GR', 125.0000, 0.0000, 10, 0, 12, 1, '1000-01-01', '', '0', 120.0000, 125.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'T02C4', 100.0000);
INSERT INTO `productos` VALUES (36743, '', 'CIAN TONER DE 400GR', 125.0000, 0.0000, 10, 0, 12, 1, '1000-01-01', '', '0', 120.0000, 125.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'T02C4', 100.0000);
INSERT INTO `productos` VALUES (36744, '', 'CUCHILLA DE CORTE PARA IPF', 341.0000, 60.0000, 1, 0, 12, 1, '1000-01-01', '', '0', 90.0000, 90.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 90.0000, 0.0000, 0.0000, 'CUTTERIPF', 0.0000);
INSERT INTO `productos` VALUES (36745, '', 'CUCHILLA DE CORTE PARA IPF', 341.0000, 60.0000, 1, 0, 12, 1, '1000-01-01', '', '0', 90.0000, 90.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 90.0000, 0.0000, 0.0000, 'CUTTERIPF', 0.0000);
INSERT INTO `productos` VALUES (36748, '', 'CIAN TONER DE 1600GR', 107.0000, 97.0000, 5, 0, 12, 1, '1000-01-01', '', '0', 105.0000, 105.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 105.0000, 0.0000, NULL, 'T02C16', 0.0000);
INSERT INTO `productos` VALUES (36749, '', 'CIAN TONER DE 1600GR', 107.0000, 97.0000, 10, 0, 12, 1, '1000-01-01', '', '0', 105.0000, 105.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 105.0000, 0.0000, NULL, 'T02C16', 0.0000);
INSERT INTO `productos` VALUES (36750, '', 'YELLOW TONER DE 1600GR', 107.0000, 97.0000, 8, 0, 12, 1, '1000-01-01', '', '0', 105.0000, 105.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 105.0000, 0.0000, 0.0000, 'T02Y16', 0.0000);
INSERT INTO `productos` VALUES (36751, '', 'YELLOW TONER DE 1600GR', 107.0000, 97.0000, 10, 0, 12, 1, '1000-01-01', '', '0', 105.0000, 105.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 105.0000, 0.0000, 0.0000, 'T02Y16', 0.0000);
INSERT INTO `productos` VALUES (36752, '', 'PLOTTER TX3000', 14440.0000, 3000.0000, 9, 0, 12, 1, '1000-01-01', '', '0', 3800.0000, 3800.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 3800.0000, 0.0000, NULL, 'TX3000', 0.0000);
INSERT INTO `productos` VALUES (36753, '', 'PLOTTER TX3000', 14440.0000, 3000.0000, 10, 0, 12, 1, '1000-01-01', '', '0', 3800.0000, 3800.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 3800.0000, 0.0000, NULL, 'TX3000', 0.0000);
INSERT INTO `productos` VALUES (36754, '', 'SERVICIO DE RESETEO DE CABEZAL', 100.0000, 0.0000, 99, 0, 12, 1, '1000-01-01', '', '0', 100.0000, 100.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 25.0000, 0.0000, NULL, 'RESETEO', 50.0000);
INSERT INTO `productos` VALUES (36755, '', 'SERVICIO DE RESETEO DE CABEZAL', 100.0000, 0.0000, 100, 0, 12, 1, '1000-01-01', '', '0', 100.0000, 100.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 25.0000, 0.0000, NULL, 'RESETEO', 50.0000);
INSERT INTO `productos` VALUES (36756, '', 'SCANNER M40 SEMINUEVO', 2000.0000, 0.0000, 10, 0, 12, 1, '1000-01-01', '', '0', 2000.0000, 2000.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 2000.0000, 0.0000, NULL, 'M40SEMI', 0.0000);
INSERT INTO `productos` VALUES (36757, '', 'SCANNER M40 SEMINUEVO', 2000.0000, 0.0000, 10, 0, 12, 1, '1000-01-01', '', '0', 2000.0000, 2000.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 2000.0000, 0.0000, NULL, 'M40SEMI', 0.0000);
INSERT INTO `productos` VALUES (36764, '', 'CAMBIO DE BANDEJA DE MANTENIMIENTO', 80.0000, 0.0000, 100, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'BANDEJA', 40.0000);
INSERT INTO `productos` VALUES (36765, '', 'CAMBIO DE BANDEJA DE MANTENIMIENTO', 80.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'BANDEJA', 40.0000);
INSERT INTO `productos` VALUES (36766, '', 'CABLE FLAT DE DATOS ', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 109.0000, 0.0000, NULL, 'FLAT', 0.0000);
INSERT INTO `productos` VALUES (36767, '', 'CABLE FLAT DE DATOS ', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 109.0000, 0.0000, NULL, 'FLAT', 0.0000);
INSERT INTO `productos` VALUES (36768, '', 'TARJETA PCB PRINCIPAL', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 200.0000, 0.0000, NULL, 'PCBPRINCIPAL', 0.0000);
INSERT INTO `productos` VALUES (36769, '', 'TARJETA PCB PRINCIPAL', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 200.0000, 0.0000, NULL, 'PCBPRINCIPAL', 0.0000);
INSERT INTO `productos` VALUES (36770, '', 'CABLE MORADO DE PANEL', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 12.0000, 0.0000, NULL, 'CABLEMORADO', 0.0000);
INSERT INTO `productos` VALUES (36771, '', 'CABLE MORADO DE PANEL', 0.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 12.0000, 0.0000, NULL, 'CABLEMORADO', 0.0000);
INSERT INTO `productos` VALUES (36772, NULL, 'UNIDAD DE PURGA IPF 670/650/680/770', 280.0000, 182.3100, 2, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'QM4-3670-020', 0.0000);
INSERT INTO `productos` VALUES (36773, NULL, 'UNIDAD DE PURGA IPF 670/650/680/770', 280.0000, 182.3100, 4, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'QM4-3670-020', 0.0000);
INSERT INTO `productos` VALUES (36774, NULL, 'REVELADOR MAGENTA  C6010VP, C7000VP, C7010VP', 0.0000, 37.7000, 30, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, '0442B001AA', 0.0000);
INSERT INTO `productos` VALUES (36775, NULL, 'REVELADOR MAGENTA  C6010VP, C7000VP, C7010VP', 0.0000, 37.7000, 0, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, '0442B001AA', 0.0000);
INSERT INTO `productos` VALUES (36776, NULL, 'REVELADOR AMARILLO C6010VP, C7000VP, C7010VP', 0.0000, 68.1500, 1, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, '0443B001AA', 0.0000);
INSERT INTO `productos` VALUES (36777, NULL, 'REVELADOR AMARILLO C6010VP, C7000VP, C7010VP', 0.0000, 68.1500, 0, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, '0443B001AA', 0.0000);
INSERT INTO `productos` VALUES (36778, NULL, 'TAPA ABSORBEDORA  IPF750', 0.0000, 2.9900, 10, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'QC2-0819-000', 0.0000);
INSERT INTO `productos` VALUES (36779, NULL, 'TAPA ABSORBEDORA  IPF750', 0.0000, 2.9900, 10, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'QC2-0819-000', 0.0000);
INSERT INTO `productos` VALUES (36780, NULL, 'CODIFICADOR IPF760/765/750/755', 0.0000, 45.7300, 4, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'QM4-2883-000', 0.0000);
INSERT INTO `productos` VALUES (36781, NULL, 'CODIFICADOR IPF760/765/750/755', 0.0000, 45.7300, 4, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'QM4-2883-000', 0.0000);
INSERT INTO `productos` VALUES (36782, NULL, 'ESCALA LINEAL IPF786/785/780/770', 0.0000, 65.0700, 2, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'QC4-8815-000', 0.0000);
INSERT INTO `productos` VALUES (36783, NULL, 'ESCALA LINEAL IPF786/785/780/770', 0.0000, 65.0700, 2, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'QC4-8815-000', 0.0000);
INSERT INTO `productos` VALUES (36784, NULL, 'ESCALA LINEAL TM200/205 TA20/30', 0.0000, 33.4600, 1, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'QC4-9427-000', 0.0000);
INSERT INTO `productos` VALUES (36785, NULL, 'ESCALA LINEAL TM200/205 TA20/30', 0.0000, 33.4600, 1, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'QC4-9427-000', 0.0000);
INSERT INTO `productos` VALUES (36786, NULL, 'TAPA ABSORBEDORA  TM200/205/300 TA20/30', 0.0000, 1.6600, 20, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'QC5-6203-000', 0.0000);
INSERT INTO `productos` VALUES (36787, NULL, 'TAPA ABSORBEDORA  TM200/205/300 TA20/30', 0.0000, 1.6600, 20, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'QC5-6203-000', 0.0000);
INSERT INTO `productos` VALUES (36788, NULL, 'TAPA ABSORBEDORA-A  TC20', 0.0000, 2.9600, 5, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'QC7-4921-000', 0.0000);
INSERT INTO `productos` VALUES (36789, NULL, 'TAPA ABSORBEDORA-A  TC20', 0.0000, 2.9600, 5, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'QC7-4921-000', 0.0000);
INSERT INTO `productos` VALUES (36790, NULL, 'TAPA ABSORBEDORA-B   TC20', 0.0000, 2.8600, 5, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'QC7-4922-000', 0.0000);
INSERT INTO `productos` VALUES (36791, NULL, 'TAPA ABSORBEDORA-B   TC20', 0.0000, 2.8600, 5, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'QC7-4922-000', 0.0000);
INSERT INTO `productos` VALUES (36792, NULL, 'ENCODER CIRCULAR TM200/300 TC20/30 TA20/30 ', 0.0000, 6.6400, 5, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'QD1-2702-000', 0.0000);
INSERT INTO `productos` VALUES (36793, NULL, 'ENCODER CIRCULAR TM200/300 TC20/30 TA20/30 ', 0.0000, 6.6400, 5, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'QD1-2702-000', 0.0000);
INSERT INTO `productos` VALUES (36794, NULL, 'UNIDAD DE TUBO DE TINTA  IPF750/760', 0.0000, 118.2300, 1, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'QM4-2823-000', 0.0000);
INSERT INTO `productos` VALUES (36795, NULL, 'UNIDAD DE TUBO DE TINTA  IPF750/760', 0.0000, 118.2300, 1, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'QM4-2823-000', 0.0000);
INSERT INTO `productos` VALUES (36796, NULL, 'UNIDAD DE PURGA IPF 670/650/680', 0.0000, 182.3100, 4, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'QM4-3670-020', 0.0000);
INSERT INTO `productos` VALUES (36797, NULL, 'UNIDAD DE PURGA IPF 670/650/680', 0.0000, 182.3100, 4, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'QM4-3670-020', 0.0000);
INSERT INTO `productos` VALUES (36798, NULL, 'UNIDAD DE CARRO  PARA IPF 770/780/785', 0.0000, 295.6700, 4, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'QM4-4717-000', 0.0000);
INSERT INTO `productos` VALUES (36799, NULL, 'UNIDAD DE CARRO  PARA IPF 770/780/785', 0.0000, 295.6700, 4, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'QM4-4717-000', 0.0000);
INSERT INTO `productos` VALUES (36800, NULL, 'UNIDAD DE CARRO  PARA IPF 670/650/655', 0.0000, 285.1300, 4, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'QM4-4718-000', 0.0000);
INSERT INTO `productos` VALUES (36801, NULL, 'UNIDAD DE CARRO  PARA IPF 670/650/655', 0.0000, 285.1300, 4, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'QM4-4718-000', 0.0000);
INSERT INTO `productos` VALUES (36802, NULL, 'KIT DE LIMPIEZA DE LA UNIDAD DE CARRUAGE ', 0.0000, 36.3500, 3, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'QM4-5869-000', 0.0000);
INSERT INTO `productos` VALUES (36803, NULL, 'KIT DE LIMPIEZA DE LA UNIDAD DE CARRUAGE ', 0.0000, 36.3500, 3, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'QM4-5869-000', 0.0000);
INSERT INTO `productos` VALUES (36804, NULL, 'UNIDAD DE TANQUE DE TINTA DERECHO TM200/205', 0.0000, 195.8100, 1, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'QM4-5966-000', 0.0000);
INSERT INTO `productos` VALUES (36805, NULL, 'UNIDAD DE TANQUE DE TINTA DERECHO TM200/205', 0.0000, 195.8100, 1, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'QM4-5966-000', 0.0000);
INSERT INTO `productos` VALUES (36806, NULL, 'UNIDAD DE TANQUE DE TINTA IZQUIERDO TM200/205', 0.0000, 181.0000, 1, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'QM4-5971-000', 0.0000);
INSERT INTO `productos` VALUES (36807, NULL, 'UNIDAD DE TANQUE DE TINTA IZQUIERDO TM200/205', 0.0000, 181.0000, 1, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'QM4-5971-000', 0.0000);
INSERT INTO `productos` VALUES (36808, NULL, 'UNIDAD DE PURGA  TM200/300 TA20/30', 0.0000, 143.5000, 4, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'QM4-6171-000', 0.0000);
INSERT INTO `productos` VALUES (36809, NULL, 'UNIDAD DE PURGA  TM200/300 TA20/30', 0.0000, 143.5000, 4, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'QM4-6171-000', 0.0000);
INSERT INTO `productos` VALUES (36810, NULL, 'UNIDAD DE MOTOR, CC, 37,5 TC20', 0.0000, 87.1400, 1, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'QM4-6206-000', 0.0000);
INSERT INTO `productos` VALUES (36811, NULL, 'UNIDAD DE MOTOR, CC, 37,5 TC20', 0.0000, 87.1400, 1, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'QM4-6206-000', 0.0000);
INSERT INTO `productos` VALUES (36812, NULL, 'UNIDAD MOTOR, CON ENCODER TM200/205', 0.0000, 36.0500, 1, 0, 12, 1, '1000-01-01', '', '0', 1.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'QM4-6727-000', 0.0000);
INSERT INTO `productos` VALUES (36813, NULL, 'UNIDAD MOTOR, CON ENCODER TM200/205', 0.0000, 36.0500, 0, 0, 12, 1, '1000-01-01', '', '0', 1.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'QM4-6727-000', 0.0000);
INSERT INTO `productos` VALUES (36814, NULL, 'UNIDAD DE CARRO TC/20', 0.0000, 312.4200, 1, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'QM5-2409-000', 0.0000);
INSERT INTO `productos` VALUES (36815, NULL, 'UNIDAD DE CARRO TC/20', 0.0000, 312.4200, 1, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'QM5-2409-000', 0.0000);
INSERT INTO `productos` VALUES (36816, NULL, 'MEMORIA DE RESPALDO IPF650/750/680/780', 0.0000, 5.0300, 8, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'QM7-3606-000', 0.0000);
INSERT INTO `productos` VALUES (36817, NULL, 'MEMORIA DE RESPALDO IPF650/750/680/780', 0.0000, 5.0300, 8, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'QM7-3606-000', 0.0000);
INSERT INTO `productos` VALUES (36818, NULL, 'UNIDAD DE TANQUE DE TINTA PCB TM200/300', 0.0000, 14.1600, 7, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'QM7-5668-000', 0.0000);
INSERT INTO `productos` VALUES (36819, NULL, 'UNIDAD DE TANQUE DE TINTA PCB TM200/300', 0.0000, 14.1600, 7, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'QM7-5668-000', 0.0000);
INSERT INTO `productos` VALUES (36820, '', 'CABEZAL HP 711 ', 0.0000, 251.9600, 12, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'HP711', 0.0000);
INSERT INTO `productos` VALUES (36821, '', 'CABEZAL HP 711 ', 0.0000, 251.9600, 0, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'HP711', 0.0000);
INSERT INTO `productos` VALUES (36822, NULL, 'CHIP DE MANTENIMIENTO EPSON T04D1 ', 0.0000, 2.1750, 8, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'T04D1', 0.0000);
INSERT INTO `productos` VALUES (36823, NULL, 'CHIP DE MANTENIMIENTO EPSON T04D1 ', 0.0000, 2.1750, 8, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'T04D1', 0.0000);
INSERT INTO `productos` VALUES (36824, NULL, 'CHIP DE MANTENIMIENTO EPSON F170', 0.0000, 2.1750, 10, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'EPS170', 0.0000);
INSERT INTO `productos` VALUES (36825, NULL, 'CHIP DE MANTENIMIENTO EPSON F170', 0.0000, 2.1750, 10, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'EPS170', 0.0000);
INSERT INTO `productos` VALUES (36826, NULL, 'CHIP DE MANTENIMIENTO EPSON  C9345', 0.0000, 2.1750, 10, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'EPSC9345', 0.0000);
INSERT INTO `productos` VALUES (36827, NULL, 'CHIP DE MANTENIMIENTO EPSON  C9345', 0.0000, 2.1750, 10, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'EPSC9345', 0.0000);
INSERT INTO `productos` VALUES (36828, NULL, 'CHIP DE MANTENIMIENTO EPSON C9344', 0.0000, 2.1800, 5, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'EPSC9344', 0.0000);
INSERT INTO `productos` VALUES (36829, NULL, 'CHIP DE MANTENIMIENTO EPSON C9344', 0.0000, 2.1800, 0, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'EPSC9344', 0.0000);
INSERT INTO `productos` VALUES (36830, NULL, 'CHIP DE MANTENIMIENTO EPSON  T04D0', 0.0000, 2.1800, 5, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'EPST04D0', 0.0000);
INSERT INTO `productos` VALUES (36831, NULL, 'CHIP DE MANTENIMIENTO EPSON  T04D0', 0.0000, 2.1800, 5, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'EPST04D0', 0.0000);
INSERT INTO `productos` VALUES (36832, NULL, 'CHIP DE MANTENIMIENTO EPSON T6710', 0.0000, 1.7400, 5, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'EPST6710', 0.0000);
INSERT INTO `productos` VALUES (36833, NULL, 'CHIP DE MANTENIMIENTO EPSON T6710', 0.0000, 1.7400, 5, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'EPST6710', 0.0000);
INSERT INTO `productos` VALUES (36834, NULL, 'CHIP DE MANTENIMIENTO EPSON  T6711', 0.0000, 1.7400, 10, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'EPST6711', 0.0000);
INSERT INTO `productos` VALUES (36835, NULL, 'CHIP DE MANTENIMIENTO EPSON  T6711', 0.0000, 1.7400, 10, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'EPST6711', 0.0000);
INSERT INTO `productos` VALUES (36836, NULL, 'CHIP DE MANTENIMIENTO EPSON T6712', 0.0000, 2.1800, 5, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'EPST6712', 0.0000);
INSERT INTO `productos` VALUES (36837, NULL, 'CHIP DE MANTENIMIENTO EPSON T6712', 0.0000, 2.1800, 0, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'EPST6712', 0.0000);
INSERT INTO `productos` VALUES (36838, '', 'CHIP DE MANTENIMIENTO EPSON T6713', 0.0000, 2.9000, 5, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'EPST6713', 0.0000);
INSERT INTO `productos` VALUES (36839, '', 'CHIP DE MANTENIMIENTO EPSON T6713', 0.0000, 2.9000, 0, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'EPST6713', 0.0000);
INSERT INTO `productos` VALUES (36840, NULL, 'CHIP DE MANTENIMIENTO EPSON T6714', 0.0000, 2.6100, 5, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'EPST6714', 0.0000);
INSERT INTO `productos` VALUES (36841, NULL, 'CHIP DE MANTENIMIENTO EPSON T6714', 0.0000, 2.6100, 5, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'EPST6714', 0.0000);
INSERT INTO `productos` VALUES (36842, '', 'CHIP DE MANTENIMIENTO EPSON T6715/T6716', 0.0000, 2.3200, 9, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'EPST6715/16', 0.0000);
INSERT INTO `productos` VALUES (36843, '', 'CHIP DE MANTENIMIENTO EPSON T6715/T6716', 0.0000, 2.3200, 0, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'EPST6715/16', 0.0000);
INSERT INTO `productos` VALUES (36844, '', 'CHIP DE MANTENIMIENTO EPSON T6193', 0.0000, 2.1800, 6, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'EPST6193', 0.0000);
INSERT INTO `productos` VALUES (36845, '', 'CHIP DE MANTENIMIENTO EPSON T6193', 0.0000, 2.1800, 10, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'EPST6193', 0.0000);
INSERT INTO `productos` VALUES (36846, '', 'CHIP DE MANTENIMIENTO EPSON T6997', 0.0000, 2.1800, 5, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'EPST6997', 0.0000);
INSERT INTO `productos` VALUES (36847, '', 'CHIP DE MANTENIMIENTO EPSON T6997', 0.0000, 2.1800, 0, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'EPST6997', 0.0000);
INSERT INTO `productos` VALUES (36848, '', 'CHIP DE MANTENIMIENTO CANON MC-G01', 0.0000, 2.1800, 10, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'CANONG01', 0.0000);
INSERT INTO `productos` VALUES (36849, '', 'CHIP DE MANTENIMIENTO CANON MC-G01', 0.0000, 2.1800, 0, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'CANONG01', 0.0000);
INSERT INTO `productos` VALUES (36850, NULL, 'CHIP DE MANTENIMIENTO CANON MC-G02', 0.0000, 2.1800, 10, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'CANONG02', 0.0000);
INSERT INTO `productos` VALUES (36851, NULL, 'CHIP DE MANTENIMIENTO CANON MC-G02', 0.0000, 2.1800, 10, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'CANONG02', 0.0000);
INSERT INTO `productos` VALUES (36852, NULL, 'CHIP DE MANTENIMIENTO CANON MC-G03', 0.0000, 2.9700, 5, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'CANONG03', 0.0000);
INSERT INTO `productos` VALUES (36853, NULL, 'CHIP DE MANTENIMIENTO CANON MC-G03', 0.0000, 2.9700, 0, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'CANONG03', 0.0000);
INSERT INTO `productos` VALUES (36854, '', 'CHIP DE MANTENIMIENTO CANON MC-G04', 0.0000, 2.9700, 5, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'CANONG04', 0.0000);
INSERT INTO `productos` VALUES (36855, '', 'CHIP DE MANTENIMIENTO CANON MC-G04', 0.0000, 2.9700, 0, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'CANONG04', 0.0000);
INSERT INTO `productos` VALUES (36856, NULL, 'CHIP DE MANTENIMIENTO CANON MC-20', 0.0000, 3.6300, 5, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'CANONMC20', 0.0000);
INSERT INTO `productos` VALUES (36857, NULL, 'CHIP DE MANTENIMIENTO CANON MC-20', 0.0000, 3.6300, 0, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'CANONMC20', 0.0000);
INSERT INTO `productos` VALUES (36858, NULL, 'CHIP DE MANTENIMIENTO CANON MC-32', 0.0000, 3.6300, 5, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'CANON32', 0.0000);
INSERT INTO `productos` VALUES (36859, NULL, 'CHIP DE MANTENIMIENTO CANON MC-32', 0.0000, 3.6300, 5, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'CANON32', 0.0000);
INSERT INTO `productos` VALUES (36860, NULL, 'CHIP DE MANTENIMIENTO CANON MC-50', 0.0000, 3.6300, 5, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'CANONMC50', 0.0000);
INSERT INTO `productos` VALUES (36861, NULL, 'CHIP DE MANTENIMIENTO CANON MC-50', 0.0000, 3.6300, 5, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'CANONMC50', 0.0000);
INSERT INTO `productos` VALUES (36862, NULL, 'CHIP HP CIAN 727 XL - 300ML', 85.0000, 13.7600, 20, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'HP727.XL.C', 0.0000);
INSERT INTO `productos` VALUES (36863, NULL, 'CHIP HP CIAN 727 XL - 300ML', 85.0000, 13.7600, 0, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'HP727.XL.C', 0.0000);
INSERT INTO `productos` VALUES (36864, NULL, 'CHIP HP MAGENTA  727 XL - 300ML', 85.0000, 13.7600, 20, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'HP727.XL.M', 0.0000);
INSERT INTO `productos` VALUES (36865, NULL, 'CHIP HP MAGENTA  727 XL - 300ML', 85.0000, 13.7600, 20, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'HP727.XL.M', 0.0000);
INSERT INTO `productos` VALUES (36866, NULL, 'CHIP HP AMARILLO 727 XL - 300ML', 85.0000, 13.7600, 20, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'CHIP.HP727.XL.Y', 0.0000);
INSERT INTO `productos` VALUES (36867, NULL, 'CHIP HP AMARILLO 727 XL - 300ML', 85.0000, 13.7600, 20, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'CHIP.HP727.XL.Y', 0.0000);
INSERT INTO `productos` VALUES (36868, NULL, 'CHIP HP GRIS 727 XL - 300ML', 85.0000, 13.7600, 20, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'HP727.XL.GY', 0.0000);
INSERT INTO `productos` VALUES (36869, NULL, 'CHIP HP GRIS 727 XL - 300ML', 85.0000, 13.7600, 20, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'HP727.XL.GY', 0.0000);
INSERT INTO `productos` VALUES (36870, NULL, 'CHIP HP NEGRO MATE 727 XL - 300ML', 85.0000, 13.7600, 20, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'HP727.XL.MK', 0.0000);
INSERT INTO `productos` VALUES (36871, NULL, 'CHIP HP NEGRO MATE 727 XL - 300ML', 85.0000, 13.7600, 0, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'HP727.XL.MK', 0.0000);
INSERT INTO `productos` VALUES (36872, NULL, 'CHIP HP NEGRO FOTO 727 XL - 300ML', 85.0000, 13.7600, 20, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'HP727.XL.PK', 0.0000);
INSERT INTO `productos` VALUES (36873, NULL, 'CHIP HP NEGRO FOTO 727 XL - 300ML', 85.0000, 13.7600, 20, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'HP727.XL.PK', 0.0000);
INSERT INTO `productos` VALUES (36874, '', 'STOP DE PORTAROLLO', 0.0000, 1.0000, 2, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 4.0000, 0.0000, NULL, 'STOP', 0.0000);
INSERT INTO `productos` VALUES (36875, '', 'STOP DE PORTAROLLO', 0.0000, 1.0000, 0, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 4.0000, 0.0000, NULL, 'STOP', 0.0000);
INSERT INTO `productos` VALUES (36876, NULL, 'GUIA IZQUIERDA DE PAPEL ', 0.0000, 5.0000, 0, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 16.0000, 0.0000, NULL, 'GUIA', 0.0000);
INSERT INTO `productos` VALUES (36877, NULL, 'GUIA IZQUIERDA DE PAPEL ', 0.0000, 5.0000, 1, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 16.0000, 0.0000, NULL, 'GUIA', 0.0000);
INSERT INTO `productos` VALUES (36878, '', 'FUENTE DE PODER PARA TM200', 0.0000, 80.0000, 0, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 120.0000, 0.0000, NULL, 'QK2-2883-000', 0.0000);
INSERT INTO `productos` VALUES (36879, '', 'FUENTE DE PODER PARA TM200', 0.0000, 80.0000, 1, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 120.0000, 0.0000, NULL, 'QK2-2883-000', 0.0000);
INSERT INTO `productos` VALUES (36880, NULL, 'CARTUCHO DE TINTA HP DESIGNJET 711 MAGENTA DE 29 ML', 0.0000, 26.0000, 0, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 30.0000, 0.0000, NULL, '711MAGENTA', 0.0000);
INSERT INTO `productos` VALUES (36881, NULL, 'CARTUCHO DE TINTA HP DESIGNJET 711 MAGENTA DE 29 ML', 0.0000, 26.0000, 0, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 30.0000, 0.0000, NULL, '711MAGENTA', 0.0000);
INSERT INTO `productos` VALUES (36882, NULL, 'CARTUCHO DE TINTA HP DESIGNJET 711 AMARILLO  DE 29 ML', 0.0000, 26.0000, 0, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 30.0000, 0.0000, NULL, '711YELLOW', 0.0000);
INSERT INTO `productos` VALUES (36883, NULL, 'CARTUCHO DE TINTA HP DESIGNJET 711 AMARILLO  DE 29 ML', 0.0000, 26.0000, 0, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 30.0000, 0.0000, NULL, '711YELLOW', 0.0000);
INSERT INTO `productos` VALUES (36884, '', 'CARTUCHO DE TINTA HP DESIGNJET 711 CIAN DE 29 ML', 0.0000, 26.0000, 0, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 30.0000, 0.0000, NULL, '711CIAN', 0.0000);
INSERT INTO `productos` VALUES (36885, '', 'CARTUCHO DE TINTA HP DESIGNJET 711 CIAN DE 29 ML', 0.0000, 26.0000, 0, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 30.0000, 0.0000, NULL, '711CIAN', 0.0000);
INSERT INTO `productos` VALUES (36886, NULL, 'COCACOLA', 70.0000, 80.0000, 10, 0, 12, 1, '1000-01-01', 'FDFDFF', '0', NULL, NULL, NULL, NULL, '0', '1', 70.0000, 70.0000, 70.0000, 70.0000, 'EFEFEFEF', NULL);
INSERT INTO `productos` VALUES (36887, '', 'UNIDAD DE TAMBOR ', 160.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'TAMBOR', 100.0000);
INSERT INTO `productos` VALUES (36888, '', 'UNIDAD DE TAMBOR ', 160.0000, 0.0000, 2, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'TAMBOR', 100.0000);
INSERT INTO `productos` VALUES (36889, '', 'CUCHILLA PARA TAMBOR ', 50.0000, 0.0000, 0, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '1', 0.0000, 0.0000, 0.0000, NULL, 'CUCHITAMBOR', 16.0000);
INSERT INTO `productos` VALUES (36890, '', 'CUCHILLA PARA TAMBOR ', 50.0000, 0.0000, 2, 0, 12, 1, '1000-01-01', '', '0', 0.0000, 0.0000, 'VALDEZ MORALES ALEXANDER', '10408695924', '1', '2', 0.0000, 0.0000, 0.0000, NULL, 'CUCHITAMBOR', 16.0000);

-- ----------------------------
-- Table structure for productos_compras
-- ----------------------------
DROP TABLE IF EXISTS `productos_compras`;
CREATE TABLE `productos_compras`  (
  `id_producto_venta` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NULL DEFAULT NULL,
  `id_compra` int(11) NULL DEFAULT NULL,
  `cantidad` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `precio` double(10, 3) NULL DEFAULT NULL,
  `costo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_producto_venta`) USING BTREE,
  INDEX `id_producto`(`id_producto`) USING BTREE,
  INDEX `id_compra`(`id_compra`) USING BTREE,
  CONSTRAINT `productos_compras_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `productos_compras_ibfk_2` FOREIGN KEY (`id_compra`) REFERENCES `compras` (`id_compra`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 850 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of productos_compras
-- ----------------------------

-- ----------------------------
-- Table structure for productos_cotis
-- ----------------------------
DROP TABLE IF EXISTS `productos_cotis`;
CREATE TABLE `productos_cotis`  (
  `id_producto` int(11) NOT NULL,
  `id_coti` int(11) NOT NULL,
  `cantidad` double(6, 2) NULL DEFAULT NULL,
  `precio` double(10, 5) NULL DEFAULT NULL,
  `costo` double(10, 5) NULL DEFAULT NULL,
  PRIMARY KEY (`id_producto`, `id_coti`) USING BTREE,
  INDEX `id_coti`(`id_coti`) USING BTREE,
  CONSTRAINT `productos_cotis_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `productos_cotis_ibfk_3` FOREIGN KEY (`id_coti`) REFERENCES `cotizaciones` (`cotizacion_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of productos_cotis
-- ----------------------------
INSERT INTO `productos_cotis` VALUES (36253, 815, 1.00, 80.00000, 0.00000);
INSERT INTO `productos_cotis` VALUES (36255, 815, 1.00, 80.00000, 0.00000);
INSERT INTO `productos_cotis` VALUES (36257, 815, 1.00, 80.00000, 0.00000);
INSERT INTO `productos_cotis` VALUES (36259, 815, 1.00, 80.00000, 0.00000);
INSERT INTO `productos_cotis` VALUES (36267, 815, 1.00, 120.00000, 0.00000);
INSERT INTO `productos_cotis` VALUES (36267, 820, 1.00, 30.00000, 0.00000);
INSERT INTO `productos_cotis` VALUES (36267, 826, 1.00, 80.00000, 0.00000);
INSERT INTO `productos_cotis` VALUES (36485, 818, 1.00, 1976.00000, 1.00000);
INSERT INTO `productos_cotis` VALUES (36517, 821, 1.00, 120.00000, 1.00000);
INSERT INTO `productos_cotis` VALUES (36517, 823, 2.00, 120.00000, 1.00000);
INSERT INTO `productos_cotis` VALUES (36548, 827, 1.00, 550.00000, 490.00000);
INSERT INTO `productos_cotis` VALUES (36548, 847, 1.00, 550.00000, 426.43000);
INSERT INTO `productos_cotis` VALUES (36548, 851, 1.00, 2079.00000, 426.43000);
INSERT INTO `productos_cotis` VALUES (36548, 853, 1.00, 550.00000, 426.43000);
INSERT INTO `productos_cotis` VALUES (36555, 835, 1.00, 145.00000, 80.00000);
INSERT INTO `productos_cotis` VALUES (36579, 839, 1.00, 95.00000, 46.00000);
INSERT INTO `productos_cotis` VALUES (36579, 840, 1.00, 356.25000, 46.00000);
INSERT INTO `productos_cotis` VALUES (36579, 841, 1.00, 95.00000, 46.00000);
INSERT INTO `productos_cotis` VALUES (36580, 824, 1.00, 120.00000, 71.19000);
INSERT INTO `productos_cotis` VALUES (36580, 825, 1.00, 105.00000, 71.19000);
INSERT INTO `productos_cotis` VALUES (36580, 850, 4.00, 105.00000, 0.00000);
INSERT INTO `productos_cotis` VALUES (36581, 824, 1.00, 160.00000, 107.63000);
INSERT INTO `productos_cotis` VALUES (36581, 825, 1.00, 145.00000, 107.63000);
INSERT INTO `productos_cotis` VALUES (36581, 838, 1.00, 160.00000, 0.00000);
INSERT INTO `productos_cotis` VALUES (36581, 846, 4.00, 145.00000, 0.00000);
INSERT INTO `productos_cotis` VALUES (36609, 819, 1.00, 40.00000, 0.00000);
INSERT INTO `productos_cotis` VALUES (36611, 852, 1.00, 3800.00000, 2947.78000);
INSERT INTO `productos_cotis` VALUES (36614, 832, 1.00, 2887.50000, 2000.00000);
INSERT INTO `productos_cotis` VALUES (36614, 833, 1.00, 2887.50000, 2000.00000);
INSERT INTO `productos_cotis` VALUES (36614, 834, 1.00, 10943.62000, 2000.00000);
INSERT INTO `productos_cotis` VALUES (36621, 851, 1.00, 300.00000, 0.00000);
INSERT INTO `productos_cotis` VALUES (36623, 817, 1.00, 3490.00000, 0.00000);
INSERT INTO `productos_cotis` VALUES (36625, 816, 1.00, 2490.00000, 0.00000);
INSERT INTO `productos_cotis` VALUES (36627, 816, 1.00, 1200.00000, 0.00000);
INSERT INTO `productos_cotis` VALUES (36629, 817, 1.00, 2700.00000, 0.00000);
INSERT INTO `productos_cotis` VALUES (36629, 822, 1.00, 2750.00000, 0.00000);
INSERT INTO `productos_cotis` VALUES (36631, 842, 1.00, 550.00000, 410.51000);
INSERT INTO `productos_cotis` VALUES (36635, 839, 1.00, 95.00000, 80.00000);
INSERT INTO `productos_cotis` VALUES (36635, 840, 1.00, 356.25000, 80.00000);
INSERT INTO `productos_cotis` VALUES (36635, 841, 1.00, 95.00000, 80.00000);
INSERT INTO `productos_cotis` VALUES (36637, 839, 1.00, 95.00000, 80.00000);
INSERT INTO `productos_cotis` VALUES (36637, 840, 1.00, 356.25000, 80.00000);
INSERT INTO `productos_cotis` VALUES (36637, 841, 1.00, 95.00000, 80.00000);
INSERT INTO `productos_cotis` VALUES (36643, 830, 1.00, 80.00000, 40.00000);
INSERT INTO `productos_cotis` VALUES (36643, 831, 1.00, 67.79000, 40.00000);
INSERT INTO `productos_cotis` VALUES (36645, 826, 1.00, 180.00000, 0.00000);
INSERT INTO `productos_cotis` VALUES (36645, 830, 1.00, 80.00000, 40.00000);
INSERT INTO `productos_cotis` VALUES (36645, 831, 1.00, 67.79000, 40.00000);
INSERT INTO `productos_cotis` VALUES (36647, 830, 1.00, 80.00000, 40.00000);
INSERT INTO `productos_cotis` VALUES (36647, 831, 1.00, 67.79000, 40.00000);
INSERT INTO `productos_cotis` VALUES (36648, 843, 1.00, 80.00000, 0.00000);
INSERT INTO `productos_cotis` VALUES (36649, 843, 1.00, 80.00000, 0.00000);
INSERT INTO `productos_cotis` VALUES (36650, 843, 1.00, 80.00000, 0.00000);
INSERT INTO `productos_cotis` VALUES (36651, 843, 1.00, 80.00000, 0.00000);
INSERT INTO `productos_cotis` VALUES (36652, 843, 1.00, 80.00000, 0.00000);
INSERT INTO `productos_cotis` VALUES (36654, 829, 1.00, 120.00000, 30.00000);
INSERT INTO `productos_cotis` VALUES (36654, 836, 1.00, 60.00000, 30.00000);
INSERT INTO `productos_cotis` VALUES (36654, 837, 1.00, 60.00000, 30.00000);
INSERT INTO `productos_cotis` VALUES (36718, 830, 1.00, 80.00000, 40.00000);
INSERT INTO `productos_cotis` VALUES (36718, 831, 1.00, 67.79000, 40.00000);
INSERT INTO `productos_cotis` VALUES (36720, 830, 1.00, 80.00000, 40.00000);
INSERT INTO `productos_cotis` VALUES (36720, 831, 1.00, 67.79000, 40.00000);
INSERT INTO `productos_cotis` VALUES (36736, 839, 1.00, 95.00000, 80.00000);
INSERT INTO `productos_cotis` VALUES (36736, 840, 1.00, 356.25000, 80.00000);
INSERT INTO `productos_cotis` VALUES (36736, 841, 1.00, 95.00000, 80.00000);
INSERT INTO `productos_cotis` VALUES (36738, 839, 2.00, 95.00000, 80.00000);
INSERT INTO `productos_cotis` VALUES (36738, 840, 2.00, 356.25000, 80.00000);
INSERT INTO `productos_cotis` VALUES (36738, 841, 2.00, 95.00000, 80.00000);
INSERT INTO `productos_cotis` VALUES (36756, 828, 1.00, 2000.00000, 0.00000);
INSERT INTO `productos_cotis` VALUES (36766, 836, 1.00, 109.00000, 0.00000);
INSERT INTO `productos_cotis` VALUES (36766, 837, 1.00, 109.00000, 0.00000);
INSERT INTO `productos_cotis` VALUES (36768, 836, 1.00, 200.00000, 0.00000);
INSERT INTO `productos_cotis` VALUES (36768, 837, 1.00, 200.00000, 0.00000);
INSERT INTO `productos_cotis` VALUES (36770, 836, 1.00, 12.00000, 0.00000);
INSERT INTO `productos_cotis` VALUES (36770, 837, 1.00, 12.00000, 0.00000);
INSERT INTO `productos_cotis` VALUES (36794, 848, 1.00, 180.00000, 118.23000);
INSERT INTO `productos_cotis` VALUES (36794, 849, 1.00, 180.00000, 118.23000);
INSERT INTO `productos_cotis` VALUES (36798, 844, 1.00, 580.00000, 295.67000);
INSERT INTO `productos_cotis` VALUES (36798, 845, 1.00, 580.00000, 295.67000);
INSERT INTO `productos_cotis` VALUES (36816, 847, 1.00, 42.00000, 5.03000);

-- ----------------------------
-- Table structure for productos_ventas
-- ----------------------------
DROP TABLE IF EXISTS `productos_ventas`;
CREATE TABLE `productos_ventas`  (
  `id_producto` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `cantidad` double(6, 2) NULL DEFAULT NULL,
  `precio` double(10, 5) NULL DEFAULT NULL,
  `costo` double(10, 5) NULL DEFAULT NULL,
  `precio_usado` char(1) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  INDEX `fk_productos_has_ventas_ventas1_idx`(`id_venta`) USING BTREE,
  INDEX `fk_productos_has_ventas_productos1_idx`(`id_producto`) USING BTREE,
  CONSTRAINT `fk_productos_has_ventas_productos1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_productos_has_ventas_ventas1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of productos_ventas
-- ----------------------------
INSERT INTO `productos_ventas` VALUES (36234, 6299, 1.00, 0.00000, 520.00000, '');
INSERT INTO `productos_ventas` VALUES (36233, 6300, 1.00, 550.00000, 520.00000, '1');
INSERT INTO `productos_ventas` VALUES (36233, 6301, 1.00, 550.00000, 520.00000, '1');
INSERT INTO `productos_ventas` VALUES (36235, 6302, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36241, 6302, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36239, 6302, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36243, 6302, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36237, 6302, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36247, 6302, 4.00, 5.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36245, 6302, 4.00, 5.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36255, 6303, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36259, 6303, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36253, 6303, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36261, 6303, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36233, 6308, 1.00, 550.00000, 520.00000, '0');
INSERT INTO `productos_ventas` VALUES (36233, 6309, 1.00, 0.00000, 520.00000, '');
INSERT INTO `productos_ventas` VALUES (36233, 6310, 1.00, 2079.00000, 520.00000, '1');
INSERT INTO `productos_ventas` VALUES (36436, 6311, 6.00, 90.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36261, 6311, 2.00, 48.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36257, 6311, 1.00, 48.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36255, 6311, 1.00, 48.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36259, 6311, 1.00, 48.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36253, 6311, 1.00, 48.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36265, 6312, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36254, 6314, 1.00, 0.00000, 0.00000, '');
INSERT INTO `productos_ventas` VALUES (36255, 6314, 1.00, 0.00000, 0.00000, '');
INSERT INTO `productos_ventas` VALUES (36259, 6314, 1.00, 0.00000, 0.00000, '');
INSERT INTO `productos_ventas` VALUES (36257, 6314, 1.00, 0.00000, 0.00000, '');
INSERT INTO `productos_ventas` VALUES (36267, 6314, 1.00, 0.00000, 0.00000, '');
INSERT INTO `productos_ventas` VALUES (36253, 6315, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36257, 6315, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36255, 6315, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36259, 6315, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36267, 6315, 1.00, 120.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36539, 6316, 1.00, 0.00000, 15.00000, 'I');
INSERT INTO `productos_ventas` VALUES (36601, 6316, 1.00, 0.00000, 15.00000, 'I');
INSERT INTO `productos_ventas` VALUES (36603, 6316, 2.00, 0.00000, 1.00000, 'I');
INSERT INTO `productos_ventas` VALUES (36538, 6317, 1.00, 18.00000, 15.00000, '0');
INSERT INTO `productos_ventas` VALUES (36539, 6317, 1.00, 18.00000, 15.00000, '0');
INSERT INTO `productos_ventas` VALUES (36603, 6317, 2.00, 5.00000, 1.00000, '0');
INSERT INTO `productos_ventas` VALUES (36605, 6318, 1.00, 160.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36235, 6318, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36243, 6318, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36239, 6318, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36237, 6318, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36489, 6319, 1.00, 160.00000, 1.00000, '1');
INSERT INTO `productos_ventas` VALUES (36253, 6319, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36259, 6319, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36255, 6319, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36494, 6320, 1.00, 180.00000, 1.00000, '1');
INSERT INTO `productos_ventas` VALUES (36436, 6320, 1.00, 90.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36436, 6320, 1.00, 90.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36480, 6321, 1.00, 125.00000, 1.00000, '1');
INSERT INTO `productos_ventas` VALUES (36479, 6321, 1.00, 125.00000, 1.00000, '1');
INSERT INTO `productos_ventas` VALUES (36477, 6321, 1.00, 125.00000, 1.00000, '1');
INSERT INTO `productos_ventas` VALUES (36261, 6322, 2.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36253, 6322, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36259, 6322, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36255, 6322, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36235, 6322, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36243, 6322, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36510, 6323, 1.00, 80.00000, 1.00000, '1');
INSERT INTO `productos_ventas` VALUES (36509, 6323, 1.00, 80.00000, 1.00000, '1');
INSERT INTO `productos_ventas` VALUES (36492, 6323, 1.00, 100.00000, 1.00000, '1');
INSERT INTO `productos_ventas` VALUES (36436, 6324, 1.00, 90.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36243, 6325, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36253, 6325, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36611, 6326, 7.00, 3.00000, 0.00000, '');
INSERT INTO `productos_ventas` VALUES (36237, 6326, 1.00, 48.00000, 0.00000, '');
INSERT INTO `productos_ventas` VALUES (36239, 6326, 1.00, 48.00000, 0.00000, '');
INSERT INTO `productos_ventas` VALUES (36243, 6326, 1.00, 48.00000, 0.00000, '');
INSERT INTO `productos_ventas` VALUES (36241, 6326, 1.00, 48.00000, 0.00000, '');
INSERT INTO `productos_ventas` VALUES (36235, 6326, 1.00, 48.00000, 0.00000, '');
INSERT INTO `productos_ventas` VALUES (36552, 6326, 1.00, 96.00000, 0.00000, '');
INSERT INTO `productos_ventas` VALUES (36261, 6326, 3.00, 48.00000, 0.00000, '');
INSERT INTO `productos_ventas` VALUES (36609, 6326, 2.00, 40.00000, 0.00000, '');
INSERT INTO `productos_ventas` VALUES (36490, 6327, 1.00, 160.00000, 1.00000, '1');
INSERT INTO `productos_ventas` VALUES (36485, 6328, 1.00, 550.00000, 1.00000, '0');
INSERT INTO `productos_ventas` VALUES (36480, 6330, 1.00, 125.00000, 1.00000, '1');
INSERT INTO `productos_ventas` VALUES (36621, 6331, 1.00, 122.20000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36543, 6332, 1.00, 120.00000, 100.00000, '1');
INSERT INTO `productos_ventas` VALUES (36267, 6333, 1.00, 52.00000, 0.00000, '0');
INSERT INTO `productos_ventas` VALUES (36597, 6334, 1.00, 100.00000, 0.00000, '');
INSERT INTO `productos_ventas` VALUES (36598, 6334, 1.00, 40.00000, 0.00000, '');
INSERT INTO `productos_ventas` VALUES (36241, 6335, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36598, 6336, 5.00, 40.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36489, 6337, 1.00, 160.00000, 1.00000, '1');
INSERT INTO `productos_ventas` VALUES (36598, 6338, 1.00, 50.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36267, 6339, 1.00, 200.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36265, 6340, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36233, 6341, 1.00, 0.00000, 520.00000, 'I');
INSERT INTO `productos_ventas` VALUES (36485, 6341, 1.00, 0.00000, 1.00000, 'I');
INSERT INTO `productos_ventas` VALUES (36233, 6342, 1.00, 0.00000, 520.00000, 'N');
INSERT INTO `productos_ventas` VALUES (36485, 6342, 1.00, 0.00000, 1.00000, 'N');
INSERT INTO `productos_ventas` VALUES (36485, 6343, 1.00, 502.50000, 1.00000, '0');
INSERT INTO `productos_ventas` VALUES (36233, 6343, 1.00, 502.50000, 520.00000, '0');
INSERT INTO `productos_ventas` VALUES (36485, 6344, 1.00, 2091.00000, 1.00000, '1');
INSERT INTO `productos_ventas` VALUES (36436, 6329, 1.00, 90.00000, 1.00000, '1');
INSERT INTO `productos_ventas` VALUES (36499, 6345, 1.00, 0.00000, 1.00000, '');
INSERT INTO `productos_ventas` VALUES (36562, 6346, 1.00, 80.00000, 7.60000, '1');
INSERT INTO `productos_ventas` VALUES (36543, 6347, 1.00, 0.00000, 100.00000, '');
INSERT INTO `productos_ventas` VALUES (36543, 6348, 1.00, 125.00000, 100.00000, '1');
INSERT INTO `productos_ventas` VALUES (36257, 6349, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36255, 6349, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36631, 6350, 1.00, 145.00000, 145.00000, '1');
INSERT INTO `productos_ventas` VALUES (36261, 6350, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36482, 6351, 1.00, 407.67000, 1.00000, '1');
INSERT INTO `productos_ventas` VALUES (36540, 6352, 1.00, 120.00000, 100.00000, '1');
INSERT INTO `productos_ventas` VALUES (36255, 6352, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36253, 6352, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36490, 6353, 1.00, 160.00000, 1.00000, '1');
INSERT INTO `productos_ventas` VALUES (36551, 6353, 1.00, 160.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36486, 6353, 1.00, 160.00000, 1.00000, '1');
INSERT INTO `productos_ventas` VALUES (36487, 6353, 1.00, 160.00000, 1.00000, '1');
INSERT INTO `productos_ventas` VALUES (36257, 6353, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36633, 6353, 1.00, 197.60000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36548, 6354, 1.00, 2095.50000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36529, 6354, 1.00, 50.00000, 17.33000, '1');
INSERT INTO `productos_ventas` VALUES (36635, 6355, 1.00, 1970.80000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36635, 6356, 1.00, 1970.80000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36548, 6357, 1.00, 0.00000, 0.00000, 'I');
INSERT INTO `productos_ventas` VALUES (36530, 6358, 1.00, 30.00000, 17.33000, '1');
INSERT INTO `productos_ventas` VALUES (36594, 6358, 1.00, 30.00000, 17.33000, '1');
INSERT INTO `productos_ventas` VALUES (36265, 6359, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36548, 6360, 1.00, 550.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36619, 6361, 1.00, 150.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36494, 6363, 1.00, 160.00000, 1.00000, '1');
INSERT INTO `productos_ventas` VALUES (36493, 6363, 1.00, 80.00000, 1.00000, '1');
INSERT INTO `productos_ventas` VALUES (36259, 6363, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36255, 6363, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36635, 6362, 1.00, 1965.60000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36635, 6364, 1.00, 1965.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36553, 6365, 3.00, 160.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36488, 6365, 1.00, 160.00000, 1.00000, '');
INSERT INTO `productos_ventas` VALUES (36549, 6365, 1.00, 160.00000, 0.00000, '');
INSERT INTO `productos_ventas` VALUES (36487, 6365, 1.00, 160.00000, 1.00000, '1');
INSERT INTO `productos_ventas` VALUES (36552, 6365, 1.00, 160.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36548, 6366, 2.00, 520.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36627, 6367, 1.00, 4750.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36627, 6368, 1.00, 4750.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36267, 6369, 1.00, 40.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36629, 6370, 1.00, 10367.50000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36581, 6370, 1.00, 160.00000, 107.63000, '1');
INSERT INTO `productos_ventas` VALUES (36548, 6371, 1.00, 550.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36483, 6372, 1.00, 403.39000, 1.00000, '1');
INSERT INTO `productos_ventas` VALUES (36480, 6372, 1.00, 125.00000, 1.00000, '1');
INSERT INTO `productos_ventas` VALUES (36540, 6372, 1.00, 125.00000, 100.00000, '1');
INSERT INTO `productos_ventas` VALUES (36548, 6373, 1.00, 639.50000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36251, 6373, 1.00, 30.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36249, 6373, 1.00, 30.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36553, 6373, 1.00, 160.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36546, 6374, 1.00, 404.46000, 360.84000, '1');
INSERT INTO `productos_ventas` VALUES (36265, 6375, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36265, 6376, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36599, 6377, 1.00, 300.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36265, 6378, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36548, 6379, 1.00, 500.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36255, 6380, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36253, 6380, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36540, 6381, 1.00, 120.00000, 100.00000, '');
INSERT INTO `productos_ventas` VALUES (36541, 6381, 1.00, 120.00000, 100.00000, '');
INSERT INTO `productos_ventas` VALUES (36542, 6381, 1.00, 120.00000, 100.00000, '');
INSERT INTO `productos_ventas` VALUES (36543, 6381, 1.00, 120.00000, 100.00000, '');
INSERT INTO `productos_ventas` VALUES (36598, 6381, 2.00, 40.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36554, 6382, 2.00, 120.00000, 28.00000, '1');
INSERT INTO `productos_ventas` VALUES (36639, 6383, 1.00, 20.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36493, 6383, 1.00, 80.00000, 1.00000, '1');
INSERT INTO `productos_ventas` VALUES (36253, 6383, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36259, 6383, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36641, 6383, 1.00, 40.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36553, 6384, 1.00, 160.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36267, 6385, 1.00, 180.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36239, 6386, 1.00, 48.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36611, 6386, 6.00, 3.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36643, 6387, 1.00, 340.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36267, 6388, 1.00, 80.00000, 0.00000, '5');
INSERT INTO `productos_ventas` VALUES (36645, 6388, 1.00, 180.00000, 0.00000, '5');
INSERT INTO `productos_ventas` VALUES (36548, 6389, 1.00, 2095.50000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36265, 6390, 1.00, 50.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36548, 6391, 1.00, 2068.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36627, 6392, 1.00, 1200.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36710, 6393, 1.00, 15.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36637, 6393, 1.00, 35.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36265, 6394, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36551, 6395, 1.00, 160.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36261, 6395, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36641, 6396, 1.00, 2.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36712, 6397, 2.00, 80.00000, 40.00000, '1');
INSERT INTO `productos_ventas` VALUES (36712, 6398, 4.00, 80.00000, 40.00000, '1');
INSERT INTO `productos_ventas` VALUES (36548, 6399, 1.00, 2073.50000, 0.00000, '2');
INSERT INTO `productos_ventas` VALUES (36562, 6400, 1.00, 90.00000, 7.60000, '1');
INSERT INTO `productos_ventas` VALUES (36645, 6401, 1.00, 80.00000, 40.00000, '1');
INSERT INTO `productos_ventas` VALUES (36643, 6402, 1.00, 90.00000, 40.00000, '1');
INSERT INTO `productos_ventas` VALUES (36652, 6402, 1.00, 90.00000, 40.00000, '1');
INSERT INTO `productos_ventas` VALUES (36619, 6403, 1.00, 40.00000, 5.00000, '1');
INSERT INTO `productos_ventas` VALUES (36645, 6403, 1.00, 90.00000, 40.00000, '1');
INSERT INTO `productos_ventas` VALUES (36641, 6403, 3.00, 5.00000, 1.00000, '1');
INSERT INTO `productos_ventas` VALUES (36714, 6403, 3.00, 5.00000, 1.00000, '1');
INSERT INTO `productos_ventas` VALUES (36556, 6404, 1.00, 80.00000, 40.00000, '1');
INSERT INTO `productos_ventas` VALUES (36531, 6405, 1.00, 30.00000, 17.33000, '1');
INSERT INTO `productos_ventas` VALUES (36716, 6406, 1.00, 220.00000, 200.00000, '1');
INSERT INTO `productos_ventas` VALUES (36554, 6407, 1.00, 120.00000, 80.00000, '1');
INSERT INTO `productos_ventas` VALUES (36613, 6408, 1.00, 5216.74000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36548, 6409, 1.00, 0.00000, 0.00000, 'I');
INSERT INTO `productos_ventas` VALUES (36548, 6410, 1.00, 0.00000, 0.00000, 'I');
INSERT INTO `productos_ventas` VALUES (36548, 6411, 1.00, 550.00000, 0.00000, '3');
INSERT INTO `productos_ventas` VALUES (36528, 6412, 1.00, 30.00000, 17.33000, '1');
INSERT INTO `productos_ventas` VALUES (36593, 6412, 1.00, 30.00000, 17.33000, '1');
INSERT INTO `productos_ventas` VALUES (36562, 6412, 1.00, 90.00000, 7.60000, '1');
INSERT INTO `productos_ventas` VALUES (36619, 6412, 1.00, 40.00000, 5.00000, '1');
INSERT INTO `productos_ventas` VALUES (36643, 6412, 1.00, 80.00000, 40.00000, '1');
INSERT INTO `productos_ventas` VALUES (36645, 6412, 1.00, 80.00000, 40.00000, '1');
INSERT INTO `productos_ventas` VALUES (36647, 6412, 1.00, 80.00000, 40.00000, '1');
INSERT INTO `productos_ventas` VALUES (36720, 6412, 1.00, 80.00000, 40.00000, '1');
INSERT INTO `productos_ventas` VALUES (36718, 6412, 1.00, 80.00000, 40.00000, '1');
INSERT INTO `productos_ventas` VALUES (36728, 6413, 1.00, 90.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36724, 6413, 1.00, 90.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36722, 6413, 1.00, 90.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36730, 6413, 1.00, 90.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36726, 6413, 1.00, 90.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36548, 6414, 1.00, 2068.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36650, 6415, 1.00, 90.00000, 40.00000, '1');
INSERT INTO `productos_ventas` VALUES (36651, 6415, 1.00, 90.00000, 40.00000, '1');
INSERT INTO `productos_ventas` VALUES (36649, 6415, 1.00, 90.00000, 40.00000, '1');
INSERT INTO `productos_ventas` VALUES (36732, 6416, 1.00, 21.05263, 40.00000, '0');
INSERT INTO `productos_ventas` VALUES (36732, 6417, 1.00, 80.00000, 40.00000, '1');
INSERT INTO `productos_ventas` VALUES (36734, 6418, 2.00, 80.00000, 40.00000, '1');
INSERT INTO `productos_ventas` VALUES (36650, 6419, 1.00, 90.00000, 40.00000, '1');
INSERT INTO `productos_ventas` VALUES (36651, 6419, 1.00, 90.00000, 40.00000, '');
INSERT INTO `productos_ventas` VALUES (36649, 6419, 1.00, 90.00000, 40.00000, '');
INSERT INTO `productos_ventas` VALUES (36548, 6420, 1.00, 2068.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36554, 6420, 1.00, 100.00000, 80.00000, '1');
INSERT INTO `productos_ventas` VALUES (36556, 6421, 1.00, 80.00000, 40.00000, '1');
INSERT INTO `productos_ventas` VALUES (36557, 6421, 1.00, 160.00000, 80.00000, '1');
INSERT INTO `productos_ventas` VALUES (36720, 6421, 1.00, 80.00000, 40.00000, '1');
INSERT INTO `productos_ventas` VALUES (36645, 6421, 1.00, 80.00000, 40.00000, '1');
INSERT INTO `productos_ventas` VALUES (36718, 6421, 1.00, 80.00000, 40.00000, '1');
INSERT INTO `productos_ventas` VALUES (36643, 6421, 1.00, 80.00000, 40.00000, '1');
INSERT INTO `productos_ventas` VALUES (36645, 6422, 1.00, 80.00000, 40.00000, '1');
INSERT INTO `productos_ventas` VALUES (36740, 6422, 1.00, 125.00000, 100.00000, '1');
INSERT INTO `productos_ventas` VALUES (36623, 6423, 1.00, 125.00000, 100.00000, '1');
INSERT INTO `productos_ventas` VALUES (36742, 6423, 1.00, 125.00000, 100.00000, '1');
INSERT INTO `productos_ventas` VALUES (36720, 6424, 1.00, 90.00000, 40.00000, '1');
INSERT INTO `productos_ventas` VALUES (36645, 6424, 1.00, 90.00000, 40.00000, '1');
INSERT INTO `productos_ventas` VALUES (36718, 6424, 1.00, 90.00000, 40.00000, '1');
INSERT INTO `productos_ventas` VALUES (36643, 6424, 1.00, 90.00000, 40.00000, '1');
INSERT INTO `productos_ventas` VALUES (36552, 6425, 6.00, 100.00000, 80.00000, '1');
INSERT INTO `productos_ventas` VALUES (36551, 6425, 1.00, 100.00000, 80.00000, '1');
INSERT INTO `productos_ventas` VALUES (36623, 6426, 1.00, 125.00000, 100.00000, '1');
INSERT INTO `productos_ventas` VALUES (36625, 6426, 1.00, 125.00000, 100.00000, '1');
INSERT INTO `productos_ventas` VALUES (36740, 6426, 1.00, 125.00000, 100.00000, '1');
INSERT INTO `productos_ventas` VALUES (36553, 6427, 1.00, 160.00000, 80.00000, '');
INSERT INTO `productos_ventas` VALUES (36552, 6427, 1.00, 160.00000, 80.00000, '');
INSERT INTO `productos_ventas` VALUES (36550, 6427, 1.00, 160.00000, 80.00000, '');
INSERT INTO `productos_ventas` VALUES (36627, 6428, 1.00, 405.53000, 360.84000, '1');
INSERT INTO `productos_ventas` VALUES (36548, 6429, 1.00, 2025.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36554, 6429, 1.00, 120.00000, 80.00000, '1');
INSERT INTO `productos_ventas` VALUES (36548, 6430, 1.00, 2079.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36548, 6431, 1.00, 0.00000, 0.00000, 'I');
INSERT INTO `productos_ventas` VALUES (36553, 6432, 1.00, 160.00000, 80.00000, '1');
INSERT INTO `productos_ventas` VALUES (36720, 6432, 1.00, 80.00000, 40.00000, '1');
INSERT INTO `productos_ventas` VALUES (36643, 6433, 1.00, 90.00000, 40.00000, '1');
INSERT INTO `productos_ventas` VALUES (36651, 6434, 1.00, 90.00000, 40.00000, '1');
INSERT INTO `productos_ventas` VALUES (36549, 6435, 1.00, 160.00000, 80.00000, '1');
INSERT INTO `productos_ventas` VALUES (36643, 6435, 1.00, 80.00000, 40.00000, '1');
INSERT INTO `productos_ventas` VALUES (36652, 6435, 1.00, 80.00000, 40.00000, '1');
INSERT INTO `productos_ventas` VALUES (36548, 6436, 1.00, 0.00000, 490.00000, 'I');
INSERT INTO `productos_ventas` VALUES (36548, 6437, 1.00, 2079.00000, 490.00000, '1');
INSERT INTO `productos_ventas` VALUES (36744, 6438, 1.00, 341.10000, 30.00000, '1');
INSERT INTO `productos_ventas` VALUES (36653, 6438, 1.00, 80.00000, 30.00000, '1');
INSERT INTO `productos_ventas` VALUES (36548, 6439, 1.00, 2084.50000, 490.00000, '1');
INSERT INTO `productos_ventas` VALUES (36562, 6439, 1.00, 82.50000, 7.60000, '1');
INSERT INTO `productos_ventas` VALUES (36629, 6440, 1.00, 0.00000, 360.84000, 'I');
INSERT INTO `productos_ventas` VALUES (36748, 6440, 1.00, 0.00000, 0.00000, 'I');
INSERT INTO `productos_ventas` VALUES (36623, 6440, 1.00, 0.00000, 100.00000, 'I');
INSERT INTO `productos_ventas` VALUES (36750, 6440, 1.00, 0.00000, 95.00000, 'I');
INSERT INTO `productos_ventas` VALUES (36629, 6441, 1.00, 105.00000, 360.84000, '3');
INSERT INTO `productos_ventas` VALUES (36748, 6441, 1.00, 105.00000, 0.00000, '3');
INSERT INTO `productos_ventas` VALUES (36627, 6441, 1.00, 105.00000, 360.84000, '3');
INSERT INTO `productos_ventas` VALUES (36750, 6441, 1.00, 105.00000, 95.00000, '3');
INSERT INTO `productos_ventas` VALUES (36720, 6442, 1.00, 90.00000, 40.00000, '1');
INSERT INTO `productos_ventas` VALUES (36645, 6442, 1.00, 90.00000, 40.00000, '1');
INSERT INTO `productos_ventas` VALUES (36718, 6442, 1.00, 90.00000, 40.00000, '1');
INSERT INTO `productos_ventas` VALUES (36647, 6443, 1.00, 90.00000, 40.00000, '');
INSERT INTO `productos_ventas` VALUES (36643, 6443, 1.00, 90.00000, 40.00000, '');
INSERT INTO `productos_ventas` VALUES (36553, 6444, 1.00, 160.00000, 80.00000, '');
INSERT INTO `productos_ventas` VALUES (36718, 6444, 1.00, 80.00000, 40.00000, '');
INSERT INTO `productos_ventas` VALUES (36595, 6445, 1.00, 100.00000, 34.00000, '1');
INSERT INTO `productos_ventas` VALUES (36596, 6445, 1.00, 20.00000, 20.40000, '1');
INSERT INTO `productos_ventas` VALUES (36595, 6446, 2.00, 100.00000, 34.00000, '1');
INSERT INTO `productos_ventas` VALUES (36596, 6446, 2.00, 45.00000, 20.40000, '1');
INSERT INTO `productos_ventas` VALUES (36720, 6447, 1.00, 90.00000, 40.00000, '1');
INSERT INTO `productos_ventas` VALUES (36718, 6447, 1.00, 90.00000, 40.00000, '1');
INSERT INTO `productos_ventas` VALUES (36643, 6447, 1.00, 90.00000, 40.00000, '1');
INSERT INTO `productos_ventas` VALUES (36645, 6447, 1.00, 90.00000, 40.00000, '1');
INSERT INTO `productos_ventas` VALUES (36623, 6448, 1.00, 120.00000, 100.00000, '1');
INSERT INTO `productos_ventas` VALUES (36742, 6448, 1.00, 120.00000, 100.00000, '1');
INSERT INTO `productos_ventas` VALUES (36740, 6448, 1.00, 120.00000, 100.00000, '1');
INSERT INTO `productos_ventas` VALUES (36555, 6449, 2.00, 120.00000, 80.00000, '1');
INSERT INTO `productos_ventas` VALUES (36596, 6450, 1.00, 50.00000, 20.40000, '1');
INSERT INTO `productos_ventas` VALUES (36752, 6451, 1.00, 14440.00000, 2000.00000, '1');
INSERT INTO `productos_ventas` VALUES (36754, 6452, 1.00, 100.00000, 50.00000, '1');
INSERT INTO `productos_ventas` VALUES (36554, 6453, 1.00, 120.00000, 80.00000, '1');
INSERT INTO `productos_ventas` VALUES (36548, 6454, 1.00, 550.00000, 490.00000, '3');
INSERT INTO `productos_ventas` VALUES (36742, 6455, 1.00, 125.00000, 100.00000, '1');
INSERT INTO `productos_ventas` VALUES (36555, 6456, 2.00, 130.00000, 80.00000, '1');
INSERT INTO `productos_ventas` VALUES (36579, 6457, 1.00, 0.00000, 46.00000, 'I');
INSERT INTO `productos_ventas` VALUES (36738, 6457, 1.00, 0.00000, 46.00000, 'I');
INSERT INTO `productos_ventas` VALUES (36548, 6457, 1.00, 0.00000, 490.00000, 'I');
INSERT INTO `productos_ventas` VALUES (36579, 6458, 1.00, 95.00000, 46.00000, '1');
INSERT INTO `productos_ventas` VALUES (36738, 6458, 1.00, 95.00000, 46.00000, '1');
INSERT INTO `productos_ventas` VALUES (36548, 6458, 1.00, 550.00000, 490.00000, '1');
INSERT INTO `productos_ventas` VALUES (36738, 6459, 2.00, 361.95000, 46.00000, '1');
INSERT INTO `productos_ventas` VALUES (36548, 6459, 1.00, 2095.50000, 490.00000, '1');
INSERT INTO `productos_ventas` VALUES (36548, 6460, 1.00, 600.00000, 490.00000, '3');
INSERT INTO `productos_ventas` VALUES (36554, 6461, 3.00, 90.00000, 80.00000, '1');
INSERT INTO `productos_ventas` VALUES (36650, 6462, 1.00, 20.94241, 40.00000, '0');
INSERT INTO `productos_ventas` VALUES (36596, 6463, 1.00, 50.00000, 20.40000, '1');
INSERT INTO `productos_ventas` VALUES (36629, 6464, 1.00, 105.00000, 95.00000, '3');
INSERT INTO `productos_ventas` VALUES (36748, 6464, 1.00, 105.00000, 95.00000, '3');
INSERT INTO `productos_ventas` VALUES (36627, 6464, 1.00, 105.00000, 95.00000, '3');
INSERT INTO `productos_ventas` VALUES (36750, 6464, 1.00, 105.00000, 95.00000, '3');
INSERT INTO `productos_ventas` VALUES (36554, 6465, 2.00, 120.00000, 80.00000, '1');
INSERT INTO `productos_ventas` VALUES (36647, 6466, 1.00, 80.00000, 40.00000, '1');
INSERT INTO `productos_ventas` VALUES (36602, 6467, 1.00, 160.00000, 80.00000, '1');
INSERT INTO `productos_ventas` VALUES (36718, 6467, 1.00, 80.00000, 40.00000, '1');
INSERT INTO `productos_ventas` VALUES (36647, 6467, 1.00, 80.00000, 40.00000, '1');
INSERT INTO `productos_ventas` VALUES (36720, 6467, 1.00, 80.00000, 40.00000, '1');
INSERT INTO `productos_ventas` VALUES (36557, 6468, 1.00, 180.00000, 80.00000, '1');
INSERT INTO `productos_ventas` VALUES (36720, 6468, 1.00, 90.00000, 40.00000, '1');
INSERT INTO `productos_ventas` VALUES (36764, 6468, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36558, 6469, 1.00, 90.00000, 8.36000, '1');
INSERT INTO `productos_ventas` VALUES (36720, 6470, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36649, 6471, 1.00, 80.00000, 40.00000, '1');
INSERT INTO `productos_ventas` VALUES (36650, 6471, 1.00, 80.00000, 40.00000, '1');
INSERT INTO `productos_ventas` VALUES (36548, 6472, 1.00, 2084.00000, 490.00000, '1');
INSERT INTO `productos_ventas` VALUES (36549, 6473, 1.00, 150.00000, 80.00000, '');
INSERT INTO `productos_ventas` VALUES (36553, 6473, 2.00, 150.00000, 80.00000, '');
INSERT INTO `productos_ventas` VALUES (36550, 6473, 1.00, 150.00000, 80.00000, '');
INSERT INTO `productos_ventas` VALUES (36551, 6473, 1.00, 150.00000, 80.00000, '');
INSERT INTO `productos_ventas` VALUES (36602, 6474, 1.00, 160.00000, 80.00000, '1');
INSERT INTO `productos_ventas` VALUES (36720, 6474, 1.00, 80.00000, 0.00000, '');
INSERT INTO `productos_ventas` VALUES (36645, 6474, 1.00, 80.00000, 40.00000, '');
INSERT INTO `productos_ventas` VALUES (36718, 6474, 1.00, 80.00000, 0.00000, '');
INSERT INTO `productos_ventas` VALUES (36552, 6474, 1.00, 160.00000, 80.00000, '1');
INSERT INTO `productos_ventas` VALUES (36528, 6475, 1.00, 30.00000, 17.33000, '1');
INSERT INTO `productos_ventas` VALUES (36654, 6475, 1.00, 160.00000, 30.00000, '1');
INSERT INTO `productos_ventas` VALUES (36653, 6476, 1.00, 80.00000, 30.00000, '1');
INSERT INTO `productos_ventas` VALUES (36591, 6477, 1.00, 30.00000, 4.40000, '1');
INSERT INTO `productos_ventas` VALUES (36654, 6477, 1.00, 160.00000, 30.00000, '1');
INSERT INTO `productos_ventas` VALUES (36653, 6478, 1.00, 80.00000, 30.00000, '1');
INSERT INTO `productos_ventas` VALUES (36653, 6479, 1.00, 80.00000, 30.00000, '1');
INSERT INTO `productos_ventas` VALUES (36653, 6480, 1.00, 80.00000, 30.00000, '1');
INSERT INTO `productos_ventas` VALUES (36653, 6481, 1.00, 60.00000, 30.00000, '1');
INSERT INTO `productos_ventas` VALUES (36653, 6482, 1.00, 120.00000, 30.00000, '1');
INSERT INTO `productos_ventas` VALUES (36653, 6483, 1.00, 80.00000, 30.00000, '1');
INSERT INTO `productos_ventas` VALUES (36654, 6484, 1.00, 250.00000, 30.00000, '1');
INSERT INTO `productos_ventas` VALUES (36654, 6484, 1.00, 200.00000, 30.00000, '1');
INSERT INTO `productos_ventas` VALUES (36653, 6485, 1.00, 80.00000, 30.00000, '1');
INSERT INTO `productos_ventas` VALUES (36597, 6486, 1.00, 1122.00000, 270.00000, '1');
INSERT INTO `productos_ventas` VALUES (36744, 6486, 1.00, 250.00000, 60.00000, '1');
INSERT INTO `productos_ventas` VALUES (36597, 6487, 1.00, 1122.00000, 270.00000, '1');
INSERT INTO `productos_ventas` VALUES (36744, 6487, 1.00, 250.00000, 60.00000, '1');
INSERT INTO `productos_ventas` VALUES (36555, 6488, 2.00, 147.50000, 80.00000, '1');
INSERT INTO `productos_ventas` VALUES (36548, 6489, 1.00, 2062.50000, 490.00000, '1');
INSERT INTO `productos_ventas` VALUES (36720, 6490, 1.00, 90.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36647, 6490, 1.00, 90.00000, 40.00000, '1');
INSERT INTO `productos_ventas` VALUES (36645, 6490, 1.00, 90.00000, 40.00000, '1');
INSERT INTO `productos_ventas` VALUES (36718, 6490, 1.00, 90.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36643, 6490, 1.00, 90.00000, 40.00000, '1');
INSERT INTO `productos_ventas` VALUES (36557, 6491, 1.00, 160.00000, 80.00000, '1');
INSERT INTO `productos_ventas` VALUES (36647, 6492, 1.00, 90.00000, 40.00000, '1');
INSERT INTO `productos_ventas` VALUES (36653, 6492, 1.00, 60.00000, 30.00000, '1');
INSERT INTO `productos_ventas` VALUES (36625, 6493, 2.00, 120.00000, 100.00000, '1');
INSERT INTO `productos_ventas` VALUES (36716, 6494, 1.00, 220.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36548, 6495, 1.00, 520.00000, 490.00000, '1');
INSERT INTO `productos_ventas` VALUES (36548, 6496, 1.00, 2051.50000, 490.00000, '1');
INSERT INTO `productos_ventas` VALUES (36654, 6497, 2.00, 120.00000, 30.00000, '1');
INSERT INTO `productos_ventas` VALUES (36742, 6498, 1.00, 120.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36740, 6498, 1.00, 120.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36613, 6499, 1.00, 5035.50000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36613, 6500, 1.00, 5035.50000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36581, 6501, 1.00, 160.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36581, 6502, 1.00, 150.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36631, 6503, 1.00, 499.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36772, 6504, 2.00, 280.00000, 182.31000, '1');
INSERT INTO `productos_ventas` VALUES (36548, 6504, 1.00, 510.00000, 490.00000, '1');
INSERT INTO `productos_ventas` VALUES (36555, 6505, 1.00, 120.00000, 80.00000, '1');
INSERT INTO `productos_ventas` VALUES (36554, 6506, 1.00, 120.00000, 80.00000, '1');
INSERT INTO `productos_ventas` VALUES (36764, 6507, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36654, 6508, 1.00, 160.00000, 30.00000, '1');
INSERT INTO `productos_ventas` VALUES (36548, 6509, 1.00, 2062.50000, 410.51000, '1');
INSERT INTO `productos_ventas` VALUES (36654, 6510, 1.00, 160.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36740, 6511, 1.00, 120.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36623, 6511, 1.00, 120.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36742, 6511, 1.00, 120.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36625, 6511, 2.00, 120.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36653, 6512, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36653, 6513, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36653, 6514, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36653, 6515, 1.00, 100.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36562, 6516, 1.00, 90.00000, 7.60000, '1');
INSERT INTO `productos_ventas` VALUES (36764, 6516, 1.00, 60.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36573, 6517, 1.00, 80.00000, 15.00000, '');
INSERT INTO `productos_ventas` VALUES (36570, 6517, 1.00, 80.00000, 15.00000, '');
INSERT INTO `productos_ventas` VALUES (36572, 6517, 1.00, 80.00000, 15.00000, '');
INSERT INTO `productos_ventas` VALUES (36574, 6517, 1.00, 80.00000, 0.00000, '');
INSERT INTO `productos_ventas` VALUES (36571, 6517, 1.00, 80.00000, 15.00000, '');
INSERT INTO `productos_ventas` VALUES (36585, 6517, 1.00, 40.00000, 6.68000, '');
INSERT INTO `productos_ventas` VALUES (36584, 6517, 1.00, 40.00000, 6.68000, '');
INSERT INTO `productos_ventas` VALUES (36583, 6517, 1.00, 40.00000, 6.68000, '');
INSERT INTO `productos_ventas` VALUES (36582, 6517, 1.00, 40.00000, 6.68000, '');
INSERT INTO `productos_ventas` VALUES (36586, 6517, 1.00, 40.00000, 6.68000, '');
INSERT INTO `productos_ventas` VALUES (36654, 6518, 1.00, 60.00000, 0.00000, '3');
INSERT INTO `productos_ventas` VALUES (36766, 6518, 1.00, 109.00000, 0.00000, '3');
INSERT INTO `productos_ventas` VALUES (36768, 6518, 1.00, 200.00000, 0.00000, '3');
INSERT INTO `productos_ventas` VALUES (36770, 6518, 1.00, 12.00000, 0.00000, '3');
INSERT INTO `productos_ventas` VALUES (36653, 6519, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36654, 6520, 1.00, 200.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36554, 6520, 1.00, 120.00000, 80.00000, '1');
INSERT INTO `productos_ventas` VALUES (36619, 6520, 1.00, 30.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36654, 6521, 1.00, 120.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36553, 6522, 1.00, 180.00000, 80.00000, '1');
INSERT INTO `productos_ventas` VALUES (36720, 6523, 1.00, 85.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36647, 6523, 2.00, 85.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36645, 6523, 1.00, 85.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36718, 6523, 1.00, 85.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36643, 6523, 1.00, 85.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36631, 6524, 1.00, 499.00000, 426.43000, '1');
INSERT INTO `productos_ventas` VALUES (36653, 6525, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36595, 6526, 2.00, 100.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36596, 6526, 6.00, 50.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36645, 6527, 1.00, 90.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36591, 6528, 1.00, 30.00000, 4.40000, '1');
INSERT INTO `productos_ventas` VALUES (36654, 6528, 1.00, 160.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36604, 6529, 1.00, 40.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36652, 6529, 1.00, 48.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36648, 6529, 1.00, 48.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36649, 6529, 1.00, 48.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36651, 6529, 1.00, 48.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36650, 6529, 1.00, 48.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36654, 6530, 1.00, 120.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36654, 6531, 1.00, 120.01000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36740, 6532, 1.00, 120.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36716, 6533, 1.00, 220.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36581, 6534, 4.00, 144.99750, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36581, 6535, 4.00, 144.99750, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36652, 6536, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36573, 6537, 1.00, 70.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36574, 6537, 1.00, 70.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36584, 6537, 1.00, 30.00000, 6.68000, '1');
INSERT INTO `productos_ventas` VALUES (36586, 6537, 1.00, 30.00000, 6.68000, '1');
INSERT INTO `productos_ventas` VALUES (36548, 6538, 1.00, 2057.00000, 426.43000, '1');
INSERT INTO `productos_ventas` VALUES (36643, 6538, 1.00, 90.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36645, 6538, 1.00, 90.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36556, 6538, 1.00, 90.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36718, 6538, 1.00, 90.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36720, 6538, 1.00, 90.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36654, 6539, 1.00, 143.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36625, 6540, 1.00, 120.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36742, 6541, 1.00, 125.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36548, 6542, 1.00, 550.00000, 426.43000, '3');
INSERT INTO `productos_ventas` VALUES (36874, 6542, 1.00, 4.00000, 1.00000, '3');
INSERT INTO `productos_ventas` VALUES (36876, 6542, 1.00, 16.00000, 5.00000, '3');
INSERT INTO `productos_ventas` VALUES (36580, 6543, 4.00, 105.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36580, 6544, 4.00, 104.99750, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36580, 6545, 4.00, 104.99750, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36647, 6546, 1.00, 77.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36548, 6547, 1.00, 510.00000, 426.43000, '1');
INSERT INTO `productos_ventas` VALUES (36553, 6548, 2.00, 180.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36878, 6549, 1.00, 120.00000, 80.00000, '3');
INSERT INTO `productos_ventas` VALUES (36643, 6550, 1.00, 90.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36882, 6551, 2.00, 30.00000, 26.00000, '3');
INSERT INTO `productos_ventas` VALUES (36884, 6551, 2.00, 30.00000, 26.00000, '3');
INSERT INTO `productos_ventas` VALUES (36880, 6551, 2.00, 30.00000, 26.00000, '3');
INSERT INTO `productos_ventas` VALUES (36631, 6552, 1.00, 550.00000, 426.43000, '1');
INSERT INTO `productos_ventas` VALUES (36631, 6553, 1.00, 550.00000, 426.43000, '1');
INSERT INTO `productos_ventas` VALUES (36718, 6554, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36645, 6554, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36553, 6554, 1.00, 160.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36720, 6554, 1.00, 80.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36654, 6555, 1.00, 160.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36654, 6556, 1.00, 160.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36889, 6557, 2.00, 50.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36887, 6557, 2.00, 160.00000, 0.00000, '1');
INSERT INTO `productos_ventas` VALUES (36654, 6558, 1.00, 250.00000, 0.00000, '1');

-- ----------------------------
-- Table structure for proveedores
-- ----------------------------
DROP TABLE IF EXISTS `proveedores`;
CREATE TABLE `proveedores`  (
  `proveedor_id` int(11) NOT NULL AUTO_INCREMENT,
  `ruc` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `razon_social` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `direccion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `departamento` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `provincia` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `distrito` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ubigeo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`proveedor_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of proveedores
-- ----------------------------
INSERT INTO `proveedores` VALUES (40, '20101639275', 'IPESA S.A.C.', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for resumen_diario
-- ----------------------------
DROP TABLE IF EXISTS `resumen_diario`;
CREATE TABLE `resumen_diario`  (
  `id_resumen_diario` int(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` int(11) NOT NULL,
  `fecha` date NULL DEFAULT NULL,
  `ticket` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `cantidad_items` int(4) NULL DEFAULT NULL,
  `tipo` int(1) NULL DEFAULT NULL COMMENT '1 para resumen\n2 para comunicacion de baja',
  PRIMARY KEY (`id_resumen_diario`) USING BTREE,
  INDEX `fk_resumen_diario_empresas1_idx`(`id_empresa`) USING BTREE,
  CONSTRAINT `fk_resumen_diario_empresas1` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of resumen_diario
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `rol_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`rol_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'ADMIN');
INSERT INTO `roles` VALUES (2, 'USUARIO');

-- ----------------------------
-- Table structure for sucursales
-- ----------------------------
DROP TABLE IF EXISTS `sucursales`;
CREATE TABLE `sucursales`  (
  `id_sucursal` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NULL DEFAULT NULL,
  `direccion` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `distrito` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `provincia` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `departamento` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ubigeo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cod_sucursal` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_sucursal`) USING BTREE,
  INDEX `empresa_id`(`empresa_id`) USING BTREE,
  CONSTRAINT `sucursales_ibfk_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id_empresa`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sucursales
-- ----------------------------

-- ----------------------------
-- Table structure for tamsporte_persona
-- ----------------------------
DROP TABLE IF EXISTS `tamsporte_persona`;
CREATE TABLE `tamsporte_persona`  (
  `tampo_id` int(11) NOT NULL AUTO_INCREMENT,
  `ruc` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `razon_social` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `direccion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`tampo_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tamsporte_persona
-- ----------------------------

-- ----------------------------
-- Table structure for tipo_cambio
-- ----------------------------
DROP TABLE IF EXISTS `tipo_cambio`;
CREATE TABLE `tipo_cambio`  (
  `id_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `valor` double(10, 2) NULL DEFAULT NULL,
  `fecha` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `id_empresa` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id_tipo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tipo_cambio
-- ----------------------------
INSERT INTO `tipo_cambio` VALUES (1, 3.80, '2023-11-30', 12);
INSERT INTO `tipo_cambio` VALUES (2, 3.85, '2023-12-01', 12);
INSERT INTO `tipo_cambio` VALUES (3, 3.84, '2023-12-05', 12);
INSERT INTO `tipo_cambio` VALUES (4, 3.80, '2023-12-06', 12);
INSERT INTO `tipo_cambio` VALUES (5, 3.91, '2023-12-07', 12);
INSERT INTO `tipo_cambio` VALUES (6, 3.75, '2023-11-06', 12);
INSERT INTO `tipo_cambio` VALUES (7, 3.82, '2023-12-14', 12);
INSERT INTO `tipo_cambio` VALUES (8, 3.81, '2023-12-13', 12);
INSERT INTO `tipo_cambio` VALUES (9, 3.79, '2023-12-08', 12);
INSERT INTO `tipo_cambio` VALUES (10, 3.79, '2023-12-15', 12);
INSERT INTO `tipo_cambio` VALUES (11, 3.80, '2023-12-16', 12);
INSERT INTO `tipo_cambio` VALUES (12, 3.80, '2023-12-18', 12);
INSERT INTO `tipo_cambio` VALUES (13, 3.75, '2023-12-19', 12);
INSERT INTO `tipo_cambio` VALUES (14, 3.74, '2023-12-20', 12);
INSERT INTO `tipo_cambio` VALUES (15, 3.72, '2023-12-22', 12);
INSERT INTO `tipo_cambio` VALUES (16, 3.73, '2023-12-26', 12);
INSERT INTO `tipo_cambio` VALUES (17, 3.73, '2023-12-27', 12);
INSERT INTO `tipo_cambio` VALUES (18, 3.74, '2023-12-28', 12);
INSERT INTO `tipo_cambio` VALUES (19, 3.74, '2023-12-29', 12);
INSERT INTO `tipo_cambio` VALUES (20, 3.75, '2024-01-03', 12);
INSERT INTO `tipo_cambio` VALUES (21, 3.75, '2024-01-06', 12);
INSERT INTO `tipo_cambio` VALUES (22, 3.75, '2024-01-05', 12);
INSERT INTO `tipo_cambio` VALUES (23, 3.73, '2024-01-09', 12);
INSERT INTO `tipo_cambio` VALUES (24, 3.78, '2024-01-20', 12);
INSERT INTO `tipo_cambio` VALUES (25, 3.77, '2024-01-19', 12);
INSERT INTO `tipo_cambio` VALUES (26, 3.77, '2024-01-22', 12);
INSERT INTO `tipo_cambio` VALUES (27, 3.77, '2024-01-23', 12);

-- ----------------------------
-- Table structure for tipo_pago
-- ----------------------------
DROP TABLE IF EXISTS `tipo_pago`;
CREATE TABLE `tipo_pago`  (
  `tipo_pago_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`tipo_pago_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tipo_pago
-- ----------------------------
INSERT INTO `tipo_pago` VALUES (1, 'Contado');
INSERT INTO `tipo_pago` VALUES (2, 'Credito');

-- ----------------------------
-- Table structure for ubigeo_inei
-- ----------------------------
DROP TABLE IF EXISTS `ubigeo_inei`;
CREATE TABLE `ubigeo_inei`  (
  `id_ubigeo` int(4) NOT NULL AUTO_INCREMENT,
  `departamento` varchar(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `provincia` varchar(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `distrito` varchar(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nombre` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_ubigeo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2077 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ubigeo_inei
-- ----------------------------
INSERT INTO `ubigeo_inei` VALUES (1, '01', '00', '00', 'AMAZONAS');
INSERT INTO `ubigeo_inei` VALUES (2, '01', '01', '00', 'CHACHAPOYAS');
INSERT INTO `ubigeo_inei` VALUES (3, '01', '01', '01', 'CHACHAPOYAS');
INSERT INTO `ubigeo_inei` VALUES (4, '01', '01', '02', 'ASUNCION');
INSERT INTO `ubigeo_inei` VALUES (5, '01', '01', '03', 'BALSAS');
INSERT INTO `ubigeo_inei` VALUES (6, '01', '01', '04', 'CHETO');
INSERT INTO `ubigeo_inei` VALUES (7, '01', '01', '05', 'CHILIQUIN');
INSERT INTO `ubigeo_inei` VALUES (8, '01', '01', '06', 'CHUQUIBAMBA');
INSERT INTO `ubigeo_inei` VALUES (9, '01', '01', '07', 'GRANADA');
INSERT INTO `ubigeo_inei` VALUES (10, '01', '01', '08', 'HUANCAS');
INSERT INTO `ubigeo_inei` VALUES (11, '01', '01', '09', 'LA JALCA');
INSERT INTO `ubigeo_inei` VALUES (12, '01', '01', '10', 'LEIMEBAMBA');
INSERT INTO `ubigeo_inei` VALUES (13, '01', '01', '11', 'LEVANTO');
INSERT INTO `ubigeo_inei` VALUES (14, '01', '01', '12', 'MAGDALENA');
INSERT INTO `ubigeo_inei` VALUES (15, '01', '01', '13', 'MARISCAL CASTILLA');
INSERT INTO `ubigeo_inei` VALUES (16, '01', '01', '14', 'MOLINOPAMPA');
INSERT INTO `ubigeo_inei` VALUES (17, '01', '01', '15', 'MONTEVIDEO');
INSERT INTO `ubigeo_inei` VALUES (18, '01', '01', '16', 'OLLEROS');
INSERT INTO `ubigeo_inei` VALUES (19, '01', '01', '17', 'QUINJALCA');
INSERT INTO `ubigeo_inei` VALUES (20, '01', '01', '18', 'SAN FRANCISCO DE DAGUAS');
INSERT INTO `ubigeo_inei` VALUES (21, '01', '01', '19', 'SAN ISIDRO DE MAINO');
INSERT INTO `ubigeo_inei` VALUES (22, '01', '01', '20', 'SOLOCO');
INSERT INTO `ubigeo_inei` VALUES (23, '01', '01', '21', 'SONCHE');
INSERT INTO `ubigeo_inei` VALUES (24, '01', '02', '00', 'BAGUA');
INSERT INTO `ubigeo_inei` VALUES (25, '01', '02', '01', 'BAGUA');
INSERT INTO `ubigeo_inei` VALUES (26, '01', '02', '02', 'ARAMANGO');
INSERT INTO `ubigeo_inei` VALUES (27, '01', '02', '03', 'COPALLIN');
INSERT INTO `ubigeo_inei` VALUES (28, '01', '02', '04', 'EL PARCO');
INSERT INTO `ubigeo_inei` VALUES (29, '01', '02', '05', 'IMAZA');
INSERT INTO `ubigeo_inei` VALUES (30, '01', '02', '06', 'LA PECA');
INSERT INTO `ubigeo_inei` VALUES (31, '01', '03', '00', 'BONGARA');
INSERT INTO `ubigeo_inei` VALUES (32, '01', '03', '01', 'JUMBILLA');
INSERT INTO `ubigeo_inei` VALUES (33, '01', '03', '02', 'CHISQUILLA');
INSERT INTO `ubigeo_inei` VALUES (34, '01', '03', '03', 'CHURUJA');
INSERT INTO `ubigeo_inei` VALUES (35, '01', '03', '04', 'COROSHA');
INSERT INTO `ubigeo_inei` VALUES (36, '01', '03', '05', 'CUISPES');
INSERT INTO `ubigeo_inei` VALUES (37, '01', '03', '06', 'FLORIDA');
INSERT INTO `ubigeo_inei` VALUES (38, '01', '03', '07', 'JAZÁN');
INSERT INTO `ubigeo_inei` VALUES (39, '01', '03', '08', 'RECTA');
INSERT INTO `ubigeo_inei` VALUES (40, '01', '03', '09', 'SAN CARLOS');
INSERT INTO `ubigeo_inei` VALUES (41, '01', '03', '10', 'SHIPASBAMBA');
INSERT INTO `ubigeo_inei` VALUES (42, '01', '03', '11', 'VALERA');
INSERT INTO `ubigeo_inei` VALUES (43, '01', '03', '12', 'YAMBRASBAMBA');
INSERT INTO `ubigeo_inei` VALUES (44, '01', '04', '00', 'CONDORCANQUI');
INSERT INTO `ubigeo_inei` VALUES (45, '01', '04', '01', 'NIEVA');
INSERT INTO `ubigeo_inei` VALUES (46, '01', '04', '02', 'EL CENEPA');
INSERT INTO `ubigeo_inei` VALUES (47, '01', '04', '03', 'RIO SANTIAGO');
INSERT INTO `ubigeo_inei` VALUES (48, '01', '05', '00', 'LUYA');
INSERT INTO `ubigeo_inei` VALUES (49, '01', '05', '01', 'LAMUD');
INSERT INTO `ubigeo_inei` VALUES (50, '01', '05', '02', 'CAMPORREDONDO');
INSERT INTO `ubigeo_inei` VALUES (51, '01', '05', '03', 'COCABAMBA');
INSERT INTO `ubigeo_inei` VALUES (52, '01', '05', '04', 'COLCAMAR');
INSERT INTO `ubigeo_inei` VALUES (53, '01', '05', '05', 'CONILA');
INSERT INTO `ubigeo_inei` VALUES (54, '01', '05', '06', 'INGUILPATA');
INSERT INTO `ubigeo_inei` VALUES (55, '01', '05', '07', 'LONGUITA');
INSERT INTO `ubigeo_inei` VALUES (56, '01', '05', '08', 'LONYA CHICO');
INSERT INTO `ubigeo_inei` VALUES (57, '01', '05', '09', 'LUYA');
INSERT INTO `ubigeo_inei` VALUES (58, '01', '05', '10', 'LUYA VIEJO');
INSERT INTO `ubigeo_inei` VALUES (59, '01', '05', '11', 'MARIA');
INSERT INTO `ubigeo_inei` VALUES (60, '01', '05', '12', 'OCALLI');
INSERT INTO `ubigeo_inei` VALUES (61, '01', '05', '13', 'OCUMAL');
INSERT INTO `ubigeo_inei` VALUES (62, '01', '05', '14', 'PISUQUIA');
INSERT INTO `ubigeo_inei` VALUES (63, '01', '05', '15', 'PROVIDENCIA');
INSERT INTO `ubigeo_inei` VALUES (64, '01', '05', '16', 'SAN CRISTOBAL');
INSERT INTO `ubigeo_inei` VALUES (65, '01', '05', '17', 'SAN FRANCISCO DEL YESO');
INSERT INTO `ubigeo_inei` VALUES (66, '01', '05', '18', 'SAN JERONIMO');
INSERT INTO `ubigeo_inei` VALUES (67, '01', '05', '19', 'SAN JUAN DE LOPECANCHA');
INSERT INTO `ubigeo_inei` VALUES (68, '01', '05', '20', 'SANTA CATALINA');
INSERT INTO `ubigeo_inei` VALUES (69, '01', '05', '21', 'SANTO TOMAS');
INSERT INTO `ubigeo_inei` VALUES (70, '01', '05', '22', 'TINGO');
INSERT INTO `ubigeo_inei` VALUES (71, '01', '05', '23', 'TRITA');
INSERT INTO `ubigeo_inei` VALUES (72, '01', '06', '00', 'RODRIGUEZ DE MENDOZA');
INSERT INTO `ubigeo_inei` VALUES (73, '01', '06', '01', 'SAN NICOLAS');
INSERT INTO `ubigeo_inei` VALUES (74, '01', '06', '02', 'CHIRIMOTO');
INSERT INTO `ubigeo_inei` VALUES (75, '01', '06', '03', 'COCHAMAL');
INSERT INTO `ubigeo_inei` VALUES (76, '01', '06', '04', 'HUAMBO');
INSERT INTO `ubigeo_inei` VALUES (77, '01', '06', '05', 'LIMABAMBA');
INSERT INTO `ubigeo_inei` VALUES (78, '01', '06', '06', 'LONGAR');
INSERT INTO `ubigeo_inei` VALUES (79, '01', '06', '07', 'MARISCAL BENAVIDES');
INSERT INTO `ubigeo_inei` VALUES (80, '01', '06', '08', 'MILPUC');
INSERT INTO `ubigeo_inei` VALUES (81, '01', '06', '09', 'OMIA');
INSERT INTO `ubigeo_inei` VALUES (82, '01', '06', '10', 'SANTA ROSA');
INSERT INTO `ubigeo_inei` VALUES (83, '01', '06', '11', 'TOTORA');
INSERT INTO `ubigeo_inei` VALUES (84, '01', '06', '12', 'VISTA ALEGRE');
INSERT INTO `ubigeo_inei` VALUES (85, '01', '07', '00', 'UTCUBAMBA');
INSERT INTO `ubigeo_inei` VALUES (86, '01', '07', '01', 'BAGUA GRANDE');
INSERT INTO `ubigeo_inei` VALUES (87, '01', '07', '02', 'CAJARURO');
INSERT INTO `ubigeo_inei` VALUES (88, '01', '07', '03', 'CUMBA');
INSERT INTO `ubigeo_inei` VALUES (89, '01', '07', '04', 'EL MILAGRO');
INSERT INTO `ubigeo_inei` VALUES (90, '01', '07', '05', 'JAMALCA');
INSERT INTO `ubigeo_inei` VALUES (91, '01', '07', '06', 'LONYA GRANDE');
INSERT INTO `ubigeo_inei` VALUES (92, '01', '07', '07', 'YAMON');
INSERT INTO `ubigeo_inei` VALUES (93, '02', '00', '00', 'ANCASH');
INSERT INTO `ubigeo_inei` VALUES (94, '02', '01', '00', 'HUARAZ');
INSERT INTO `ubigeo_inei` VALUES (95, '02', '01', '01', 'HUARAZ');
INSERT INTO `ubigeo_inei` VALUES (96, '02', '01', '02', 'COCHABAMBA');
INSERT INTO `ubigeo_inei` VALUES (97, '02', '01', '03', 'COLCABAMBA');
INSERT INTO `ubigeo_inei` VALUES (98, '02', '01', '04', 'HUANCHAY');
INSERT INTO `ubigeo_inei` VALUES (99, '02', '01', '05', 'INDEPENDENCIA');
INSERT INTO `ubigeo_inei` VALUES (100, '02', '01', '06', 'JANGAS');
INSERT INTO `ubigeo_inei` VALUES (101, '02', '01', '07', 'LA LIBERTAD');
INSERT INTO `ubigeo_inei` VALUES (102, '02', '01', '08', 'OLLEROS');
INSERT INTO `ubigeo_inei` VALUES (103, '02', '01', '09', 'PAMPAS');
INSERT INTO `ubigeo_inei` VALUES (104, '02', '01', '10', 'PARIACOTO');
INSERT INTO `ubigeo_inei` VALUES (105, '02', '01', '11', 'PIRA');
INSERT INTO `ubigeo_inei` VALUES (106, '02', '01', '12', 'TARICA');
INSERT INTO `ubigeo_inei` VALUES (107, '02', '02', '00', 'AIJA');
INSERT INTO `ubigeo_inei` VALUES (108, '02', '02', '01', 'AIJA');
INSERT INTO `ubigeo_inei` VALUES (109, '02', '02', '02', 'CORIS');
INSERT INTO `ubigeo_inei` VALUES (110, '02', '02', '03', 'HUACLLAN');
INSERT INTO `ubigeo_inei` VALUES (111, '02', '02', '04', 'LA MERCED');
INSERT INTO `ubigeo_inei` VALUES (112, '02', '02', '05', 'SUCCHA');
INSERT INTO `ubigeo_inei` VALUES (113, '02', '03', '00', 'ANTONIO RAYMONDI');
INSERT INTO `ubigeo_inei` VALUES (114, '02', '03', '01', 'LLAMELLIN');
INSERT INTO `ubigeo_inei` VALUES (115, '02', '03', '02', 'ACZO');
INSERT INTO `ubigeo_inei` VALUES (116, '02', '03', '03', 'CHACCHO');
INSERT INTO `ubigeo_inei` VALUES (117, '02', '03', '04', 'CHINGAS');
INSERT INTO `ubigeo_inei` VALUES (118, '02', '03', '05', 'MIRGAS');
INSERT INTO `ubigeo_inei` VALUES (119, '02', '03', '06', 'SAN JUAN DE RONTOY');
INSERT INTO `ubigeo_inei` VALUES (120, '02', '04', '00', 'ASUNCION');
INSERT INTO `ubigeo_inei` VALUES (121, '02', '04', '01', 'CHACAS');
INSERT INTO `ubigeo_inei` VALUES (122, '02', '04', '02', 'ACOCHACA');
INSERT INTO `ubigeo_inei` VALUES (123, '02', '05', '00', 'BOLOGNESI');
INSERT INTO `ubigeo_inei` VALUES (124, '02', '05', '01', 'CHIQUIAN');
INSERT INTO `ubigeo_inei` VALUES (125, '02', '05', '02', 'ABELARDO PARDO LEZAMETA');
INSERT INTO `ubigeo_inei` VALUES (126, '02', '05', '03', 'ANTONIO RAYMONDI');
INSERT INTO `ubigeo_inei` VALUES (127, '02', '05', '04', 'AQUIA');
INSERT INTO `ubigeo_inei` VALUES (128, '02', '05', '05', 'CAJACAY');
INSERT INTO `ubigeo_inei` VALUES (129, '02', '05', '06', 'CANIS');
INSERT INTO `ubigeo_inei` VALUES (130, '02', '05', '07', 'COLQUIOC');
INSERT INTO `ubigeo_inei` VALUES (131, '02', '05', '08', 'HUALLANCA');
INSERT INTO `ubigeo_inei` VALUES (132, '02', '05', '09', 'HUASTA');
INSERT INTO `ubigeo_inei` VALUES (133, '02', '05', '10', 'HUAYLLACAYAN');
INSERT INTO `ubigeo_inei` VALUES (134, '02', '05', '11', 'LA PRIMAVERA');
INSERT INTO `ubigeo_inei` VALUES (135, '02', '05', '12', 'MANGAS');
INSERT INTO `ubigeo_inei` VALUES (136, '02', '05', '13', 'PACLLON');
INSERT INTO `ubigeo_inei` VALUES (137, '02', '05', '14', 'SAN MIGUEL DE CORPANQUI');
INSERT INTO `ubigeo_inei` VALUES (138, '02', '05', '15', 'TICLLOS');
INSERT INTO `ubigeo_inei` VALUES (139, '02', '06', '00', 'CARHUAZ');
INSERT INTO `ubigeo_inei` VALUES (140, '02', '06', '01', 'CARHUAZ');
INSERT INTO `ubigeo_inei` VALUES (141, '02', '06', '02', 'ACOPAMPA');
INSERT INTO `ubigeo_inei` VALUES (142, '02', '06', '03', 'AMASHCA');
INSERT INTO `ubigeo_inei` VALUES (143, '02', '06', '04', 'ANTA');
INSERT INTO `ubigeo_inei` VALUES (144, '02', '06', '05', 'ATAQUERO');
INSERT INTO `ubigeo_inei` VALUES (145, '02', '06', '06', 'MARCARA');
INSERT INTO `ubigeo_inei` VALUES (146, '02', '06', '07', 'PARIAHUANCA');
INSERT INTO `ubigeo_inei` VALUES (147, '02', '06', '08', 'SAN MIGUEL DE ACO');
INSERT INTO `ubigeo_inei` VALUES (148, '02', '06', '09', 'SHILLA');
INSERT INTO `ubigeo_inei` VALUES (149, '02', '06', '10', 'TINCO');
INSERT INTO `ubigeo_inei` VALUES (150, '02', '06', '11', 'YUNGAR');
INSERT INTO `ubigeo_inei` VALUES (151, '02', '07', '00', 'CARLOS FERMIN FITZCARRALD');
INSERT INTO `ubigeo_inei` VALUES (152, '02', '07', '01', 'SAN LUIS');
INSERT INTO `ubigeo_inei` VALUES (153, '02', '07', '02', 'SAN NICOLAS');
INSERT INTO `ubigeo_inei` VALUES (154, '02', '07', '03', 'YAUYA');
INSERT INTO `ubigeo_inei` VALUES (155, '02', '08', '00', 'CASMA');
INSERT INTO `ubigeo_inei` VALUES (156, '02', '08', '01', 'CASMA');
INSERT INTO `ubigeo_inei` VALUES (157, '02', '08', '02', 'BUENA VISTA ALTA');
INSERT INTO `ubigeo_inei` VALUES (158, '02', '08', '03', 'COMANDANTE NOEL');
INSERT INTO `ubigeo_inei` VALUES (159, '02', '08', '04', 'YAUTAN');
INSERT INTO `ubigeo_inei` VALUES (160, '02', '09', '00', 'CORONGO');
INSERT INTO `ubigeo_inei` VALUES (161, '02', '09', '01', 'CORONGO');
INSERT INTO `ubigeo_inei` VALUES (162, '02', '09', '02', 'ACO');
INSERT INTO `ubigeo_inei` VALUES (163, '02', '09', '03', 'BAMBAS');
INSERT INTO `ubigeo_inei` VALUES (164, '02', '09', '04', 'CUSCA');
INSERT INTO `ubigeo_inei` VALUES (165, '02', '09', '05', 'LA PAMPA');
INSERT INTO `ubigeo_inei` VALUES (166, '02', '09', '06', 'YANAC');
INSERT INTO `ubigeo_inei` VALUES (167, '02', '09', '07', 'YUPAN');
INSERT INTO `ubigeo_inei` VALUES (168, '02', '10', '00', 'HUARI');
INSERT INTO `ubigeo_inei` VALUES (169, '02', '10', '01', 'HUARI');
INSERT INTO `ubigeo_inei` VALUES (170, '02', '10', '02', 'ANRA');
INSERT INTO `ubigeo_inei` VALUES (171, '02', '10', '03', 'CAJAY');
INSERT INTO `ubigeo_inei` VALUES (172, '02', '10', '04', 'CHAVIN DE HUANTAR');
INSERT INTO `ubigeo_inei` VALUES (173, '02', '10', '05', 'HUACACHI');
INSERT INTO `ubigeo_inei` VALUES (174, '02', '10', '06', 'HUACCHIS');
INSERT INTO `ubigeo_inei` VALUES (175, '02', '10', '07', 'HUACHIS');
INSERT INTO `ubigeo_inei` VALUES (176, '02', '10', '08', 'HUANTAR');
INSERT INTO `ubigeo_inei` VALUES (177, '02', '10', '09', 'MASIN');
INSERT INTO `ubigeo_inei` VALUES (178, '02', '10', '10', 'PAUCAS');
INSERT INTO `ubigeo_inei` VALUES (179, '02', '10', '11', 'PONTO');
INSERT INTO `ubigeo_inei` VALUES (180, '02', '10', '12', 'RAHUAPAMPA');
INSERT INTO `ubigeo_inei` VALUES (181, '02', '10', '13', 'RAPAYAN');
INSERT INTO `ubigeo_inei` VALUES (182, '02', '10', '14', 'SAN MARCOS');
INSERT INTO `ubigeo_inei` VALUES (183, '02', '10', '15', 'SAN PEDRO DE CHANA');
INSERT INTO `ubigeo_inei` VALUES (184, '02', '10', '16', 'UCO');
INSERT INTO `ubigeo_inei` VALUES (185, '02', '11', '00', 'HUARMEY');
INSERT INTO `ubigeo_inei` VALUES (186, '02', '11', '01', 'HUARMEY');
INSERT INTO `ubigeo_inei` VALUES (187, '02', '11', '02', 'COCHAPETI');
INSERT INTO `ubigeo_inei` VALUES (188, '02', '11', '03', 'CULEBRAS');
INSERT INTO `ubigeo_inei` VALUES (189, '02', '11', '04', 'HUAYAN');
INSERT INTO `ubigeo_inei` VALUES (190, '02', '11', '05', 'MALVAS');
INSERT INTO `ubigeo_inei` VALUES (191, '02', '12', '00', 'HUAYLAS');
INSERT INTO `ubigeo_inei` VALUES (192, '02', '12', '01', 'CARAZ');
INSERT INTO `ubigeo_inei` VALUES (193, '02', '12', '02', 'HUALLANCA');
INSERT INTO `ubigeo_inei` VALUES (194, '02', '12', '03', 'HUATA');
INSERT INTO `ubigeo_inei` VALUES (195, '02', '12', '04', 'HUAYLAS');
INSERT INTO `ubigeo_inei` VALUES (196, '02', '12', '05', 'MATO');
INSERT INTO `ubigeo_inei` VALUES (197, '02', '12', '06', 'PAMPAROMAS');
INSERT INTO `ubigeo_inei` VALUES (198, '02', '12', '07', 'PUEBLO LIBRE');
INSERT INTO `ubigeo_inei` VALUES (199, '02', '12', '08', 'SANTA CRUZ');
INSERT INTO `ubigeo_inei` VALUES (200, '02', '12', '09', 'SANTO TORIBIO');
INSERT INTO `ubigeo_inei` VALUES (201, '02', '12', '10', 'YURACMARCA');
INSERT INTO `ubigeo_inei` VALUES (202, '02', '13', '00', 'MARISCAL LUZURIAGA');
INSERT INTO `ubigeo_inei` VALUES (203, '02', '13', '01', 'PISCOBAMBA');
INSERT INTO `ubigeo_inei` VALUES (204, '02', '13', '02', 'CASCA');
INSERT INTO `ubigeo_inei` VALUES (205, '02', '13', '03', 'ELEAZAR GUZMAN BARRON');
INSERT INTO `ubigeo_inei` VALUES (206, '02', '13', '04', 'FIDEL OLIVAS ESCUDERO');
INSERT INTO `ubigeo_inei` VALUES (207, '02', '13', '05', 'LLAMA');
INSERT INTO `ubigeo_inei` VALUES (208, '02', '13', '06', 'LLUMPA');
INSERT INTO `ubigeo_inei` VALUES (209, '02', '13', '07', 'LUCMA');
INSERT INTO `ubigeo_inei` VALUES (210, '02', '13', '08', 'MUSGA');
INSERT INTO `ubigeo_inei` VALUES (211, '02', '14', '00', 'OCROS');
INSERT INTO `ubigeo_inei` VALUES (212, '02', '14', '01', 'OCROS');
INSERT INTO `ubigeo_inei` VALUES (213, '02', '14', '02', 'ACAS');
INSERT INTO `ubigeo_inei` VALUES (214, '02', '14', '03', 'CAJAMARQUILLA');
INSERT INTO `ubigeo_inei` VALUES (215, '02', '14', '04', 'CARHUAPAMPA');
INSERT INTO `ubigeo_inei` VALUES (216, '02', '14', '05', 'COCHAS');
INSERT INTO `ubigeo_inei` VALUES (217, '02', '14', '06', 'CONGAS');
INSERT INTO `ubigeo_inei` VALUES (218, '02', '14', '07', 'LLIPA');
INSERT INTO `ubigeo_inei` VALUES (219, '02', '14', '08', 'SAN CRISTOBAL DE RAJAN');
INSERT INTO `ubigeo_inei` VALUES (220, '02', '14', '09', 'SAN PEDRO');
INSERT INTO `ubigeo_inei` VALUES (221, '02', '14', '10', 'SANTIAGO DE CHILCAS');
INSERT INTO `ubigeo_inei` VALUES (222, '02', '15', '00', 'PALLASCA');
INSERT INTO `ubigeo_inei` VALUES (223, '02', '15', '01', 'CABANA');
INSERT INTO `ubigeo_inei` VALUES (224, '02', '15', '02', 'BOLOGNESI');
INSERT INTO `ubigeo_inei` VALUES (225, '02', '15', '03', 'CONCHUCOS');
INSERT INTO `ubigeo_inei` VALUES (226, '02', '15', '04', 'HUACASCHUQUE');
INSERT INTO `ubigeo_inei` VALUES (227, '02', '15', '05', 'HUANDOVAL');
INSERT INTO `ubigeo_inei` VALUES (228, '02', '15', '06', 'LACABAMBA');
INSERT INTO `ubigeo_inei` VALUES (229, '02', '15', '07', 'LLAPO');
INSERT INTO `ubigeo_inei` VALUES (230, '02', '15', '08', 'PALLASCA');
INSERT INTO `ubigeo_inei` VALUES (231, '02', '15', '09', 'PAMPAS');
INSERT INTO `ubigeo_inei` VALUES (232, '02', '15', '10', 'SANTA ROSA');
INSERT INTO `ubigeo_inei` VALUES (233, '02', '15', '11', 'TAUCA');
INSERT INTO `ubigeo_inei` VALUES (234, '02', '16', '00', 'POMABAMBA');
INSERT INTO `ubigeo_inei` VALUES (235, '02', '16', '01', 'POMABAMBA');
INSERT INTO `ubigeo_inei` VALUES (236, '02', '16', '02', 'HUAYLLAN');
INSERT INTO `ubigeo_inei` VALUES (237, '02', '16', '03', 'PAROBAMBA');
INSERT INTO `ubigeo_inei` VALUES (238, '02', '16', '04', 'QUINUABAMBA');
INSERT INTO `ubigeo_inei` VALUES (239, '02', '17', '00', 'RECUAY');
INSERT INTO `ubigeo_inei` VALUES (240, '02', '17', '01', 'RECUAY');
INSERT INTO `ubigeo_inei` VALUES (241, '02', '17', '02', 'CATAC');
INSERT INTO `ubigeo_inei` VALUES (242, '02', '17', '03', 'COTAPARACO');
INSERT INTO `ubigeo_inei` VALUES (243, '02', '17', '04', 'HUAYLLAPAMPA');
INSERT INTO `ubigeo_inei` VALUES (244, '02', '17', '05', 'LLACLLIN');
INSERT INTO `ubigeo_inei` VALUES (245, '02', '17', '06', 'MARCA');
INSERT INTO `ubigeo_inei` VALUES (246, '02', '17', '07', 'PAMPAS CHICO');
INSERT INTO `ubigeo_inei` VALUES (247, '02', '17', '08', 'PARARIN');
INSERT INTO `ubigeo_inei` VALUES (248, '02', '17', '09', 'TAPACOCHA');
INSERT INTO `ubigeo_inei` VALUES (249, '02', '17', '10', 'TICAPAMPA');
INSERT INTO `ubigeo_inei` VALUES (250, '02', '18', '00', 'SANTA');
INSERT INTO `ubigeo_inei` VALUES (251, '02', '18', '01', 'CHIMBOTE');
INSERT INTO `ubigeo_inei` VALUES (252, '02', '18', '02', 'CACERES DEL PERU');
INSERT INTO `ubigeo_inei` VALUES (253, '02', '18', '03', 'COISHCO');
INSERT INTO `ubigeo_inei` VALUES (254, '02', '18', '04', 'MACATE');
INSERT INTO `ubigeo_inei` VALUES (255, '02', '18', '05', 'MORO');
INSERT INTO `ubigeo_inei` VALUES (256, '02', '18', '06', 'NEPEÑA');
INSERT INTO `ubigeo_inei` VALUES (257, '02', '18', '07', 'SAMANCO');
INSERT INTO `ubigeo_inei` VALUES (258, '02', '18', '08', 'SANTA');
INSERT INTO `ubigeo_inei` VALUES (259, '02', '18', '09', 'NUEVO CHIMBOTE');
INSERT INTO `ubigeo_inei` VALUES (260, '02', '19', '00', 'SIHUAS');
INSERT INTO `ubigeo_inei` VALUES (261, '02', '19', '01', 'SIHUAS');
INSERT INTO `ubigeo_inei` VALUES (262, '02', '19', '02', 'ACOBAMBA');
INSERT INTO `ubigeo_inei` VALUES (263, '02', '19', '03', 'ALFONSO UGARTE');
INSERT INTO `ubigeo_inei` VALUES (264, '02', '19', '04', 'CASHAPAMPA');
INSERT INTO `ubigeo_inei` VALUES (265, '02', '19', '05', 'CHINGALPO');
INSERT INTO `ubigeo_inei` VALUES (266, '02', '19', '06', 'HUAYLLABAMBA');
INSERT INTO `ubigeo_inei` VALUES (267, '02', '19', '07', 'QUICHES');
INSERT INTO `ubigeo_inei` VALUES (268, '02', '19', '08', 'RAGASH');
INSERT INTO `ubigeo_inei` VALUES (269, '02', '19', '09', 'SAN JUAN');
INSERT INTO `ubigeo_inei` VALUES (270, '02', '19', '10', 'SICSIBAMBA');
INSERT INTO `ubigeo_inei` VALUES (271, '02', '20', '00', 'YUNGAY');
INSERT INTO `ubigeo_inei` VALUES (272, '02', '20', '01', 'YUNGAY');
INSERT INTO `ubigeo_inei` VALUES (273, '02', '20', '02', 'CASCAPARA');
INSERT INTO `ubigeo_inei` VALUES (274, '02', '20', '03', 'MANCOS');
INSERT INTO `ubigeo_inei` VALUES (275, '02', '20', '04', 'MATACOTO');
INSERT INTO `ubigeo_inei` VALUES (276, '02', '20', '05', 'QUILLO');
INSERT INTO `ubigeo_inei` VALUES (277, '02', '20', '06', 'RANRAHIRCA');
INSERT INTO `ubigeo_inei` VALUES (278, '02', '20', '07', 'SHUPLUY');
INSERT INTO `ubigeo_inei` VALUES (279, '02', '20', '08', 'YANAMA');
INSERT INTO `ubigeo_inei` VALUES (280, '03', '00', '00', 'APURIMAC');
INSERT INTO `ubigeo_inei` VALUES (281, '03', '01', '00', 'ABANCAY');
INSERT INTO `ubigeo_inei` VALUES (282, '03', '01', '01', 'ABANCAY');
INSERT INTO `ubigeo_inei` VALUES (283, '03', '01', '02', 'CHACOCHE');
INSERT INTO `ubigeo_inei` VALUES (284, '03', '01', '03', 'CIRCA');
INSERT INTO `ubigeo_inei` VALUES (285, '03', '01', '04', 'CURAHUASI');
INSERT INTO `ubigeo_inei` VALUES (286, '03', '01', '05', 'HUANIPACA');
INSERT INTO `ubigeo_inei` VALUES (287, '03', '01', '06', 'LAMBRAMA');
INSERT INTO `ubigeo_inei` VALUES (288, '03', '01', '07', 'PICHIRHUA');
INSERT INTO `ubigeo_inei` VALUES (289, '03', '01', '08', 'SAN PEDRO DE CACHORA');
INSERT INTO `ubigeo_inei` VALUES (290, '03', '01', '09', 'TAMBURCO');
INSERT INTO `ubigeo_inei` VALUES (291, '03', '02', '00', 'ANDAHUAYLAS');
INSERT INTO `ubigeo_inei` VALUES (292, '03', '02', '01', 'ANDAHUAYLAS');
INSERT INTO `ubigeo_inei` VALUES (293, '03', '02', '02', 'ANDARAPA');
INSERT INTO `ubigeo_inei` VALUES (294, '03', '02', '03', 'CHIARA');
INSERT INTO `ubigeo_inei` VALUES (295, '03', '02', '04', 'HUANCARAMA');
INSERT INTO `ubigeo_inei` VALUES (296, '03', '02', '05', 'HUANCARAY');
INSERT INTO `ubigeo_inei` VALUES (297, '03', '02', '06', 'HUAYANA');
INSERT INTO `ubigeo_inei` VALUES (298, '03', '02', '07', 'KISHUARA');
INSERT INTO `ubigeo_inei` VALUES (299, '03', '02', '08', 'PACOBAMBA');
INSERT INTO `ubigeo_inei` VALUES (300, '03', '02', '09', 'PACUCHA');
INSERT INTO `ubigeo_inei` VALUES (301, '03', '02', '10', 'PAMPACHIRI');
INSERT INTO `ubigeo_inei` VALUES (302, '03', '02', '11', 'POMACOCHA');
INSERT INTO `ubigeo_inei` VALUES (303, '03', '02', '12', 'SAN ANTONIO DE CACHI');
INSERT INTO `ubigeo_inei` VALUES (304, '03', '02', '13', 'SAN JERONIMO');
INSERT INTO `ubigeo_inei` VALUES (305, '03', '02', '14', 'SAN MIGUEL DE CHACCRAMPA');
INSERT INTO `ubigeo_inei` VALUES (306, '03', '02', '15', 'SANTA MARIA DE CHICMO');
INSERT INTO `ubigeo_inei` VALUES (307, '03', '02', '16', 'TALAVERA');
INSERT INTO `ubigeo_inei` VALUES (308, '03', '02', '17', 'TUMAY HUARACA');
INSERT INTO `ubigeo_inei` VALUES (309, '03', '02', '18', 'TURPO');
INSERT INTO `ubigeo_inei` VALUES (310, '03', '02', '19', 'KAQUIABAMBA');
INSERT INTO `ubigeo_inei` VALUES (311, '03', '03', '00', 'ANTABAMBA');
INSERT INTO `ubigeo_inei` VALUES (312, '03', '03', '01', 'ANTABAMBA');
INSERT INTO `ubigeo_inei` VALUES (313, '03', '03', '02', 'EL ORO');
INSERT INTO `ubigeo_inei` VALUES (314, '03', '03', '03', 'HUAQUIRCA');
INSERT INTO `ubigeo_inei` VALUES (315, '03', '03', '04', 'JUAN ESPINOZA MEDRANO');
INSERT INTO `ubigeo_inei` VALUES (316, '03', '03', '05', 'OROPESA');
INSERT INTO `ubigeo_inei` VALUES (317, '03', '03', '06', 'PACHACONAS');
INSERT INTO `ubigeo_inei` VALUES (318, '03', '03', '07', 'SABAINO');
INSERT INTO `ubigeo_inei` VALUES (319, '03', '04', '00', 'AYMARAES');
INSERT INTO `ubigeo_inei` VALUES (320, '03', '04', '01', 'CHALHUANCA');
INSERT INTO `ubigeo_inei` VALUES (321, '03', '04', '02', 'CAPAYA');
INSERT INTO `ubigeo_inei` VALUES (322, '03', '04', '03', 'CARAYBAMBA');
INSERT INTO `ubigeo_inei` VALUES (323, '03', '04', '04', 'CHAPIMARCA');
INSERT INTO `ubigeo_inei` VALUES (324, '03', '04', '05', 'COLCABAMBA');
INSERT INTO `ubigeo_inei` VALUES (325, '03', '04', '06', 'COTARUSE');
INSERT INTO `ubigeo_inei` VALUES (326, '03', '04', '07', 'HUAYLLO');
INSERT INTO `ubigeo_inei` VALUES (327, '03', '04', '08', 'JUSTO APU SAHUARAURA');
INSERT INTO `ubigeo_inei` VALUES (328, '03', '04', '09', 'LUCRE');
INSERT INTO `ubigeo_inei` VALUES (329, '03', '04', '10', 'POCOHUANCA');
INSERT INTO `ubigeo_inei` VALUES (330, '03', '04', '11', 'SAN JUAN DE CHACÑA');
INSERT INTO `ubigeo_inei` VALUES (331, '03', '04', '12', 'SAÑAYCA');
INSERT INTO `ubigeo_inei` VALUES (332, '03', '04', '13', 'SORAYA');
INSERT INTO `ubigeo_inei` VALUES (333, '03', '04', '14', 'TAPAIRIHUA');
INSERT INTO `ubigeo_inei` VALUES (334, '03', '04', '15', 'TINTAY');
INSERT INTO `ubigeo_inei` VALUES (335, '03', '04', '16', 'TORAYA');
INSERT INTO `ubigeo_inei` VALUES (336, '03', '04', '17', 'YANACA');
INSERT INTO `ubigeo_inei` VALUES (337, '03', '05', '00', 'COTABAMBAS');
INSERT INTO `ubigeo_inei` VALUES (338, '03', '05', '01', 'TAMBOBAMBA');
INSERT INTO `ubigeo_inei` VALUES (339, '03', '05', '02', 'COTABAMBAS');
INSERT INTO `ubigeo_inei` VALUES (340, '03', '05', '03', 'COYLLURQUI');
INSERT INTO `ubigeo_inei` VALUES (341, '03', '05', '04', 'HAQUIRA');
INSERT INTO `ubigeo_inei` VALUES (342, '03', '05', '05', 'MARA');
INSERT INTO `ubigeo_inei` VALUES (343, '03', '05', '06', 'CHALLHUAHUACHO');
INSERT INTO `ubigeo_inei` VALUES (344, '03', '06', '00', 'CHINCHEROS');
INSERT INTO `ubigeo_inei` VALUES (345, '03', '06', '01', 'CHINCHEROS');
INSERT INTO `ubigeo_inei` VALUES (346, '03', '06', '02', 'ANCO-HUALLO');
INSERT INTO `ubigeo_inei` VALUES (347, '03', '06', '03', 'COCHARCAS');
INSERT INTO `ubigeo_inei` VALUES (348, '03', '06', '04', 'HUACCANA');
INSERT INTO `ubigeo_inei` VALUES (349, '03', '06', '05', 'OCOBAMBA');
INSERT INTO `ubigeo_inei` VALUES (350, '03', '06', '06', 'ONGOY');
INSERT INTO `ubigeo_inei` VALUES (351, '03', '06', '07', 'URANMARCA');
INSERT INTO `ubigeo_inei` VALUES (352, '03', '06', '08', 'RANRACANCHA');
INSERT INTO `ubigeo_inei` VALUES (353, '03', '07', '00', 'GRAU');
INSERT INTO `ubigeo_inei` VALUES (354, '03', '07', '01', 'CHUQUIBAMBILLA');
INSERT INTO `ubigeo_inei` VALUES (355, '03', '07', '02', 'CURPAHUASI');
INSERT INTO `ubigeo_inei` VALUES (356, '03', '07', '03', 'GAMARRA');
INSERT INTO `ubigeo_inei` VALUES (357, '03', '07', '04', 'HUAYLLATI');
INSERT INTO `ubigeo_inei` VALUES (358, '03', '07', '05', 'MAMARA');
INSERT INTO `ubigeo_inei` VALUES (359, '03', '07', '06', 'MICAELA BASTIDAS');
INSERT INTO `ubigeo_inei` VALUES (360, '03', '07', '07', 'PATAYPAMPA');
INSERT INTO `ubigeo_inei` VALUES (361, '03', '07', '08', 'PROGRESO');
INSERT INTO `ubigeo_inei` VALUES (362, '03', '07', '09', 'SAN ANTONIO');
INSERT INTO `ubigeo_inei` VALUES (363, '03', '07', '10', 'SANTA ROSA');
INSERT INTO `ubigeo_inei` VALUES (364, '03', '07', '11', 'TURPAY');
INSERT INTO `ubigeo_inei` VALUES (365, '03', '07', '12', 'VILCABAMBA');
INSERT INTO `ubigeo_inei` VALUES (366, '03', '07', '13', 'VIRUNDO');
INSERT INTO `ubigeo_inei` VALUES (367, '03', '07', '14', 'CURASCO');
INSERT INTO `ubigeo_inei` VALUES (368, '04', '00', '00', 'AREQUIPA');
INSERT INTO `ubigeo_inei` VALUES (369, '04', '01', '00', 'AREQUIPA');
INSERT INTO `ubigeo_inei` VALUES (370, '04', '01', '01', 'AREQUIPA');
INSERT INTO `ubigeo_inei` VALUES (371, '04', '01', '02', 'ALTO SELVA ALEGRE');
INSERT INTO `ubigeo_inei` VALUES (372, '04', '01', '03', 'CAYMA');
INSERT INTO `ubigeo_inei` VALUES (373, '04', '01', '04', 'CERRO COLORADO');
INSERT INTO `ubigeo_inei` VALUES (374, '04', '01', '05', 'CHARACATO');
INSERT INTO `ubigeo_inei` VALUES (375, '04', '01', '06', 'CHIGUATA');
INSERT INTO `ubigeo_inei` VALUES (376, '04', '01', '07', 'JACOBO HUNTER');
INSERT INTO `ubigeo_inei` VALUES (377, '04', '01', '08', 'LA JOYA');
INSERT INTO `ubigeo_inei` VALUES (378, '04', '01', '09', 'MARIANO MELGAR');
INSERT INTO `ubigeo_inei` VALUES (379, '04', '01', '10', 'MIRAFLORES');
INSERT INTO `ubigeo_inei` VALUES (380, '04', '01', '11', 'MOLLEBAYA');
INSERT INTO `ubigeo_inei` VALUES (381, '04', '01', '12', 'PAUCARPATA');
INSERT INTO `ubigeo_inei` VALUES (382, '04', '01', '13', 'POCSI');
INSERT INTO `ubigeo_inei` VALUES (383, '04', '01', '14', 'POLOBAYA');
INSERT INTO `ubigeo_inei` VALUES (384, '04', '01', '15', 'QUEQUEÑA');
INSERT INTO `ubigeo_inei` VALUES (385, '04', '01', '16', 'SABANDIA');
INSERT INTO `ubigeo_inei` VALUES (386, '04', '01', '17', 'SACHACA');
INSERT INTO `ubigeo_inei` VALUES (387, '04', '01', '18', 'SAN JUAN DE SIGUAS');
INSERT INTO `ubigeo_inei` VALUES (388, '04', '01', '19', 'SAN JUAN DE TARUCANI');
INSERT INTO `ubigeo_inei` VALUES (389, '04', '01', '20', 'SANTA ISABEL DE SIGUAS');
INSERT INTO `ubigeo_inei` VALUES (390, '04', '01', '21', 'SANTA RITA DE SIGUAS');
INSERT INTO `ubigeo_inei` VALUES (391, '04', '01', '22', 'SOCABAYA');
INSERT INTO `ubigeo_inei` VALUES (392, '04', '01', '23', 'TIABAYA');
INSERT INTO `ubigeo_inei` VALUES (393, '04', '01', '24', 'UCHUMAYO');
INSERT INTO `ubigeo_inei` VALUES (394, '04', '01', '25', 'VITOR');
INSERT INTO `ubigeo_inei` VALUES (395, '04', '01', '26', 'YANAHUARA');
INSERT INTO `ubigeo_inei` VALUES (396, '04', '01', '27', 'YARABAMBA');
INSERT INTO `ubigeo_inei` VALUES (397, '04', '01', '28', 'YURA');
INSERT INTO `ubigeo_inei` VALUES (398, '04', '01', '29', 'JOSE LUIS BUSTAMANTE Y RIVERO');
INSERT INTO `ubigeo_inei` VALUES (399, '04', '02', '00', 'CAMANA');
INSERT INTO `ubigeo_inei` VALUES (400, '04', '02', '01', 'CAMANA');
INSERT INTO `ubigeo_inei` VALUES (401, '04', '02', '02', 'JOSE MARIA QUIMPER');
INSERT INTO `ubigeo_inei` VALUES (402, '04', '02', '03', 'MARIANO NICOLAS VALCARCEL');
INSERT INTO `ubigeo_inei` VALUES (403, '04', '02', '04', 'MARISCAL CACERES');
INSERT INTO `ubigeo_inei` VALUES (404, '04', '02', '05', 'NICOLAS DE PIEROLA');
INSERT INTO `ubigeo_inei` VALUES (405, '04', '02', '06', 'OCOÑA');
INSERT INTO `ubigeo_inei` VALUES (406, '04', '02', '07', 'QUILCA');
INSERT INTO `ubigeo_inei` VALUES (407, '04', '02', '08', 'SAMUEL PASTOR');
INSERT INTO `ubigeo_inei` VALUES (408, '04', '03', '00', 'CARAVELI');
INSERT INTO `ubigeo_inei` VALUES (409, '04', '03', '01', 'CARAVELI');
INSERT INTO `ubigeo_inei` VALUES (410, '04', '03', '02', 'ACARI');
INSERT INTO `ubigeo_inei` VALUES (411, '04', '03', '03', 'ATICO');
INSERT INTO `ubigeo_inei` VALUES (412, '04', '03', '04', 'ATIQUIPA');
INSERT INTO `ubigeo_inei` VALUES (413, '04', '03', '05', 'BELLA UNION');
INSERT INTO `ubigeo_inei` VALUES (414, '04', '03', '06', 'CAHUACHO');
INSERT INTO `ubigeo_inei` VALUES (415, '04', '03', '07', 'CHALA');
INSERT INTO `ubigeo_inei` VALUES (416, '04', '03', '08', 'CHAPARRA');
INSERT INTO `ubigeo_inei` VALUES (417, '04', '03', '09', 'HUANUHUANU');
INSERT INTO `ubigeo_inei` VALUES (418, '04', '03', '10', 'JAQUI');
INSERT INTO `ubigeo_inei` VALUES (419, '04', '03', '11', 'LOMAS');
INSERT INTO `ubigeo_inei` VALUES (420, '04', '03', '12', 'QUICACHA');
INSERT INTO `ubigeo_inei` VALUES (421, '04', '03', '13', 'YAUCA');
INSERT INTO `ubigeo_inei` VALUES (422, '04', '04', '00', 'CASTILLA');
INSERT INTO `ubigeo_inei` VALUES (423, '04', '04', '01', 'APLAO');
INSERT INTO `ubigeo_inei` VALUES (424, '04', '04', '02', 'ANDAGUA');
INSERT INTO `ubigeo_inei` VALUES (425, '04', '04', '03', 'AYO');
INSERT INTO `ubigeo_inei` VALUES (426, '04', '04', '04', 'CHACHAS');
INSERT INTO `ubigeo_inei` VALUES (427, '04', '04', '05', 'CHILCAYMARCA');
INSERT INTO `ubigeo_inei` VALUES (428, '04', '04', '06', 'CHOCO');
INSERT INTO `ubigeo_inei` VALUES (429, '04', '04', '07', 'HUANCARQUI');
INSERT INTO `ubigeo_inei` VALUES (430, '04', '04', '08', 'MACHAGUAY');
INSERT INTO `ubigeo_inei` VALUES (431, '04', '04', '09', 'ORCOPAMPA');
INSERT INTO `ubigeo_inei` VALUES (432, '04', '04', '10', 'PAMPACOLCA');
INSERT INTO `ubigeo_inei` VALUES (433, '04', '04', '11', 'TIPAN');
INSERT INTO `ubigeo_inei` VALUES (434, '04', '04', '12', 'UÑON');
INSERT INTO `ubigeo_inei` VALUES (435, '04', '04', '13', 'URACA');
INSERT INTO `ubigeo_inei` VALUES (436, '04', '04', '14', 'VIRACO');
INSERT INTO `ubigeo_inei` VALUES (437, '04', '05', '00', 'CAYLLOMA');
INSERT INTO `ubigeo_inei` VALUES (438, '04', '05', '01', 'CHIVAY');
INSERT INTO `ubigeo_inei` VALUES (439, '04', '05', '02', 'ACHOMA');
INSERT INTO `ubigeo_inei` VALUES (440, '04', '05', '03', 'CABANACONDE');
INSERT INTO `ubigeo_inei` VALUES (441, '04', '05', '04', 'CALLALLI');
INSERT INTO `ubigeo_inei` VALUES (442, '04', '05', '05', 'CAYLLOMA');
INSERT INTO `ubigeo_inei` VALUES (443, '04', '05', '06', 'COPORAQUE');
INSERT INTO `ubigeo_inei` VALUES (444, '04', '05', '07', 'HUAMBO');
INSERT INTO `ubigeo_inei` VALUES (445, '04', '05', '08', 'HUANCA');
INSERT INTO `ubigeo_inei` VALUES (446, '04', '05', '09', 'ICHUPAMPA');
INSERT INTO `ubigeo_inei` VALUES (447, '04', '05', '10', 'LARI');
INSERT INTO `ubigeo_inei` VALUES (448, '04', '05', '11', 'LLUTA');
INSERT INTO `ubigeo_inei` VALUES (449, '04', '05', '12', 'MACA');
INSERT INTO `ubigeo_inei` VALUES (450, '04', '05', '13', 'MADRIGAL');
INSERT INTO `ubigeo_inei` VALUES (451, '04', '05', '14', 'SAN ANTONIO DE CHUCA');
INSERT INTO `ubigeo_inei` VALUES (452, '04', '05', '15', 'SIBAYO');
INSERT INTO `ubigeo_inei` VALUES (453, '04', '05', '16', 'TAPAY');
INSERT INTO `ubigeo_inei` VALUES (454, '04', '05', '17', 'TISCO');
INSERT INTO `ubigeo_inei` VALUES (455, '04', '05', '18', 'TUTI');
INSERT INTO `ubigeo_inei` VALUES (456, '04', '05', '19', 'YANQUE');
INSERT INTO `ubigeo_inei` VALUES (457, '04', '05', '20', 'MAJES');
INSERT INTO `ubigeo_inei` VALUES (458, '04', '06', '00', 'CONDESUYOS');
INSERT INTO `ubigeo_inei` VALUES (459, '04', '06', '01', 'CHUQUIBAMBA');
INSERT INTO `ubigeo_inei` VALUES (460, '04', '06', '02', 'ANDARAY');
INSERT INTO `ubigeo_inei` VALUES (461, '04', '06', '03', 'CAYARANI');
INSERT INTO `ubigeo_inei` VALUES (462, '04', '06', '04', 'CHICHAS');
INSERT INTO `ubigeo_inei` VALUES (463, '04', '06', '05', 'IRAY');
INSERT INTO `ubigeo_inei` VALUES (464, '04', '06', '06', 'RIO GRANDE');
INSERT INTO `ubigeo_inei` VALUES (465, '04', '06', '07', 'SALAMANCA');
INSERT INTO `ubigeo_inei` VALUES (466, '04', '06', '08', 'YANAQUIHUA');
INSERT INTO `ubigeo_inei` VALUES (467, '04', '07', '00', 'ISLAY');
INSERT INTO `ubigeo_inei` VALUES (468, '04', '07', '01', 'MOLLENDO');
INSERT INTO `ubigeo_inei` VALUES (469, '04', '07', '02', 'COCACHACRA');
INSERT INTO `ubigeo_inei` VALUES (470, '04', '07', '03', 'DEAN VALDIVIA');
INSERT INTO `ubigeo_inei` VALUES (471, '04', '07', '04', 'ISLAY');
INSERT INTO `ubigeo_inei` VALUES (472, '04', '07', '05', 'MEJIA');
INSERT INTO `ubigeo_inei` VALUES (473, '04', '07', '06', 'PUNTA DE BOMBON');
INSERT INTO `ubigeo_inei` VALUES (474, '04', '08', '00', 'LA UNION');
INSERT INTO `ubigeo_inei` VALUES (475, '04', '08', '01', 'COTAHUASI');
INSERT INTO `ubigeo_inei` VALUES (476, '04', '08', '02', 'ALCA');
INSERT INTO `ubigeo_inei` VALUES (477, '04', '08', '03', 'CHARCANA');
INSERT INTO `ubigeo_inei` VALUES (478, '04', '08', '04', 'HUAYNACOTAS');
INSERT INTO `ubigeo_inei` VALUES (479, '04', '08', '05', 'PAMPAMARCA');
INSERT INTO `ubigeo_inei` VALUES (480, '04', '08', '06', 'PUYCA');
INSERT INTO `ubigeo_inei` VALUES (481, '04', '08', '07', 'QUECHUALLA');
INSERT INTO `ubigeo_inei` VALUES (482, '04', '08', '08', 'SAYLA');
INSERT INTO `ubigeo_inei` VALUES (483, '04', '08', '09', 'TAURIA');
INSERT INTO `ubigeo_inei` VALUES (484, '04', '08', '10', 'TOMEPAMPA');
INSERT INTO `ubigeo_inei` VALUES (485, '04', '08', '11', 'TORO');
INSERT INTO `ubigeo_inei` VALUES (486, '05', '00', '00', 'AYACUCHO');
INSERT INTO `ubigeo_inei` VALUES (487, '05', '01', '00', 'HUAMANGA');
INSERT INTO `ubigeo_inei` VALUES (488, '05', '01', '01', 'AYACUCHO');
INSERT INTO `ubigeo_inei` VALUES (489, '05', '01', '02', 'ACOCRO');
INSERT INTO `ubigeo_inei` VALUES (490, '05', '01', '03', 'ACOS VINCHOS');
INSERT INTO `ubigeo_inei` VALUES (491, '05', '01', '04', 'CARMEN ALTO');
INSERT INTO `ubigeo_inei` VALUES (492, '05', '01', '05', 'CHIARA');
INSERT INTO `ubigeo_inei` VALUES (493, '05', '01', '06', 'OCROS');
INSERT INTO `ubigeo_inei` VALUES (494, '05', '01', '07', 'PACAYCASA');
INSERT INTO `ubigeo_inei` VALUES (495, '05', '01', '08', 'QUINUA');
INSERT INTO `ubigeo_inei` VALUES (496, '05', '01', '09', 'SAN JOSE DE TICLLAS');
INSERT INTO `ubigeo_inei` VALUES (497, '05', '01', '10', 'SAN JUAN BAUTISTA');
INSERT INTO `ubigeo_inei` VALUES (498, '05', '01', '11', 'SANTIAGO DE PISCHA');
INSERT INTO `ubigeo_inei` VALUES (499, '05', '01', '12', 'SOCOS');
INSERT INTO `ubigeo_inei` VALUES (500, '05', '01', '13', 'TAMBILLO');
INSERT INTO `ubigeo_inei` VALUES (501, '05', '01', '14', 'VINCHOS');
INSERT INTO `ubigeo_inei` VALUES (502, '05', '01', '15', 'JESÚS NAZARENO');
INSERT INTO `ubigeo_inei` VALUES (503, '05', '01', '16', 'ANDRÉS AVELINO CÁCERES DORREGAY');
INSERT INTO `ubigeo_inei` VALUES (504, '05', '02', '00', 'CANGALLO');
INSERT INTO `ubigeo_inei` VALUES (505, '05', '02', '01', 'CANGALLO');
INSERT INTO `ubigeo_inei` VALUES (506, '05', '02', '02', 'CHUSCHI');
INSERT INTO `ubigeo_inei` VALUES (507, '05', '02', '03', 'LOS MOROCHUCOS');
INSERT INTO `ubigeo_inei` VALUES (508, '05', '02', '04', 'MARIA PARADO DE BELLIDO');
INSERT INTO `ubigeo_inei` VALUES (509, '05', '02', '05', 'PARAS');
INSERT INTO `ubigeo_inei` VALUES (510, '05', '02', '06', 'TOTOS');
INSERT INTO `ubigeo_inei` VALUES (511, '05', '03', '00', 'HUANCA SANCOS');
INSERT INTO `ubigeo_inei` VALUES (512, '05', '03', '01', 'SANCOS');
INSERT INTO `ubigeo_inei` VALUES (513, '05', '03', '02', 'CARAPO');
INSERT INTO `ubigeo_inei` VALUES (514, '05', '03', '03', 'SACSAMARCA');
INSERT INTO `ubigeo_inei` VALUES (515, '05', '03', '04', 'SANTIAGO DE LUCANAMARCA');
INSERT INTO `ubigeo_inei` VALUES (516, '05', '04', '00', 'HUANTA');
INSERT INTO `ubigeo_inei` VALUES (517, '05', '04', '01', 'HUANTA');
INSERT INTO `ubigeo_inei` VALUES (518, '05', '04', '02', 'AYAHUANCO');
INSERT INTO `ubigeo_inei` VALUES (519, '05', '04', '03', 'HUAMANGUILLA');
INSERT INTO `ubigeo_inei` VALUES (520, '05', '04', '04', 'IGUAIN');
INSERT INTO `ubigeo_inei` VALUES (521, '05', '04', '05', 'LURICOCHA');
INSERT INTO `ubigeo_inei` VALUES (522, '05', '04', '06', 'SANTILLANA');
INSERT INTO `ubigeo_inei` VALUES (523, '05', '04', '07', 'SIVIA');
INSERT INTO `ubigeo_inei` VALUES (524, '05', '04', '08', 'LLOCHEGUA');
INSERT INTO `ubigeo_inei` VALUES (525, '05', '04', '09', 'CANAYRE');
INSERT INTO `ubigeo_inei` VALUES (526, '05', '04', '10', 'UCHURACCAY');
INSERT INTO `ubigeo_inei` VALUES (527, '05', '04', '11', 'PUCACOLPA');
INSERT INTO `ubigeo_inei` VALUES (528, '05', '05', '00', 'LA MAR');
INSERT INTO `ubigeo_inei` VALUES (529, '05', '05', '01', 'SAN MIGUEL');
INSERT INTO `ubigeo_inei` VALUES (530, '05', '05', '02', 'ANCO');
INSERT INTO `ubigeo_inei` VALUES (531, '05', '05', '03', 'AYNA');
INSERT INTO `ubigeo_inei` VALUES (532, '05', '05', '04', 'CHILCAS');
INSERT INTO `ubigeo_inei` VALUES (533, '05', '05', '05', 'CHUNGUI');
INSERT INTO `ubigeo_inei` VALUES (534, '05', '05', '06', 'LUIS CARRANZA');
INSERT INTO `ubigeo_inei` VALUES (535, '05', '05', '07', 'SANTA ROSA');
INSERT INTO `ubigeo_inei` VALUES (536, '05', '05', '08', 'TAMBO');
INSERT INTO `ubigeo_inei` VALUES (537, '05', '05', '09', 'SAMUGARI');
INSERT INTO `ubigeo_inei` VALUES (538, '05', '05', '10', 'ANCHIHUAY');
INSERT INTO `ubigeo_inei` VALUES (539, '05', '06', '00', 'LUCANAS');
INSERT INTO `ubigeo_inei` VALUES (540, '05', '06', '01', 'PUQUIO');
INSERT INTO `ubigeo_inei` VALUES (541, '05', '06', '02', 'AUCARA');
INSERT INTO `ubigeo_inei` VALUES (542, '05', '06', '03', 'CABANA');
INSERT INTO `ubigeo_inei` VALUES (543, '05', '06', '04', 'CARMEN SALCEDO');
INSERT INTO `ubigeo_inei` VALUES (544, '05', '06', '05', 'CHAVIÑA');
INSERT INTO `ubigeo_inei` VALUES (545, '05', '06', '06', 'CHIPAO');
INSERT INTO `ubigeo_inei` VALUES (546, '05', '06', '07', 'HUAC-HUAS');
INSERT INTO `ubigeo_inei` VALUES (547, '05', '06', '08', 'LARAMATE');
INSERT INTO `ubigeo_inei` VALUES (548, '05', '06', '09', 'LEONCIO PRADO');
INSERT INTO `ubigeo_inei` VALUES (549, '05', '06', '10', 'LLAUTA');
INSERT INTO `ubigeo_inei` VALUES (550, '05', '06', '11', 'LUCANAS');
INSERT INTO `ubigeo_inei` VALUES (551, '05', '06', '12', 'OCAÑA');
INSERT INTO `ubigeo_inei` VALUES (552, '05', '06', '13', 'OTOCA');
INSERT INTO `ubigeo_inei` VALUES (553, '05', '06', '14', 'SAISA');
INSERT INTO `ubigeo_inei` VALUES (554, '05', '06', '15', 'SAN CRISTOBAL');
INSERT INTO `ubigeo_inei` VALUES (555, '05', '06', '16', 'SAN JUAN');
INSERT INTO `ubigeo_inei` VALUES (556, '05', '06', '17', 'SAN PEDRO');
INSERT INTO `ubigeo_inei` VALUES (557, '05', '06', '18', 'SAN PEDRO DE PALCO');
INSERT INTO `ubigeo_inei` VALUES (558, '05', '06', '19', 'SANCOS');
INSERT INTO `ubigeo_inei` VALUES (559, '05', '06', '20', 'SANTA ANA DE HUAYCAHUACHO');
INSERT INTO `ubigeo_inei` VALUES (560, '05', '06', '21', 'SANTA LUCIA');
INSERT INTO `ubigeo_inei` VALUES (561, '05', '07', '00', 'PARINACOCHAS');
INSERT INTO `ubigeo_inei` VALUES (562, '05', '07', '01', 'CORACORA');
INSERT INTO `ubigeo_inei` VALUES (563, '05', '07', '02', 'CHUMPI');
INSERT INTO `ubigeo_inei` VALUES (564, '05', '07', '03', 'CORONEL CASTAÑEDA');
INSERT INTO `ubigeo_inei` VALUES (565, '05', '07', '04', 'PACAPAUSA');
INSERT INTO `ubigeo_inei` VALUES (566, '05', '07', '05', 'PULLO');
INSERT INTO `ubigeo_inei` VALUES (567, '05', '07', '06', 'PUYUSCA');
INSERT INTO `ubigeo_inei` VALUES (568, '05', '07', '07', 'SAN FRANCISCO DE RAVACAYCO');
INSERT INTO `ubigeo_inei` VALUES (569, '05', '07', '08', 'UPAHUACHO');
INSERT INTO `ubigeo_inei` VALUES (570, '05', '08', '00', 'PAUCAR DEL SARA SARA');
INSERT INTO `ubigeo_inei` VALUES (571, '05', '08', '01', 'PAUSA');
INSERT INTO `ubigeo_inei` VALUES (572, '05', '08', '02', 'COLTA');
INSERT INTO `ubigeo_inei` VALUES (573, '05', '08', '03', 'CORCULLA');
INSERT INTO `ubigeo_inei` VALUES (574, '05', '08', '04', 'LAMPA');
INSERT INTO `ubigeo_inei` VALUES (575, '05', '08', '05', 'MARCABAMBA');
INSERT INTO `ubigeo_inei` VALUES (576, '05', '08', '06', 'OYOLO');
INSERT INTO `ubigeo_inei` VALUES (577, '05', '08', '07', 'PARARCA');
INSERT INTO `ubigeo_inei` VALUES (578, '05', '08', '08', 'SAN JAVIER DE ALPABAMBA');
INSERT INTO `ubigeo_inei` VALUES (579, '05', '08', '09', 'SAN JOSE DE USHUA');
INSERT INTO `ubigeo_inei` VALUES (580, '05', '08', '10', 'SARA SARA');
INSERT INTO `ubigeo_inei` VALUES (581, '05', '09', '00', 'SUCRE');
INSERT INTO `ubigeo_inei` VALUES (582, '05', '09', '01', 'QUEROBAMBA');
INSERT INTO `ubigeo_inei` VALUES (583, '05', '09', '02', 'BELEN');
INSERT INTO `ubigeo_inei` VALUES (584, '05', '09', '03', 'CHALCOS');
INSERT INTO `ubigeo_inei` VALUES (585, '05', '09', '04', 'CHILCAYOC');
INSERT INTO `ubigeo_inei` VALUES (586, '05', '09', '05', 'HUACAÑA');
INSERT INTO `ubigeo_inei` VALUES (587, '05', '09', '06', 'MORCOLLA');
INSERT INTO `ubigeo_inei` VALUES (588, '05', '09', '07', 'PAICO');
INSERT INTO `ubigeo_inei` VALUES (589, '05', '09', '08', 'SAN PEDRO DE LARCAY');
INSERT INTO `ubigeo_inei` VALUES (590, '05', '09', '09', 'SAN SALVADOR DE QUIJE');
INSERT INTO `ubigeo_inei` VALUES (591, '05', '09', '10', 'SANTIAGO DE PAUCARAY');
INSERT INTO `ubigeo_inei` VALUES (592, '05', '09', '11', 'SORAS');
INSERT INTO `ubigeo_inei` VALUES (593, '05', '10', '00', 'VICTOR FAJARDO');
INSERT INTO `ubigeo_inei` VALUES (594, '05', '10', '01', 'HUANCAPI');
INSERT INTO `ubigeo_inei` VALUES (595, '05', '10', '02', 'ALCAMENCA');
INSERT INTO `ubigeo_inei` VALUES (596, '05', '10', '03', 'APONGO');
INSERT INTO `ubigeo_inei` VALUES (597, '05', '10', '04', 'ASQUIPATA');
INSERT INTO `ubigeo_inei` VALUES (598, '05', '10', '05', 'CANARIA');
INSERT INTO `ubigeo_inei` VALUES (599, '05', '10', '06', 'CAYARA');
INSERT INTO `ubigeo_inei` VALUES (600, '05', '10', '07', 'COLCA');
INSERT INTO `ubigeo_inei` VALUES (601, '05', '10', '08', 'HUAMANQUIQUIA');
INSERT INTO `ubigeo_inei` VALUES (602, '05', '10', '09', 'HUANCARAYLLA');
INSERT INTO `ubigeo_inei` VALUES (603, '05', '10', '10', 'HUAYA');
INSERT INTO `ubigeo_inei` VALUES (604, '05', '10', '11', 'SARHUA');
INSERT INTO `ubigeo_inei` VALUES (605, '05', '10', '12', 'VILCANCHOS');
INSERT INTO `ubigeo_inei` VALUES (606, '05', '11', '00', 'VILCAS HUAMAN');
INSERT INTO `ubigeo_inei` VALUES (607, '05', '11', '01', 'VILCAS HUAMAN');
INSERT INTO `ubigeo_inei` VALUES (608, '05', '11', '02', 'ACCOMARCA');
INSERT INTO `ubigeo_inei` VALUES (609, '05', '11', '03', 'CARHUANCA');
INSERT INTO `ubigeo_inei` VALUES (610, '05', '11', '04', 'CONCEPCION');
INSERT INTO `ubigeo_inei` VALUES (611, '05', '11', '05', 'HUAMBALPA');
INSERT INTO `ubigeo_inei` VALUES (612, '05', '11', '06', 'INDEPENDENCIA');
INSERT INTO `ubigeo_inei` VALUES (613, '05', '11', '07', 'SAURAMA');
INSERT INTO `ubigeo_inei` VALUES (614, '05', '11', '08', 'VISCHONGO');
INSERT INTO `ubigeo_inei` VALUES (615, '06', '00', '00', 'CAJAMARCA');
INSERT INTO `ubigeo_inei` VALUES (616, '06', '01', '00', 'CAJAMARCA');
INSERT INTO `ubigeo_inei` VALUES (617, '06', '01', '01', 'CAJAMARCA');
INSERT INTO `ubigeo_inei` VALUES (618, '06', '01', '02', 'ASUNCION');
INSERT INTO `ubigeo_inei` VALUES (619, '06', '01', '03', 'CHETILLA');
INSERT INTO `ubigeo_inei` VALUES (620, '06', '01', '04', 'COSPAN');
INSERT INTO `ubigeo_inei` VALUES (621, '06', '01', '05', 'ENCAÑADA');
INSERT INTO `ubigeo_inei` VALUES (622, '06', '01', '06', 'JESUS');
INSERT INTO `ubigeo_inei` VALUES (623, '06', '01', '07', 'LLACANORA');
INSERT INTO `ubigeo_inei` VALUES (624, '06', '01', '08', 'LOS BAÑOS DEL INCA');
INSERT INTO `ubigeo_inei` VALUES (625, '06', '01', '09', 'MAGDALENA');
INSERT INTO `ubigeo_inei` VALUES (626, '06', '01', '10', 'MATARA');
INSERT INTO `ubigeo_inei` VALUES (627, '06', '01', '11', 'NAMORA');
INSERT INTO `ubigeo_inei` VALUES (628, '06', '01', '12', 'SAN JUAN');
INSERT INTO `ubigeo_inei` VALUES (629, '06', '02', '00', 'CAJABAMBA');
INSERT INTO `ubigeo_inei` VALUES (630, '06', '02', '01', 'CAJABAMBA');
INSERT INTO `ubigeo_inei` VALUES (631, '06', '02', '02', 'CACHACHI');
INSERT INTO `ubigeo_inei` VALUES (632, '06', '02', '03', 'CONDEBAMBA');
INSERT INTO `ubigeo_inei` VALUES (633, '06', '02', '04', 'SITACOCHA');
INSERT INTO `ubigeo_inei` VALUES (634, '06', '03', '00', 'CELENDIN');
INSERT INTO `ubigeo_inei` VALUES (635, '06', '03', '01', 'CELENDIN');
INSERT INTO `ubigeo_inei` VALUES (636, '06', '03', '02', 'CHUMUCH');
INSERT INTO `ubigeo_inei` VALUES (637, '06', '03', '03', 'CORTEGANA');
INSERT INTO `ubigeo_inei` VALUES (638, '06', '03', '04', 'HUASMIN');
INSERT INTO `ubigeo_inei` VALUES (639, '06', '03', '05', 'JORGE CHAVEZ');
INSERT INTO `ubigeo_inei` VALUES (640, '06', '03', '06', 'JOSE GALVEZ');
INSERT INTO `ubigeo_inei` VALUES (641, '06', '03', '07', 'MIGUEL IGLESIAS');
INSERT INTO `ubigeo_inei` VALUES (642, '06', '03', '08', 'OXAMARCA');
INSERT INTO `ubigeo_inei` VALUES (643, '06', '03', '09', 'SOROCHUCO');
INSERT INTO `ubigeo_inei` VALUES (644, '06', '03', '10', 'SUCRE');
INSERT INTO `ubigeo_inei` VALUES (645, '06', '03', '11', 'UTCO');
INSERT INTO `ubigeo_inei` VALUES (646, '06', '03', '12', 'LA LIBERTAD DE PALLAN');
INSERT INTO `ubigeo_inei` VALUES (647, '06', '04', '00', 'CHOTA');
INSERT INTO `ubigeo_inei` VALUES (648, '06', '04', '01', 'CHOTA');
INSERT INTO `ubigeo_inei` VALUES (649, '06', '04', '02', 'ANGUIA');
INSERT INTO `ubigeo_inei` VALUES (650, '06', '04', '03', 'CHADIN');
INSERT INTO `ubigeo_inei` VALUES (651, '06', '04', '04', 'CHIGUIRIP');
INSERT INTO `ubigeo_inei` VALUES (652, '06', '04', '05', 'CHIMBAN');
INSERT INTO `ubigeo_inei` VALUES (653, '06', '04', '06', 'CHOROPAMPA');
INSERT INTO `ubigeo_inei` VALUES (654, '06', '04', '07', 'COCHABAMBA');
INSERT INTO `ubigeo_inei` VALUES (655, '06', '04', '08', 'CONCHAN');
INSERT INTO `ubigeo_inei` VALUES (656, '06', '04', '09', 'HUAMBOS');
INSERT INTO `ubigeo_inei` VALUES (657, '06', '04', '10', 'LAJAS');
INSERT INTO `ubigeo_inei` VALUES (658, '06', '04', '11', 'LLAMA');
INSERT INTO `ubigeo_inei` VALUES (659, '06', '04', '12', 'MIRACOSTA');
INSERT INTO `ubigeo_inei` VALUES (660, '06', '04', '13', 'PACCHA');
INSERT INTO `ubigeo_inei` VALUES (661, '06', '04', '14', 'PION');
INSERT INTO `ubigeo_inei` VALUES (662, '06', '04', '15', 'QUEROCOTO');
INSERT INTO `ubigeo_inei` VALUES (663, '06', '04', '16', 'SAN JUAN DE LICUPIS');
INSERT INTO `ubigeo_inei` VALUES (664, '06', '04', '17', 'TACABAMBA');
INSERT INTO `ubigeo_inei` VALUES (665, '06', '04', '18', 'TOCMOCHE');
INSERT INTO `ubigeo_inei` VALUES (666, '06', '04', '19', 'CHALAMARCA');
INSERT INTO `ubigeo_inei` VALUES (667, '06', '05', '00', 'CONTUMAZA');
INSERT INTO `ubigeo_inei` VALUES (668, '06', '05', '01', 'CONTUMAZA');
INSERT INTO `ubigeo_inei` VALUES (669, '06', '05', '02', 'CHILETE');
INSERT INTO `ubigeo_inei` VALUES (670, '06', '05', '03', 'CUPISNIQUE');
INSERT INTO `ubigeo_inei` VALUES (671, '06', '05', '04', 'GUZMANGO');
INSERT INTO `ubigeo_inei` VALUES (672, '06', '05', '05', 'SAN BENITO');
INSERT INTO `ubigeo_inei` VALUES (673, '06', '05', '06', 'SANTA CRUZ DE TOLED');
INSERT INTO `ubigeo_inei` VALUES (674, '06', '05', '07', 'TANTARICA');
INSERT INTO `ubigeo_inei` VALUES (675, '06', '05', '08', 'YONAN');
INSERT INTO `ubigeo_inei` VALUES (676, '06', '06', '00', 'CUTERVO');
INSERT INTO `ubigeo_inei` VALUES (677, '06', '06', '01', 'CUTERVO');
INSERT INTO `ubigeo_inei` VALUES (678, '06', '06', '02', 'CALLAYUC');
INSERT INTO `ubigeo_inei` VALUES (679, '06', '06', '03', 'CHOROS');
INSERT INTO `ubigeo_inei` VALUES (680, '06', '06', '04', 'CUJILLO');
INSERT INTO `ubigeo_inei` VALUES (681, '06', '06', '05', 'LA RAMADA');
INSERT INTO `ubigeo_inei` VALUES (682, '06', '06', '06', 'PIMPINGOS');
INSERT INTO `ubigeo_inei` VALUES (683, '06', '06', '07', 'QUEROCOTILLO');
INSERT INTO `ubigeo_inei` VALUES (684, '06', '06', '08', 'SAN ANDRES DE CUTERVO');
INSERT INTO `ubigeo_inei` VALUES (685, '06', '06', '09', 'SAN JUAN DE CUTERVO');
INSERT INTO `ubigeo_inei` VALUES (686, '06', '06', '10', 'SAN LUIS DE LUCMA');
INSERT INTO `ubigeo_inei` VALUES (687, '06', '06', '11', 'SANTA CRUZ');
INSERT INTO `ubigeo_inei` VALUES (688, '06', '06', '12', 'SANTO DOMINGO DE LA CAPILLA');
INSERT INTO `ubigeo_inei` VALUES (689, '06', '06', '13', 'SANTO TOMAS');
INSERT INTO `ubigeo_inei` VALUES (690, '06', '06', '14', 'SOCOTA');
INSERT INTO `ubigeo_inei` VALUES (691, '06', '06', '15', 'TORIBIO CASANOVA');
INSERT INTO `ubigeo_inei` VALUES (692, '06', '07', '00', 'HUALGAYOC');
INSERT INTO `ubigeo_inei` VALUES (693, '06', '07', '01', 'BAMBAMARCA');
INSERT INTO `ubigeo_inei` VALUES (694, '06', '07', '02', 'CHUGUR');
INSERT INTO `ubigeo_inei` VALUES (695, '06', '07', '03', 'HUALGAYOC');
INSERT INTO `ubigeo_inei` VALUES (696, '06', '08', '00', 'JAEN');
INSERT INTO `ubigeo_inei` VALUES (697, '06', '08', '01', 'JAEN');
INSERT INTO `ubigeo_inei` VALUES (698, '06', '08', '02', 'BELLAVISTA');
INSERT INTO `ubigeo_inei` VALUES (699, '06', '08', '03', 'CHONTALI');
INSERT INTO `ubigeo_inei` VALUES (700, '06', '08', '04', 'COLASAY');
INSERT INTO `ubigeo_inei` VALUES (701, '06', '08', '05', 'HUABAL');
INSERT INTO `ubigeo_inei` VALUES (702, '06', '08', '06', 'LAS PIRIAS');
INSERT INTO `ubigeo_inei` VALUES (703, '06', '08', '07', 'POMAHUACA');
INSERT INTO `ubigeo_inei` VALUES (704, '06', '08', '08', 'PUCARA');
INSERT INTO `ubigeo_inei` VALUES (705, '06', '08', '09', 'SALLIQUE');
INSERT INTO `ubigeo_inei` VALUES (706, '06', '08', '10', 'SAN FELIPE');
INSERT INTO `ubigeo_inei` VALUES (707, '06', '08', '11', 'SAN JOSE DEL ALTO');
INSERT INTO `ubigeo_inei` VALUES (708, '06', '08', '12', 'SANTA ROSA');
INSERT INTO `ubigeo_inei` VALUES (709, '06', '09', '00', 'SAN IGNACIO');
INSERT INTO `ubigeo_inei` VALUES (710, '06', '09', '01', 'SAN IGNACIO');
INSERT INTO `ubigeo_inei` VALUES (711, '06', '09', '02', 'CHIRINOS');
INSERT INTO `ubigeo_inei` VALUES (712, '06', '09', '03', 'HUARANGO');
INSERT INTO `ubigeo_inei` VALUES (713, '06', '09', '04', 'LA COIPA');
INSERT INTO `ubigeo_inei` VALUES (714, '06', '09', '05', 'NAMBALLE');
INSERT INTO `ubigeo_inei` VALUES (715, '06', '09', '06', 'SAN JOSE DE LOURDES');
INSERT INTO `ubigeo_inei` VALUES (716, '06', '09', '07', 'TABACONAS');
INSERT INTO `ubigeo_inei` VALUES (717, '06', '10', '00', 'SAN MARCOS');
INSERT INTO `ubigeo_inei` VALUES (718, '06', '10', '01', 'PEDRO GALVEZ');
INSERT INTO `ubigeo_inei` VALUES (719, '06', '10', '02', 'CHANCAY');
INSERT INTO `ubigeo_inei` VALUES (720, '06', '10', '03', 'EDUARDO VILLANUEVA');
INSERT INTO `ubigeo_inei` VALUES (721, '06', '10', '04', 'GREGORIO PITA');
INSERT INTO `ubigeo_inei` VALUES (722, '06', '10', '05', 'ICHOCAN');
INSERT INTO `ubigeo_inei` VALUES (723, '06', '10', '06', 'JOSE MANUEL QUIROZ');
INSERT INTO `ubigeo_inei` VALUES (724, '06', '10', '07', 'JOSE SABOGAL');
INSERT INTO `ubigeo_inei` VALUES (725, '06', '11', '00', 'SAN MIGUEL');
INSERT INTO `ubigeo_inei` VALUES (726, '06', '11', '01', 'SAN MIGUEL');
INSERT INTO `ubigeo_inei` VALUES (727, '06', '11', '02', 'BOLIVAR');
INSERT INTO `ubigeo_inei` VALUES (728, '06', '11', '03', 'CALQUIS');
INSERT INTO `ubigeo_inei` VALUES (729, '06', '11', '04', 'CATILLUC');
INSERT INTO `ubigeo_inei` VALUES (730, '06', '11', '05', 'EL PRADO');
INSERT INTO `ubigeo_inei` VALUES (731, '06', '11', '06', 'LA FLORIDA');
INSERT INTO `ubigeo_inei` VALUES (732, '06', '11', '07', 'LLAPA');
INSERT INTO `ubigeo_inei` VALUES (733, '06', '11', '08', 'NANCHOC');
INSERT INTO `ubigeo_inei` VALUES (734, '06', '11', '09', 'NIEPOS');
INSERT INTO `ubigeo_inei` VALUES (735, '06', '11', '10', 'SAN GREGORIO');
INSERT INTO `ubigeo_inei` VALUES (736, '06', '11', '11', 'SAN SILVESTRE DE COCHAN');
INSERT INTO `ubigeo_inei` VALUES (737, '06', '11', '12', 'TONGOD');
INSERT INTO `ubigeo_inei` VALUES (738, '06', '11', '13', 'UNION AGUA BLANCA');
INSERT INTO `ubigeo_inei` VALUES (739, '06', '12', '00', 'SAN PABLO');
INSERT INTO `ubigeo_inei` VALUES (740, '06', '12', '01', 'SAN PABLO');
INSERT INTO `ubigeo_inei` VALUES (741, '06', '12', '02', 'SAN BERNARDINO');
INSERT INTO `ubigeo_inei` VALUES (742, '06', '12', '03', 'SAN LUIS');
INSERT INTO `ubigeo_inei` VALUES (743, '06', '12', '04', 'TUMBADEN');
INSERT INTO `ubigeo_inei` VALUES (744, '06', '13', '00', 'SANTA CRUZ');
INSERT INTO `ubigeo_inei` VALUES (745, '06', '13', '01', 'SANTA CRUZ');
INSERT INTO `ubigeo_inei` VALUES (746, '06', '13', '02', 'ANDABAMBA');
INSERT INTO `ubigeo_inei` VALUES (747, '06', '13', '03', 'CATACHE');
INSERT INTO `ubigeo_inei` VALUES (748, '06', '13', '04', 'CHANCAYBAÑOS');
INSERT INTO `ubigeo_inei` VALUES (749, '06', '13', '05', 'LA ESPERANZA');
INSERT INTO `ubigeo_inei` VALUES (750, '06', '13', '06', 'NINABAMBA');
INSERT INTO `ubigeo_inei` VALUES (751, '06', '13', '07', 'PULAN');
INSERT INTO `ubigeo_inei` VALUES (752, '06', '13', '08', 'SAUCEPAMPA');
INSERT INTO `ubigeo_inei` VALUES (753, '06', '13', '09', 'SEXI');
INSERT INTO `ubigeo_inei` VALUES (754, '06', '13', '10', 'UTICYACU');
INSERT INTO `ubigeo_inei` VALUES (755, '06', '13', '11', 'YAUYUCAN');
INSERT INTO `ubigeo_inei` VALUES (756, '07', '00', '00', 'CALLAO');
INSERT INTO `ubigeo_inei` VALUES (757, '07', '01', '00', 'PROV. CONST. DEL CALLAO');
INSERT INTO `ubigeo_inei` VALUES (758, '07', '01', '01', 'CALLAO');
INSERT INTO `ubigeo_inei` VALUES (759, '07', '01', '02', 'BELLAVISTA');
INSERT INTO `ubigeo_inei` VALUES (760, '07', '01', '03', 'CARMEN DE LA LEGUA REYNOSO');
INSERT INTO `ubigeo_inei` VALUES (761, '07', '01', '04', 'LA PERLA');
INSERT INTO `ubigeo_inei` VALUES (762, '07', '01', '05', 'LA PUNTA');
INSERT INTO `ubigeo_inei` VALUES (763, '07', '01', '06', 'VENTANILLA');
INSERT INTO `ubigeo_inei` VALUES (764, '07', '01', '07', 'MI PERÚ');
INSERT INTO `ubigeo_inei` VALUES (765, '08', '00', '00', 'CUSCO');
INSERT INTO `ubigeo_inei` VALUES (766, '08', '01', '00', 'CUSCO');
INSERT INTO `ubigeo_inei` VALUES (767, '08', '01', '01', 'CUSCO');
INSERT INTO `ubigeo_inei` VALUES (768, '08', '01', '02', 'CCORCA');
INSERT INTO `ubigeo_inei` VALUES (769, '08', '01', '03', 'POROY');
INSERT INTO `ubigeo_inei` VALUES (770, '08', '01', '04', 'SAN JERONIMO');
INSERT INTO `ubigeo_inei` VALUES (771, '08', '01', '05', 'SAN SEBASTIAN');
INSERT INTO `ubigeo_inei` VALUES (772, '08', '01', '06', 'SANTIAGO');
INSERT INTO `ubigeo_inei` VALUES (773, '08', '01', '07', 'SAYLLA');
INSERT INTO `ubigeo_inei` VALUES (774, '08', '01', '08', 'WANCHAQ');
INSERT INTO `ubigeo_inei` VALUES (775, '08', '02', '00', 'ACOMAYO');
INSERT INTO `ubigeo_inei` VALUES (776, '08', '02', '01', 'ACOMAYO');
INSERT INTO `ubigeo_inei` VALUES (777, '08', '02', '02', 'ACOPIA');
INSERT INTO `ubigeo_inei` VALUES (778, '08', '02', '03', 'ACOS');
INSERT INTO `ubigeo_inei` VALUES (779, '08', '02', '04', 'MOSOC LLACTA');
INSERT INTO `ubigeo_inei` VALUES (780, '08', '02', '05', 'POMACANCHI');
INSERT INTO `ubigeo_inei` VALUES (781, '08', '02', '06', 'RONDOCAN');
INSERT INTO `ubigeo_inei` VALUES (782, '08', '02', '07', 'SANGARARA');
INSERT INTO `ubigeo_inei` VALUES (783, '08', '03', '00', 'ANTA');
INSERT INTO `ubigeo_inei` VALUES (784, '08', '03', '01', 'ANTA');
INSERT INTO `ubigeo_inei` VALUES (785, '08', '03', '02', 'ANCAHUASI');
INSERT INTO `ubigeo_inei` VALUES (786, '08', '03', '03', 'CACHIMAYO');
INSERT INTO `ubigeo_inei` VALUES (787, '08', '03', '04', 'CHINCHAYPUJIO');
INSERT INTO `ubigeo_inei` VALUES (788, '08', '03', '05', 'HUAROCONDO');
INSERT INTO `ubigeo_inei` VALUES (789, '08', '03', '06', 'LIMATAMBO');
INSERT INTO `ubigeo_inei` VALUES (790, '08', '03', '07', 'MOLLEPATA');
INSERT INTO `ubigeo_inei` VALUES (791, '08', '03', '08', 'PUCYURA');
INSERT INTO `ubigeo_inei` VALUES (792, '08', '03', '09', 'ZURITE');
INSERT INTO `ubigeo_inei` VALUES (793, '08', '04', '00', 'CALCA');
INSERT INTO `ubigeo_inei` VALUES (794, '08', '04', '01', 'CALCA');
INSERT INTO `ubigeo_inei` VALUES (795, '08', '04', '02', 'COYA');
INSERT INTO `ubigeo_inei` VALUES (796, '08', '04', '03', 'LAMAY');
INSERT INTO `ubigeo_inei` VALUES (797, '08', '04', '04', 'LARES');
INSERT INTO `ubigeo_inei` VALUES (798, '08', '04', '05', 'PISAC');
INSERT INTO `ubigeo_inei` VALUES (799, '08', '04', '06', 'SAN SALVADOR');
INSERT INTO `ubigeo_inei` VALUES (800, '08', '04', '07', 'TARAY');
INSERT INTO `ubigeo_inei` VALUES (801, '08', '04', '08', 'YANATILE');
INSERT INTO `ubigeo_inei` VALUES (802, '08', '05', '00', 'CANAS');
INSERT INTO `ubigeo_inei` VALUES (803, '08', '05', '01', 'YANAOCA');
INSERT INTO `ubigeo_inei` VALUES (804, '08', '05', '02', 'CHECCA');
INSERT INTO `ubigeo_inei` VALUES (805, '08', '05', '03', 'KUNTURKANKI');
INSERT INTO `ubigeo_inei` VALUES (806, '08', '05', '04', 'LANGUI');
INSERT INTO `ubigeo_inei` VALUES (807, '08', '05', '05', 'LAYO');
INSERT INTO `ubigeo_inei` VALUES (808, '08', '05', '06', 'PAMPAMARCA');
INSERT INTO `ubigeo_inei` VALUES (809, '08', '05', '07', 'QUEHUE');
INSERT INTO `ubigeo_inei` VALUES (810, '08', '05', '08', 'TUPAC AMARU');
INSERT INTO `ubigeo_inei` VALUES (811, '08', '06', '00', 'CANCHIS');
INSERT INTO `ubigeo_inei` VALUES (812, '08', '06', '01', 'SICUANI');
INSERT INTO `ubigeo_inei` VALUES (813, '08', '06', '02', 'CHECACUPE');
INSERT INTO `ubigeo_inei` VALUES (814, '08', '06', '03', 'COMBAPATA');
INSERT INTO `ubigeo_inei` VALUES (815, '08', '06', '04', 'MARANGANI');
INSERT INTO `ubigeo_inei` VALUES (816, '08', '06', '05', 'PITUMARCA');
INSERT INTO `ubigeo_inei` VALUES (817, '08', '06', '06', 'SAN PABLO');
INSERT INTO `ubigeo_inei` VALUES (818, '08', '06', '07', 'SAN PEDRO');
INSERT INTO `ubigeo_inei` VALUES (819, '08', '06', '08', 'TINTA');
INSERT INTO `ubigeo_inei` VALUES (820, '08', '07', '00', 'CHUMBIVILCAS');
INSERT INTO `ubigeo_inei` VALUES (821, '08', '07', '01', 'SANTO TOMAS');
INSERT INTO `ubigeo_inei` VALUES (822, '08', '07', '02', 'CAPACMARCA');
INSERT INTO `ubigeo_inei` VALUES (823, '08', '07', '03', 'CHAMACA');
INSERT INTO `ubigeo_inei` VALUES (824, '08', '07', '04', 'COLQUEMARCA');
INSERT INTO `ubigeo_inei` VALUES (825, '08', '07', '05', 'LIVITACA');
INSERT INTO `ubigeo_inei` VALUES (826, '08', '07', '06', 'LLUSCO');
INSERT INTO `ubigeo_inei` VALUES (827, '08', '07', '07', 'QUIÑOTA');
INSERT INTO `ubigeo_inei` VALUES (828, '08', '07', '08', 'VELILLE');
INSERT INTO `ubigeo_inei` VALUES (829, '08', '08', '00', 'ESPINAR');
INSERT INTO `ubigeo_inei` VALUES (830, '08', '08', '01', 'ESPINAR');
INSERT INTO `ubigeo_inei` VALUES (831, '08', '08', '02', 'CONDOROMA');
INSERT INTO `ubigeo_inei` VALUES (832, '08', '08', '03', 'COPORAQUE');
INSERT INTO `ubigeo_inei` VALUES (833, '08', '08', '04', 'OCORURO');
INSERT INTO `ubigeo_inei` VALUES (834, '08', '08', '05', 'PALLPATA');
INSERT INTO `ubigeo_inei` VALUES (835, '08', '08', '06', 'PICHIGUA');
INSERT INTO `ubigeo_inei` VALUES (836, '08', '08', '07', 'SUYCKUTAMBO');
INSERT INTO `ubigeo_inei` VALUES (837, '08', '08', '08', 'ALTO PICHIGUA');
INSERT INTO `ubigeo_inei` VALUES (838, '08', '09', '00', 'LA CONVENCION');
INSERT INTO `ubigeo_inei` VALUES (839, '08', '09', '01', 'SANTA ANA');
INSERT INTO `ubigeo_inei` VALUES (840, '08', '09', '02', 'ECHARATE');
INSERT INTO `ubigeo_inei` VALUES (841, '08', '09', '03', 'HUAYOPATA');
INSERT INTO `ubigeo_inei` VALUES (842, '08', '09', '04', 'MARANURA');
INSERT INTO `ubigeo_inei` VALUES (843, '08', '09', '05', 'OCOBAMBA');
INSERT INTO `ubigeo_inei` VALUES (844, '08', '09', '06', 'QUELLOUNO');
INSERT INTO `ubigeo_inei` VALUES (845, '08', '09', '07', 'KIMBIRI');
INSERT INTO `ubigeo_inei` VALUES (846, '08', '09', '08', 'SANTA TERESA');
INSERT INTO `ubigeo_inei` VALUES (847, '08', '09', '09', 'VILCABAMBA');
INSERT INTO `ubigeo_inei` VALUES (848, '08', '09', '10', 'PICHARI');
INSERT INTO `ubigeo_inei` VALUES (849, '08', '09', '11', 'INKAWASI');
INSERT INTO `ubigeo_inei` VALUES (850, '08', '09', '12', 'VILLA VIRGEN');
INSERT INTO `ubigeo_inei` VALUES (851, '08', '10', '00', 'PARURO');
INSERT INTO `ubigeo_inei` VALUES (852, '08', '10', '01', 'PARURO');
INSERT INTO `ubigeo_inei` VALUES (853, '08', '10', '02', 'ACCHA');
INSERT INTO `ubigeo_inei` VALUES (854, '08', '10', '03', 'CCAPI');
INSERT INTO `ubigeo_inei` VALUES (855, '08', '10', '04', 'COLCHA');
INSERT INTO `ubigeo_inei` VALUES (856, '08', '10', '05', 'HUANOQUITE');
INSERT INTO `ubigeo_inei` VALUES (857, '08', '10', '06', 'OMACHA');
INSERT INTO `ubigeo_inei` VALUES (858, '08', '10', '07', 'PACCARITAMBO');
INSERT INTO `ubigeo_inei` VALUES (859, '08', '10', '08', 'PILLPINTO');
INSERT INTO `ubigeo_inei` VALUES (860, '08', '10', '09', 'YAURISQUE');
INSERT INTO `ubigeo_inei` VALUES (861, '08', '11', '00', 'PAUCARTAMBO');
INSERT INTO `ubigeo_inei` VALUES (862, '08', '11', '01', 'PAUCARTAMBO');
INSERT INTO `ubigeo_inei` VALUES (863, '08', '11', '02', 'CAICAY');
INSERT INTO `ubigeo_inei` VALUES (864, '08', '11', '03', 'CHALLABAMBA');
INSERT INTO `ubigeo_inei` VALUES (865, '08', '11', '04', 'COLQUEPATA');
INSERT INTO `ubigeo_inei` VALUES (866, '08', '11', '05', 'HUANCARANI');
INSERT INTO `ubigeo_inei` VALUES (867, '08', '11', '06', 'KOSÑIPATA');
INSERT INTO `ubigeo_inei` VALUES (868, '08', '12', '00', 'QUISPICANCHI');
INSERT INTO `ubigeo_inei` VALUES (869, '08', '12', '01', 'URCOS');
INSERT INTO `ubigeo_inei` VALUES (870, '08', '12', '02', 'ANDAHUAYLILLAS');
INSERT INTO `ubigeo_inei` VALUES (871, '08', '12', '03', 'CAMANTI');
INSERT INTO `ubigeo_inei` VALUES (872, '08', '12', '04', 'CCARHUAYO');
INSERT INTO `ubigeo_inei` VALUES (873, '08', '12', '05', 'CCATCA');
INSERT INTO `ubigeo_inei` VALUES (874, '08', '12', '06', 'CUSIPATA');
INSERT INTO `ubigeo_inei` VALUES (875, '08', '12', '07', 'HUARO');
INSERT INTO `ubigeo_inei` VALUES (876, '08', '12', '08', 'LUCRE');
INSERT INTO `ubigeo_inei` VALUES (877, '08', '12', '09', 'MARCAPATA');
INSERT INTO `ubigeo_inei` VALUES (878, '08', '12', '10', 'OCONGATE');
INSERT INTO `ubigeo_inei` VALUES (879, '08', '12', '11', 'OROPESA');
INSERT INTO `ubigeo_inei` VALUES (880, '08', '12', '12', 'QUIQUIJANA');
INSERT INTO `ubigeo_inei` VALUES (881, '08', '13', '00', 'URUBAMBA');
INSERT INTO `ubigeo_inei` VALUES (882, '08', '13', '01', 'URUBAMBA');
INSERT INTO `ubigeo_inei` VALUES (883, '08', '13', '02', 'CHINCHERO');
INSERT INTO `ubigeo_inei` VALUES (884, '08', '13', '03', 'HUAYLLABAMBA');
INSERT INTO `ubigeo_inei` VALUES (885, '08', '13', '04', 'MACHUPICCHU');
INSERT INTO `ubigeo_inei` VALUES (886, '08', '13', '05', 'MARAS');
INSERT INTO `ubigeo_inei` VALUES (887, '08', '13', '06', 'OLLANTAYTAMBO');
INSERT INTO `ubigeo_inei` VALUES (888, '08', '13', '07', 'YUCAY');
INSERT INTO `ubigeo_inei` VALUES (889, '09', '00', '00', 'HUANCAVELICA');
INSERT INTO `ubigeo_inei` VALUES (890, '09', '01', '00', 'HUANCAVELICA');
INSERT INTO `ubigeo_inei` VALUES (891, '09', '01', '01', 'HUANCAVELICA');
INSERT INTO `ubigeo_inei` VALUES (892, '09', '01', '02', 'ACOBAMBILLA');
INSERT INTO `ubigeo_inei` VALUES (893, '09', '01', '03', 'ACORIA');
INSERT INTO `ubigeo_inei` VALUES (894, '09', '01', '04', 'CONAYCA');
INSERT INTO `ubigeo_inei` VALUES (895, '09', '01', '05', 'CUENCA');
INSERT INTO `ubigeo_inei` VALUES (896, '09', '01', '06', 'HUACHOCOLPA');
INSERT INTO `ubigeo_inei` VALUES (897, '09', '01', '07', 'HUAYLLAHUARA');
INSERT INTO `ubigeo_inei` VALUES (898, '09', '01', '08', 'IZCUCHACA');
INSERT INTO `ubigeo_inei` VALUES (899, '09', '01', '09', 'LARIA');
INSERT INTO `ubigeo_inei` VALUES (900, '09', '01', '10', 'MANTA');
INSERT INTO `ubigeo_inei` VALUES (901, '09', '01', '11', 'MARISCAL CACERES');
INSERT INTO `ubigeo_inei` VALUES (902, '09', '01', '12', 'MOYA');
INSERT INTO `ubigeo_inei` VALUES (903, '09', '01', '13', 'NUEVO OCCORO');
INSERT INTO `ubigeo_inei` VALUES (904, '09', '01', '14', 'PALCA');
INSERT INTO `ubigeo_inei` VALUES (905, '09', '01', '15', 'PILCHACA');
INSERT INTO `ubigeo_inei` VALUES (906, '09', '01', '16', 'VILCA');
INSERT INTO `ubigeo_inei` VALUES (907, '09', '01', '17', 'YAULI');
INSERT INTO `ubigeo_inei` VALUES (908, '09', '01', '18', 'ASCENSIÓN');
INSERT INTO `ubigeo_inei` VALUES (909, '09', '01', '19', 'HUANDO');
INSERT INTO `ubigeo_inei` VALUES (910, '09', '02', '00', 'ACOBAMBA');
INSERT INTO `ubigeo_inei` VALUES (911, '09', '02', '01', 'ACOBAMBA');
INSERT INTO `ubigeo_inei` VALUES (912, '09', '02', '02', 'ANDABAMBA');
INSERT INTO `ubigeo_inei` VALUES (913, '09', '02', '03', 'ANTA');
INSERT INTO `ubigeo_inei` VALUES (914, '09', '02', '04', 'CAJA');
INSERT INTO `ubigeo_inei` VALUES (915, '09', '02', '05', 'MARCAS');
INSERT INTO `ubigeo_inei` VALUES (916, '09', '02', '06', 'PAUCARA');
INSERT INTO `ubigeo_inei` VALUES (917, '09', '02', '07', 'POMACOCHA');
INSERT INTO `ubigeo_inei` VALUES (918, '09', '02', '08', 'ROSARIO');
INSERT INTO `ubigeo_inei` VALUES (919, '09', '03', '00', 'ANGARAES');
INSERT INTO `ubigeo_inei` VALUES (920, '09', '03', '01', 'LIRCAY');
INSERT INTO `ubigeo_inei` VALUES (921, '09', '03', '02', 'ANCHONGA');
INSERT INTO `ubigeo_inei` VALUES (922, '09', '03', '03', 'CALLANMARCA');
INSERT INTO `ubigeo_inei` VALUES (923, '09', '03', '04', 'CCOCHACCASA');
INSERT INTO `ubigeo_inei` VALUES (924, '09', '03', '05', 'CHINCHO');
INSERT INTO `ubigeo_inei` VALUES (925, '09', '03', '06', 'CONGALLA');
INSERT INTO `ubigeo_inei` VALUES (926, '09', '03', '07', 'HUANCA-HUANCA');
INSERT INTO `ubigeo_inei` VALUES (927, '09', '03', '08', 'HUAYLLAY GRANDE');
INSERT INTO `ubigeo_inei` VALUES (928, '09', '03', '09', 'JULCAMARCA');
INSERT INTO `ubigeo_inei` VALUES (929, '09', '03', '10', 'SAN ANTONIO DE ANTAPARCO');
INSERT INTO `ubigeo_inei` VALUES (930, '09', '03', '11', 'SANTO TOMAS DE PATA');
INSERT INTO `ubigeo_inei` VALUES (931, '09', '03', '12', 'SECCLLA');
INSERT INTO `ubigeo_inei` VALUES (932, '09', '04', '00', 'CASTROVIRREYNA');
INSERT INTO `ubigeo_inei` VALUES (933, '09', '04', '01', 'CASTROVIRREYNA');
INSERT INTO `ubigeo_inei` VALUES (934, '09', '04', '02', 'ARMA');
INSERT INTO `ubigeo_inei` VALUES (935, '09', '04', '03', 'AURAHUA');
INSERT INTO `ubigeo_inei` VALUES (936, '09', '04', '04', 'CAPILLAS');
INSERT INTO `ubigeo_inei` VALUES (937, '09', '04', '05', 'CHUPAMARCA');
INSERT INTO `ubigeo_inei` VALUES (938, '09', '04', '06', 'COCAS');
INSERT INTO `ubigeo_inei` VALUES (939, '09', '04', '07', 'HUACHOS');
INSERT INTO `ubigeo_inei` VALUES (940, '09', '04', '08', 'HUAMATAMBO');
INSERT INTO `ubigeo_inei` VALUES (941, '09', '04', '09', 'MOLLEPAMPA');
INSERT INTO `ubigeo_inei` VALUES (942, '09', '04', '10', 'SAN JUAN');
INSERT INTO `ubigeo_inei` VALUES (943, '09', '04', '11', 'SANTA ANA');
INSERT INTO `ubigeo_inei` VALUES (944, '09', '04', '12', 'TANTARA');
INSERT INTO `ubigeo_inei` VALUES (945, '09', '04', '13', 'TICRAPO');
INSERT INTO `ubigeo_inei` VALUES (946, '09', '05', '00', 'CHURCAMPA');
INSERT INTO `ubigeo_inei` VALUES (947, '09', '05', '01', 'CHURCAMPA');
INSERT INTO `ubigeo_inei` VALUES (948, '09', '05', '02', 'ANCO');
INSERT INTO `ubigeo_inei` VALUES (949, '09', '05', '03', 'CHINCHIHUASI');
INSERT INTO `ubigeo_inei` VALUES (950, '09', '05', '04', 'EL CARMEN');
INSERT INTO `ubigeo_inei` VALUES (951, '09', '05', '05', 'LA MERCED');
INSERT INTO `ubigeo_inei` VALUES (952, '09', '05', '06', 'LOCROJA');
INSERT INTO `ubigeo_inei` VALUES (953, '09', '05', '07', 'PAUCARBAMBA');
INSERT INTO `ubigeo_inei` VALUES (954, '09', '05', '08', 'SAN MIGUEL DE MAYOCC');
INSERT INTO `ubigeo_inei` VALUES (955, '09', '05', '09', 'SAN PEDRO DE CORIS');
INSERT INTO `ubigeo_inei` VALUES (956, '09', '05', '10', 'PACHAMARCA');
INSERT INTO `ubigeo_inei` VALUES (957, '09', '05', '11', 'COSME');
INSERT INTO `ubigeo_inei` VALUES (958, '09', '06', '00', 'HUAYTARA');
INSERT INTO `ubigeo_inei` VALUES (959, '09', '06', '01', 'HUAYTARA');
INSERT INTO `ubigeo_inei` VALUES (960, '09', '06', '02', 'AYAVI');
INSERT INTO `ubigeo_inei` VALUES (961, '09', '06', '03', 'CORDOVA');
INSERT INTO `ubigeo_inei` VALUES (962, '09', '06', '04', 'HUAYACUNDO ARMA');
INSERT INTO `ubigeo_inei` VALUES (963, '09', '06', '05', 'LARAMARCA');
INSERT INTO `ubigeo_inei` VALUES (964, '09', '06', '06', 'OCOYO');
INSERT INTO `ubigeo_inei` VALUES (965, '09', '06', '07', 'PILPICHACA');
INSERT INTO `ubigeo_inei` VALUES (966, '09', '06', '08', 'QUERCO');
INSERT INTO `ubigeo_inei` VALUES (967, '09', '06', '09', 'QUITO-ARMA');
INSERT INTO `ubigeo_inei` VALUES (968, '09', '06', '10', 'SAN ANTONIO DE CUSICANCHA');
INSERT INTO `ubigeo_inei` VALUES (969, '09', '06', '11', 'SAN FRANCISCO DE SANGAYAICO');
INSERT INTO `ubigeo_inei` VALUES (970, '09', '06', '12', 'SAN ISIDRO');
INSERT INTO `ubigeo_inei` VALUES (971, '09', '06', '13', 'SANTIAGO DE CHOCORVOS');
INSERT INTO `ubigeo_inei` VALUES (972, '09', '06', '14', 'SANTIAGO DE QUIRAHUARA');
INSERT INTO `ubigeo_inei` VALUES (973, '09', '06', '15', 'SANTO DOMINGO DE CAPILLAS');
INSERT INTO `ubigeo_inei` VALUES (974, '09', '06', '16', 'TAMBO');
INSERT INTO `ubigeo_inei` VALUES (975, '09', '07', '00', 'TAYACAJA');
INSERT INTO `ubigeo_inei` VALUES (976, '09', '07', '01', 'PAMPAS');
INSERT INTO `ubigeo_inei` VALUES (977, '09', '07', '02', 'ACOSTAMBO');
INSERT INTO `ubigeo_inei` VALUES (978, '09', '07', '03', 'ACRAQUIA');
INSERT INTO `ubigeo_inei` VALUES (979, '09', '07', '04', 'AHUAYCHA');
INSERT INTO `ubigeo_inei` VALUES (980, '09', '07', '05', 'COLCABAMBA');
INSERT INTO `ubigeo_inei` VALUES (981, '09', '07', '06', 'DANIEL HERNANDEZ');
INSERT INTO `ubigeo_inei` VALUES (982, '09', '07', '07', 'HUACHOCOLPA');
INSERT INTO `ubigeo_inei` VALUES (983, '09', '07', '09', 'HUARIBAMBA');
INSERT INTO `ubigeo_inei` VALUES (984, '09', '07', '10', 'ÑAHUIMPUQUIO');
INSERT INTO `ubigeo_inei` VALUES (985, '09', '07', '11', 'PAZOS');
INSERT INTO `ubigeo_inei` VALUES (986, '09', '07', '13', 'QUISHUAR');
INSERT INTO `ubigeo_inei` VALUES (987, '09', '07', '14', 'SALCABAMBA');
INSERT INTO `ubigeo_inei` VALUES (988, '09', '07', '15', 'SALCAHUASI');
INSERT INTO `ubigeo_inei` VALUES (989, '09', '07', '16', 'SAN MARCOS DE ROCCHAC');
INSERT INTO `ubigeo_inei` VALUES (990, '09', '07', '17', 'SURCUBAMBA');
INSERT INTO `ubigeo_inei` VALUES (991, '09', '07', '18', 'TINTAY PUNCU');
INSERT INTO `ubigeo_inei` VALUES (992, '10', '00', '00', 'HUANUCO');
INSERT INTO `ubigeo_inei` VALUES (993, '10', '01', '00', 'HUANUCO');
INSERT INTO `ubigeo_inei` VALUES (994, '10', '01', '01', 'HUANUCO');
INSERT INTO `ubigeo_inei` VALUES (995, '10', '01', '02', 'AMARILIS');
INSERT INTO `ubigeo_inei` VALUES (996, '10', '01', '03', 'CHINCHAO');
INSERT INTO `ubigeo_inei` VALUES (997, '10', '01', '04', 'CHURUBAMBA');
INSERT INTO `ubigeo_inei` VALUES (998, '10', '01', '05', 'MARGOS');
INSERT INTO `ubigeo_inei` VALUES (999, '10', '01', '06', 'QUISQUI');
INSERT INTO `ubigeo_inei` VALUES (1000, '10', '01', '07', 'SAN FRANCISCO DE CAYRAN');
INSERT INTO `ubigeo_inei` VALUES (1001, '10', '01', '08', 'SAN PEDRO DE CHAULAN');
INSERT INTO `ubigeo_inei` VALUES (1002, '10', '01', '09', 'SANTA MARIA DEL VALLE');
INSERT INTO `ubigeo_inei` VALUES (1003, '10', '01', '10', 'YARUMAYO');
INSERT INTO `ubigeo_inei` VALUES (1004, '10', '01', '11', 'PILLCO MARCA');
INSERT INTO `ubigeo_inei` VALUES (1005, '10', '01', '12', 'YACUS');
INSERT INTO `ubigeo_inei` VALUES (1006, '10', '02', '00', 'AMBO');
INSERT INTO `ubigeo_inei` VALUES (1007, '10', '02', '01', 'AMBO');
INSERT INTO `ubigeo_inei` VALUES (1008, '10', '02', '02', 'CAYNA');
INSERT INTO `ubigeo_inei` VALUES (1009, '10', '02', '03', 'COLPAS');
INSERT INTO `ubigeo_inei` VALUES (1010, '10', '02', '04', 'CONCHAMARCA');
INSERT INTO `ubigeo_inei` VALUES (1011, '10', '02', '05', 'HUACAR');
INSERT INTO `ubigeo_inei` VALUES (1012, '10', '02', '06', 'SAN FRANCISCO');
INSERT INTO `ubigeo_inei` VALUES (1013, '10', '02', '07', 'SAN RAFAEL');
INSERT INTO `ubigeo_inei` VALUES (1014, '10', '02', '08', 'TOMAY KICHWA');
INSERT INTO `ubigeo_inei` VALUES (1015, '10', '03', '00', 'DOS DE MAYO');
INSERT INTO `ubigeo_inei` VALUES (1016, '10', '03', '01', 'LA UNION');
INSERT INTO `ubigeo_inei` VALUES (1017, '10', '03', '07', 'CHUQUIS');
INSERT INTO `ubigeo_inei` VALUES (1018, '10', '03', '11', 'MARIAS');
INSERT INTO `ubigeo_inei` VALUES (1019, '10', '03', '13', 'PACHAS');
INSERT INTO `ubigeo_inei` VALUES (1020, '10', '03', '16', 'QUIVILLA');
INSERT INTO `ubigeo_inei` VALUES (1021, '10', '03', '17', 'RIPAN');
INSERT INTO `ubigeo_inei` VALUES (1022, '10', '03', '21', 'SHUNQUI');
INSERT INTO `ubigeo_inei` VALUES (1023, '10', '03', '22', 'SILLAPATA');
INSERT INTO `ubigeo_inei` VALUES (1024, '10', '03', '23', 'YANAS');
INSERT INTO `ubigeo_inei` VALUES (1025, '10', '04', '00', 'HUACAYBAMBA');
INSERT INTO `ubigeo_inei` VALUES (1026, '10', '04', '01', 'HUACAYBAMBA');
INSERT INTO `ubigeo_inei` VALUES (1027, '10', '04', '02', 'CANCHABAMBA');
INSERT INTO `ubigeo_inei` VALUES (1028, '10', '04', '03', 'COCHABAMBA');
INSERT INTO `ubigeo_inei` VALUES (1029, '10', '04', '04', 'PINRA');
INSERT INTO `ubigeo_inei` VALUES (1030, '10', '05', '00', 'HUAMALIES');
INSERT INTO `ubigeo_inei` VALUES (1031, '10', '05', '01', 'LLATA');
INSERT INTO `ubigeo_inei` VALUES (1032, '10', '05', '02', 'ARANCAY');
INSERT INTO `ubigeo_inei` VALUES (1033, '10', '05', '03', 'CHAVIN DE PARIARCA');
INSERT INTO `ubigeo_inei` VALUES (1034, '10', '05', '04', 'JACAS GRANDE');
INSERT INTO `ubigeo_inei` VALUES (1035, '10', '05', '05', 'JIRCAN');
INSERT INTO `ubigeo_inei` VALUES (1036, '10', '05', '06', 'MIRAFLORES');
INSERT INTO `ubigeo_inei` VALUES (1037, '10', '05', '07', 'MONZON');
INSERT INTO `ubigeo_inei` VALUES (1038, '10', '05', '08', 'PUNCHAO');
INSERT INTO `ubigeo_inei` VALUES (1039, '10', '05', '09', 'PUÑOS');
INSERT INTO `ubigeo_inei` VALUES (1040, '10', '05', '10', 'SINGA');
INSERT INTO `ubigeo_inei` VALUES (1041, '10', '05', '11', 'TANTAMAYO');
INSERT INTO `ubigeo_inei` VALUES (1042, '10', '06', '00', 'LEONCIO PRADO');
INSERT INTO `ubigeo_inei` VALUES (1043, '10', '06', '01', 'RUPA-RUPA');
INSERT INTO `ubigeo_inei` VALUES (1044, '10', '06', '02', 'DANIEL ALOMIAS ROBLES');
INSERT INTO `ubigeo_inei` VALUES (1045, '10', '06', '03', 'HERMILIO VALDIZAN');
INSERT INTO `ubigeo_inei` VALUES (1046, '10', '06', '04', 'JOSE CRESPO Y CASTILLO');
INSERT INTO `ubigeo_inei` VALUES (1047, '10', '06', '05', 'LUYANDO');
INSERT INTO `ubigeo_inei` VALUES (1048, '10', '06', '06', 'MARIANO DAMASO BERAUN');
INSERT INTO `ubigeo_inei` VALUES (1049, '10', '07', '00', 'MARAÑON');
INSERT INTO `ubigeo_inei` VALUES (1050, '10', '07', '01', 'HUACRACHUCO');
INSERT INTO `ubigeo_inei` VALUES (1051, '10', '07', '02', 'CHOLON');
INSERT INTO `ubigeo_inei` VALUES (1052, '10', '07', '03', 'SAN BUENAVENTURA');
INSERT INTO `ubigeo_inei` VALUES (1053, '10', '08', '00', 'PACHITEA');
INSERT INTO `ubigeo_inei` VALUES (1054, '10', '08', '01', 'PANAO');
INSERT INTO `ubigeo_inei` VALUES (1055, '10', '08', '02', 'CHAGLLA');
INSERT INTO `ubigeo_inei` VALUES (1056, '10', '08', '03', 'MOLINO');
INSERT INTO `ubigeo_inei` VALUES (1057, '10', '08', '04', 'UMARI');
INSERT INTO `ubigeo_inei` VALUES (1058, '10', '09', '00', 'PUERTO INCA');
INSERT INTO `ubigeo_inei` VALUES (1059, '10', '09', '01', 'PUERTO INCA');
INSERT INTO `ubigeo_inei` VALUES (1060, '10', '09', '02', 'CODO DEL POZUZO');
INSERT INTO `ubigeo_inei` VALUES (1061, '10', '09', '03', 'HONORIA');
INSERT INTO `ubigeo_inei` VALUES (1062, '10', '09', '04', 'TOURNAVISTA');
INSERT INTO `ubigeo_inei` VALUES (1063, '10', '09', '05', 'YUYAPICHIS');
INSERT INTO `ubigeo_inei` VALUES (1064, '10', '10', '00', 'LAURICOCHA');
INSERT INTO `ubigeo_inei` VALUES (1065, '10', '10', '01', 'JESUS');
INSERT INTO `ubigeo_inei` VALUES (1066, '10', '10', '02', 'BAÑOS');
INSERT INTO `ubigeo_inei` VALUES (1067, '10', '10', '03', 'JIVIA');
INSERT INTO `ubigeo_inei` VALUES (1068, '10', '10', '04', 'QUEROPALCA');
INSERT INTO `ubigeo_inei` VALUES (1069, '10', '10', '05', 'RONDOS');
INSERT INTO `ubigeo_inei` VALUES (1070, '10', '10', '06', 'SAN FRANCISCO DE ASIS');
INSERT INTO `ubigeo_inei` VALUES (1071, '10', '10', '07', 'SAN MIGUEL DE CAURI');
INSERT INTO `ubigeo_inei` VALUES (1072, '10', '11', '00', 'YAROWILCA');
INSERT INTO `ubigeo_inei` VALUES (1073, '10', '11', '01', 'CHAVINILLO');
INSERT INTO `ubigeo_inei` VALUES (1074, '10', '11', '02', 'CAHUAC');
INSERT INTO `ubigeo_inei` VALUES (1075, '10', '11', '03', 'CHACABAMBA');
INSERT INTO `ubigeo_inei` VALUES (1076, '10', '11', '04', 'CHUPAN');
INSERT INTO `ubigeo_inei` VALUES (1077, '10', '11', '05', 'JACAS CHICO');
INSERT INTO `ubigeo_inei` VALUES (1078, '10', '11', '06', 'OBAS');
INSERT INTO `ubigeo_inei` VALUES (1079, '10', '11', '07', 'PAMPAMARCA');
INSERT INTO `ubigeo_inei` VALUES (1080, '10', '11', '08', 'CHORAS');
INSERT INTO `ubigeo_inei` VALUES (1081, '11', '00', '00', 'ICA');
INSERT INTO `ubigeo_inei` VALUES (1082, '11', '01', '00', 'ICA');
INSERT INTO `ubigeo_inei` VALUES (1083, '11', '01', '01', 'ICA');
INSERT INTO `ubigeo_inei` VALUES (1084, '11', '01', '02', 'LA TINGUIÑA');
INSERT INTO `ubigeo_inei` VALUES (1085, '11', '01', '03', 'LOS AQUIJES');
INSERT INTO `ubigeo_inei` VALUES (1086, '11', '01', '04', 'OCUCAJE');
INSERT INTO `ubigeo_inei` VALUES (1087, '11', '01', '05', 'PACHACUTEC');
INSERT INTO `ubigeo_inei` VALUES (1088, '11', '01', '06', 'PARCONA');
INSERT INTO `ubigeo_inei` VALUES (1089, '11', '01', '07', 'PUEBLO NUEVO');
INSERT INTO `ubigeo_inei` VALUES (1090, '11', '01', '08', 'SALAS');
INSERT INTO `ubigeo_inei` VALUES (1091, '11', '01', '09', 'SAN JOSE DE LOS MOLINOS');
INSERT INTO `ubigeo_inei` VALUES (1092, '11', '01', '10', 'SAN JUAN BAUTISTA');
INSERT INTO `ubigeo_inei` VALUES (1093, '11', '01', '11', 'SANTIAGO');
INSERT INTO `ubigeo_inei` VALUES (1094, '11', '01', '12', 'SUBTANJALLA');
INSERT INTO `ubigeo_inei` VALUES (1095, '11', '01', '13', 'TATE');
INSERT INTO `ubigeo_inei` VALUES (1096, '11', '01', '14', 'YAUCA DEL ROSARIO');
INSERT INTO `ubigeo_inei` VALUES (1097, '11', '02', '00', 'CHINCHA');
INSERT INTO `ubigeo_inei` VALUES (1098, '11', '02', '01', 'CHINCHA ALTA');
INSERT INTO `ubigeo_inei` VALUES (1099, '11', '02', '02', 'ALTO LARAN');
INSERT INTO `ubigeo_inei` VALUES (1100, '11', '02', '03', 'CHAVIN');
INSERT INTO `ubigeo_inei` VALUES (1101, '11', '02', '04', 'CHINCHA BAJA');
INSERT INTO `ubigeo_inei` VALUES (1102, '11', '02', '05', 'EL CARMEN');
INSERT INTO `ubigeo_inei` VALUES (1103, '11', '02', '06', 'GROCIO PRADO');
INSERT INTO `ubigeo_inei` VALUES (1104, '11', '02', '07', 'PUEBLO NUEVO');
INSERT INTO `ubigeo_inei` VALUES (1105, '11', '02', '08', 'SAN JUAN DE YANAC');
INSERT INTO `ubigeo_inei` VALUES (1106, '11', '02', '09', 'SAN PEDRO DE HUACARPANA');
INSERT INTO `ubigeo_inei` VALUES (1107, '11', '02', '10', 'SUNAMPE');
INSERT INTO `ubigeo_inei` VALUES (1108, '11', '02', '11', 'TAMBO DE MORA');
INSERT INTO `ubigeo_inei` VALUES (1109, '11', '03', '00', 'NAZCA');
INSERT INTO `ubigeo_inei` VALUES (1110, '11', '03', '01', 'NAZCA');
INSERT INTO `ubigeo_inei` VALUES (1111, '11', '03', '02', 'CHANGUILLO');
INSERT INTO `ubigeo_inei` VALUES (1112, '11', '03', '03', 'EL INGENIO');
INSERT INTO `ubigeo_inei` VALUES (1113, '11', '03', '04', 'MARCONA');
INSERT INTO `ubigeo_inei` VALUES (1114, '11', '03', '05', 'VISTA ALEGRE');
INSERT INTO `ubigeo_inei` VALUES (1115, '11', '04', '00', 'PALPA');
INSERT INTO `ubigeo_inei` VALUES (1116, '11', '04', '01', 'PALPA');
INSERT INTO `ubigeo_inei` VALUES (1117, '11', '04', '02', 'LLIPATA');
INSERT INTO `ubigeo_inei` VALUES (1118, '11', '04', '03', 'RIO GRANDE');
INSERT INTO `ubigeo_inei` VALUES (1119, '11', '04', '04', 'SANTA CRUZ');
INSERT INTO `ubigeo_inei` VALUES (1120, '11', '04', '05', 'TIBILLO');
INSERT INTO `ubigeo_inei` VALUES (1121, '11', '05', '00', 'PISCO');
INSERT INTO `ubigeo_inei` VALUES (1122, '11', '05', '01', 'PISCO');
INSERT INTO `ubigeo_inei` VALUES (1123, '11', '05', '02', 'HUANCANO');
INSERT INTO `ubigeo_inei` VALUES (1124, '11', '05', '03', 'HUMAY');
INSERT INTO `ubigeo_inei` VALUES (1125, '11', '05', '04', 'INDEPENDENCIA');
INSERT INTO `ubigeo_inei` VALUES (1126, '11', '05', '05', 'PARACAS');
INSERT INTO `ubigeo_inei` VALUES (1127, '11', '05', '06', 'SAN ANDRES');
INSERT INTO `ubigeo_inei` VALUES (1128, '11', '05', '07', 'SAN CLEMENTE');
INSERT INTO `ubigeo_inei` VALUES (1129, '11', '05', '08', 'TUPAC AMARU INCA');
INSERT INTO `ubigeo_inei` VALUES (1130, '12', '00', '00', 'JUNIN');
INSERT INTO `ubigeo_inei` VALUES (1131, '12', '01', '00', 'HUANCAYO');
INSERT INTO `ubigeo_inei` VALUES (1132, '12', '01', '01', 'HUANCAYO');
INSERT INTO `ubigeo_inei` VALUES (1133, '12', '01', '04', 'CARHUACALLANGA');
INSERT INTO `ubigeo_inei` VALUES (1134, '12', '01', '05', 'CHACAPAMPA');
INSERT INTO `ubigeo_inei` VALUES (1135, '12', '01', '06', 'CHICCHE');
INSERT INTO `ubigeo_inei` VALUES (1136, '12', '01', '07', 'CHILCA');
INSERT INTO `ubigeo_inei` VALUES (1137, '12', '01', '08', 'CHONGOS ALTO');
INSERT INTO `ubigeo_inei` VALUES (1138, '12', '01', '11', 'CHUPURO');
INSERT INTO `ubigeo_inei` VALUES (1139, '12', '01', '12', 'COLCA');
INSERT INTO `ubigeo_inei` VALUES (1140, '12', '01', '13', 'CULLHUAS');
INSERT INTO `ubigeo_inei` VALUES (1141, '12', '01', '14', 'EL TAMBO');
INSERT INTO `ubigeo_inei` VALUES (1142, '12', '01', '16', 'HUACRAPUQUIO');
INSERT INTO `ubigeo_inei` VALUES (1143, '12', '01', '17', 'HUALHUAS');
INSERT INTO `ubigeo_inei` VALUES (1144, '12', '01', '19', 'HUANCAN');
INSERT INTO `ubigeo_inei` VALUES (1145, '12', '01', '20', 'HUASICANCHA');
INSERT INTO `ubigeo_inei` VALUES (1146, '12', '01', '21', 'HUAYUCACHI');
INSERT INTO `ubigeo_inei` VALUES (1147, '12', '01', '22', 'INGENIO');
INSERT INTO `ubigeo_inei` VALUES (1148, '12', '01', '24', 'PARIAHUANCA');
INSERT INTO `ubigeo_inei` VALUES (1149, '12', '01', '25', 'PILCOMAYO');
INSERT INTO `ubigeo_inei` VALUES (1150, '12', '01', '26', 'PUCARA');
INSERT INTO `ubigeo_inei` VALUES (1151, '12', '01', '27', 'QUICHUAY');
INSERT INTO `ubigeo_inei` VALUES (1152, '12', '01', '28', 'QUILCAS');
INSERT INTO `ubigeo_inei` VALUES (1153, '12', '01', '29', 'SAN AGUSTIN');
INSERT INTO `ubigeo_inei` VALUES (1154, '12', '01', '30', 'SAN JERONIMO DE TUNAN');
INSERT INTO `ubigeo_inei` VALUES (1155, '12', '01', '32', 'SAÑO');
INSERT INTO `ubigeo_inei` VALUES (1156, '12', '01', '33', 'SAPALLANGA');
INSERT INTO `ubigeo_inei` VALUES (1157, '12', '01', '34', 'SICAYA');
INSERT INTO `ubigeo_inei` VALUES (1158, '12', '01', '35', 'SANTO DOMINGO DE ACOBAMBA');
INSERT INTO `ubigeo_inei` VALUES (1159, '12', '01', '36', 'VIQUES');
INSERT INTO `ubigeo_inei` VALUES (1160, '12', '02', '00', 'CONCEPCION');
INSERT INTO `ubigeo_inei` VALUES (1161, '12', '02', '01', 'CONCEPCION');
INSERT INTO `ubigeo_inei` VALUES (1162, '12', '02', '02', 'ACO');
INSERT INTO `ubigeo_inei` VALUES (1163, '12', '02', '03', 'ANDAMARCA');
INSERT INTO `ubigeo_inei` VALUES (1164, '12', '02', '04', 'CHAMBARA');
INSERT INTO `ubigeo_inei` VALUES (1165, '12', '02', '05', 'COCHAS');
INSERT INTO `ubigeo_inei` VALUES (1166, '12', '02', '06', 'COMAS');
INSERT INTO `ubigeo_inei` VALUES (1167, '12', '02', '07', 'HEROINAS TOLEDO');
INSERT INTO `ubigeo_inei` VALUES (1168, '12', '02', '08', 'MANZANARES');
INSERT INTO `ubigeo_inei` VALUES (1169, '12', '02', '09', 'MARISCAL CASTILLA');
INSERT INTO `ubigeo_inei` VALUES (1170, '12', '02', '10', 'MATAHUASI');
INSERT INTO `ubigeo_inei` VALUES (1171, '12', '02', '11', 'MITO');
INSERT INTO `ubigeo_inei` VALUES (1172, '12', '02', '12', 'NUEVE DE JULIO');
INSERT INTO `ubigeo_inei` VALUES (1173, '12', '02', '13', 'ORCOTUNA');
INSERT INTO `ubigeo_inei` VALUES (1174, '12', '02', '14', 'SAN JOSE DE QUERO');
INSERT INTO `ubigeo_inei` VALUES (1175, '12', '02', '15', 'SANTA ROSA DE OCOPA');
INSERT INTO `ubigeo_inei` VALUES (1176, '12', '03', '00', 'CHANCHAMAYO');
INSERT INTO `ubigeo_inei` VALUES (1177, '12', '03', '01', 'CHANCHAMAYO');
INSERT INTO `ubigeo_inei` VALUES (1178, '12', '03', '02', 'PERENE');
INSERT INTO `ubigeo_inei` VALUES (1179, '12', '03', '03', 'PICHANAQUI');
INSERT INTO `ubigeo_inei` VALUES (1180, '12', '03', '04', 'SAN LUIS DE SHUARO');
INSERT INTO `ubigeo_inei` VALUES (1181, '12', '03', '05', 'SAN RAMON');
INSERT INTO `ubigeo_inei` VALUES (1182, '12', '03', '06', 'VITOC');
INSERT INTO `ubigeo_inei` VALUES (1183, '12', '04', '00', 'JAUJA');
INSERT INTO `ubigeo_inei` VALUES (1184, '12', '04', '01', 'JAUJA');
INSERT INTO `ubigeo_inei` VALUES (1185, '12', '04', '02', 'ACOLLA');
INSERT INTO `ubigeo_inei` VALUES (1186, '12', '04', '03', 'APATA');
INSERT INTO `ubigeo_inei` VALUES (1187, '12', '04', '04', 'ATAURA');
INSERT INTO `ubigeo_inei` VALUES (1188, '12', '04', '05', 'CANCHAYLLO');
INSERT INTO `ubigeo_inei` VALUES (1189, '12', '04', '06', 'CURICACA');
INSERT INTO `ubigeo_inei` VALUES (1190, '12', '04', '07', 'EL MANTARO');
INSERT INTO `ubigeo_inei` VALUES (1191, '12', '04', '08', 'HUAMALI');
INSERT INTO `ubigeo_inei` VALUES (1192, '12', '04', '09', 'HUARIPAMPA');
INSERT INTO `ubigeo_inei` VALUES (1193, '12', '04', '10', 'HUERTAS');
INSERT INTO `ubigeo_inei` VALUES (1194, '12', '04', '11', 'JANJAILLO');
INSERT INTO `ubigeo_inei` VALUES (1195, '12', '04', '12', 'JULCAN');
INSERT INTO `ubigeo_inei` VALUES (1196, '12', '04', '13', 'LEONOR ORDOÑEZ');
INSERT INTO `ubigeo_inei` VALUES (1197, '12', '04', '14', 'LLOCLLAPAMPA');
INSERT INTO `ubigeo_inei` VALUES (1198, '12', '04', '15', 'MARCO');
INSERT INTO `ubigeo_inei` VALUES (1199, '12', '04', '16', 'MASMA');
INSERT INTO `ubigeo_inei` VALUES (1200, '12', '04', '17', 'MASMA CHICCHE');
INSERT INTO `ubigeo_inei` VALUES (1201, '12', '04', '18', 'MOLINOS');
INSERT INTO `ubigeo_inei` VALUES (1202, '12', '04', '19', 'MONOBAMBA');
INSERT INTO `ubigeo_inei` VALUES (1203, '12', '04', '20', 'MUQUI');
INSERT INTO `ubigeo_inei` VALUES (1204, '12', '04', '21', 'MUQUIYAUYO');
INSERT INTO `ubigeo_inei` VALUES (1205, '12', '04', '22', 'PACA');
INSERT INTO `ubigeo_inei` VALUES (1206, '12', '04', '23', 'PACCHA');
INSERT INTO `ubigeo_inei` VALUES (1207, '12', '04', '24', 'PANCAN');
INSERT INTO `ubigeo_inei` VALUES (1208, '12', '04', '25', 'PARCO');
INSERT INTO `ubigeo_inei` VALUES (1209, '12', '04', '26', 'POMACANCHA');
INSERT INTO `ubigeo_inei` VALUES (1210, '12', '04', '27', 'RICRAN');
INSERT INTO `ubigeo_inei` VALUES (1211, '12', '04', '28', 'SAN LORENZO');
INSERT INTO `ubigeo_inei` VALUES (1212, '12', '04', '29', 'SAN PEDRO DE CHUNAN');
INSERT INTO `ubigeo_inei` VALUES (1213, '12', '04', '30', 'SAUSA');
INSERT INTO `ubigeo_inei` VALUES (1214, '12', '04', '31', 'SINCOS');
INSERT INTO `ubigeo_inei` VALUES (1215, '12', '04', '32', 'TUNAN MARCA');
INSERT INTO `ubigeo_inei` VALUES (1216, '12', '04', '33', 'YAULI');
INSERT INTO `ubigeo_inei` VALUES (1217, '12', '04', '34', 'YAUYOS');
INSERT INTO `ubigeo_inei` VALUES (1218, '12', '05', '00', 'JUNIN');
INSERT INTO `ubigeo_inei` VALUES (1219, '12', '05', '01', 'JUNIN');
INSERT INTO `ubigeo_inei` VALUES (1220, '12', '05', '02', 'CARHUAMAYO');
INSERT INTO `ubigeo_inei` VALUES (1221, '12', '05', '03', 'ONDORES');
INSERT INTO `ubigeo_inei` VALUES (1222, '12', '05', '04', 'ULCUMAYO');
INSERT INTO `ubigeo_inei` VALUES (1223, '12', '06', '00', 'SATIPO');
INSERT INTO `ubigeo_inei` VALUES (1224, '12', '06', '01', 'SATIPO');
INSERT INTO `ubigeo_inei` VALUES (1225, '12', '06', '02', 'COVIRIALI');
INSERT INTO `ubigeo_inei` VALUES (1226, '12', '06', '03', 'LLAYLLA');
INSERT INTO `ubigeo_inei` VALUES (1227, '12', '06', '04', 'MAZAMARI');
INSERT INTO `ubigeo_inei` VALUES (1228, '12', '06', '05', 'PAMPA HERMOSA');
INSERT INTO `ubigeo_inei` VALUES (1229, '12', '06', '06', 'PANGOA');
INSERT INTO `ubigeo_inei` VALUES (1230, '12', '06', '07', 'RIO NEGRO');
INSERT INTO `ubigeo_inei` VALUES (1231, '12', '06', '08', 'RIO TAMBO');
INSERT INTO `ubigeo_inei` VALUES (1232, '12', '06', '99', 'MAZAMARI-PANGOA');
INSERT INTO `ubigeo_inei` VALUES (1233, '12', '07', '00', 'TARMA');
INSERT INTO `ubigeo_inei` VALUES (1234, '12', '07', '01', 'TARMA');
INSERT INTO `ubigeo_inei` VALUES (1235, '12', '07', '02', 'ACOBAMBA');
INSERT INTO `ubigeo_inei` VALUES (1236, '12', '07', '03', 'HUARICOLCA');
INSERT INTO `ubigeo_inei` VALUES (1237, '12', '07', '04', 'HUASAHUASI');
INSERT INTO `ubigeo_inei` VALUES (1238, '12', '07', '05', 'LA UNION');
INSERT INTO `ubigeo_inei` VALUES (1239, '12', '07', '06', 'PALCA');
INSERT INTO `ubigeo_inei` VALUES (1240, '12', '07', '07', 'PALCAMAYO');
INSERT INTO `ubigeo_inei` VALUES (1241, '12', '07', '08', 'SAN PEDRO DE CAJAS');
INSERT INTO `ubigeo_inei` VALUES (1242, '12', '07', '09', 'TAPO');
INSERT INTO `ubigeo_inei` VALUES (1243, '12', '08', '00', 'YAULI');
INSERT INTO `ubigeo_inei` VALUES (1244, '12', '08', '01', 'LA OROYA');
INSERT INTO `ubigeo_inei` VALUES (1245, '12', '08', '02', 'CHACAPALPA');
INSERT INTO `ubigeo_inei` VALUES (1246, '12', '08', '03', 'HUAY-HUAY');
INSERT INTO `ubigeo_inei` VALUES (1247, '12', '08', '04', 'MARCAPOMACOCHA');
INSERT INTO `ubigeo_inei` VALUES (1248, '12', '08', '05', 'MOROCOCHA');
INSERT INTO `ubigeo_inei` VALUES (1249, '12', '08', '06', 'PACCHA');
INSERT INTO `ubigeo_inei` VALUES (1250, '12', '08', '07', 'SANTA BARBARA DE CARHUACAYAN');
INSERT INTO `ubigeo_inei` VALUES (1251, '12', '08', '08', 'SANTA ROSA DE SACCO');
INSERT INTO `ubigeo_inei` VALUES (1252, '12', '08', '09', 'SUITUCANCHA');
INSERT INTO `ubigeo_inei` VALUES (1253, '12', '08', '10', 'YAULI');
INSERT INTO `ubigeo_inei` VALUES (1254, '12', '09', '00', 'CHUPACA');
INSERT INTO `ubigeo_inei` VALUES (1255, '12', '09', '01', 'CHUPACA');
INSERT INTO `ubigeo_inei` VALUES (1256, '12', '09', '02', 'AHUAC');
INSERT INTO `ubigeo_inei` VALUES (1257, '12', '09', '03', 'CHONGOS BAJO');
INSERT INTO `ubigeo_inei` VALUES (1258, '12', '09', '04', 'HUACHAC');
INSERT INTO `ubigeo_inei` VALUES (1259, '12', '09', '05', 'HUAMANCACA CHICO');
INSERT INTO `ubigeo_inei` VALUES (1260, '12', '09', '06', 'SAN JUAN DE ISCOS');
INSERT INTO `ubigeo_inei` VALUES (1261, '12', '09', '07', 'SAN JUAN DE JARPA');
INSERT INTO `ubigeo_inei` VALUES (1262, '12', '09', '08', '3 DE DICIEMBRE');
INSERT INTO `ubigeo_inei` VALUES (1263, '12', '09', '09', 'YANACANCHA');
INSERT INTO `ubigeo_inei` VALUES (1264, '13', '00', '00', 'LA LIBERTAD');
INSERT INTO `ubigeo_inei` VALUES (1265, '13', '01', '00', 'TRUJILLO');
INSERT INTO `ubigeo_inei` VALUES (1266, '13', '01', '01', 'TRUJILLO');
INSERT INTO `ubigeo_inei` VALUES (1267, '13', '01', '02', 'EL PORVENIR');
INSERT INTO `ubigeo_inei` VALUES (1268, '13', '01', '03', 'FLORENCIA DE MORA');
INSERT INTO `ubigeo_inei` VALUES (1269, '13', '01', '04', 'HUANCHACO');
INSERT INTO `ubigeo_inei` VALUES (1270, '13', '01', '05', 'LA ESPERANZA');
INSERT INTO `ubigeo_inei` VALUES (1271, '13', '01', '06', 'LAREDO');
INSERT INTO `ubigeo_inei` VALUES (1272, '13', '01', '07', 'MOCHE');
INSERT INTO `ubigeo_inei` VALUES (1273, '13', '01', '08', 'POROTO');
INSERT INTO `ubigeo_inei` VALUES (1274, '13', '01', '09', 'SALAVERRY');
INSERT INTO `ubigeo_inei` VALUES (1275, '13', '01', '10', 'SIMBAL');
INSERT INTO `ubigeo_inei` VALUES (1276, '13', '01', '11', 'VICTOR LARCO HERRERA');
INSERT INTO `ubigeo_inei` VALUES (1277, '13', '02', '00', 'ASCOPE');
INSERT INTO `ubigeo_inei` VALUES (1278, '13', '02', '01', 'ASCOPE');
INSERT INTO `ubigeo_inei` VALUES (1279, '13', '02', '02', 'CHICAMA');
INSERT INTO `ubigeo_inei` VALUES (1280, '13', '02', '03', 'CHOCOPE');
INSERT INTO `ubigeo_inei` VALUES (1281, '13', '02', '04', 'MAGDALENA DE CAO');
INSERT INTO `ubigeo_inei` VALUES (1282, '13', '02', '05', 'PAIJAN');
INSERT INTO `ubigeo_inei` VALUES (1283, '13', '02', '06', 'RAZURI');
INSERT INTO `ubigeo_inei` VALUES (1284, '13', '02', '07', 'SANTIAGO DE CAO');
INSERT INTO `ubigeo_inei` VALUES (1285, '13', '02', '08', 'CASA GRANDE');
INSERT INTO `ubigeo_inei` VALUES (1286, '13', '03', '00', 'BOLIVAR');
INSERT INTO `ubigeo_inei` VALUES (1287, '13', '03', '01', 'BOLIVAR');
INSERT INTO `ubigeo_inei` VALUES (1288, '13', '03', '02', 'BAMBAMARCA');
INSERT INTO `ubigeo_inei` VALUES (1289, '13', '03', '03', 'CONDORMARCA');
INSERT INTO `ubigeo_inei` VALUES (1290, '13', '03', '04', 'LONGOTEA');
INSERT INTO `ubigeo_inei` VALUES (1291, '13', '03', '05', 'UCHUMARCA');
INSERT INTO `ubigeo_inei` VALUES (1292, '13', '03', '06', 'UCUNCHA');
INSERT INTO `ubigeo_inei` VALUES (1293, '13', '04', '00', 'CHEPEN');
INSERT INTO `ubigeo_inei` VALUES (1294, '13', '04', '01', 'CHEPEN');
INSERT INTO `ubigeo_inei` VALUES (1295, '13', '04', '02', 'PACANGA');
INSERT INTO `ubigeo_inei` VALUES (1296, '13', '04', '03', 'PUEBLO NUEVO');
INSERT INTO `ubigeo_inei` VALUES (1297, '13', '05', '00', 'JULCAN');
INSERT INTO `ubigeo_inei` VALUES (1298, '13', '05', '01', 'JULCAN');
INSERT INTO `ubigeo_inei` VALUES (1299, '13', '05', '02', 'CALAMARCA');
INSERT INTO `ubigeo_inei` VALUES (1300, '13', '05', '03', 'CARABAMBA');
INSERT INTO `ubigeo_inei` VALUES (1301, '13', '05', '04', 'HUASO');
INSERT INTO `ubigeo_inei` VALUES (1302, '13', '06', '00', 'OTUZCO');
INSERT INTO `ubigeo_inei` VALUES (1303, '13', '06', '01', 'OTUZCO');
INSERT INTO `ubigeo_inei` VALUES (1304, '13', '06', '02', 'AGALLPAMPA');
INSERT INTO `ubigeo_inei` VALUES (1305, '13', '06', '04', 'CHARAT');
INSERT INTO `ubigeo_inei` VALUES (1306, '13', '06', '05', 'HUARANCHAL');
INSERT INTO `ubigeo_inei` VALUES (1307, '13', '06', '06', 'LA CUESTA');
INSERT INTO `ubigeo_inei` VALUES (1308, '13', '06', '08', 'MACHE');
INSERT INTO `ubigeo_inei` VALUES (1309, '13', '06', '10', 'PARANDAY');
INSERT INTO `ubigeo_inei` VALUES (1310, '13', '06', '11', 'SALPO');
INSERT INTO `ubigeo_inei` VALUES (1311, '13', '06', '13', 'SINSICAP');
INSERT INTO `ubigeo_inei` VALUES (1312, '13', '06', '14', 'USQUIL');
INSERT INTO `ubigeo_inei` VALUES (1313, '13', '07', '00', 'PACASMAYO');
INSERT INTO `ubigeo_inei` VALUES (1314, '13', '07', '01', 'SAN PEDRO DE LLOC');
INSERT INTO `ubigeo_inei` VALUES (1315, '13', '07', '02', 'GUADALUPE');
INSERT INTO `ubigeo_inei` VALUES (1316, '13', '07', '03', 'JEQUETEPEQUE');
INSERT INTO `ubigeo_inei` VALUES (1317, '13', '07', '04', 'PACASMAYO');
INSERT INTO `ubigeo_inei` VALUES (1318, '13', '07', '05', 'SAN JOSE');
INSERT INTO `ubigeo_inei` VALUES (1319, '13', '08', '00', 'PATAZ');
INSERT INTO `ubigeo_inei` VALUES (1320, '13', '08', '01', 'TAYABAMBA');
INSERT INTO `ubigeo_inei` VALUES (1321, '13', '08', '02', 'BULDIBUYO');
INSERT INTO `ubigeo_inei` VALUES (1322, '13', '08', '03', 'CHILLIA');
INSERT INTO `ubigeo_inei` VALUES (1323, '13', '08', '04', 'HUANCASPATA');
INSERT INTO `ubigeo_inei` VALUES (1324, '13', '08', '05', 'HUAYLILLAS');
INSERT INTO `ubigeo_inei` VALUES (1325, '13', '08', '06', 'HUAYO');
INSERT INTO `ubigeo_inei` VALUES (1326, '13', '08', '07', 'ONGON');
INSERT INTO `ubigeo_inei` VALUES (1327, '13', '08', '08', 'PARCOY');
INSERT INTO `ubigeo_inei` VALUES (1328, '13', '08', '09', 'PATAZ');
INSERT INTO `ubigeo_inei` VALUES (1329, '13', '08', '10', 'PIAS');
INSERT INTO `ubigeo_inei` VALUES (1330, '13', '08', '11', 'SANTIAGO DE CHALLAS');
INSERT INTO `ubigeo_inei` VALUES (1331, '13', '08', '12', 'TAURIJA');
INSERT INTO `ubigeo_inei` VALUES (1332, '13', '08', '13', 'URPAY');
INSERT INTO `ubigeo_inei` VALUES (1333, '13', '09', '00', 'SANCHEZ CARRION');
INSERT INTO `ubigeo_inei` VALUES (1334, '13', '09', '01', 'HUAMACHUCO');
INSERT INTO `ubigeo_inei` VALUES (1335, '13', '09', '02', 'CHUGAY');
INSERT INTO `ubigeo_inei` VALUES (1336, '13', '09', '03', 'COCHORCO');
INSERT INTO `ubigeo_inei` VALUES (1337, '13', '09', '04', 'CURGOS');
INSERT INTO `ubigeo_inei` VALUES (1338, '13', '09', '05', 'MARCABAL');
INSERT INTO `ubigeo_inei` VALUES (1339, '13', '09', '06', 'SANAGORAN');
INSERT INTO `ubigeo_inei` VALUES (1340, '13', '09', '07', 'SARIN');
INSERT INTO `ubigeo_inei` VALUES (1341, '13', '09', '08', 'SARTIMBAMBA');
INSERT INTO `ubigeo_inei` VALUES (1342, '13', '10', '00', 'SANTIAGO DE CHUCO');
INSERT INTO `ubigeo_inei` VALUES (1343, '13', '10', '01', 'SANTIAGO DE CHUCO');
INSERT INTO `ubigeo_inei` VALUES (1344, '13', '10', '02', 'ANGASMARCA');
INSERT INTO `ubigeo_inei` VALUES (1345, '13', '10', '03', 'CACHICADAN');
INSERT INTO `ubigeo_inei` VALUES (1346, '13', '10', '04', 'MOLLEBAMBA');
INSERT INTO `ubigeo_inei` VALUES (1347, '13', '10', '05', 'MOLLEPATA');
INSERT INTO `ubigeo_inei` VALUES (1348, '13', '10', '06', 'QUIRUVILCA');
INSERT INTO `ubigeo_inei` VALUES (1349, '13', '10', '07', 'SANTA CRUZ DE CHUCA');
INSERT INTO `ubigeo_inei` VALUES (1350, '13', '10', '08', 'SITABAMBA');
INSERT INTO `ubigeo_inei` VALUES (1351, '13', '11', '00', 'GRAN CHIMU');
INSERT INTO `ubigeo_inei` VALUES (1352, '13', '11', '01', 'CASCAS');
INSERT INTO `ubigeo_inei` VALUES (1353, '13', '11', '02', 'LUCMA');
INSERT INTO `ubigeo_inei` VALUES (1354, '13', '11', '03', 'MARMOT');
INSERT INTO `ubigeo_inei` VALUES (1355, '13', '11', '04', 'SAYAPULLO');
INSERT INTO `ubigeo_inei` VALUES (1356, '13', '12', '00', 'VIRU');
INSERT INTO `ubigeo_inei` VALUES (1357, '13', '12', '01', 'VIRU');
INSERT INTO `ubigeo_inei` VALUES (1358, '13', '12', '02', 'CHAO');
INSERT INTO `ubigeo_inei` VALUES (1359, '13', '12', '03', 'GUADALUPITO');
INSERT INTO `ubigeo_inei` VALUES (1360, '14', '00', '00', 'LAMBAYEQUE');
INSERT INTO `ubigeo_inei` VALUES (1361, '14', '01', '00', 'CHICLAYO');
INSERT INTO `ubigeo_inei` VALUES (1362, '14', '01', '01', 'CHICLAYO');
INSERT INTO `ubigeo_inei` VALUES (1363, '14', '01', '02', 'CHONGOYAPE');
INSERT INTO `ubigeo_inei` VALUES (1364, '14', '01', '03', 'ETEN');
INSERT INTO `ubigeo_inei` VALUES (1365, '14', '01', '04', 'ETEN PUERTO');
INSERT INTO `ubigeo_inei` VALUES (1366, '14', '01', '05', 'JOSE LEONARDO ORTIZ');
INSERT INTO `ubigeo_inei` VALUES (1367, '14', '01', '06', 'LA VICTORIA');
INSERT INTO `ubigeo_inei` VALUES (1368, '14', '01', '07', 'LAGUNAS');
INSERT INTO `ubigeo_inei` VALUES (1369, '14', '01', '08', 'MONSEFU');
INSERT INTO `ubigeo_inei` VALUES (1370, '14', '01', '09', 'NUEVA ARICA');
INSERT INTO `ubigeo_inei` VALUES (1371, '14', '01', '10', 'OYOTUN');
INSERT INTO `ubigeo_inei` VALUES (1372, '14', '01', '11', 'PICSI');
INSERT INTO `ubigeo_inei` VALUES (1373, '14', '01', '12', 'PIMENTEL');
INSERT INTO `ubigeo_inei` VALUES (1374, '14', '01', '13', 'REQUE');
INSERT INTO `ubigeo_inei` VALUES (1375, '14', '01', '14', 'SANTA ROSA');
INSERT INTO `ubigeo_inei` VALUES (1376, '14', '01', '15', 'SAÑA');
INSERT INTO `ubigeo_inei` VALUES (1377, '14', '01', '16', 'CAYALTÍ');
INSERT INTO `ubigeo_inei` VALUES (1378, '14', '01', '17', 'PATAPO');
INSERT INTO `ubigeo_inei` VALUES (1379, '14', '01', '18', 'POMALCA');
INSERT INTO `ubigeo_inei` VALUES (1380, '14', '01', '19', 'PUCALÁ');
INSERT INTO `ubigeo_inei` VALUES (1381, '14', '01', '20', 'TUMÁN');
INSERT INTO `ubigeo_inei` VALUES (1382, '14', '02', '00', 'FERREÑAFE');
INSERT INTO `ubigeo_inei` VALUES (1383, '14', '02', '01', 'FERREÑAFE');
INSERT INTO `ubigeo_inei` VALUES (1384, '14', '02', '02', 'CAÑARIS');
INSERT INTO `ubigeo_inei` VALUES (1385, '14', '02', '03', 'INCAHUASI');
INSERT INTO `ubigeo_inei` VALUES (1386, '14', '02', '04', 'MANUEL ANTONIO MESONES MURO');
INSERT INTO `ubigeo_inei` VALUES (1387, '14', '02', '05', 'PITIPO');
INSERT INTO `ubigeo_inei` VALUES (1388, '14', '02', '06', 'PUEBLO NUEVO');
INSERT INTO `ubigeo_inei` VALUES (1389, '14', '03', '00', 'LAMBAYEQUE');
INSERT INTO `ubigeo_inei` VALUES (1390, '14', '03', '01', 'LAMBAYEQUE');
INSERT INTO `ubigeo_inei` VALUES (1391, '14', '03', '02', 'CHOCHOPE');
INSERT INTO `ubigeo_inei` VALUES (1392, '14', '03', '03', 'ILLIMO');
INSERT INTO `ubigeo_inei` VALUES (1393, '14', '03', '04', 'JAYANCA');
INSERT INTO `ubigeo_inei` VALUES (1394, '14', '03', '05', 'MOCHUMI');
INSERT INTO `ubigeo_inei` VALUES (1395, '14', '03', '06', 'MORROPE');
INSERT INTO `ubigeo_inei` VALUES (1396, '14', '03', '07', 'MOTUPE');
INSERT INTO `ubigeo_inei` VALUES (1397, '14', '03', '08', 'OLMOS');
INSERT INTO `ubigeo_inei` VALUES (1398, '14', '03', '09', 'PACORA');
INSERT INTO `ubigeo_inei` VALUES (1399, '14', '03', '10', 'SALAS');
INSERT INTO `ubigeo_inei` VALUES (1400, '14', '03', '11', 'SAN JOSE');
INSERT INTO `ubigeo_inei` VALUES (1401, '14', '03', '12', 'TUCUME');
INSERT INTO `ubigeo_inei` VALUES (1402, '15', '00', '00', 'LIMA');
INSERT INTO `ubigeo_inei` VALUES (1403, '15', '01', '00', 'LIMA');
INSERT INTO `ubigeo_inei` VALUES (1404, '15', '01', '01', 'LIMA');
INSERT INTO `ubigeo_inei` VALUES (1405, '15', '01', '02', 'ANCON');
INSERT INTO `ubigeo_inei` VALUES (1406, '15', '01', '03', 'ATE');
INSERT INTO `ubigeo_inei` VALUES (1407, '15', '01', '04', 'BARRANCO');
INSERT INTO `ubigeo_inei` VALUES (1408, '15', '01', '05', 'BREÑA');
INSERT INTO `ubigeo_inei` VALUES (1409, '15', '01', '06', 'CARABAYLLO');
INSERT INTO `ubigeo_inei` VALUES (1410, '15', '01', '07', 'CHACLACAYO');
INSERT INTO `ubigeo_inei` VALUES (1411, '15', '01', '08', 'CHORRILLOS');
INSERT INTO `ubigeo_inei` VALUES (1412, '15', '01', '09', 'CIENEGUILLA');
INSERT INTO `ubigeo_inei` VALUES (1413, '15', '01', '10', 'COMAS');
INSERT INTO `ubigeo_inei` VALUES (1414, '15', '01', '11', 'EL AGUSTINO');
INSERT INTO `ubigeo_inei` VALUES (1415, '15', '01', '12', 'INDEPENDENCIA');
INSERT INTO `ubigeo_inei` VALUES (1416, '15', '01', '13', 'JESUS MARIA');
INSERT INTO `ubigeo_inei` VALUES (1417, '15', '01', '14', 'LA MOLINA');
INSERT INTO `ubigeo_inei` VALUES (1418, '15', '01', '15', 'LA VICTORIA');
INSERT INTO `ubigeo_inei` VALUES (1419, '15', '01', '16', 'LINCE');
INSERT INTO `ubigeo_inei` VALUES (1420, '15', '01', '17', 'LOS OLIVOS');
INSERT INTO `ubigeo_inei` VALUES (1421, '15', '01', '18', 'LURIGANCHO');
INSERT INTO `ubigeo_inei` VALUES (1422, '15', '01', '19', 'LURIN');
INSERT INTO `ubigeo_inei` VALUES (1423, '15', '01', '20', 'MAGDALENA DEL MAR');
INSERT INTO `ubigeo_inei` VALUES (1424, '15', '01', '21', 'PUEBLO LIBRE (MAGDALENA VIEJA)');
INSERT INTO `ubigeo_inei` VALUES (1425, '15', '01', '22', 'MIRAFLORES');
INSERT INTO `ubigeo_inei` VALUES (1426, '15', '01', '23', 'PACHACAMAC');
INSERT INTO `ubigeo_inei` VALUES (1427, '15', '01', '24', 'PUCUSANA');
INSERT INTO `ubigeo_inei` VALUES (1428, '15', '01', '25', 'PUENTE PIEDRA');
INSERT INTO `ubigeo_inei` VALUES (1429, '15', '01', '26', 'PUNTA HERMOSA');
INSERT INTO `ubigeo_inei` VALUES (1430, '15', '01', '27', 'PUNTA NEGRA');
INSERT INTO `ubigeo_inei` VALUES (1431, '15', '01', '28', 'RIMAC');
INSERT INTO `ubigeo_inei` VALUES (1432, '15', '01', '29', 'SAN BARTOLO');
INSERT INTO `ubigeo_inei` VALUES (1433, '15', '01', '30', 'SAN BORJA');
INSERT INTO `ubigeo_inei` VALUES (1434, '15', '01', '31', 'SAN ISIDRO');
INSERT INTO `ubigeo_inei` VALUES (1435, '15', '01', '32', 'SAN JUAN DE LURIGANCHO');
INSERT INTO `ubigeo_inei` VALUES (1436, '15', '01', '33', 'SAN JUAN DE MIRAFLORES');
INSERT INTO `ubigeo_inei` VALUES (1437, '15', '01', '34', 'SAN LUIS');
INSERT INTO `ubigeo_inei` VALUES (1438, '15', '01', '35', 'SAN MARTIN DE PORRES');
INSERT INTO `ubigeo_inei` VALUES (1439, '15', '01', '36', 'SAN MIGUEL');
INSERT INTO `ubigeo_inei` VALUES (1440, '15', '01', '37', 'SANTA ANITA');
INSERT INTO `ubigeo_inei` VALUES (1441, '15', '01', '38', 'SANTA MARIA DEL MAR');
INSERT INTO `ubigeo_inei` VALUES (1442, '15', '01', '39', 'SANTA ROSA');
INSERT INTO `ubigeo_inei` VALUES (1443, '15', '01', '40', 'SANTIAGO DE SURCO');
INSERT INTO `ubigeo_inei` VALUES (1444, '15', '01', '41', 'SURQUILLO');
INSERT INTO `ubigeo_inei` VALUES (1445, '15', '01', '42', 'VILLA EL SALVADOR');
INSERT INTO `ubigeo_inei` VALUES (1446, '15', '01', '43', 'VILLA MARIA DEL TRIUNFO');
INSERT INTO `ubigeo_inei` VALUES (1447, '15', '02', '00', 'BARRANCA');
INSERT INTO `ubigeo_inei` VALUES (1448, '15', '02', '01', 'BARRANCA');
INSERT INTO `ubigeo_inei` VALUES (1449, '15', '02', '02', 'PARAMONGA');
INSERT INTO `ubigeo_inei` VALUES (1450, '15', '02', '03', 'PATIVILCA');
INSERT INTO `ubigeo_inei` VALUES (1451, '15', '02', '04', 'SUPE');
INSERT INTO `ubigeo_inei` VALUES (1452, '15', '02', '05', 'SUPE PUERTO');
INSERT INTO `ubigeo_inei` VALUES (1453, '15', '03', '00', 'CAJATAMBO');
INSERT INTO `ubigeo_inei` VALUES (1454, '15', '03', '01', 'CAJATAMBO');
INSERT INTO `ubigeo_inei` VALUES (1455, '15', '03', '02', 'COPA');
INSERT INTO `ubigeo_inei` VALUES (1456, '15', '03', '03', 'GORGOR');
INSERT INTO `ubigeo_inei` VALUES (1457, '15', '03', '04', 'HUANCAPON');
INSERT INTO `ubigeo_inei` VALUES (1458, '15', '03', '05', 'MANAS');
INSERT INTO `ubigeo_inei` VALUES (1459, '15', '04', '00', 'CANTA');
INSERT INTO `ubigeo_inei` VALUES (1460, '15', '04', '01', 'CANTA');
INSERT INTO `ubigeo_inei` VALUES (1461, '15', '04', '02', 'ARAHUAY');
INSERT INTO `ubigeo_inei` VALUES (1462, '15', '04', '03', 'HUAMANTANGA');
INSERT INTO `ubigeo_inei` VALUES (1463, '15', '04', '04', 'HUAROS');
INSERT INTO `ubigeo_inei` VALUES (1464, '15', '04', '05', 'LACHAQUI');
INSERT INTO `ubigeo_inei` VALUES (1465, '15', '04', '06', 'SAN BUENAVENTURA');
INSERT INTO `ubigeo_inei` VALUES (1466, '15', '04', '07', 'SANTA ROSA DE QUIVES');
INSERT INTO `ubigeo_inei` VALUES (1467, '15', '05', '00', 'CAÑETE');
INSERT INTO `ubigeo_inei` VALUES (1468, '15', '05', '01', 'SAN VICENTE DE CAÑETE');
INSERT INTO `ubigeo_inei` VALUES (1469, '15', '05', '02', 'ASIA');
INSERT INTO `ubigeo_inei` VALUES (1470, '15', '05', '03', 'CALANGO');
INSERT INTO `ubigeo_inei` VALUES (1471, '15', '05', '04', 'CERRO AZUL');
INSERT INTO `ubigeo_inei` VALUES (1472, '15', '05', '05', 'CHILCA');
INSERT INTO `ubigeo_inei` VALUES (1473, '15', '05', '06', 'COAYLLO');
INSERT INTO `ubigeo_inei` VALUES (1474, '15', '05', '07', 'IMPERIAL');
INSERT INTO `ubigeo_inei` VALUES (1475, '15', '05', '08', 'LUNAHUANA');
INSERT INTO `ubigeo_inei` VALUES (1476, '15', '05', '09', 'MALA');
INSERT INTO `ubigeo_inei` VALUES (1477, '15', '05', '10', 'NUEVO IMPERIAL');
INSERT INTO `ubigeo_inei` VALUES (1478, '15', '05', '11', 'PACARAN');
INSERT INTO `ubigeo_inei` VALUES (1479, '15', '05', '12', 'QUILMANA');
INSERT INTO `ubigeo_inei` VALUES (1480, '15', '05', '13', 'SAN ANTONIO');
INSERT INTO `ubigeo_inei` VALUES (1481, '15', '05', '14', 'SAN LUIS');
INSERT INTO `ubigeo_inei` VALUES (1482, '15', '05', '15', 'SANTA CRUZ DE FLORES');
INSERT INTO `ubigeo_inei` VALUES (1483, '15', '05', '16', 'ZUÑIGA');
INSERT INTO `ubigeo_inei` VALUES (1484, '15', '06', '00', 'HUARAL');
INSERT INTO `ubigeo_inei` VALUES (1485, '15', '06', '01', 'HUARAL');
INSERT INTO `ubigeo_inei` VALUES (1486, '15', '06', '02', 'ATAVILLOS ALTO');
INSERT INTO `ubigeo_inei` VALUES (1487, '15', '06', '03', 'ATAVILLOS BAJO');
INSERT INTO `ubigeo_inei` VALUES (1488, '15', '06', '04', 'AUCALLAMA');
INSERT INTO `ubigeo_inei` VALUES (1489, '15', '06', '05', 'CHANCAY');
INSERT INTO `ubigeo_inei` VALUES (1490, '15', '06', '06', 'IHUARI');
INSERT INTO `ubigeo_inei` VALUES (1491, '15', '06', '07', 'LAMPIAN');
INSERT INTO `ubigeo_inei` VALUES (1492, '15', '06', '08', 'PACARAOS');
INSERT INTO `ubigeo_inei` VALUES (1493, '15', '06', '09', 'SAN MIGUEL DE ACOS');
INSERT INTO `ubigeo_inei` VALUES (1494, '15', '06', '10', 'SANTA CRUZ DE ANDAMARCA');
INSERT INTO `ubigeo_inei` VALUES (1495, '15', '06', '11', 'SUMBILCA');
INSERT INTO `ubigeo_inei` VALUES (1496, '15', '06', '12', 'VEINTISIETE DE NOVIEMBRE');
INSERT INTO `ubigeo_inei` VALUES (1497, '15', '07', '00', 'HUAROCHIRI');
INSERT INTO `ubigeo_inei` VALUES (1498, '15', '07', '01', 'MATUCANA');
INSERT INTO `ubigeo_inei` VALUES (1499, '15', '07', '02', 'ANTIOQUIA');
INSERT INTO `ubigeo_inei` VALUES (1500, '15', '07', '03', 'CALLAHUANCA');
INSERT INTO `ubigeo_inei` VALUES (1501, '15', '07', '04', 'CARAMPOMA');
INSERT INTO `ubigeo_inei` VALUES (1502, '15', '07', '05', 'CHICLA');
INSERT INTO `ubigeo_inei` VALUES (1503, '15', '07', '06', 'CUENCA');
INSERT INTO `ubigeo_inei` VALUES (1504, '15', '07', '07', 'HUACHUPAMPA');
INSERT INTO `ubigeo_inei` VALUES (1505, '15', '07', '08', 'HUANZA');
INSERT INTO `ubigeo_inei` VALUES (1506, '15', '07', '09', 'HUAROCHIRI');
INSERT INTO `ubigeo_inei` VALUES (1507, '15', '07', '10', 'LAHUAYTAMBO');
INSERT INTO `ubigeo_inei` VALUES (1508, '15', '07', '11', 'LANGA');
INSERT INTO `ubigeo_inei` VALUES (1509, '15', '07', '12', 'LARAOS');
INSERT INTO `ubigeo_inei` VALUES (1510, '15', '07', '13', 'MARIATANA');
INSERT INTO `ubigeo_inei` VALUES (1511, '15', '07', '14', 'RICARDO PALMA');
INSERT INTO `ubigeo_inei` VALUES (1512, '15', '07', '15', 'SAN ANDRES DE TUPICOCHA');
INSERT INTO `ubigeo_inei` VALUES (1513, '15', '07', '16', 'SAN ANTONIO');
INSERT INTO `ubigeo_inei` VALUES (1514, '15', '07', '17', 'SAN BARTOLOME');
INSERT INTO `ubigeo_inei` VALUES (1515, '15', '07', '18', 'SAN DAMIAN');
INSERT INTO `ubigeo_inei` VALUES (1516, '15', '07', '19', 'SAN JUAN DE IRIS');
INSERT INTO `ubigeo_inei` VALUES (1517, '15', '07', '20', 'SAN JUAN DE TANTARANCHE');
INSERT INTO `ubigeo_inei` VALUES (1518, '15', '07', '21', 'SAN LORENZO DE QUINTI');
INSERT INTO `ubigeo_inei` VALUES (1519, '15', '07', '22', 'SAN MATEO');
INSERT INTO `ubigeo_inei` VALUES (1520, '15', '07', '23', 'SAN MATEO DE OTAO');
INSERT INTO `ubigeo_inei` VALUES (1521, '15', '07', '24', 'SAN PEDRO DE CASTA');
INSERT INTO `ubigeo_inei` VALUES (1522, '15', '07', '25', 'SAN PEDRO DE HUANCAYRE');
INSERT INTO `ubigeo_inei` VALUES (1523, '15', '07', '26', 'SANGALLAYA');
INSERT INTO `ubigeo_inei` VALUES (1524, '15', '07', '27', 'SANTA CRUZ DE COCACHACRA');
INSERT INTO `ubigeo_inei` VALUES (1525, '15', '07', '28', 'SANTA EULALIA');
INSERT INTO `ubigeo_inei` VALUES (1526, '15', '07', '29', 'SANTIAGO DE ANCHUCAYA');
INSERT INTO `ubigeo_inei` VALUES (1527, '15', '07', '30', 'SANTIAGO DE TUNA');
INSERT INTO `ubigeo_inei` VALUES (1528, '15', '07', '31', 'SANTO DOMINGO DE LOS OLLEROS');
INSERT INTO `ubigeo_inei` VALUES (1529, '15', '07', '32', 'SURCO');
INSERT INTO `ubigeo_inei` VALUES (1530, '15', '08', '00', 'HUAURA');
INSERT INTO `ubigeo_inei` VALUES (1531, '15', '08', '01', 'HUACHO');
INSERT INTO `ubigeo_inei` VALUES (1532, '15', '08', '02', 'AMBAR');
INSERT INTO `ubigeo_inei` VALUES (1533, '15', '08', '03', 'CALETA DE CARQUIN');
INSERT INTO `ubigeo_inei` VALUES (1534, '15', '08', '04', 'CHECRAS');
INSERT INTO `ubigeo_inei` VALUES (1535, '15', '08', '05', 'HUALMAY');
INSERT INTO `ubigeo_inei` VALUES (1536, '15', '08', '06', 'HUAURA');
INSERT INTO `ubigeo_inei` VALUES (1537, '15', '08', '07', 'LEONCIO PRADO');
INSERT INTO `ubigeo_inei` VALUES (1538, '15', '08', '08', 'PACCHO');
INSERT INTO `ubigeo_inei` VALUES (1539, '15', '08', '09', 'SANTA LEONOR');
INSERT INTO `ubigeo_inei` VALUES (1540, '15', '08', '10', 'SANTA MARIA');
INSERT INTO `ubigeo_inei` VALUES (1541, '15', '08', '11', 'SAYAN');
INSERT INTO `ubigeo_inei` VALUES (1542, '15', '08', '12', 'VEGUETA');
INSERT INTO `ubigeo_inei` VALUES (1543, '15', '09', '00', 'OYON');
INSERT INTO `ubigeo_inei` VALUES (1544, '15', '09', '01', 'OYON');
INSERT INTO `ubigeo_inei` VALUES (1545, '15', '09', '02', 'ANDAJES');
INSERT INTO `ubigeo_inei` VALUES (1546, '15', '09', '03', 'CAUJUL');
INSERT INTO `ubigeo_inei` VALUES (1547, '15', '09', '04', 'COCHAMARCA');
INSERT INTO `ubigeo_inei` VALUES (1548, '15', '09', '05', 'NAVAN');
INSERT INTO `ubigeo_inei` VALUES (1549, '15', '09', '06', 'PACHANGARA');
INSERT INTO `ubigeo_inei` VALUES (1550, '15', '10', '00', 'YAUYOS');
INSERT INTO `ubigeo_inei` VALUES (1551, '15', '10', '01', 'YAUYOS');
INSERT INTO `ubigeo_inei` VALUES (1552, '15', '10', '02', 'ALIS');
INSERT INTO `ubigeo_inei` VALUES (1553, '15', '10', '03', 'AYAUCA');
INSERT INTO `ubigeo_inei` VALUES (1554, '15', '10', '04', 'AYAVIRI');
INSERT INTO `ubigeo_inei` VALUES (1555, '15', '10', '05', 'AZANGARO');
INSERT INTO `ubigeo_inei` VALUES (1556, '15', '10', '06', 'CACRA');
INSERT INTO `ubigeo_inei` VALUES (1557, '15', '10', '07', 'CARANIA');
INSERT INTO `ubigeo_inei` VALUES (1558, '15', '10', '08', 'CATAHUASI');
INSERT INTO `ubigeo_inei` VALUES (1559, '15', '10', '09', 'CHOCOS');
INSERT INTO `ubigeo_inei` VALUES (1560, '15', '10', '10', 'COCHAS');
INSERT INTO `ubigeo_inei` VALUES (1561, '15', '10', '11', 'COLONIA');
INSERT INTO `ubigeo_inei` VALUES (1562, '15', '10', '12', 'HONGOS');
INSERT INTO `ubigeo_inei` VALUES (1563, '15', '10', '13', 'HUAMPARA');
INSERT INTO `ubigeo_inei` VALUES (1564, '15', '10', '14', 'HUANCAYA');
INSERT INTO `ubigeo_inei` VALUES (1565, '15', '10', '15', 'HUANGASCAR');
INSERT INTO `ubigeo_inei` VALUES (1566, '15', '10', '16', 'HUANTAN');
INSERT INTO `ubigeo_inei` VALUES (1567, '15', '10', '17', 'HUAÑEC');
INSERT INTO `ubigeo_inei` VALUES (1568, '15', '10', '18', 'LARAOS');
INSERT INTO `ubigeo_inei` VALUES (1569, '15', '10', '19', 'LINCHA');
INSERT INTO `ubigeo_inei` VALUES (1570, '15', '10', '20', 'MADEAN');
INSERT INTO `ubigeo_inei` VALUES (1571, '15', '10', '21', 'MIRAFLORES');
INSERT INTO `ubigeo_inei` VALUES (1572, '15', '10', '22', 'OMAS');
INSERT INTO `ubigeo_inei` VALUES (1573, '15', '10', '23', 'PUTINZA');
INSERT INTO `ubigeo_inei` VALUES (1574, '15', '10', '24', 'QUINCHES');
INSERT INTO `ubigeo_inei` VALUES (1575, '15', '10', '25', 'QUINOCAY');
INSERT INTO `ubigeo_inei` VALUES (1576, '15', '10', '26', 'SAN JOAQUIN');
INSERT INTO `ubigeo_inei` VALUES (1577, '15', '10', '27', 'SAN PEDRO DE PILAS');
INSERT INTO `ubigeo_inei` VALUES (1578, '15', '10', '28', 'TANTA');
INSERT INTO `ubigeo_inei` VALUES (1579, '15', '10', '29', 'TAURIPAMPA');
INSERT INTO `ubigeo_inei` VALUES (1580, '15', '10', '30', 'TOMAS');
INSERT INTO `ubigeo_inei` VALUES (1581, '15', '10', '31', 'TUPE');
INSERT INTO `ubigeo_inei` VALUES (1582, '15', '10', '32', 'VIÑAC');
INSERT INTO `ubigeo_inei` VALUES (1583, '15', '10', '33', 'VITIS');
INSERT INTO `ubigeo_inei` VALUES (1584, '16', '00', '00', 'LORETO');
INSERT INTO `ubigeo_inei` VALUES (1585, '16', '01', '00', 'MAYNAS');
INSERT INTO `ubigeo_inei` VALUES (1586, '16', '01', '01', 'IQUITOS');
INSERT INTO `ubigeo_inei` VALUES (1587, '16', '01', '02', 'ALTO NANAY');
INSERT INTO `ubigeo_inei` VALUES (1588, '16', '01', '03', 'FERNANDO LORES');
INSERT INTO `ubigeo_inei` VALUES (1589, '16', '01', '04', 'INDIANA');
INSERT INTO `ubigeo_inei` VALUES (1590, '16', '01', '05', 'LAS AMAZONAS');
INSERT INTO `ubigeo_inei` VALUES (1591, '16', '01', '06', 'MAZAN');
INSERT INTO `ubigeo_inei` VALUES (1592, '16', '01', '07', 'NAPO');
INSERT INTO `ubigeo_inei` VALUES (1593, '16', '01', '08', 'PUNCHANA');
INSERT INTO `ubigeo_inei` VALUES (1594, '16', '01', '09', 'PUTUMAYO');
INSERT INTO `ubigeo_inei` VALUES (1595, '16', '01', '10', 'TORRES CAUSANA');
INSERT INTO `ubigeo_inei` VALUES (1596, '16', '01', '12', 'BELÉN');
INSERT INTO `ubigeo_inei` VALUES (1597, '16', '01', '13', 'SAN JUAN BAUTISTA');
INSERT INTO `ubigeo_inei` VALUES (1598, '16', '01', '14', 'TENIENTE MANUEL CLAVERO');
INSERT INTO `ubigeo_inei` VALUES (1599, '16', '02', '00', 'ALTO AMAZONAS');
INSERT INTO `ubigeo_inei` VALUES (1600, '16', '02', '01', 'YURIMAGUAS');
INSERT INTO `ubigeo_inei` VALUES (1601, '16', '02', '02', 'BALSAPUERTO');
INSERT INTO `ubigeo_inei` VALUES (1602, '16', '02', '05', 'JEBEROS');
INSERT INTO `ubigeo_inei` VALUES (1603, '16', '02', '06', 'LAGUNAS');
INSERT INTO `ubigeo_inei` VALUES (1604, '16', '02', '10', 'SANTA CRUZ');
INSERT INTO `ubigeo_inei` VALUES (1605, '16', '02', '11', 'TENIENTE CESAR LOPEZ ROJAS');
INSERT INTO `ubigeo_inei` VALUES (1606, '16', '03', '00', 'LORETO');
INSERT INTO `ubigeo_inei` VALUES (1607, '16', '03', '01', 'NAUTA');
INSERT INTO `ubigeo_inei` VALUES (1608, '16', '03', '02', 'PARINARI');
INSERT INTO `ubigeo_inei` VALUES (1609, '16', '03', '03', 'TIGRE');
INSERT INTO `ubigeo_inei` VALUES (1610, '16', '03', '04', 'TROMPETEROS');
INSERT INTO `ubigeo_inei` VALUES (1611, '16', '03', '05', 'URARINAS');
INSERT INTO `ubigeo_inei` VALUES (1612, '16', '04', '00', 'MARISCAL RAMON CASTILLA');
INSERT INTO `ubigeo_inei` VALUES (1613, '16', '04', '01', 'RAMON CASTILLA');
INSERT INTO `ubigeo_inei` VALUES (1614, '16', '04', '02', 'PEBAS');
INSERT INTO `ubigeo_inei` VALUES (1615, '16', '04', '03', 'YAVARI');
INSERT INTO `ubigeo_inei` VALUES (1616, '16', '04', '04', 'SAN PABLO');
INSERT INTO `ubigeo_inei` VALUES (1617, '16', '05', '00', 'REQUENA');
INSERT INTO `ubigeo_inei` VALUES (1618, '16', '05', '01', 'REQUENA');
INSERT INTO `ubigeo_inei` VALUES (1619, '16', '05', '02', 'ALTO TAPICHE');
INSERT INTO `ubigeo_inei` VALUES (1620, '16', '05', '03', 'CAPELO');
INSERT INTO `ubigeo_inei` VALUES (1621, '16', '05', '04', 'EMILIO SAN MARTIN');
INSERT INTO `ubigeo_inei` VALUES (1622, '16', '05', '05', 'MAQUIA');
INSERT INTO `ubigeo_inei` VALUES (1623, '16', '05', '06', 'PUINAHUA');
INSERT INTO `ubigeo_inei` VALUES (1624, '16', '05', '07', 'SAQUENA');
INSERT INTO `ubigeo_inei` VALUES (1625, '16', '05', '08', 'SOPLIN');
INSERT INTO `ubigeo_inei` VALUES (1626, '16', '05', '09', 'TAPICHE');
INSERT INTO `ubigeo_inei` VALUES (1627, '16', '05', '10', 'JENARO HERRERA');
INSERT INTO `ubigeo_inei` VALUES (1628, '16', '05', '11', 'YAQUERANA');
INSERT INTO `ubigeo_inei` VALUES (1629, '16', '06', '00', 'UCAYALI');
INSERT INTO `ubigeo_inei` VALUES (1630, '16', '06', '01', 'CONTAMANA');
INSERT INTO `ubigeo_inei` VALUES (1631, '16', '06', '02', 'INAHUAYA');
INSERT INTO `ubigeo_inei` VALUES (1632, '16', '06', '03', 'PADRE MARQUEZ');
INSERT INTO `ubigeo_inei` VALUES (1633, '16', '06', '04', 'PAMPA HERMOSA');
INSERT INTO `ubigeo_inei` VALUES (1634, '16', '06', '05', 'SARAYACU');
INSERT INTO `ubigeo_inei` VALUES (1635, '16', '06', '06', 'VARGAS GUERRA');
INSERT INTO `ubigeo_inei` VALUES (1636, '16', '07', '00', 'DATEM DEL MARAÑÓN');
INSERT INTO `ubigeo_inei` VALUES (1637, '16', '07', '01', 'BARRANCA');
INSERT INTO `ubigeo_inei` VALUES (1638, '16', '07', '02', 'CAHUAPANAS');
INSERT INTO `ubigeo_inei` VALUES (1639, '16', '07', '03', 'MANSERICHE');
INSERT INTO `ubigeo_inei` VALUES (1640, '16', '07', '04', 'MORONA');
INSERT INTO `ubigeo_inei` VALUES (1641, '16', '07', '05', 'PASTAZA');
INSERT INTO `ubigeo_inei` VALUES (1642, '16', '07', '06', 'ANDOAS');
INSERT INTO `ubigeo_inei` VALUES (1643, '16', '08', '00', 'PUTUMAYO');
INSERT INTO `ubigeo_inei` VALUES (1644, '16', '08', '01', 'PUTUMAYO');
INSERT INTO `ubigeo_inei` VALUES (1645, '16', '08', '02', 'ROSA PANDURO');
INSERT INTO `ubigeo_inei` VALUES (1646, '16', '08', '03', 'TENIENTE MANUEL CLAVERO');
INSERT INTO `ubigeo_inei` VALUES (1647, '16', '08', '04', 'YAGUAS');
INSERT INTO `ubigeo_inei` VALUES (1648, '17', '00', '00', 'MADRE DE DIOS');
INSERT INTO `ubigeo_inei` VALUES (1649, '17', '01', '00', 'TAMBOPATA');
INSERT INTO `ubigeo_inei` VALUES (1650, '17', '01', '01', 'TAMBOPATA');
INSERT INTO `ubigeo_inei` VALUES (1651, '17', '01', '02', 'INAMBARI');
INSERT INTO `ubigeo_inei` VALUES (1652, '17', '01', '03', 'LAS PIEDRAS');
INSERT INTO `ubigeo_inei` VALUES (1653, '17', '01', '04', 'LABERINTO');
INSERT INTO `ubigeo_inei` VALUES (1654, '17', '02', '00', 'MANU');
INSERT INTO `ubigeo_inei` VALUES (1655, '17', '02', '01', 'MANU');
INSERT INTO `ubigeo_inei` VALUES (1656, '17', '02', '02', 'FITZCARRALD');
INSERT INTO `ubigeo_inei` VALUES (1657, '17', '02', '03', 'MADRE DE DIOS');
INSERT INTO `ubigeo_inei` VALUES (1658, '17', '02', '04', 'HUEPETUHE');
INSERT INTO `ubigeo_inei` VALUES (1659, '17', '03', '00', 'TAHUAMANU');
INSERT INTO `ubigeo_inei` VALUES (1660, '17', '03', '01', 'IÑAPARI');
INSERT INTO `ubigeo_inei` VALUES (1661, '17', '03', '02', 'IBERIA');
INSERT INTO `ubigeo_inei` VALUES (1662, '17', '03', '03', 'TAHUAMANU');
INSERT INTO `ubigeo_inei` VALUES (1663, '18', '00', '00', 'MOQUEGUA');
INSERT INTO `ubigeo_inei` VALUES (1664, '18', '01', '00', 'MARISCAL NIETO');
INSERT INTO `ubigeo_inei` VALUES (1665, '18', '01', '01', 'MOQUEGUA');
INSERT INTO `ubigeo_inei` VALUES (1666, '18', '01', '02', 'CARUMAS');
INSERT INTO `ubigeo_inei` VALUES (1667, '18', '01', '03', 'CUCHUMBAYA');
INSERT INTO `ubigeo_inei` VALUES (1668, '18', '01', '04', 'SAMEGUA');
INSERT INTO `ubigeo_inei` VALUES (1669, '18', '01', '05', 'SAN CRISTOBAL');
INSERT INTO `ubigeo_inei` VALUES (1670, '18', '01', '06', 'TORATA');
INSERT INTO `ubigeo_inei` VALUES (1671, '18', '02', '00', 'GENERAL SANCHEZ CERRO');
INSERT INTO `ubigeo_inei` VALUES (1672, '18', '02', '01', 'OMATE');
INSERT INTO `ubigeo_inei` VALUES (1673, '18', '02', '02', 'CHOJATA');
INSERT INTO `ubigeo_inei` VALUES (1674, '18', '02', '03', 'COALAQUE');
INSERT INTO `ubigeo_inei` VALUES (1675, '18', '02', '04', 'ICHUÑA');
INSERT INTO `ubigeo_inei` VALUES (1676, '18', '02', '05', 'LA CAPILLA');
INSERT INTO `ubigeo_inei` VALUES (1677, '18', '02', '06', 'LLOQUE');
INSERT INTO `ubigeo_inei` VALUES (1678, '18', '02', '07', 'MATALAQUE');
INSERT INTO `ubigeo_inei` VALUES (1679, '18', '02', '08', 'PUQUINA');
INSERT INTO `ubigeo_inei` VALUES (1680, '18', '02', '09', 'QUINISTAQUILLAS');
INSERT INTO `ubigeo_inei` VALUES (1681, '18', '02', '10', 'UBINAS');
INSERT INTO `ubigeo_inei` VALUES (1682, '18', '02', '11', 'YUNGA');
INSERT INTO `ubigeo_inei` VALUES (1683, '18', '03', '00', 'ILO');
INSERT INTO `ubigeo_inei` VALUES (1684, '18', '03', '01', 'ILO');
INSERT INTO `ubigeo_inei` VALUES (1685, '18', '03', '02', 'EL ALGARROBAL');
INSERT INTO `ubigeo_inei` VALUES (1686, '18', '03', '03', 'PACOCHA');
INSERT INTO `ubigeo_inei` VALUES (1687, '19', '00', '00', 'PASCO');
INSERT INTO `ubigeo_inei` VALUES (1688, '19', '01', '00', 'PASCO');
INSERT INTO `ubigeo_inei` VALUES (1689, '19', '01', '01', 'CHAUPIMARCA');
INSERT INTO `ubigeo_inei` VALUES (1690, '19', '01', '02', 'HUACHON');
INSERT INTO `ubigeo_inei` VALUES (1691, '19', '01', '03', 'HUARIACA');
INSERT INTO `ubigeo_inei` VALUES (1692, '19', '01', '04', 'HUAYLLAY');
INSERT INTO `ubigeo_inei` VALUES (1693, '19', '01', '05', 'NINACACA');
INSERT INTO `ubigeo_inei` VALUES (1694, '19', '01', '06', 'PALLANCHACRA');
INSERT INTO `ubigeo_inei` VALUES (1695, '19', '01', '07', 'PAUCARTAMBO');
INSERT INTO `ubigeo_inei` VALUES (1696, '19', '01', '08', 'SAN FCO. DE ASÍS DE YARUSYACÁN');
INSERT INTO `ubigeo_inei` VALUES (1697, '19', '01', '09', 'SIMON BOLIVAR');
INSERT INTO `ubigeo_inei` VALUES (1698, '19', '01', '10', 'TICLACAYAN');
INSERT INTO `ubigeo_inei` VALUES (1699, '19', '01', '11', 'TINYAHUARCO');
INSERT INTO `ubigeo_inei` VALUES (1700, '19', '01', '12', 'VICCO');
INSERT INTO `ubigeo_inei` VALUES (1701, '19', '01', '13', 'YANACANCHA');
INSERT INTO `ubigeo_inei` VALUES (1702, '19', '02', '00', 'DANIEL ALCIDES CARRION');
INSERT INTO `ubigeo_inei` VALUES (1703, '19', '02', '01', 'YANAHUANCA');
INSERT INTO `ubigeo_inei` VALUES (1704, '19', '02', '02', 'CHACAYAN');
INSERT INTO `ubigeo_inei` VALUES (1705, '19', '02', '03', 'GOYLLARISQUIZGA');
INSERT INTO `ubigeo_inei` VALUES (1706, '19', '02', '04', 'PAUCAR');
INSERT INTO `ubigeo_inei` VALUES (1707, '19', '02', '05', 'SAN PEDRO DE PILLAO');
INSERT INTO `ubigeo_inei` VALUES (1708, '19', '02', '06', 'SANTA ANA DE TUSI');
INSERT INTO `ubigeo_inei` VALUES (1709, '19', '02', '07', 'TAPUC');
INSERT INTO `ubigeo_inei` VALUES (1710, '19', '02', '08', 'VILCABAMBA');
INSERT INTO `ubigeo_inei` VALUES (1711, '19', '03', '00', 'OXAPAMPA');
INSERT INTO `ubigeo_inei` VALUES (1712, '19', '03', '01', 'OXAPAMPA');
INSERT INTO `ubigeo_inei` VALUES (1713, '19', '03', '02', 'CHONTABAMBA');
INSERT INTO `ubigeo_inei` VALUES (1714, '19', '03', '03', 'HUANCABAMBA');
INSERT INTO `ubigeo_inei` VALUES (1715, '19', '03', '04', 'PALCAZU');
INSERT INTO `ubigeo_inei` VALUES (1716, '19', '03', '05', 'POZUZO');
INSERT INTO `ubigeo_inei` VALUES (1717, '19', '03', '06', 'PUERTO BERMUDEZ');
INSERT INTO `ubigeo_inei` VALUES (1718, '19', '03', '07', 'VILLA RICA');
INSERT INTO `ubigeo_inei` VALUES (1719, '19', '03', '08', 'CONSTITUCION');
INSERT INTO `ubigeo_inei` VALUES (1720, '20', '00', '00', 'PIURA');
INSERT INTO `ubigeo_inei` VALUES (1721, '20', '01', '00', 'PIURA');
INSERT INTO `ubigeo_inei` VALUES (1722, '20', '01', '01', 'PIURA');
INSERT INTO `ubigeo_inei` VALUES (1723, '20', '01', '04', 'CASTILLA');
INSERT INTO `ubigeo_inei` VALUES (1724, '20', '01', '05', 'CATACAOS');
INSERT INTO `ubigeo_inei` VALUES (1725, '20', '01', '07', 'CURA MORI');
INSERT INTO `ubigeo_inei` VALUES (1726, '20', '01', '08', 'EL TALLAN');
INSERT INTO `ubigeo_inei` VALUES (1727, '20', '01', '09', 'LA ARENA');
INSERT INTO `ubigeo_inei` VALUES (1728, '20', '01', '10', 'LA UNION');
INSERT INTO `ubigeo_inei` VALUES (1729, '20', '01', '11', 'LAS LOMAS');
INSERT INTO `ubigeo_inei` VALUES (1730, '20', '01', '14', 'TAMBO GRANDE');
INSERT INTO `ubigeo_inei` VALUES (1731, '20', '01', '15', 'VEINTISÉIS DE OCTUBRE');
INSERT INTO `ubigeo_inei` VALUES (1732, '20', '02', '00', 'AYABACA');
INSERT INTO `ubigeo_inei` VALUES (1733, '20', '02', '01', 'AYABACA');
INSERT INTO `ubigeo_inei` VALUES (1734, '20', '02', '02', 'FRIAS');
INSERT INTO `ubigeo_inei` VALUES (1735, '20', '02', '03', 'JILILI');
INSERT INTO `ubigeo_inei` VALUES (1736, '20', '02', '04', 'LAGUNAS');
INSERT INTO `ubigeo_inei` VALUES (1737, '20', '02', '05', 'MONTERO');
INSERT INTO `ubigeo_inei` VALUES (1738, '20', '02', '06', 'PACAIPAMPA');
INSERT INTO `ubigeo_inei` VALUES (1739, '20', '02', '07', 'PAIMAS');
INSERT INTO `ubigeo_inei` VALUES (1740, '20', '02', '08', 'SAPILLICA');
INSERT INTO `ubigeo_inei` VALUES (1741, '20', '02', '09', 'SICCHEZ');
INSERT INTO `ubigeo_inei` VALUES (1742, '20', '02', '10', 'SUYO');
INSERT INTO `ubigeo_inei` VALUES (1743, '20', '03', '00', 'HUANCABAMBA');
INSERT INTO `ubigeo_inei` VALUES (1744, '20', '03', '01', 'HUANCABAMBA');
INSERT INTO `ubigeo_inei` VALUES (1745, '20', '03', '02', 'CANCHAQUE');
INSERT INTO `ubigeo_inei` VALUES (1746, '20', '03', '03', 'EL CARMEN DE LA FRONTERA');
INSERT INTO `ubigeo_inei` VALUES (1747, '20', '03', '04', 'HUARMACA');
INSERT INTO `ubigeo_inei` VALUES (1748, '20', '03', '05', 'LALAQUIZ');
INSERT INTO `ubigeo_inei` VALUES (1749, '20', '03', '06', 'SAN MIGUEL DE EL FAIQUE');
INSERT INTO `ubigeo_inei` VALUES (1750, '20', '03', '07', 'SONDOR');
INSERT INTO `ubigeo_inei` VALUES (1751, '20', '03', '08', 'SONDORILLO');
INSERT INTO `ubigeo_inei` VALUES (1752, '20', '04', '00', 'MORROPON');
INSERT INTO `ubigeo_inei` VALUES (1753, '20', '04', '01', 'CHULUCANAS');
INSERT INTO `ubigeo_inei` VALUES (1754, '20', '04', '02', 'BUENOS AIRES');
INSERT INTO `ubigeo_inei` VALUES (1755, '20', '04', '03', 'CHALACO');
INSERT INTO `ubigeo_inei` VALUES (1756, '20', '04', '04', 'LA MATANZA');
INSERT INTO `ubigeo_inei` VALUES (1757, '20', '04', '05', 'MORROPON');
INSERT INTO `ubigeo_inei` VALUES (1758, '20', '04', '06', 'SALITRAL');
INSERT INTO `ubigeo_inei` VALUES (1759, '20', '04', '07', 'SAN JUAN DE BIGOTE');
INSERT INTO `ubigeo_inei` VALUES (1760, '20', '04', '08', 'SANTA CATALINA DE MOSSA');
INSERT INTO `ubigeo_inei` VALUES (1761, '20', '04', '09', 'SANTO DOMINGO');
INSERT INTO `ubigeo_inei` VALUES (1762, '20', '04', '10', 'YAMANGO');
INSERT INTO `ubigeo_inei` VALUES (1763, '20', '05', '00', 'PAITA');
INSERT INTO `ubigeo_inei` VALUES (1764, '20', '05', '01', 'PAITA');
INSERT INTO `ubigeo_inei` VALUES (1765, '20', '05', '02', 'AMOTAPE');
INSERT INTO `ubigeo_inei` VALUES (1766, '20', '05', '03', 'ARENAL');
INSERT INTO `ubigeo_inei` VALUES (1767, '20', '05', '04', 'COLAN');
INSERT INTO `ubigeo_inei` VALUES (1768, '20', '05', '05', 'LA HUACA');
INSERT INTO `ubigeo_inei` VALUES (1769, '20', '05', '06', 'TAMARINDO');
INSERT INTO `ubigeo_inei` VALUES (1770, '20', '05', '07', 'VICHAYAL');
INSERT INTO `ubigeo_inei` VALUES (1771, '20', '06', '00', 'SULLANA');
INSERT INTO `ubigeo_inei` VALUES (1772, '20', '06', '01', 'SULLANA');
INSERT INTO `ubigeo_inei` VALUES (1773, '20', '06', '02', 'BELLAVISTA');
INSERT INTO `ubigeo_inei` VALUES (1774, '20', '06', '03', 'IGNACIO ESCUDERO');
INSERT INTO `ubigeo_inei` VALUES (1775, '20', '06', '04', 'LANCONES');
INSERT INTO `ubigeo_inei` VALUES (1776, '20', '06', '05', 'MARCAVELICA');
INSERT INTO `ubigeo_inei` VALUES (1777, '20', '06', '06', 'MIGUEL CHECA');
INSERT INTO `ubigeo_inei` VALUES (1778, '20', '06', '07', 'QUERECOTILLO');
INSERT INTO `ubigeo_inei` VALUES (1779, '20', '06', '08', 'SALITRAL');
INSERT INTO `ubigeo_inei` VALUES (1780, '20', '07', '00', 'TALARA');
INSERT INTO `ubigeo_inei` VALUES (1781, '20', '07', '01', 'PARIÑAS');
INSERT INTO `ubigeo_inei` VALUES (1782, '20', '07', '02', 'EL ALTO');
INSERT INTO `ubigeo_inei` VALUES (1783, '20', '07', '03', 'LA BREA');
INSERT INTO `ubigeo_inei` VALUES (1784, '20', '07', '04', 'LOBITOS');
INSERT INTO `ubigeo_inei` VALUES (1785, '20', '07', '05', 'LOS ORGANOS');
INSERT INTO `ubigeo_inei` VALUES (1786, '20', '07', '06', 'MANCORA');
INSERT INTO `ubigeo_inei` VALUES (1787, '20', '08', '00', 'SECHURA');
INSERT INTO `ubigeo_inei` VALUES (1788, '20', '08', '01', 'SECHURA');
INSERT INTO `ubigeo_inei` VALUES (1789, '20', '08', '02', 'BELLAVISTA DE LA UNION');
INSERT INTO `ubigeo_inei` VALUES (1790, '20', '08', '03', 'BERNAL');
INSERT INTO `ubigeo_inei` VALUES (1791, '20', '08', '04', 'CRISTO NOS VALGA');
INSERT INTO `ubigeo_inei` VALUES (1792, '20', '08', '05', 'VICE');
INSERT INTO `ubigeo_inei` VALUES (1793, '20', '08', '06', 'RINCONADA LLICUAR');
INSERT INTO `ubigeo_inei` VALUES (1794, '21', '00', '00', 'PUNO');
INSERT INTO `ubigeo_inei` VALUES (1795, '21', '01', '00', 'PUNO');
INSERT INTO `ubigeo_inei` VALUES (1796, '21', '01', '01', 'PUNO');
INSERT INTO `ubigeo_inei` VALUES (1797, '21', '01', '02', 'ACORA');
INSERT INTO `ubigeo_inei` VALUES (1798, '21', '01', '03', 'AMANTANI');
INSERT INTO `ubigeo_inei` VALUES (1799, '21', '01', '04', 'ATUNCOLLA');
INSERT INTO `ubigeo_inei` VALUES (1800, '21', '01', '05', 'CAPACHICA');
INSERT INTO `ubigeo_inei` VALUES (1801, '21', '01', '06', 'CHUCUITO');
INSERT INTO `ubigeo_inei` VALUES (1802, '21', '01', '07', 'COATA');
INSERT INTO `ubigeo_inei` VALUES (1803, '21', '01', '08', 'HUATA');
INSERT INTO `ubigeo_inei` VALUES (1804, '21', '01', '09', 'MAÑAZO');
INSERT INTO `ubigeo_inei` VALUES (1805, '21', '01', '10', 'PAUCARCOLLA');
INSERT INTO `ubigeo_inei` VALUES (1806, '21', '01', '11', 'PICHACANI');
INSERT INTO `ubigeo_inei` VALUES (1807, '21', '01', '12', 'PLATERIA');
INSERT INTO `ubigeo_inei` VALUES (1808, '21', '01', '13', 'SAN ANTONIO');
INSERT INTO `ubigeo_inei` VALUES (1809, '21', '01', '14', 'TIQUILLACA');
INSERT INTO `ubigeo_inei` VALUES (1810, '21', '01', '15', 'VILQUE');
INSERT INTO `ubigeo_inei` VALUES (1811, '21', '02', '00', 'AZANGARO');
INSERT INTO `ubigeo_inei` VALUES (1812, '21', '02', '01', 'AZANGARO');
INSERT INTO `ubigeo_inei` VALUES (1813, '21', '02', '02', 'ACHAYA');
INSERT INTO `ubigeo_inei` VALUES (1814, '21', '02', '03', 'ARAPA');
INSERT INTO `ubigeo_inei` VALUES (1815, '21', '02', '04', 'ASILLO');
INSERT INTO `ubigeo_inei` VALUES (1816, '21', '02', '05', 'CAMINACA');
INSERT INTO `ubigeo_inei` VALUES (1817, '21', '02', '06', 'CHUPA');
INSERT INTO `ubigeo_inei` VALUES (1818, '21', '02', '07', 'JOSE DOMINGO CHOQUEHUANCA');
INSERT INTO `ubigeo_inei` VALUES (1819, '21', '02', '08', 'MUÑANI');
INSERT INTO `ubigeo_inei` VALUES (1820, '21', '02', '09', 'POTONI');
INSERT INTO `ubigeo_inei` VALUES (1821, '21', '02', '10', 'SAMAN');
INSERT INTO `ubigeo_inei` VALUES (1822, '21', '02', '11', 'SAN ANTON');
INSERT INTO `ubigeo_inei` VALUES (1823, '21', '02', '12', 'SAN JOSE');
INSERT INTO `ubigeo_inei` VALUES (1824, '21', '02', '13', 'SAN JUAN DE SALINAS');
INSERT INTO `ubigeo_inei` VALUES (1825, '21', '02', '14', 'SANTIAGO DE PUPUJA');
INSERT INTO `ubigeo_inei` VALUES (1826, '21', '02', '15', 'TIRAPATA');
INSERT INTO `ubigeo_inei` VALUES (1827, '21', '03', '00', 'CARABAYA');
INSERT INTO `ubigeo_inei` VALUES (1828, '21', '03', '01', 'MACUSANI');
INSERT INTO `ubigeo_inei` VALUES (1829, '21', '03', '02', 'AJOYANI');
INSERT INTO `ubigeo_inei` VALUES (1830, '21', '03', '03', 'AYAPATA');
INSERT INTO `ubigeo_inei` VALUES (1831, '21', '03', '04', 'COASA');
INSERT INTO `ubigeo_inei` VALUES (1832, '21', '03', '05', 'CORANI');
INSERT INTO `ubigeo_inei` VALUES (1833, '21', '03', '06', 'CRUCERO');
INSERT INTO `ubigeo_inei` VALUES (1834, '21', '03', '07', 'ITUATA');
INSERT INTO `ubigeo_inei` VALUES (1835, '21', '03', '08', 'OLLACHEA');
INSERT INTO `ubigeo_inei` VALUES (1836, '21', '03', '09', 'SAN GABAN');
INSERT INTO `ubigeo_inei` VALUES (1837, '21', '03', '10', 'USICAYOS');
INSERT INTO `ubigeo_inei` VALUES (1838, '21', '04', '00', 'CHUCUITO');
INSERT INTO `ubigeo_inei` VALUES (1839, '21', '04', '01', 'JULI');
INSERT INTO `ubigeo_inei` VALUES (1840, '21', '04', '02', 'DESAGUADERO');
INSERT INTO `ubigeo_inei` VALUES (1841, '21', '04', '03', 'HUACULLANI');
INSERT INTO `ubigeo_inei` VALUES (1842, '21', '04', '04', 'KELLUYO');
INSERT INTO `ubigeo_inei` VALUES (1843, '21', '04', '05', 'PISACOMA');
INSERT INTO `ubigeo_inei` VALUES (1844, '21', '04', '06', 'POMATA');
INSERT INTO `ubigeo_inei` VALUES (1845, '21', '04', '07', 'ZEPITA');
INSERT INTO `ubigeo_inei` VALUES (1846, '21', '05', '00', 'EL COLLAO');
INSERT INTO `ubigeo_inei` VALUES (1847, '21', '05', '01', 'ILAVE');
INSERT INTO `ubigeo_inei` VALUES (1848, '21', '05', '02', 'CAPASO');
INSERT INTO `ubigeo_inei` VALUES (1849, '21', '05', '03', 'PILCUYO');
INSERT INTO `ubigeo_inei` VALUES (1850, '21', '05', '04', 'SANTA ROSA');
INSERT INTO `ubigeo_inei` VALUES (1851, '21', '05', '05', 'CONDURIRI');
INSERT INTO `ubigeo_inei` VALUES (1852, '21', '06', '00', 'HUANCANE');
INSERT INTO `ubigeo_inei` VALUES (1853, '21', '06', '01', 'HUANCANE');
INSERT INTO `ubigeo_inei` VALUES (1854, '21', '06', '02', 'COJATA');
INSERT INTO `ubigeo_inei` VALUES (1855, '21', '06', '03', 'HUATASANI');
INSERT INTO `ubigeo_inei` VALUES (1856, '21', '06', '04', 'INCHUPALLA');
INSERT INTO `ubigeo_inei` VALUES (1857, '21', '06', '05', 'PUSI');
INSERT INTO `ubigeo_inei` VALUES (1858, '21', '06', '06', 'ROSASPATA');
INSERT INTO `ubigeo_inei` VALUES (1859, '21', '06', '07', 'TARACO');
INSERT INTO `ubigeo_inei` VALUES (1860, '21', '06', '08', 'VILQUE CHICO');
INSERT INTO `ubigeo_inei` VALUES (1861, '21', '07', '00', 'LAMPA');
INSERT INTO `ubigeo_inei` VALUES (1862, '21', '07', '01', 'LAMPA');
INSERT INTO `ubigeo_inei` VALUES (1863, '21', '07', '02', 'CABANILLA');
INSERT INTO `ubigeo_inei` VALUES (1864, '21', '07', '03', 'CALAPUJA');
INSERT INTO `ubigeo_inei` VALUES (1865, '21', '07', '04', 'NICASIO');
INSERT INTO `ubigeo_inei` VALUES (1866, '21', '07', '05', 'OCUVIRI');
INSERT INTO `ubigeo_inei` VALUES (1867, '21', '07', '06', 'PALCA');
INSERT INTO `ubigeo_inei` VALUES (1868, '21', '07', '07', 'PARATIA');
INSERT INTO `ubigeo_inei` VALUES (1869, '21', '07', '08', 'PUCARA');
INSERT INTO `ubigeo_inei` VALUES (1870, '21', '07', '09', 'SANTA LUCIA');
INSERT INTO `ubigeo_inei` VALUES (1871, '21', '07', '10', 'VILAVILA');
INSERT INTO `ubigeo_inei` VALUES (1872, '21', '08', '00', 'MELGAR');
INSERT INTO `ubigeo_inei` VALUES (1873, '21', '08', '01', 'AYAVIRI');
INSERT INTO `ubigeo_inei` VALUES (1874, '21', '08', '02', 'ANTAUTA');
INSERT INTO `ubigeo_inei` VALUES (1875, '21', '08', '03', 'CUPI');
INSERT INTO `ubigeo_inei` VALUES (1876, '21', '08', '04', 'LLALLI');
INSERT INTO `ubigeo_inei` VALUES (1877, '21', '08', '05', 'MACARI');
INSERT INTO `ubigeo_inei` VALUES (1878, '21', '08', '06', 'NUÑOA');
INSERT INTO `ubigeo_inei` VALUES (1879, '21', '08', '07', 'ORURILLO');
INSERT INTO `ubigeo_inei` VALUES (1880, '21', '08', '08', 'SANTA ROSA');
INSERT INTO `ubigeo_inei` VALUES (1881, '21', '08', '09', 'UMACHIRI');
INSERT INTO `ubigeo_inei` VALUES (1882, '21', '09', '00', 'MOHO');
INSERT INTO `ubigeo_inei` VALUES (1883, '21', '09', '01', 'MOHO');
INSERT INTO `ubigeo_inei` VALUES (1884, '21', '09', '02', 'CONIMA');
INSERT INTO `ubigeo_inei` VALUES (1885, '21', '09', '03', 'HUAYRAPATA');
INSERT INTO `ubigeo_inei` VALUES (1886, '21', '09', '04', 'TILALI');
INSERT INTO `ubigeo_inei` VALUES (1887, '21', '10', '00', 'SAN ANTONIO DE PUTINA');
INSERT INTO `ubigeo_inei` VALUES (1888, '21', '10', '01', 'PUTINA');
INSERT INTO `ubigeo_inei` VALUES (1889, '21', '10', '02', 'ANANEA');
INSERT INTO `ubigeo_inei` VALUES (1890, '21', '10', '03', 'PEDRO VILCA APAZA');
INSERT INTO `ubigeo_inei` VALUES (1891, '21', '10', '04', 'QUILCAPUNCU');
INSERT INTO `ubigeo_inei` VALUES (1892, '21', '10', '05', 'SINA');
INSERT INTO `ubigeo_inei` VALUES (1893, '21', '11', '00', 'SAN ROMAN');
INSERT INTO `ubigeo_inei` VALUES (1894, '21', '11', '01', 'JULIACA');
INSERT INTO `ubigeo_inei` VALUES (1895, '21', '11', '02', 'CABANA');
INSERT INTO `ubigeo_inei` VALUES (1896, '21', '11', '03', 'CABANILLAS');
INSERT INTO `ubigeo_inei` VALUES (1897, '21', '11', '04', 'CARACOTO');
INSERT INTO `ubigeo_inei` VALUES (1898, '21', '12', '00', 'SANDIA');
INSERT INTO `ubigeo_inei` VALUES (1899, '21', '12', '01', 'SANDIA');
INSERT INTO `ubigeo_inei` VALUES (1900, '21', '12', '02', 'CUYOCUYO');
INSERT INTO `ubigeo_inei` VALUES (1901, '21', '12', '03', 'LIMBANI');
INSERT INTO `ubigeo_inei` VALUES (1902, '21', '12', '04', 'PATAMBUCO');
INSERT INTO `ubigeo_inei` VALUES (1903, '21', '12', '05', 'PHARA');
INSERT INTO `ubigeo_inei` VALUES (1904, '21', '12', '06', 'QUIACA');
INSERT INTO `ubigeo_inei` VALUES (1905, '21', '12', '07', 'SAN JUAN DEL ORO');
INSERT INTO `ubigeo_inei` VALUES (1906, '21', '12', '08', 'YANAHUAYA');
INSERT INTO `ubigeo_inei` VALUES (1907, '21', '12', '09', 'ALTO INAMBARI');
INSERT INTO `ubigeo_inei` VALUES (1908, '21', '12', '10', 'SAN PEDRO DE PUTINA PUNCO');
INSERT INTO `ubigeo_inei` VALUES (1909, '21', '13', '00', 'YUNGUYO');
INSERT INTO `ubigeo_inei` VALUES (1910, '21', '13', '01', 'YUNGUYO');
INSERT INTO `ubigeo_inei` VALUES (1911, '21', '13', '02', 'ANAPIA');
INSERT INTO `ubigeo_inei` VALUES (1912, '21', '13', '03', 'COPANI');
INSERT INTO `ubigeo_inei` VALUES (1913, '21', '13', '04', 'CUTURAPI');
INSERT INTO `ubigeo_inei` VALUES (1914, '21', '13', '05', 'OLLARAYA');
INSERT INTO `ubigeo_inei` VALUES (1915, '21', '13', '06', 'TINICACHI');
INSERT INTO `ubigeo_inei` VALUES (1916, '21', '13', '07', 'UNICACHI');
INSERT INTO `ubigeo_inei` VALUES (1917, '22', '00', '00', 'SAN MARTIN');
INSERT INTO `ubigeo_inei` VALUES (1918, '22', '01', '00', 'MOYOBAMBA');
INSERT INTO `ubigeo_inei` VALUES (1919, '22', '01', '01', 'MOYOBAMBA');
INSERT INTO `ubigeo_inei` VALUES (1920, '22', '01', '02', 'CALZADA');
INSERT INTO `ubigeo_inei` VALUES (1921, '22', '01', '03', 'HABANA');
INSERT INTO `ubigeo_inei` VALUES (1922, '22', '01', '04', 'JEPELACIO');
INSERT INTO `ubigeo_inei` VALUES (1923, '22', '01', '05', 'SORITOR');
INSERT INTO `ubigeo_inei` VALUES (1924, '22', '01', '06', 'YANTALO');
INSERT INTO `ubigeo_inei` VALUES (1925, '22', '02', '00', 'BELLAVISTA');
INSERT INTO `ubigeo_inei` VALUES (1926, '22', '02', '01', 'BELLAVISTA');
INSERT INTO `ubigeo_inei` VALUES (1927, '22', '02', '02', 'ALTO BIAVO');
INSERT INTO `ubigeo_inei` VALUES (1928, '22', '02', '03', 'BAJO BIAVO');
INSERT INTO `ubigeo_inei` VALUES (1929, '22', '02', '04', 'HUALLAGA');
INSERT INTO `ubigeo_inei` VALUES (1930, '22', '02', '05', 'SAN PABLO');
INSERT INTO `ubigeo_inei` VALUES (1931, '22', '02', '06', 'SAN RAFAEL');
INSERT INTO `ubigeo_inei` VALUES (1932, '22', '03', '00', 'EL DORADO');
INSERT INTO `ubigeo_inei` VALUES (1933, '22', '03', '01', 'SAN JOSE DE SISA');
INSERT INTO `ubigeo_inei` VALUES (1934, '22', '03', '02', 'AGUA BLANCA');
INSERT INTO `ubigeo_inei` VALUES (1935, '22', '03', '03', 'SAN MARTIN');
INSERT INTO `ubigeo_inei` VALUES (1936, '22', '03', '04', 'SANTA ROSA');
INSERT INTO `ubigeo_inei` VALUES (1937, '22', '03', '05', 'SHATOJA');
INSERT INTO `ubigeo_inei` VALUES (1938, '22', '04', '00', 'HUALLAGA');
INSERT INTO `ubigeo_inei` VALUES (1939, '22', '04', '01', 'SAPOSOA');
INSERT INTO `ubigeo_inei` VALUES (1940, '22', '04', '02', 'ALTO SAPOSOA');
INSERT INTO `ubigeo_inei` VALUES (1941, '22', '04', '03', 'EL ESLABON');
INSERT INTO `ubigeo_inei` VALUES (1942, '22', '04', '04', 'PISCOYACU');
INSERT INTO `ubigeo_inei` VALUES (1943, '22', '04', '05', 'SACANCHE');
INSERT INTO `ubigeo_inei` VALUES (1944, '22', '04', '06', 'TINGO DE SAPOSOA');
INSERT INTO `ubigeo_inei` VALUES (1945, '22', '05', '00', 'LAMAS');
INSERT INTO `ubigeo_inei` VALUES (1946, '22', '05', '01', 'LAMAS');
INSERT INTO `ubigeo_inei` VALUES (1947, '22', '05', '02', 'ALONSO DE ALVARADO');
INSERT INTO `ubigeo_inei` VALUES (1948, '22', '05', '03', 'BARRANQUITA');
INSERT INTO `ubigeo_inei` VALUES (1949, '22', '05', '04', 'CAYNARACHI');
INSERT INTO `ubigeo_inei` VALUES (1950, '22', '05', '05', 'CUÑUMBUQUI');
INSERT INTO `ubigeo_inei` VALUES (1951, '22', '05', '06', 'PINTO RECODO');
INSERT INTO `ubigeo_inei` VALUES (1952, '22', '05', '07', 'RUMISAPA');
INSERT INTO `ubigeo_inei` VALUES (1953, '22', '05', '08', 'SAN ROQUE DE CUMBAZA');
INSERT INTO `ubigeo_inei` VALUES (1954, '22', '05', '09', 'SHANAO');
INSERT INTO `ubigeo_inei` VALUES (1955, '22', '05', '10', 'TABALOSOS');
INSERT INTO `ubigeo_inei` VALUES (1956, '22', '05', '11', 'ZAPATERO');
INSERT INTO `ubigeo_inei` VALUES (1957, '22', '06', '00', 'MARISCAL CACERES');
INSERT INTO `ubigeo_inei` VALUES (1958, '22', '06', '01', 'JUANJUI');
INSERT INTO `ubigeo_inei` VALUES (1959, '22', '06', '02', 'CAMPANILLA');
INSERT INTO `ubigeo_inei` VALUES (1960, '22', '06', '03', 'HUICUNGO');
INSERT INTO `ubigeo_inei` VALUES (1961, '22', '06', '04', 'PACHIZA');
INSERT INTO `ubigeo_inei` VALUES (1962, '22', '06', '05', 'PAJARILLO');
INSERT INTO `ubigeo_inei` VALUES (1963, '22', '07', '00', 'PICOTA');
INSERT INTO `ubigeo_inei` VALUES (1964, '22', '07', '01', 'PICOTA');
INSERT INTO `ubigeo_inei` VALUES (1965, '22', '07', '02', 'BUENOS AIRES');
INSERT INTO `ubigeo_inei` VALUES (1966, '22', '07', '03', 'CASPISAPA');
INSERT INTO `ubigeo_inei` VALUES (1967, '22', '07', '04', 'PILLUANA');
INSERT INTO `ubigeo_inei` VALUES (1968, '22', '07', '05', 'PUCACACA');
INSERT INTO `ubigeo_inei` VALUES (1969, '22', '07', '06', 'SAN CRISTOBAL');
INSERT INTO `ubigeo_inei` VALUES (1970, '22', '07', '07', 'SAN HILARION');
INSERT INTO `ubigeo_inei` VALUES (1971, '22', '07', '08', 'SHAMBOYACU');
INSERT INTO `ubigeo_inei` VALUES (1972, '22', '07', '09', 'TINGO DE PONASA');
INSERT INTO `ubigeo_inei` VALUES (1973, '22', '07', '10', 'TRES UNIDOS');
INSERT INTO `ubigeo_inei` VALUES (1974, '22', '08', '00', 'RIOJA');
INSERT INTO `ubigeo_inei` VALUES (1975, '22', '08', '01', 'RIOJA');
INSERT INTO `ubigeo_inei` VALUES (1976, '22', '08', '02', 'AWAJUN');
INSERT INTO `ubigeo_inei` VALUES (1977, '22', '08', '03', 'ELIAS SOPLIN VARGAS');
INSERT INTO `ubigeo_inei` VALUES (1978, '22', '08', '04', 'NUEVA CAJAMARCA');
INSERT INTO `ubigeo_inei` VALUES (1979, '22', '08', '05', 'PARDO MIGUEL');
INSERT INTO `ubigeo_inei` VALUES (1980, '22', '08', '06', 'POSIC');
INSERT INTO `ubigeo_inei` VALUES (1981, '22', '08', '07', 'SAN FERNANDO');
INSERT INTO `ubigeo_inei` VALUES (1982, '22', '08', '08', 'YORONGOS');
INSERT INTO `ubigeo_inei` VALUES (1983, '22', '08', '09', 'YURACYACU');
INSERT INTO `ubigeo_inei` VALUES (1984, '22', '09', '00', 'SAN MARTIN');
INSERT INTO `ubigeo_inei` VALUES (1985, '22', '09', '01', 'TARAPOTO');
INSERT INTO `ubigeo_inei` VALUES (1986, '22', '09', '02', 'ALBERTO LEVEAU');
INSERT INTO `ubigeo_inei` VALUES (1987, '22', '09', '03', 'CACATACHI');
INSERT INTO `ubigeo_inei` VALUES (1988, '22', '09', '04', 'CHAZUTA');
INSERT INTO `ubigeo_inei` VALUES (1989, '22', '09', '05', 'CHIPURANA');
INSERT INTO `ubigeo_inei` VALUES (1990, '22', '09', '06', 'EL PORVENIR');
INSERT INTO `ubigeo_inei` VALUES (1991, '22', '09', '07', 'HUIMBAYOC');
INSERT INTO `ubigeo_inei` VALUES (1992, '22', '09', '08', 'JUAN GUERRA');
INSERT INTO `ubigeo_inei` VALUES (1993, '22', '09', '09', 'LA BANDA DE SHILCAYO');
INSERT INTO `ubigeo_inei` VALUES (1994, '22', '09', '10', 'MORALES');
INSERT INTO `ubigeo_inei` VALUES (1995, '22', '09', '11', 'PAPAPLAYA');
INSERT INTO `ubigeo_inei` VALUES (1996, '22', '09', '12', 'SAN ANTONIO');
INSERT INTO `ubigeo_inei` VALUES (1997, '22', '09', '13', 'SAUCE');
INSERT INTO `ubigeo_inei` VALUES (1998, '22', '09', '14', 'SHAPAJA');
INSERT INTO `ubigeo_inei` VALUES (1999, '22', '10', '00', 'TOCACHE');
INSERT INTO `ubigeo_inei` VALUES (2000, '22', '10', '01', 'TOCACHE');
INSERT INTO `ubigeo_inei` VALUES (2001, '22', '10', '02', 'NUEVO PROGRESO');
INSERT INTO `ubigeo_inei` VALUES (2002, '22', '10', '03', 'POLVORA');
INSERT INTO `ubigeo_inei` VALUES (2003, '22', '10', '04', 'SHUNTE');
INSERT INTO `ubigeo_inei` VALUES (2004, '22', '10', '05', 'UCHIZA');
INSERT INTO `ubigeo_inei` VALUES (2005, '23', '00', '00', 'TACNA');
INSERT INTO `ubigeo_inei` VALUES (2006, '23', '01', '00', 'TACNA');
INSERT INTO `ubigeo_inei` VALUES (2007, '23', '01', '01', 'TACNA');
INSERT INTO `ubigeo_inei` VALUES (2008, '23', '01', '02', 'ALTO DE LA ALIANZA');
INSERT INTO `ubigeo_inei` VALUES (2009, '23', '01', '03', 'CALANA');
INSERT INTO `ubigeo_inei` VALUES (2010, '23', '01', '04', 'CIUDAD NUEVA');
INSERT INTO `ubigeo_inei` VALUES (2011, '23', '01', '05', 'INCLAN');
INSERT INTO `ubigeo_inei` VALUES (2012, '23', '01', '06', 'PACHIA');
INSERT INTO `ubigeo_inei` VALUES (2013, '23', '01', '07', 'PALCA');
INSERT INTO `ubigeo_inei` VALUES (2014, '23', '01', '08', 'POCOLLAY');
INSERT INTO `ubigeo_inei` VALUES (2015, '23', '01', '09', 'SAMA');
INSERT INTO `ubigeo_inei` VALUES (2016, '23', '01', '10', 'CORONEL GREGORIO ALBARRACÍN L');
INSERT INTO `ubigeo_inei` VALUES (2017, '23', '02', '00', 'CANDARAVE');
INSERT INTO `ubigeo_inei` VALUES (2018, '23', '02', '01', 'CANDARAVE');
INSERT INTO `ubigeo_inei` VALUES (2019, '23', '02', '02', 'CAIRANI');
INSERT INTO `ubigeo_inei` VALUES (2020, '23', '02', '03', 'CAMILACA');
INSERT INTO `ubigeo_inei` VALUES (2021, '23', '02', '04', 'CURIBAYA');
INSERT INTO `ubigeo_inei` VALUES (2022, '23', '02', '05', 'HUANUARA');
INSERT INTO `ubigeo_inei` VALUES (2023, '23', '02', '06', 'QUILAHUANI');
INSERT INTO `ubigeo_inei` VALUES (2024, '23', '03', '00', 'JORGE BASADRE');
INSERT INTO `ubigeo_inei` VALUES (2025, '23', '03', '01', 'LOCUMBA');
INSERT INTO `ubigeo_inei` VALUES (2026, '23', '03', '02', 'ILABAYA');
INSERT INTO `ubigeo_inei` VALUES (2027, '23', '03', '03', 'ITE');
INSERT INTO `ubigeo_inei` VALUES (2028, '23', '04', '00', 'TARATA');
INSERT INTO `ubigeo_inei` VALUES (2029, '23', '04', '01', 'TARATA');
INSERT INTO `ubigeo_inei` VALUES (2030, '23', '04', '02', 'CHUCATAMANI');
INSERT INTO `ubigeo_inei` VALUES (2031, '23', '04', '03', 'ESTIQUE');
INSERT INTO `ubigeo_inei` VALUES (2032, '23', '04', '04', 'ESTIQUE-PAMPA');
INSERT INTO `ubigeo_inei` VALUES (2033, '23', '04', '05', 'SITAJARA');
INSERT INTO `ubigeo_inei` VALUES (2034, '23', '04', '06', 'SUSAPAYA');
INSERT INTO `ubigeo_inei` VALUES (2035, '23', '04', '07', 'TARUCACHI');
INSERT INTO `ubigeo_inei` VALUES (2036, '23', '04', '08', 'TICACO');
INSERT INTO `ubigeo_inei` VALUES (2037, '24', '00', '00', 'TUMBES');
INSERT INTO `ubigeo_inei` VALUES (2038, '24', '01', '00', 'TUMBES');
INSERT INTO `ubigeo_inei` VALUES (2039, '24', '01', '01', 'TUMBES');
INSERT INTO `ubigeo_inei` VALUES (2040, '24', '01', '02', 'CORRALES');
INSERT INTO `ubigeo_inei` VALUES (2041, '24', '01', '03', 'LA CRUZ');
INSERT INTO `ubigeo_inei` VALUES (2042, '24', '01', '04', 'PAMPAS DE HOSPITAL');
INSERT INTO `ubigeo_inei` VALUES (2043, '24', '01', '05', 'SAN JACINTO');
INSERT INTO `ubigeo_inei` VALUES (2044, '24', '01', '06', 'SAN JUAN DE LA VIRGEN');
INSERT INTO `ubigeo_inei` VALUES (2045, '24', '02', '00', 'CONTRALMIRANTE VILLAR');
INSERT INTO `ubigeo_inei` VALUES (2046, '24', '02', '01', 'ZORRITOS');
INSERT INTO `ubigeo_inei` VALUES (2047, '24', '02', '02', 'CASITAS');
INSERT INTO `ubigeo_inei` VALUES (2048, '24', '02', '03', 'CANOAS DE PUNTA SAL');
INSERT INTO `ubigeo_inei` VALUES (2049, '24', '03', '00', 'ZARUMILLA');
INSERT INTO `ubigeo_inei` VALUES (2050, '24', '03', '01', 'ZARUMILLA');
INSERT INTO `ubigeo_inei` VALUES (2051, '24', '03', '02', 'AGUAS VERDES');
INSERT INTO `ubigeo_inei` VALUES (2052, '24', '03', '03', 'MATAPALO');
INSERT INTO `ubigeo_inei` VALUES (2053, '24', '03', '04', 'PAPAYAL');
INSERT INTO `ubigeo_inei` VALUES (2054, '25', '00', '00', 'UCAYALI');
INSERT INTO `ubigeo_inei` VALUES (2055, '25', '01', '00', 'CORONEL PORTILLO');
INSERT INTO `ubigeo_inei` VALUES (2056, '25', '01', '01', 'CALLARIA');
INSERT INTO `ubigeo_inei` VALUES (2057, '25', '01', '02', 'CAMPOVERDE');
INSERT INTO `ubigeo_inei` VALUES (2058, '25', '01', '03', 'IPARIA');
INSERT INTO `ubigeo_inei` VALUES (2059, '25', '01', '04', 'MASISEA');
INSERT INTO `ubigeo_inei` VALUES (2060, '25', '01', '05', 'YARINACOCHA');
INSERT INTO `ubigeo_inei` VALUES (2061, '25', '01', '06', 'NUEVA REQUENA');
INSERT INTO `ubigeo_inei` VALUES (2062, '25', '01', '07', 'MANANTAY');
INSERT INTO `ubigeo_inei` VALUES (2063, '25', '02', '00', 'ATALAYA');
INSERT INTO `ubigeo_inei` VALUES (2064, '25', '02', '01', 'RAYMONDI');
INSERT INTO `ubigeo_inei` VALUES (2065, '25', '02', '02', 'SEPAHUA');
INSERT INTO `ubigeo_inei` VALUES (2066, '25', '02', '03', 'TAHUANIA');
INSERT INTO `ubigeo_inei` VALUES (2067, '25', '02', '04', 'YURUA');
INSERT INTO `ubigeo_inei` VALUES (2068, '25', '03', '00', 'PADRE ABAD');
INSERT INTO `ubigeo_inei` VALUES (2069, '25', '03', '01', 'PADRE ABAD');
INSERT INTO `ubigeo_inei` VALUES (2070, '25', '03', '02', 'IRAZOLA');
INSERT INTO `ubigeo_inei` VALUES (2071, '25', '03', '03', 'CURIMANA');
INSERT INTO `ubigeo_inei` VALUES (2072, '25', '04', '00', 'PURUS');
INSERT INTO `ubigeo_inei` VALUES (2073, '25', '04', '01', 'PURUS');
INSERT INTO `ubigeo_inei` VALUES (2074, '99', '00', '00', 'EXTRANJERO');
INSERT INTO `ubigeo_inei` VALUES (2075, '99', '99', '00', 'EXTRANJERO');
INSERT INTO `ubigeo_inei` VALUES (2076, '99', '99', '99', 'EXTRANJERO');

-- ----------------------------
-- Table structure for usuarios
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios`  (
  `usuario_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` int(11) NULL DEFAULT NULL,
  `id_rol` int(11) NULL DEFAULT NULL,
  `num_doc` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `usuario` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `clave` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nombres` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `apellidos` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `rubro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sucursal` int(11) NULL DEFAULT NULL,
  `telefono` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `token_reset` varchar(130) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `estado` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `mensaje` varchar(220) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`usuario_id`) USING BTREE,
  INDEX `id_empresa`(`id_empresa`) USING BTREE,
  INDEX `id_rol`(`id_rol`) USING BTREE,
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`rol_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of usuarios
-- ----------------------------
INSERT INTO `usuarios` VALUES (13, 13, 2, '41854541', 'demo', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'glomasa1985@hotmail.com', 'HUACHACA QUISPE SABINA', NULL, 'transporte', 1, '', NULL, '1', '');
INSERT INTO `usuarios` VALUES (14, 18, 2, '41854541', 'MAXSAJSR', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'transmullutita@hotmail.com', 'HUACHACA QUISPE SABINA', NULL, 'transportes', 1, '', NULL, '2', '');
INSERT INTO `usuarios` VALUES (38, 34, 2, '72179800', 'samuelsamuel', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'mlml@mlml.coim', 'VILLARREAL TITO ALEX MISAEL', '', '4', 5, '1234', NULL, '1', NULL);
INSERT INTO `usuarios` VALUES (40, 12, 2, '11111111', 'admin', '99f730b06608d8ed9fa873c529301159118d9e9b', 'ventas@kanakoprintcopy.com', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL);

-- ----------------------------
-- Table structure for venta_anexo
-- ----------------------------
DROP TABLE IF EXISTS `venta_anexo`;
CREATE TABLE `venta_anexo`  (
  `idventa` int(11) NOT NULL AUTO_INCREMENT,
  `texto` varchar(245) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`idventa`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2245 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of venta_anexo
-- ----------------------------

-- ----------------------------
-- Table structure for ventas
-- ----------------------------
DROP TABLE IF EXISTS `ventas`;
CREATE TABLE `ventas`  (
  `id_venta` int(11) NOT NULL AUTO_INCREMENT,
  `id_tido` int(11) NOT NULL,
  `id_tipo_pago` int(11) NULL DEFAULT NULL,
  `fecha_emision` date NULL DEFAULT NULL,
  `fecha_vencimiento` date NULL DEFAULT NULL,
  `dias_pagos` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `direccion` varchar(220) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `serie` varchar(4) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `numero` int(5) NULL DEFAULT NULL,
  `id_cliente` int(11) NOT NULL,
  `total` double(10, 2) NULL DEFAULT NULL,
  `estado` char(1) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `enviado_sunat` char(1) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  `sucursal` int(11) NULL DEFAULT NULL,
  `apli_igv` char(1) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT '1',
  `observacion` varchar(220) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `igv` double(10, 2) NULL DEFAULT 0.18,
  `medoto_pago_id` int(11) NULL DEFAULT NULL,
  `pagado` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `is_segun_pago` char(1) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `medoto_pago2_id` int(11) NULL DEFAULT NULL,
  `pagado2` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `moneda` int(10) NULL DEFAULT 1,
  `cm_tc` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `oc` int(11) NULL DEFAULT 0,
  `num_oc` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT '',
  PRIMARY KEY (`id_venta`) USING BTREE,
  INDEX `fk_ventas_documentos_sunat1_idx`(`id_tido`) USING BTREE,
  INDEX `fk_ventas_clientes1_idx`(`id_cliente`) USING BTREE,
  INDEX `fk_ventas_empresas1_idx`(`id_empresa`) USING BTREE,
  INDEX `id_tipo_pago`(`id_tipo_pago`) USING BTREE,
  INDEX `medoto_pago_id`(`medoto_pago_id`) USING BTREE,
  CONSTRAINT `fk_ventas_documentos_sunat1` FOREIGN KEY (`id_tido`) REFERENCES `documentos_sunat` (`id_tido`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ventas_empresas1` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_tipo_pago`) REFERENCES `tipo_pago` (`tipo_pago_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`medoto_pago_id`) REFERENCES `metodo_pago` (`id_metodo_pago`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6559 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ventas
-- ----------------------------
INSERT INTO `ventas` VALUES (6299, 2, 1, '2023-11-06', '2023-11-06', '', '-', 'NV01', 1, 4554, 550.00, '2', '0', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 2, NULL, 0, '');
INSERT INTO `ventas` VALUES (6300, 2, 1, '2023-11-06', '2023-11-06', '', '-', 'F001', 40, 4554, 550.00, '2', '1', 12, 1, '1', '', 0.18, 12, '550', '1', 12, '', 2, NULL, 0, '');
INSERT INTO `ventas` VALUES (6301, 2, 1, '2023-11-06', '2023-11-06', '', 'JR. EVARISTO SAN CRISTOBAL 1565 URB. EL PORVENIR INT. B209 LIMA-LIMA-LA VICTORIA', 'F001', 41, 4555, 550.00, '2', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, NULL, 0, '');
INSERT INTO `ventas` VALUES (6302, 2, 1, '2023-11-06', '2023-11-06', '', 'AV. UNIVERSITARIA SUR 1377 URB. OSCAR BENAVIDES LIMA-LIMA-LIMA', 'F001', 42, 4556, 440.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, NULL, 0, '');
INSERT INTO `ventas` VALUES (6303, 2, 1, '2023-11-06', '2023-11-06', '', 'JR. JUNIN 102 URB. PUEBLO LIBRE COSTADO DE CREDISCOTIA APURIMAC-ABANCAY-ABANCAY', 'F001', 43, 4557, 320.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, NULL, 0, '');
INSERT INTO `ventas` VALUES (6308, 2, 1, '2023-11-07', '2023-11-07', '', '-', 'F001', 44, 4554, 550.00, '2', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 2, '3.765', 0, '');
INSERT INTO `ventas` VALUES (6309, 2, 1, '2023-11-07', '2023-11-07', '', 'JR. EVARISTO SAN CRISTOBAL 1565 URB. EL PORVENIR INT. B209 LIMA-LIMA-LA VICTORIA', 'NV01', 2, 4555, 2079.00, '2', '0', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '3.78', 0, '');
INSERT INTO `ventas` VALUES (6310, 2, 1, '2023-11-07', '2023-11-07', '', 'JR. EVARISTO SAN CRISTOBAL 1565 URB. EL PORVENIR INT. B209 LIMA-LIMA-LA VICTORIA', 'F001', 45, 4555, 2079.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6311, 2, 1, '2023-11-07', '2023-11-07', '', 'AV. SALAVERRY 1883 ---- CERCADO 2DO.PISO,ALT. REST. FIESTAS X EL ESTADIO LAMBAYEQUE-CHICLAYO-CHICLAYO', 'F001', 46, 4559, 828.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6312, 6, 1, '2023-11-08', '2023-11-08', '', 'JR. JUNIN 1015 ---- BARR BARRIOS ALTOS LIMA-LIMA-LIMA', 'NV01', 3, 4560, 80.00, '1', '0', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6313, 2, 1, '2023-11-08', '2023-11-08', '', 'JR. JUNIN 1015 ---- BARR BARRIOS ALTOS LIMA-LIMA-LIMA', 'F001', 47, 4560, 320.00, '2', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6314, 6, 1, '2023-11-09', '2023-11-09', '', 'JR. JUNIN 1015 ---- BARR BARRIOS ALTOS LIMA-LIMA-LIMA', 'NV01', 4, 4560, 440.00, '2', '0', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6315, 6, 1, '2023-11-09', '2023-11-09', '', 'JR. JUNIN 1015 ---- BARR BARRIOS ALTOS LIMA-LIMA-LIMA', 'NV01', 5, 4560, 440.00, '1', '0', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6316, 2, 1, '2023-11-09', '2023-11-09', '', 'CAL. 7 MZA. H LOTE 05 URB. LAS VEGAS ', 'F001', 48, 4561, 46.00, '2', '0', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 2, '', 0, '');
INSERT INTO `ventas` VALUES (6317, 2, 1, '2023-11-09', '2023-11-09', '', 'CAL. 7 MZA. H LOTE 05 URB. LAS VEGAS ', 'F001', 49, 4561, 46.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 2, '3.81', 0, '');
INSERT INTO `ventas` VALUES (6318, 6, 1, '2023-11-09', '2023-11-09', '', 'AV. REVOLUCION NRO S/N INT. 56 OTR. SECTOR 02 GRUPO 10', 'NV01', 6, 4562, 480.00, '1', '0', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6319, 2, 1, '2023-11-09', '2023-11-09', '', 'CAL. SAN IGNACIO DE LOYOLA 121 URB. SAN CESAR ET. UNO LIMALIMA-LA MOLINA ', 'F001', 50, 4563, 400.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6320, 2, 1, '2023-11-09', '2023-11-09', '', 'AV. ALFREDO BENAVIDES 5384 URB. LAS GARDENIAS ET. UNO INT. 161 LIMA-LIMA-SANTIAGO DE SURCO', 'F001', 51, 4558, 360.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6321, 2, 1, '2023-11-09', '2023-11-09', '', 'AV. BENAVIDES 5330 INT. 31 GALERIA SHOPPING CENTER LIMA-LIMA-SANTIAGO DE SURCO', 'F001', 52, 4564, 375.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6322, 2, 1, '2023-11-09', '2023-11-09', '', '-	 AV. BENAVIDES 5330 URB. LAS GARDENIAS INT. 8 LIMA-LIMA-SANTIAGO DE SURCO', 'F001', 53, 4565, 560.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6323, 6, 1, '2023-11-09', '2023-11-09', '', '-', 'NV01', 7, 4554, 260.00, '1', '0', 12, 1, '1', 'fue en tusilagos atras de tottus , tm 200', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6324, 2, 1, '2023-11-10', '2023-11-10', '', 'AV. BENAVIDES 5417 URB. LAS GARDENIAS INT. 03 LIMA-LIMA-SANTIAGO DE SURCO', 'F001', 54, 4566, 90.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6325, 6, 1, '2023-11-10', '2023-11-10', '', '-', 'NV01', 8, 4554, 160.00, '1', '0', 12, 1, '1', 'fue para la señora rosita en universidad', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6326, 2, 1, '2023-11-10', '2023-11-10', '', 'AV. SALAVERRY NRO 1883 CERCADO ', 'F001', 55, 4559, 581.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6327, 6, 1, '2023-11-10', '2023-11-10', '', '-', 'NV01', 9, 4567, 160.00, '1', '0', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6328, 2, 1, '2023-11-10', '2023-11-10', '', 'Av. Benavides 5330 tda 43', 'F001', 56, 4568, 550.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 2, '3.81', 0, '');
INSERT INTO `ventas` VALUES (6329, 6, 1, '2023-11-13', '2023-11-13', '', 'CAL. EL AMAUTA NRO 284 ', 'NV01', 10, 4569, 90.00, '1', '0', 12, 1, '1', 'yapeo al sr alex ', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6330, 6, 1, '2023-11-13', '2023-11-13', '', '-', 'NV01', 11, 4554, 125.00, '1', '0', 12, 1, '1', 'Entrego el sr frnacisco  , lucio ipf 770 en san juan de lurigancho , pago deposito ', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6331, 6, 1, '2023-11-13', '2023-11-13', '', 'AV LORETO 424---PIURA--CARCADO DE PIURA---PIURA', 'NV01', 12, 4570, 122.20, '1', '0', 12, 1, '1', '', 0.18, 5, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6332, 2, 1, '2023-11-13', '2023-11-13', '', 'Av Benavides 5330 stand 23 al costado del Mac donald', 'F001', 57, 4571, 120.00, '1', '1', 12, 1, '1', '', 0.18, 5, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6333, 2, 1, '2023-11-13', '2023-11-13', '', 'CAL. 7 MZA. H LOTE 05 URB. LAS VEGAS', 'F001', 58, 4561, 52.00, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 2, '3.81', 0, '');
INSERT INTO `ventas` VALUES (6334, 2, 1, '2023-11-14', '2023-11-14', '', ': AV. ALFREDO BENAVIDES 5330 URB. LAS GARDENIAS ET. UNO INT. 49', 'F001', 59, 4572, 140.00, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6335, 2, 1, '2023-11-14', '2023-11-14', '', '-	 AV. BENAVIDES 5330 URB. LAS GARDENIAS INT. 8 LIMA-LIMA-SANTIAGO DE SURCO', 'F001', 60, 4565, 80.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6336, 2, 1, '2023-11-14', '2023-11-14', '', ': AV. ALFREDO BENAVIDES 5330 URB. LAS GARDENIAS ET. UNO INT. 49', 'F001', 61, 4572, 200.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6337, 6, 1, '2023-11-14', '2023-11-14', '', '-', 'NV01', 13, 4554, 160.00, '1', '0', 12, 1, '1', 'sr rosita richi ', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6338, 2, 1, '2023-11-14', '2023-11-14', '', 'AV. ALFREDO BENAVIDES 5330 URB. LAS GARDENIAS ET. UNO INT. 75 LIMA-LIMA-SANTIAGO DE SURCO', 'F001', 62, 4574, 50.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6339, 6, 1, '2023-11-14', '2023-11-14', '', 'AV. BENAVIDES 5330 TDA 43', 'NV01', 14, 4568, 200.00, '1', '0', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6340, 6, 1, '2023-11-14', '2023-11-14', '', '-', 'NV01', 15, 4554, 80.00, '1', '0', 12, 1, '1', 'servicio mantenimiento 80 soles efectivo , en galeria la victoria 308 A', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6341, 2, 1, '2023-11-14', '2023-11-14', '', 'JR. CHAMAYA NRO 1258 URB. AZCONA ', 'F001', 63, 4575, 1005.00, '2', '0', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 2, '', 0, '');
INSERT INTO `ventas` VALUES (6342, 2, 1, '2023-11-14', '2023-11-14', '', 'JR. CHAMAYA NRO 1258 URB. AZCONA ', 'F001', 64, 4575, 1005.00, '2', '0', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 2, '', 0, '');
INSERT INTO `ventas` VALUES (6343, 2, 1, '2023-11-14', '2023-11-14', '', 'JR. CHAMAYA NRO 1258 URB. AZCONA ', 'F001', 65, 4575, 1005.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 2, '3.81', 0, '');
INSERT INTO `ventas` VALUES (6344, 6, 1, '2023-11-14', '2023-11-14', '', 'AV CORONEL JUAN PASCAL PRING.1251 URB.PABLO BONER LA MOLINA', 'NV01', 16, 4576, 2091.00, '1', '0', 12, 1, '1', 'creo que es el cabezal pf 03 ', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6345, 6, 1, '2023-11-14', '2023-11-14', '', 'CAL. EL AMAUTA NRO 284 ', 'NV01', 17, 4569, 90.00, '2', '0', 12, 1, '1', 'pago por yape sr alex ', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6346, 6, 1, '2023-11-14', '2023-11-14', '', 'CAL. EL AMAUTA NRO 284 ', 'NV01', 18, 4569, 80.00, '1', '0', 12, 1, '1', 'se condundio sr francisco y cobro 80 en vez de 90 yapeo sr alex ', 0.18, 5, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6347, 2, 1, '2023-11-16', '2023-11-16', '', 'AV. BENAVIDES 5330 INT. 31 GALERIA SHOPPING CENTER LIMA-LIMA-SANTIAGO DE SURCO', 'NV01', 19, 4564, 125.00, '2', '0', 12, 1, '1', '', 0.18, 5, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6348, 2, 1, '2023-11-16', '2023-11-16', '', 'AV. BENAVIDES 5330 INT. 31 GALERIA SHOPPING CENTER LIMA-LIMA-SANTIAGO DE SURCO', 'F001', 66, 4564, 125.00, '1', '1', 12, 1, '1', '', 0.18, 5, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6349, 2, 1, '2023-11-16', '2023-11-16', '', 'Av venavides 5403  int 01', 'F001', 67, 4578, 160.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6350, 2, 1, '2023-11-16', '2023-11-16', '', 'AV PROLONGACION PRIMAVERA 2261 URB MONTERRICO-UPC', 'F001', 68, 4579, 225.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6351, 2, 1, '2023-11-16', '2023-11-16', '', 'AV. PRIMAVERA NRO 2359 URB. PARQUE PRIMAVERA ', 'F001', 69, 4580, 407.67, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6352, 6, 1, '2023-11-16', '2023-11-16', '', '-', 'NV01', 20, 4554, 280.00, '1', '0', 12, 1, '1', 'fueron dos idas 10 soles de delivery rosita richi ', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6353, 2, 1, '2023-11-16', '2023-11-16', '', 'AV. PROLONGACION PRIMAVERA NRO 2349 ', 'F001', 70, 4581, 917.60, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6354, 2, 1, '2023-11-18', '2023-11-18', '', 'av Benavides 5388- stand 131', 'F001', 71, 4582, 2145.50, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6355, 6, 1, '2023-11-18', '2023-11-18', '', 'piura', 'NV01', 21, 4583, 1970.80, '2', '0', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6356, 2, 1, '2023-11-18', '2023-11-18', '', 'PIURA', 'F001', 72, 4583, 1970.80, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6357, 2, 1, '2023-11-18', '2023-11-18', '', 'AV. LA FONTANA 440 INT. 1087 LIMA-LIMA-LA MOLINA', 'F001', 73, 4584, 550.00, '2', '0', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 2, '', 0, '');
INSERT INTO `ventas` VALUES (6358, 2, 1, '2023-11-18', '2023-11-18', '', 'AV. LA FONTANA 440 INT. 1087 LIMA-LIMA-LA MOLINA', 'F001', 74, 4584, 60.00, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6359, 6, 1, '2023-11-18', '2023-11-18', '', 'AV. AVIACION NRO 2438 URB. SAN BORJA NORTE ', 'NV01', 22, 4585, 80.00, '1', '0', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6360, 2, 1, '2023-11-20', '2023-11-20', '', 'AV. LA FONTANA 440 INT. 1087 LIMA-LIMA-LA MOLINA', 'F001', 75, 4584, 550.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 2, '1', 0, '');
INSERT INTO `ventas` VALUES (6361, 2, 1, '2023-11-20', '2023-11-20', '', 'JR.Alberto Gridilla 467 Huaraz', 'F001', 76, 4586, 150.00, '1', '1', 12, 1, '1', '', 0.18, 5, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6362, 2, 1, '2023-11-21', '2023-11-21', '', 'piura', 'F001', 77, 4587, 1965.60, '2', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 2, '1', 0, '');
INSERT INTO `ventas` VALUES (6363, 2, 1, '2023-11-21', '2023-11-21', '', ' Comas 15314', 'F001', 78, 4588, 400.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6364, 2, 1, '2023-11-21', '2023-11-21', '', 'piura', 'F001', 79, 4587, 1965.00, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6365, 2, 1, '2023-11-21', '2023-11-21', '', 'AV. ALFREDO BENAVIDES NRO 5384 INT. 164 URB. LAS GARDENIAS ET. UNO ', 'F001', 80, 4589, 1120.00, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6366, 2, 1, '2023-11-21', '2023-11-21', '', 'AV. LURIGANCHO NRO 1349 URB. ZARATE ', 'F001', 81, 4577, 1040.00, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 2, '1', 0, '');
INSERT INTO `ventas` VALUES (6367, 2, 1, '2023-11-21', '2023-11-21', '', 'MZA. L-6 LOTE 5 C.P. HUERTOS DE MANCHAY SECTOR ', 'F001', 82, 4590, 4750.00, '2', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6368, 2, 1, '2023-11-21', '2023-11-21', '', 'MZA. L-6 LOTE 5 C.P. HUERTOS DE MANCHAY SECTOR ', 'F001', 83, 4590, 4750.00, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6369, 2, 2, '2023-11-21', '2023-12-06', '15', 'AV. LURIGANCHO NRO 1349 URB. ZARATE ', 'F001', 84, 4577, 40.00, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 2, '1', 0, '');
INSERT INTO `ventas` VALUES (6370, 2, 1, '2023-11-21', '2023-11-21', '', 'Av. El Santuario 1616 sjl', 'F001', 85, 4591, 10527.50, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6371, 2, 1, '2023-11-22', '2023-11-22', '', 'CAL. PORTA NRO 147 ', 'F001', 86, 4593, 550.00, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 2, '1', 0, '');
INSERT INTO `ventas` VALUES (6372, 2, 1, '2023-11-22', '2023-11-22', '', 'AV PROLONGACION PRIMAVERA 2261 URB MONTERRICO-UPC', 'F001', 87, 4579, 653.39, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6373, 2, 1, '2023-11-23', '2023-11-23', '', 'piura', 'F001', 88, 4594, 859.50, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6374, 2, 1, '2023-11-23', '2023-11-23', '', 'huaraz', 'F001', 89, 4595, 404.46, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6375, 6, 1, '2023-11-23', '2023-11-23', '', 'CAL. PORTA NRO 147 ', 'NV01', 23, 4593, 80.00, '1', '0', 12, 1, '1', 'receteo de cabezal 750', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6376, 6, 1, '2023-11-23', '2023-11-23', '', '-', 'NV01', 24, 4554, 80.00, '1', '0', 12, 1, '1', 'instalacion de rip en la victoria gamarra ', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6377, 6, 1, '2023-11-23', '2023-11-23', '', 'AV. AVIACION NRO 2438 URB. SAN BORJA NORTE ', 'NV01', 25, 4585, 300.00, '1', '0', 12, 1, '1', 'instalacion de una unidad de purga ', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6378, 6, 1, '2023-11-23', '2023-11-23', '', '-', 'NV01', 26, 4596, 80.00, '1', '0', 12, 1, '1', 'ipf 770 ', 0.18, 5, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6379, 6, 1, '2023-11-23', '2023-11-23', '', '-', 'NV01', 27, 4597, 500.00, '1', '0', 12, 1, '1', 'Adelanto de un cabezal y una tarjeta ', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6380, 2, 1, '2023-11-23', '2023-11-23', '', 'AV. AVIACION NRO 2438 URB. SAN BORJA NORTE ', 'F001', 90, 4585, 160.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6381, 2, 1, '2023-11-23', '2023-11-23', '', ': AV. ALFREDO BENAVIDES 5330 URB. LAS GARDENIAS ET. UNO INT. 49', 'F001', 91, 4572, 560.00, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6382, 2, 1, '2023-11-24', '2023-11-24', '', 'chiclayo', 'F001', 92, 4598, 240.00, '1', '1', 12, 1, '1', '', 0.18, 5, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6383, 2, 1, '2023-11-24', '2023-11-24', '', '-	 AV. BENAVIDES 5330 URB. LAS GARDENIAS INT. 8 LIMA-LIMA-SANTIAGO DE SURCO', 'F001', 93, 4565, 300.00, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6384, 6, 1, '2023-11-24', '2023-11-24', '', '-', 'NV01', 28, 4554, 160.00, '1', '0', 12, 1, '1', 'señora rosita en richi ', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6385, 6, 1, '2023-11-24', '2023-11-24', '', '-	 AV. BENAVIDES 5330 URB. LAS GARDENIAS INT. 8 LIMA-LIMA-SANTIAGO DE SURCO', 'NV01', 29, 4565, 180.00, '1', '0', 12, 1, '1', 'sacar de kanako', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6386, 2, 1, '2023-11-24', '2023-11-24', '', 'AV. SALAVERRY 1883 ---- CERCADO 2DO.PISO,ALT. REST. FIESTAS X EL ESTADIO LAMBAYEQUE-CHICLAYO-CHICLAYO', 'F001', 94, 4559, 66.00, '1', '1', 12, 1, '1', '', 0.18, 5, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6387, 2, 1, '2023-11-24', '2023-11-24', '', 'AV. ALFREDO BENAVIDES NRO 5330 INT. 36 URB. LAS GARDENIAS ET. UNO ', 'F001', 95, 4599, 340.00, '1', '1', 12, 1, '1', '', 0.18, 5, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6388, 2, 1, '2023-11-24', '2023-11-24', '', 'AV. ALFREDO BENAVIDES 5384 URB. LAS GARDENIAS ET. UNO INT. 161 LIMA-LIMA-SANTIAGO DE SURCO', 'F001', 96, 4558, 260.00, '1', '1', 12, 1, '1', '', 0.18, 5, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6389, 2, 1, '2023-11-25', '2023-11-25', '', 'CAL. EL AMAUTA NRO 284 ', 'F001', 97, 4569, 2095.50, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6390, 6, 1, '2023-11-25', '2023-11-25', '', 'CAL. EL AMAUTA NRO 284 ', 'NV01', 30, 4569, 50.00, '1', '0', 12, 1, '1', 'Servicio de Revisión de Canon IPF 770 , yape señor alex', 0.18, 5, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6391, 6, 1, '2023-11-25', '2023-11-25', '', '-', 'NV01', 31, 4554, 2068.00, '1', '0', 12, 1, '1', 'se transfiero al señor  alex ', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6392, 2, 1, '2023-11-25', '2023-11-25', '', '-	 AV. BENAVIDES 5330 URB. LAS GARDENIAS INT. 8 LIMA-LIMA-SANTIAGO DE SURCO', 'F001', 98, 4565, 1200.00, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 2, '1', 0, '');
INSERT INTO `ventas` VALUES (6393, 2, 1, '2023-11-26', '2023-11-26', '', '-	 AV. BENAVIDES 5330 URB. LAS GARDENIAS INT. 8 LIMA-LIMA-SANTIAGO DE SURCO', 'F001', 99, 4565, 50.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 2, '1', 0, '');
INSERT INTO `ventas` VALUES (6394, 6, 1, '2023-11-26', '2023-11-26', '', '-	 AV. BENAVIDES 5330 URB. LAS GARDENIAS INT. 8 LIMA-LIMA-SANTIAGO DE SURCO', 'NV01', 32, 4565, 80.00, '1', '0', 12, 1, '1', 'se cambio el deposito por uno nuevo y receteo el chip , upc chorrillos ', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6395, 2, 1, '2023-11-26', '2023-11-26', '', 'AV. BENAVIDES NRO 5388 INT. 128 URB. LAS GARDENIAS ', 'F001', 100, 4600, 240.00, '1', '1', 12, 1, '1', '', 0.18, 5, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6396, 6, 1, '2023-11-27', '2023-11-27', '', '-', 'NV01', 33, 4554, 2.00, '1', '0', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6397, 6, 1, '2023-11-28', '2023-11-28', '', 'CAL. CALLE JOSE DIAZ NRO 258 DEP. 705 URB. URBANIZACIÓN SANTA BEATRI ', 'NV01', 34, 4601, 160.00, '1', '0', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6398, 6, 1, '2023-11-28', '2023-11-28', '', 'CAL. CALLE JOSE DIAZ NRO 258 DEP. 705 URB. URBANIZACIÓN SANTA BEATRI ', 'NV01', 35, 4601, 320.00, '1', '0', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6399, 1, 1, '2023-11-29', '2023-11-29', '', '-', 'B001', 1, 4597, 2073.50, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6400, 2, 1, '2023-11-29', '2023-11-29', '', 'AV. ALFREDO BENAVIDES 5317 URB. LAS GARDENIAS ET. UNO INT. 3 LIMA-LIMA-SANTIAGO DE SURCO', 'F001', 101, 4602, 90.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6401, 2, 1, '2023-11-29', '2023-11-29', '', 'AV. ALFREDO BENAVIDES 5317 URB. LAS GARDENIAS ET. UNO INT. 3 LIMA-LIMA-SANTIAGO DE SURCO', 'F001', 102, 4602, 80.00, '1', '1', 12, 1, '1', '', 0.18, 5, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6402, 2, 1, '2023-11-29', '2023-11-29', '', 'AV. ALFREDO BENAVIDES NRO 5330 INT. 13 URB. LAS GARDENIAS ET. UNO ', 'F001', 103, 4603, 180.00, '1', '1', 12, 1, '1', '', 0.18, 5, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6403, 2, 1, '2023-11-29', '2023-11-29', '', 'JR. BAUSATE Y MEZA MZA. L14 LOTE 25 URB. MRCAL CACERES ', 'F001', 104, 4604, 160.00, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6404, 2, 1, '2023-11-30', '2023-11-30', '', 'Int. 101, Av. Alfredo Benavides 5384, Santiago de Surco 15039, Perú', 'F001', 105, 4605, 80.00, '1', '1', 12, 1, '1', '', 0.18, 5, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6405, 2, 1, '2023-11-30', '2023-11-30', '', '-', 'F001', 106, 4606, 30.00, '1', '1', 12, 1, '1', '', 0.18, 5, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6406, 2, 1, '2023-11-30', '2023-11-30', '', 'AV. ALFREDO BENAVIDES NRO 5330 INT. 36 URB. LAS GARDENIAS ET. UNO ', 'F001', 107, 4599, 220.00, '1', '1', 12, 1, '1', '', 0.18, 5, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6407, 2, 1, '2023-11-30', '2023-11-30', '', '-', 'F001', 108, 4607, 120.00, '1', '1', 12, 1, '1', '', 0.18, 5, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6408, 2, 1, '2023-11-30', '2023-11-30', '', '-', 'F001', 109, 4608, 5216.74, '1', '1', 12, 1, '1', '', 0.18, 10, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6409, 2, 1, '2023-11-30', '2023-11-30', '', '-	 AV. BENAVIDES 5330 URB. LAS GARDENIAS INT. 8 LIMA-LIMA-SANTIAGO DE SURCO', 'F001', 110, 4565, 550.00, '2', '0', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 2, '', 0, '');
INSERT INTO `ventas` VALUES (6410, 2, 1, '2023-11-30', '2023-11-30', '', '-	 AV. BENAVIDES 5330 URB. LAS GARDENIAS INT. 8 LIMA-LIMA-SANTIAGO DE SURCO', 'F001', 111, 4565, 550.00, '2', '0', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 2, '', 0, '');
INSERT INTO `ventas` VALUES (6411, 2, 1, '2023-11-30', '2023-11-30', '', '-	 AV. BENAVIDES 5330 URB. LAS GARDENIAS INT. 8 LIMA-LIMA-SANTIAGO DE SURCO', 'F001', 112, 4565, 550.00, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 2, '1', 0, '');
INSERT INTO `ventas` VALUES (6412, 2, 1, '2023-11-30', '2023-11-30', '', '-	 AV. BENAVIDES 5330 URB. LAS GARDENIAS INT. 8 LIMA-LIMA-SANTIAGO DE SURCO', 'F001', 113, 4565, 590.00, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6413, 2, 1, '2023-11-30', '2023-11-30', '', 'JR. CHAMAYA NRO 1258 URB. AZCONA ', 'F001', 114, 4575, 450.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6414, 2, 1, '2023-11-30', '2023-11-30', '', '-', 'F001', 115, 4595, 2068.00, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6415, 2, 1, '2023-12-01', '2023-12-01', '', 'Av. Revolucion 19 villa el salvador', 'F001', 116, 4609, 270.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6416, 6, 1, '2023-12-01', '2023-12-01', '', '-', 'NV01', 36, 4554, 21.05, '2', '0', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 2, '3.80', 0, '');
INSERT INTO `ventas` VALUES (6417, 6, 1, '2023-12-01', '2023-12-01', '', '-', 'NV01', 37, 4554, 80.00, '2', '0', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6418, 2, 1, '2023-12-01', '2023-12-01', '', '-', 'F001', 117, 4554, 160.00, '2', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6419, 2, 1, '2023-12-02', '2023-12-02', '', 'AV. REVOLUCION 19 VILLA EL SALVADOR', 'F001', 118, 4609, 270.00, '1', '1', 12, 1, '1', '', 0.18, 5, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6420, 2, 1, '2023-12-04', '2023-12-04', '', 'JR. MARISCAL AGUSTIN GAMARRA NRO 627 INT. K DEP. 202 URB. SAN PABLO ', 'F001', 119, 4610, 2168.00, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6421, 2, 1, '2023-12-04', '2023-12-04', '', ' COMAS 15314', 'F001', 120, 4588, 560.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6422, 2, 1, '2023-12-04', '2023-12-04', '', '-', 'F001', 121, 4611, 205.00, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6423, 2, 1, '2023-12-04', '2023-12-04', '', '-', 'F001', 122, 4612, 250.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6424, 2, 1, '2023-12-04', '2023-12-04', '', 'Tda. 315 - 316 galería Wilson 1282', 'F001', 123, 4613, 360.00, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6425, 2, 1, '2023-12-04', '2023-12-04', '', 'PJ. 4 MZA. J LOTE 6 A.H. SAN JOSE ', 'F001', 124, 4614, 700.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6426, 2, 1, '2023-12-05', '2023-12-05', '', 'AV PROLONGACION PRIMAVERA 2261 URB MONTERRICO-UPC', 'F001', 125, 4579, 375.00, '1', '1', 12, 1, '1', '', 0.18, 5, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6427, 2, 1, '2023-12-05', '2023-12-05', '', 'PRO. PRIMAVERA NRO 2345 ', 'F001', 126, 4615, 480.00, '1', '1', 12, 1, '1', '', 0.18, 5, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6428, 2, 1, '2023-12-05', '2023-12-05', '', 'HUARAZ', 'F001', 127, 4595, 405.53, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6429, 2, 1, '2023-12-05', '2023-12-05', '', '-', 'F001', 128, 4616, 2145.00, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6430, 2, 1, '2023-12-05', '2023-12-05', '', 'CAL. EL AMAUTA NRO 284 URB. SAN JUAN BAUTISTA DE VILL ', 'F001', 129, 4617, 2079.00, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6431, 6, 1, '2023-12-05', '2023-12-05', '', '-', 'NV01', 38, 4618, 500.00, '1', '0', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 2, '', 0, '');
INSERT INTO `ventas` VALUES (6432, 2, 1, '2023-12-05', '2023-12-05', '', '-', 'F001', 130, 4619, 240.00, '1', '1', 12, 1, '1', '', 0.18, 5, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6433, 2, 1, '2023-12-05', '2023-12-05', '', 'AV. ALFREDO BENAVIDES NRO 5330 ', 'F001', 131, 4620, 90.00, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6434, 2, 1, '2023-12-05', '2023-12-05', '', '-', 'F001', 132, 4621, 90.00, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6435, 2, 1, '2023-12-06', '2023-12-06', '', 'AV. BENAVIDES 5330 TDA 43', 'F001', 133, 4568, 320.00, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6436, 6, 1, '2023-12-06', '2023-12-06', '', '-', 'NV01', 39, 4554, 550.00, '1', '0', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 2, '', 0, '');
INSERT INTO `ventas` VALUES (6437, 6, 1, '2023-12-06', '2023-12-06', '', '-', 'NV01', 40, 4554, 2079.00, '1', '0', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6438, 2, 1, '2023-12-06', '2023-12-06', '', 'LOS CANARIOS NRO 152 INT. 101 URB. SAN CESAR II ETAPA ', 'F001', 134, 4622, 421.10, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6439, 2, 1, '2023-12-08', '2023-12-08', '', 'AV. ALFREDO MENDIOLA NRO 945 URB. PALAO ', 'F001', 135, 4623, 2167.00, '1', '1', 12, 1, '1', '', 0.18, 4, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6440, 2, 1, '2023-12-08', '2023-12-08', '', '-', 'F001', 136, 4624, 420.00, '2', '0', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 2, '', 0, '');
INSERT INTO `ventas` VALUES (6441, 2, 1, '2023-12-08', '2023-12-08', '', '-', 'F001', 137, 4624, 420.00, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 2, '1', 0, '');
INSERT INTO `ventas` VALUES (6442, 2, 1, '2023-12-09', '2023-12-09', '', 'AV PROLONGACION PRIMAVERA 2261 URB MONTERRICO-UPC', 'F001', 138, 4579, 270.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6443, 2, 1, '2023-12-09', '2023-12-09', '', 'AV PROLONGACION PRIMAVERA 2261 URB MONTERRICO-UPC', 'F001', 139, 4579, 180.00, '2', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6444, 2, 1, '2023-12-09', '2023-12-09', '', 'AV LORETO 424---PIURA--CARCADO DE PIURA---PIURA', 'F001', 140, 4570, 240.00, '1', '1', 12, 1, '1', '', 0.18, 5, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6445, 2, 1, '2023-12-11', '2023-12-11', '', ': AV. ALFREDO BENAVIDES 5330 URB. LAS GARDENIAS ET. UNO INT. 49', 'F001', 141, 4572, 120.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6446, 2, 1, '2023-12-11', '2023-12-11', '', ': AV. ALFREDO BENAVIDES 5330 URB. LAS GARDENIAS ET. UNO INT. 49', 'F001', 142, 4572, 290.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6447, 2, 1, '2023-12-11', '2023-12-11', '', 'AV. ALFREDO BENAVIDES NRO 5330 INT. 36 URB. LAS GARDENIAS ET. UNO ', 'F001', 143, 4599, 360.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6448, 2, 1, '2023-12-11', '2023-12-11', '', ': AV. ALFREDO BENAVIDES 5330 URB. LAS GARDENIAS ET. UNO INT. 49', 'F001', 144, 4572, 360.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6449, 2, 1, '2023-12-11', '2023-12-11', '', 'MZA. I LOTE 8 URB. 4TO PROGRAMA ', 'F001', 145, 4625, 240.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6450, 2, 1, '2023-12-11', '2023-12-11', '', 'AV. ALFREDO BENAVIDES 5330 URB. LAS GARDENIAS ET. UNO INT. 75 LIMA-LIMA-SANTIAGO DE SURCO', 'F001', 146, 4574, 50.00, '1', '1', 12, 1, '1', '', 0.18, 5, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6451, 2, 1, '2023-12-12', '2023-12-12', '', 'CAL. EL AMAUTA NRO 284 ', 'F001', 147, 4569, 14440.00, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6452, 6, 1, '2023-12-12', '2023-12-12', '', '-	 AV. BENAVIDES 5330 URB. LAS GARDENIAS INT. 8 LIMA-LIMA-SANTIAGO DE SURCO', 'NV01', 41, 4565, 100.00, '1', '0', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6453, 6, 1, '2023-12-12', '2023-12-12', '', '-', 'NV01', 42, 4554, 120.00, '1', '0', 12, 1, '1', 'sr vicente zapallal yapeo sr alex ', 0.18, 5, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6454, 2, 1, '2023-12-12', '2023-12-12', '', 'CAL. SEBASTIAN BARRANCA NRO 1670 INT. 227 URB. EL PORVENIR ', 'F001', 148, 4626, 550.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 2, '1', 0, '');
INSERT INTO `ventas` VALUES (6455, 2, 1, '2023-12-12', '2023-12-12', '', 'AV PROLONGACION PRIMAVERA 2261 URB MONTERRICO-UPC', 'F001', 149, 4579, 125.00, '1', '1', 12, 1, '1', '', 0.18, 5, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6456, 2, 1, '2023-12-12', '2023-12-12', '', 'MZA. L-6 LOTE 5 C.P. HUERTOS DE MANCHAY SECTOR ', 'F001', 150, 4590, 260.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6457, 2, 1, '2023-12-13', '2023-12-13', '', 'CAL. GRANATE MZA. E LOTE 4 DEP. 301 URB. ASOCIACION DE VIVIENDA VI ', 'F001', 151, 4629, 740.00, '2', '0', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 2, '', 0, '');
INSERT INTO `ventas` VALUES (6458, 2, 1, '2023-12-13', '2023-12-13', '', 'CAL. GRANATE MZA. E LOTE 4 DEP. 301 URB. ASOCIACION DE VIVIENDA VI ', 'F001', 152, 4629, 740.00, '2', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 2, '1', 0, '');
INSERT INTO `ventas` VALUES (6459, 2, 1, '2023-12-13', '2023-12-13', '', 'CAL. GRANATE MZA. E LOTE 4 DEP. 301 URB. ASOCIACION DE VIVIENDA VI ', 'F001', 153, 4629, 2819.40, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6460, 2, 1, '2023-12-14', '2023-12-14', '', 'AV. PROLONGACION PRIMAVERA NRO 2261 INT. 205 URB. LIMA POLO HUNT ', 'F001', 154, 4630, 600.00, '1', '1', 12, 1, '1', '', 0.18, 4, '', '1', 12, '', 2, '1', 0, '');
INSERT INTO `ventas` VALUES (6461, 6, 1, '2023-12-14', '2023-12-14', '', '-', 'NV01', 43, 4554, 270.00, '1', '0', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6462, 6, 1, '2023-12-14', '2023-12-14', '', '-', 'NV01', 44, 4554, 20.94, '2', '0', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 2, '3.82', 0, '');
INSERT INTO `ventas` VALUES (6463, 2, 1, '2023-12-14', '2023-12-14', '', 'AV. ALFREDO BENAVIDES 5330 URB. LAS GARDENIAS ET. UNO INT. 75 LIMA-LIMA-SANTIAGO DE SURCO', 'F001', 155, 4574, 50.00, '1', '1', 12, 1, '1', '', 0.18, 5, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6464, 2, 1, '2023-12-14', '2023-12-14', '', 'CAL. SIMON BOLIVAR NRO 1246 CENT JAEN ', 'F001', 156, 4631, 420.00, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 2, '1', 0, '');
INSERT INTO `ventas` VALUES (6465, 2, 1, '2023-12-14', '2023-12-14', '', 'CAL. FELIPE BARGNA NRO 1084 URB. SAN LUIS ', 'F001', 157, 4632, 240.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6466, 2, 1, '2023-12-14', '2023-12-14', '', '-', 'F001', 158, 4578, 80.00, '1', '1', 12, 1, '1', '', 0.18, 5, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6467, 2, 1, '2023-12-14', '2023-12-14', '', 'AV BENAVIDES 5388- STAND 131', 'F001', 159, 4582, 400.00, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6468, 2, 1, '2023-12-14', '2023-12-14', '', 'AV. PROLONGACION PRIMAVERA NRO 2261 INT. 205 URB. LIMA POLO HUNT ', 'F001', 160, 4630, 350.00, '1', '1', 12, 1, '1', '', 0.18, 5, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6469, 6, 1, '2023-12-16', '2023-12-16', '', '-', 'NV01', 45, 4554, 90.00, '2', '0', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6470, 6, 1, '2023-12-16', '2023-12-16', '', '-', 'NV01', 46, 4554, 80.00, '2', '0', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6471, 2, 1, '2023-12-16', '2023-12-16', '', 'JR.ALBERTO GRIDILLA 467 HUARAZ', 'F001', 161, 4586, 160.00, '1', '1', 12, 1, '1', '', 0.18, 5, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6472, 2, 1, '2023-12-16', '2023-12-16', '', ' COMAS 15314', 'F001', 162, 4588, 2084.00, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6473, 2, 1, '2023-12-16', '2023-12-16', '', 'AV PROLONGACION PRIMAVERA 2261 URB MONTERRICO-UPC', 'F001', 163, 4579, 750.00, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6474, 2, 1, '2023-12-18', '2023-12-18', '', 'piura', 'F001', 164, 4634, 560.00, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6475, 6, 1, '2023-12-19', '2023-12-19', '', 'AV. DE LOS HEROES NRO 188 INT. 225 URB. ENTEL ', 'NV01', 47, 4635, 190.00, '2', '0', 12, 1, '1', 'yapeo al sr alex  ', 0.18, 5, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6476, 6, 1, '2023-12-19', '2023-12-19', '', 'AV VENAVIDES 5403  INT 01', 'NV01', 48, 4578, 80.00, '1', '0', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6477, 2, 1, '2023-12-20', '2023-12-20', '', 'AV. DE LOS HEROES NRO 188 INT. 225 URB. ENTEL ', 'F001', 165, 4635, 190.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6478, 6, 1, '2023-12-20', '2023-12-20', '', 'CAL. GRANATE MZA. E LOTE 4 DEP. 301 URB. ASOCIACION DE VIVIENDA VI ', 'NV01', 49, 4629, 80.00, '1', '0', 12, 1, '1', 'servicio dx ipf 770 ', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6479, 6, 1, '2023-12-20', '2023-12-20', '', 'surco', 'NV01', 50, 4628, 80.00, '1', '0', 12, 1, '1', '', 0.18, 5, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6480, 6, 1, '2023-12-20', '2023-12-20', '', '-', 'NV01', 51, 4554, 80.00, '1', '0', 12, 1, '1', 'paola gamarra 922848714', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6481, 6, 1, '2023-12-20', '2023-12-20', '', 'GRUPO 10 NRO F-4 SEC. 2 ', 'NV01', 52, 4627, 60.00, '1', '0', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6482, 6, 1, '2023-12-20', '2023-12-20', '', '-', 'NV01', 53, 4554, 120.00, '1', '0', 12, 1, '1', 'configuracion de red de plotter corte , mirian kela salinas pte piedra ', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6483, 6, 1, '2023-12-20', '2023-12-20', '', '-', 'NV01', 54, 4636, 80.00, '1', '0', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6484, 6, 1, '2023-12-20', '2023-12-20', '', '-', 'NV01', 55, 4554, 450.00, '1', '0', 12, 1, '1', 'el primero fue cambio de riel y cuchilla y el otro correctivo e instalación , jhon cruz guardia 979311377', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6485, 6, 1, '2023-12-20', '2023-12-20', '', '-', 'NV01', 56, 4637, 80.00, '1', '0', 12, 1, '1', 'digicopy lince solicito susana , se realizo calibración de impresión 999019399', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6486, 2, 1, '2023-12-20', '2023-12-20', '', 'PRO. PRIMAVERA NRO 2345 ', 'F001', 166, 4615, 1372.00, '2', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6487, 6, 1, '2023-12-20', '2023-12-20', '', 'PRO. PRIMAVERA NRO 2345 ', 'NV01', 57, 4615, 1372.00, '1', '0', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6488, 2, 1, '2023-12-21', '2023-12-21', '', 'AV. LURIGANCHO NRO 1349 URB. ZARATE ', 'F001', 167, 4577, 295.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6489, 2, 1, '2023-12-21', '2023-12-21', '', 'JR. BAUSATE Y MEZA MZA. L14 LOTE 25 URB. MRCAL CACERES ', 'F001', 168, 4604, 2062.50, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6490, 2, 1, '2023-12-22', '2023-12-22', '', '-', 'F001', 169, 4638, 450.00, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6491, 2, 1, '2023-12-23', '2023-12-23', '', 'AV. PROLONGACION PRIMAVERA NRO 2261 INT. 205 URB. LIMA POLO HUNT ', 'F001', 170, 4630, 160.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6492, 2, 1, '2023-12-23', '2023-12-23', '', 'AV. LA MARINA NRO 862 ', 'F001', 171, 4639, 150.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6493, 2, 1, '2023-12-23', '2023-12-23', '', ': AV. ALFREDO BENAVIDES 5330 URB. LAS GARDENIAS ET. UNO INT. 49', 'F001', 172, 4572, 240.00, '1', '1', 12, 1, '1', '', 0.18, 5, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6494, 2, 1, '2023-12-26', '2023-12-26', '', 'AV. ALFREDO BENAVIDES NRO 5330 INT. 36 URB. LAS GARDENIAS ET. UNO ', 'F001', 173, 4599, 220.00, '1', '1', 12, 1, '1', '', 0.18, 5, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6495, 2, 1, '2023-12-26', '2023-12-26', '', 'PIURA', 'F001', 174, 4587, 520.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 2, '1', 0, '');
INSERT INTO `ventas` VALUES (6496, 2, 1, '2023-12-26', '2023-12-26', '', '-', 'F001', 175, 4640, 2051.50, '1', '1', 12, 1, '1', '', 0.18, 4, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6497, 2, 1, '2023-12-27', '2023-12-27', '', 'CAL. LAS CASUARINAS DE NARANJA MZA. A LOTE 4 RES. CALLE ', 'F001', 176, 4641, 240.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6498, 2, 1, '2023-12-27', '2023-12-27', '', ': AV. ALFREDO BENAVIDES 5330 URB. LAS GARDENIAS ET. UNO INT. 49', 'F001', 177, 4572, 240.00, '1', '1', 12, 1, '1', '', 0.18, 5, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6499, 2, 1, '2023-12-27', '2023-12-27', '', 'AV. AVIACION NRO 476 INT. 102 ', 'F001', 178, 4642, 5035.50, '2', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6500, 2, 1, '2023-12-27', '2023-12-27', '', 'galeria yuyi stand 3127', 'F001', 179, 4643, 5035.50, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6501, 2, 1, '2023-12-27', '2023-12-27', '', 'Av. El Santuario 1616 sjl', 'F001', 180, 4591, 160.00, '2', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6502, 2, 1, '2023-12-27', '2023-12-27', '', 'Av. El Santuario 1616 sjl', 'F001', 181, 4591, 150.00, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6503, 2, 1, '2023-12-28', '2023-12-28', '', 'AV. REPÚBLICA DE PANAMA NRO 3517 INT. PI.8 URB. EL PALOMAR ', 'F001', 182, 4644, 499.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 2, '1', 0, '');
INSERT INTO `ventas` VALUES (6504, 2, 1, '2023-12-28', '2023-12-28', '', 'PIURA', 'F001', 183, 4587, 1070.00, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 2, '1', 0, '');
INSERT INTO `ventas` VALUES (6505, 2, 1, '2023-12-29', '2023-12-29', '', '.Jr. Sebastián Barranca 1673, La Victoria 15018.. Galería:. VICELI.. Piso 3 .. N°301', 'F001', 184, 4645, 120.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6506, 2, 1, '2024-01-03', '2024-01-03', '', 'AV. DE LOS HEROES NRO 188 INT. 225 URB. ENTEL ', 'F001', 185, 4635, 120.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6507, 6, 1, '2024-01-03', '2024-01-03', '', 'AV. ALFREDO BENAVIDES NRO 5384 INT. 164 URB. LAS GARDENIAS ET. UNO ', 'NV01', 58, 4589, 80.00, '1', '0', 12, 1, '1', '', 0.18, 5, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6508, 2, 1, '2024-01-03', '2024-01-03', '', 'JR. STA MONICA NRO 642 ', 'F001', 186, 4646, 160.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6509, 2, 1, '2024-01-04', '2024-01-04', '', 'AV. ALFREDO BENAVIDES 5384 URB. LAS GARDENIAS ET. UNO INT. 161 LIMA-LIMA-SANTIAGO DE SURCO', 'F001', 187, 4558, 2062.50, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6510, 6, 1, '2024-01-04', '2024-01-04', '', '-', 'NV01', 59, 4554, 160.00, '1', '0', 12, 1, '1', 'señor luis gutierrez galeria centro de lima ', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6511, 2, 1, '2024-01-05', '2024-01-05', '', 'AV. SALAVERRY 1883 ---- CERCADO 2DO.PISO,ALT. REST. FIESTAS X EL ESTADIO LAMBAYEQUE-CHICLAYO-CHICLAYO', 'F001', 188, 4559, 600.00, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6512, 6, 1, '2024-01-06', '2024-01-06', '', '-', 'NV01', 60, 4554, 80.00, '2', '0', 12, 1, '1', 'INSTALACION DE RIP EN ZARATE ', 0.18, 6, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6513, 2, 1, '2024-01-06', '2024-01-06', '', 'CAL. PORTADA DEL SOL NRO 769 INT. 2 URB. AZCARRUNZ BAJO ', 'F001', 189, 4648, 80.00, '1', '1', 12, 1, '1', '', 0.18, 6, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6514, 6, 1, '2024-01-08', '2024-01-08', '', '-', 'NV01', 61, 4554, 80.00, '1', '0', 12, 1, '1', 'FUE EL SR FRANCISCO EN AV PRIMAVERA 2261 D COPY EXPRESS ', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6515, 6, 1, '2024-01-08', '2024-01-08', '', '-', 'NV01', 62, 4554, 100.00, '1', '0', 12, 1, '1', 'mantenimiento de ipf 670 estacion arriola ', 0.18, 5, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6516, 6, 1, '2024-01-08', '2024-01-08', '', '-', 'NV01', 63, 4554, 150.00, '1', '0', 12, 1, '1', 'se cambio en santa anita ', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6517, 2, 1, '2024-01-08', '2024-01-08', '', 'CAL. CENTENARIO NRO 1405 ', 'F001', 190, 4649, 600.00, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6518, 2, 1, '2024-01-09', '2024-01-09', '', 'CAL. ALBERTO PEREZ NRO 140 URB. SAN ROQUE ', 'F001', 191, 4650, 381.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 2, '1', 0, '');
INSERT INTO `ventas` VALUES (6519, 6, 1, '2024-01-09', '2024-01-09', '', '-', 'NV01', 64, 4651, 80.00, '1', '0', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6520, 6, 1, '2024-01-09', '2024-01-09', '', 'el agustino', 'NV01', 65, 4652, 350.00, '1', '0', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6521, 6, 1, '2024-01-10', '2024-01-10', '', 'AV. BENAVIDES NRO 5388 INT. 128 URB. LAS GARDENIAS ', 'NV01', 66, 4600, 120.00, '1', '0', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6522, 2, 1, '2024-01-10', '2024-01-10', '', 'AV. ALFREDO BENAVIDES 5330 URB. LAS GARDENIAS ET. UNO INT. 75 LIMA-LIMA-SANTIAGO DE SURCO', 'F001', 192, 4574, 180.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6523, 2, 1, '2024-01-10', '2024-01-10', '', 'AV. MARISCAL AGUSTIN GAMARRA NRO 613 URB. SAN FRANCISCO ', 'F001', 193, 4653, 510.00, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6524, 2, 1, '2024-01-11', '2024-01-11', '', 'AV. REPUBLICA DE PANAMA NRO 3517 INT. 9 URB. EL PALOMAR ', 'F001', 194, 4654, 499.00, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 2, '1', 0, '');
INSERT INTO `ventas` VALUES (6525, 6, 1, '2024-01-12', '2024-01-12', '', '-', 'NV01', 67, 4554, 80.00, '1', '0', 12, 1, '1', 't530 surquillo', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6526, 2, 1, '2024-01-12', '2024-01-12', '', ': AV. ALFREDO BENAVIDES 5330 URB. LAS GARDENIAS ET. UNO INT. 49', 'F001', 195, 4572, 500.00, '1', '1', 12, 1, '1', '', 0.18, 5, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6527, 2, 1, '2024-01-13', '2024-01-13', '', 'INT. 101, AV. ALFREDO BENAVIDES 5384, SANTIAGO DE SURCO 15039, PERú', 'F001', 196, 4605, 90.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6528, 2, 1, '2024-01-14', '2024-01-14', '', 'AV. DE LOS HEROES NRO 188 INT. 225 URB. ENTEL ', 'F001', 197, 4635, 190.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6529, 2, 1, '2024-01-15', '2024-01-15', '', 'AV. SALAVERRY 1883 ---- CERCADO 2DO.PISO,ALT. REST. FIESTAS X EL ESTADIO LAMBAYEQUE-CHICLAYO-CHICLAYO', 'F001', 198, 4559, 280.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6530, 2, 2, '2024-01-15', '2024-01-30', '15', 'AV. SANTUARIO NRO 1323 URB. ZARATE ', 'F001', 199, 4655, 120.00, '2', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6531, 2, 2, '2024-01-15', '2024-01-30', '15', 'AV. SANTUARIO NRO 1323 URB. ZARATE ', 'F001', 200, 4655, 120.01, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6532, 2, 1, '2024-01-15', '2024-01-15', '', ': AV. ALFREDO BENAVIDES 5330 URB. LAS GARDENIAS ET. UNO INT. 49', 'F001', 201, 4572, 120.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6533, 2, 1, '2024-01-15', '2024-01-15', '', 'AV. ALFREDO BENAVIDES NRO 5330 INT. 36 URB. LAS GARDENIAS ET. UNO ', 'F001', 202, 4599, 220.00, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6534, 2, 2, '2024-01-15', '2024-01-30', '15', 'AV. LURIGANCHO NRO 1349 URB. ZARATE ', 'F001', 203, 4577, 579.99, '2', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6535, 2, 2, '2024-01-16', '2024-01-31', '15', 'AV. LURIGANCHO NRO 1349 URB. ZARATE ', 'F001', 204, 4577, 579.99, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6536, 6, 1, '2024-01-15', '2024-01-15', '', '-', 'NV01', 68, 4656, 80.00, '1', '0', 12, 1, '1', '', 0.18, 5, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6537, 2, 1, '2024-01-16', '2024-01-16', '', 'AV. SALAVERRY 1883 ---- CERCADO 2DO.PISO,ALT. REST. FIESTAS X EL ESTADIO LAMBAYEQUE-CHICLAYO-CHICLAYO', 'F001', 205, 4559, 200.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6538, 2, 1, '2024-01-17', '2024-01-17', '', 'AV. CESAR CANEVARO MZA. M LOTE 16 ASC. TREBOL AZUL ', 'F001', 206, 4657, 2507.00, '1', '1', 12, 1, '1', '', 0.18, 3, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6539, 2, 1, '2024-01-17', '2024-01-17', '', 'AV. CESAR CANEVARO MZA. M LOTE 16 ASC. TREBOL AZUL ', 'F001', 207, 4657, 143.00, '1', '1', 12, 1, '1', '', 0.18, 3, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6540, 2, 1, '2024-01-18', '2024-01-18', '', ': AV. ALFREDO BENAVIDES 5330 URB. LAS GARDENIAS ET. UNO INT. 49', 'F001', 208, 4572, 120.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6541, 2, 1, '2024-01-18', '2024-01-18', '', '-', 'F001', 209, 4658, 125.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6542, 2, 1, '2024-01-18', '2024-01-18', '', 'AV. BENAVIDES NRO 5330 INT. 62A URB. LAS GARDENIAS ', 'F001', 210, 4659, 570.00, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 2, '1', 0, '');
INSERT INTO `ventas` VALUES (6543, 2, 2, '2024-01-19', '2024-02-02', '15', 'AV. LURIGANCHO NRO 1349 URB. ZARATE ', 'F001', 211, 4577, 420.00, '2', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6544, 2, 2, '2024-01-19', '2024-02-02', '15', 'AV. LURIGANCHO NRO 1349 URB. ZARATE ', 'F001', 212, 4577, 419.99, '2', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6545, 2, 2, '2024-01-19', '2024-02-03', '15', 'AV. LURIGANCHO NRO 1349 URB. ZARATE ', 'F001', 213, 4577, 419.99, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6546, 6, 1, '2024-01-18', '2024-01-18', '', '-', 'NV01', 69, 4660, 77.00, '1', '0', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6547, 2, 1, '2024-01-20', '2024-01-20', '', 'AV. SALAVERRY 1883 ---- CERCADO 2DO.PISO,ALT. REST. FIESTAS X EL ESTADIO LAMBAYEQUE-CHICLAYO-CHICLAYO', 'F001', 214, 4559, 510.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 2, '1', 0, '');
INSERT INTO `ventas` VALUES (6548, 2, 1, '2024-01-20', '2024-01-20', '', 'AV. PROLONGACION PRIMAVERA NRO 2349 ', 'F001', 215, 4581, 360.00, '1', '1', 12, 1, '1', '', 0.18, 5, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6549, 2, 1, '2024-01-20', '2024-01-20', '', 'AV. CAMINOS DEL INCA NRO 2929 URB. PROLONGACION BENAVIDES ET ', 'F001', 216, 4661, 120.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 2, '1', 0, '');
INSERT INTO `ventas` VALUES (6550, 2, 1, '2024-01-22', '2024-01-22', '', 'AV. CIRCUNVALACIÓN DEL CLUB G NRO 202 DEP. 902 URB. CLUB DE GOLF LOS INCAS ', 'F001', 217, 4662, 90.00, '1', '1', 12, 1, '1', '', 0.18, 5, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6551, 2, 1, '2024-01-22', '2024-01-22', '', 'CAL. SCHELL NRO 343 INT. 604 ', 'F001', 218, 4663, 180.00, '1', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 2, '1', 0, '');
INSERT INTO `ventas` VALUES (6552, 2, 1, '2024-01-25', '2024-01-25', '', '-', 'F001', 219, 4656, 550.00, '2', '1', 12, 1, '1', '', 0.18, 1, '', '1', 12, '', 1, '1', 0, '');
INSERT INTO `ventas` VALUES (6553, 2, 1, '2024-01-25', '2024-01-25', '', '-', 'F001', 220, 4656, 550.00, '1', '1', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 2, '1', 0, '');
INSERT INTO `ventas` VALUES (6554, 6, 1, '2024-01-25', '2024-01-25', '', '-', 'NV01', 70, 4619, 400.00, '1', '0', 12, 1, '0', '', 0.18, 5, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6555, 6, 1, '2024-01-25', '2024-01-25', '', '-', 'NV01', 71, 4665, 160.00, '1', '0', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6556, 6, 1, '2024-01-25', '2024-01-25', '', '-', 'NV01', 72, 4554, 160.00, '1', '0', 12, 1, '1', 'receteo de contadores sr francisco epson 75270', 0.18, 5, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6557, 2, 1, '2024-01-25', '2024-01-25', '', 'JR. SINCHI ROCA MZA. 17H LOTE 01 ', 'F001', 221, 4666, 420.00, '1', '0', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');
INSERT INTO `ventas` VALUES (6558, 2, 1, '2024-01-25', '2024-01-25', '', 'JR. SINCHI ROCA MZA. 17H LOTE 01 ', 'F001', 222, 4666, 250.00, '1', '0', 12, 1, '1', '', 0.18, 12, '', '1', 12, '', 1, '', 0, '');

-- ----------------------------
-- Table structure for ventas_anuladas
-- ----------------------------
DROP TABLE IF EXISTS `ventas_anuladas`;
CREATE TABLE `ventas_anuladas`  (
  `id_venta` int(11) NOT NULL,
  `fecha` date NULL DEFAULT NULL,
  `motivo` varchar(245) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_venta`) USING BTREE,
  CONSTRAINT `fk_ventas_anuladas_ventas1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ventas_anuladas
-- ----------------------------
INSERT INTO `ventas_anuladas` VALUES (6299, '2023-11-06', '-');
INSERT INTO `ventas_anuladas` VALUES (6300, '2023-11-06', '-');
INSERT INTO `ventas_anuladas` VALUES (6301, '2023-11-07', '-');
INSERT INTO `ventas_anuladas` VALUES (6308, '2023-11-07', '-');
INSERT INTO `ventas_anuladas` VALUES (6309, '2023-11-07', '-');
INSERT INTO `ventas_anuladas` VALUES (6313, '2023-11-09', '-');
INSERT INTO `ventas_anuladas` VALUES (6314, '2023-11-09', '-');
INSERT INTO `ventas_anuladas` VALUES (6316, '2023-11-09', '-');
INSERT INTO `ventas_anuladas` VALUES (6341, '2023-11-14', '-');
INSERT INTO `ventas_anuladas` VALUES (6342, '2023-11-14', '-');
INSERT INTO `ventas_anuladas` VALUES (6345, '2023-11-14', '-');
INSERT INTO `ventas_anuladas` VALUES (6347, '2023-11-16', '-');
INSERT INTO `ventas_anuladas` VALUES (6355, '2023-11-18', '-');
INSERT INTO `ventas_anuladas` VALUES (6357, '2023-11-19', '-');
INSERT INTO `ventas_anuladas` VALUES (6362, '2023-11-21', '-');
INSERT INTO `ventas_anuladas` VALUES (6367, '2023-11-21', '-');
INSERT INTO `ventas_anuladas` VALUES (6409, '2023-11-30', '-');
INSERT INTO `ventas_anuladas` VALUES (6410, '2023-11-30', '-');
INSERT INTO `ventas_anuladas` VALUES (6416, '2023-12-01', '-');
INSERT INTO `ventas_anuladas` VALUES (6417, '2023-12-01', '-');
INSERT INTO `ventas_anuladas` VALUES (6418, '2023-12-01', '-');
INSERT INTO `ventas_anuladas` VALUES (6440, '2023-12-08', '-');
INSERT INTO `ventas_anuladas` VALUES (6443, '2023-12-10', '-');
INSERT INTO `ventas_anuladas` VALUES (6457, '2023-12-13', '-');
INSERT INTO `ventas_anuladas` VALUES (6458, '2023-12-13', '-');
INSERT INTO `ventas_anuladas` VALUES (6462, '2023-12-14', '-');
INSERT INTO `ventas_anuladas` VALUES (6469, '2023-12-16', '-');
INSERT INTO `ventas_anuladas` VALUES (6470, '2023-12-16', '-');
INSERT INTO `ventas_anuladas` VALUES (6475, '2023-12-19', '-');
INSERT INTO `ventas_anuladas` VALUES (6486, '2023-12-20', '-');
INSERT INTO `ventas_anuladas` VALUES (6499, '2023-12-27', '-');
INSERT INTO `ventas_anuladas` VALUES (6501, '2023-12-27', '-');
INSERT INTO `ventas_anuladas` VALUES (6512, '2024-01-06', '-');
INSERT INTO `ventas_anuladas` VALUES (6530, '2024-01-15', '-');
INSERT INTO `ventas_anuladas` VALUES (6534, '2024-01-15', '-');
INSERT INTO `ventas_anuladas` VALUES (6543, '2024-01-18', '-');
INSERT INTO `ventas_anuladas` VALUES (6544, '2024-01-18', '-');
INSERT INTO `ventas_anuladas` VALUES (6552, '2024-01-25', '-');

-- ----------------------------
-- Table structure for ventas_referencias
-- ----------------------------
DROP TABLE IF EXISTS `ventas_referencias`;
CREATE TABLE `ventas_referencias`  (
  `id_venta` int(11) NOT NULL,
  `id_referencia` int(11) NOT NULL,
  `id_motivo` int(11) NOT NULL,
  PRIMARY KEY (`id_venta`) USING BTREE,
  INDEX `fk_ventas_referencias_ventas2_idx`(`id_referencia`) USING BTREE,
  INDEX `fk_ventas_referencias_motivo_documento1_idx`(`id_motivo`) USING BTREE,
  CONSTRAINT `fk_ventas_referencias_motivo_documento1` FOREIGN KEY (`id_motivo`) REFERENCES `motivo_documento` (`id_motivo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ventas_referencias_ventas1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ventas_referencias_ventas2` FOREIGN KEY (`id_referencia`) REFERENCES `ventas` (`id_venta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ventas_referencias
-- ----------------------------

-- ----------------------------
-- Table structure for ventas_servicios
-- ----------------------------
DROP TABLE IF EXISTS `ventas_servicios`;
CREATE TABLE `ventas_servicios`  (
  `id_venta` int(11) NOT NULL AUTO_INCREMENT,
  `id_item` int(11) NOT NULL,
  `descripcion` varchar(245) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `monto` double(8, 2) NOT NULL,
  `cantidad` double(9, 2) NOT NULL,
  `codsunat` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_venta`, `id_item`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ventas_servicios
-- ----------------------------

-- ----------------------------
-- Table structure for ventas_sunat
-- ----------------------------
DROP TABLE IF EXISTS `ventas_sunat`;
CREATE TABLE `ventas_sunat`  (
  `id_venta` int(11) NOT NULL,
  `hash` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `nombre_xml` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `qr_data` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_venta`) USING BTREE,
  CONSTRAINT `fk_ventas_sunat_ventas1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ventas_sunat
-- ----------------------------
INSERT INTO `ventas_sunat` VALUES (6299, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6300, 'JuOafYWgRgPiOq5YZJ/ZnTPoX08=', '20611556960-01-F001-40', '20611556960|03|F001-40|83.90|550.00|2023-11-06|06|10408695924');
INSERT INTO `ventas_sunat` VALUES (6301, 'Ax5tOxnEyF0ehDrKFo7Ut7Ok6+0=', '20611556960-01-F001-41', '20611556960|03|F001-41|83.90|550.00|2023-11-06|06|15610268878');
INSERT INTO `ventas_sunat` VALUES (6302, 'mlx+BxgOkDpAmZDYK9CHHu6YE38=', '20611556960-01-F001-42', '20611556960|03|F001-42|67.12|440.00|2023-11-06|06|20610079581');
INSERT INTO `ventas_sunat` VALUES (6303, 'vGZWTQ8cZ863aUspkxCq/8O7/5w=', '20611556960-01-F001-43', '20611556960|03|F001-43|48.81|320.00|2023-11-06|06|10249994702');
INSERT INTO `ventas_sunat` VALUES (6308, 'OR+xrvqRh3k9DhrJeswQW7Cvw44=', '20611556960-01-F001-44', '20611556960|03|F001-44|83.90|550.00|2023-11-07|06|10408695924');
INSERT INTO `ventas_sunat` VALUES (6309, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6310, 'h9lN9wWqA91xiP19Cm76an+pRKc=', '20611556960-01-F001-45', '20611556960|03|F001-45|317.14|2079.00|2023-11-07|06|15610268878');
INSERT INTO `ventas_sunat` VALUES (6311, 'piXOOpUNKKVLStX3yDp+LjoAbkI=', '20611556960-01-F001-46', '20611556960|03|F001-46|126.31|828.00|2023-11-07|06|20480731582');
INSERT INTO `ventas_sunat` VALUES (6312, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6313, '3wa+iGIqw+tMPXOEbWNTmYyKDpM=', '20611556960-01-F001-47', '20611556960|03|F001-47|48.81|320.00|2023-11-08|06|20566397561');
INSERT INTO `ventas_sunat` VALUES (6314, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6315, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6316, '0m85dPczO1NaDyDC//oRytZg0NU=', '20611556960-01-F001-48', '20611556960|03|F001-48|7.02|46.00|2023-11-09|06|20555827424');
INSERT INTO `ventas_sunat` VALUES (6317, 'jSl6cb5CjDZvaqo44t5bjPI0bRE=', '20611556960-01-F001-49', '20611556960|03|F001-49|7.02|46.00|2023-11-09|06|20555827424');
INSERT INTO `ventas_sunat` VALUES (6318, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6319, 'mqfzQbVZh14LZ4s979AA8hPUkuM=', '20611556960-01-F001-50', '20611556960|03|F001-50|61.02|400.00|2023-11-09|06|10413720848');
INSERT INTO `ventas_sunat` VALUES (6320, 'KC3pG5a1cZRzlAr9czHvVHiz8Ac=', '20611556960-01-F001-51', '20611556960|03|F001-51|54.92|360.00|2023-11-09|06|10445913079');
INSERT INTO `ventas_sunat` VALUES (6321, 'NRTyHnKzw+gBAOmW5MDsClrtpgs=', '20611556960-01-F001-52', '20611556960|03|F001-52|57.20|375.00|2023-11-09|06|10412751073');
INSERT INTO `ventas_sunat` VALUES (6322, 'CGCd5gbyhpnPepzVpAREwMlVXGM=', '20611556960-01-F001-53', '20611556960|03|F001-53|85.42|560.00|2023-11-09|06|10103970844');
INSERT INTO `ventas_sunat` VALUES (6323, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6324, 'NJQD/ggW+Yuuq4xsHfb8Hpb8wfo=', '20611556960-01-F001-54', '20611556960|03|F001-54|13.73|90.00|2023-11-10|06|10405687947');
INSERT INTO `ventas_sunat` VALUES (6325, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6326, 'X7AuuIDoMSZy5Lda/oj+R+oNHUs=', '20611556960-01-F001-55', '20611556960|03|F001-55|88.63|581.00|2023-11-10|06|20480731582');
INSERT INTO `ventas_sunat` VALUES (6327, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6328, 'wRrxGIsE4vHWvRX2HMb6XuXmmHM=', '20611556960-01-F001-56', '20611556960|03|F001-56|83.90|550.00|2023-11-10|06|10408981854');
INSERT INTO `ventas_sunat` VALUES (6329, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6330, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6331, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6332, 'nw1FDMJchnT296qp3oPxY/zsu1k=', '20611556960-01-F001-57', '20611556960|03|F001-57|18.31|120.00|2023-11-13|06|10104340429');
INSERT INTO `ventas_sunat` VALUES (6333, 'LGU+38ykhL/ZRTEYxl8DUgF4jaM=', '20611556960-01-F001-58', '20611556960|03|F001-58|7.93|52.00|2023-11-13|06|20555827424');
INSERT INTO `ventas_sunat` VALUES (6334, 'n86mH+q4m9kKrmZZslfAo4OHI34=', '20611556960-01-F001-59', '20611556960|03|F001-59|21.36|140.00|2023-11-14|06|10099348912');
INSERT INTO `ventas_sunat` VALUES (6335, 'dyQ1gsrzVFeB8aGywJMr85eTMEA=', '20611556960-01-F001-60', '20611556960|03|F001-60|12.20|80.00|2023-11-14|06|10103970844');
INSERT INTO `ventas_sunat` VALUES (6336, 'rlFvt1GxWip1numRYLHdAGpL3bU=', '20611556960-01-F001-61', '20611556960|03|F001-61|30.51|200.00|2023-11-14|06|10099348912');
INSERT INTO `ventas_sunat` VALUES (6337, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6338, 'huh2yOZwwVjtDcxzzUag1HZpTu0=', '20611556960-01-F001-62', '20611556960|03|F001-62|7.63|50.00|2023-11-14|06|10406149078');
INSERT INTO `ventas_sunat` VALUES (6339, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6340, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6341, 'oorh9ypz8vhk9cItaQzxD0Qxilg=', '20611556960-01-F001-63', '20611556960|03|F001-63|153.31|1005.00|2023-11-14|06|20609073251');
INSERT INTO `ventas_sunat` VALUES (6342, 'DWbG5ScJj/WVCOXL58p5dc0sPLA=', '20611556960-01-F001-64', '20611556960|03|F001-64|153.31|1005.00|2023-11-14|06|20609073251');
INSERT INTO `ventas_sunat` VALUES (6343, 'JBZeSxHoLn5mvSzE3CC1elY0Ohs=', '20611556960-01-F001-65', '20611556960|03|F001-65|153.31|1005.00|2023-11-14|06|20609073251');
INSERT INTO `ventas_sunat` VALUES (6344, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6345, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6346, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6347, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6348, '+tMLWacqb4pCEMKt8LlfcACnILg=', '20611556960-01-F001-66', '20611556960|03|F001-66|19.07|125.00|2023-11-16|06|10412751073');
INSERT INTO `ventas_sunat` VALUES (6349, 'GXmipc3geAfZkPUqYQ5j3Y3p0MM=', '20611556960-01-F001-67', '20611556960|03|F001-67|24.41|160.00|2023-11-16|06|10413613847');
INSERT INTO `ventas_sunat` VALUES (6350, 'B4GYxhbPn1uagt6CcN6wA3KHXzs=', '20611556960-01-F001-68', '20611556960|03|F001-68|34.32|225.00|2023-11-16|06|10417854261');
INSERT INTO `ventas_sunat` VALUES (6351, 'J3Gb2IS1bI4eKcsV6Qstxqbc+QA=', '20611556960-01-F001-69', '20611556960|03|F001-69|62.19|407.67|2023-11-16|06|20601897246');
INSERT INTO `ventas_sunat` VALUES (6352, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6353, 'vYtQycACpc9gzFmQX33WZmIU1hE=', '20611556960-01-F001-70', '20611556960|03|F001-70|139.97|917.60|2023-11-16|06|20556947962');
INSERT INTO `ventas_sunat` VALUES (6354, '0J9D9cdXw6VM6wcN34GQZLnYp2A=', '20611556960-01-F001-71', '20611556960|03|F001-71|327.28|2145.50|2023-11-18|06|10464712491');
INSERT INTO `ventas_sunat` VALUES (6355, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6356, '8pNr05pr3pKEezA7cIKL1X2Wddw=', '20611556960-01-F001-72', '20611556960|03|F001-72|300.63|1970.80|2023-11-18|06|10033553591');
INSERT INTO `ventas_sunat` VALUES (6357, 'zBrsIgx5te3jGV+36kjViY+/Vms=', '20611556960-01-F001-73', '20611556960|03|F001-73|83.90|550.00|2023-11-18|06|10200164453');
INSERT INTO `ventas_sunat` VALUES (6358, '4otTkw2ui6dJxd/oMlj61fwIhqc=', '20611556960-01-F001-74', '20611556960|03|F001-74|9.15|60.00|2023-11-18|06|10200164453');
INSERT INTO `ventas_sunat` VALUES (6359, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6360, '3C2q8H9tXwoMtoVbzWEO3Hr8a/c=', '20611556960-01-F001-75', '20611556960|03|F001-75|83.90|550.00|2023-11-20|06|10200164453');
INSERT INTO `ventas_sunat` VALUES (6361, 'LDwyNJUsnozYQBpJvkwATE5nRBo=', '20611556960-01-F001-76', '20611556960|03|F001-76|22.88|150.00|2023-11-20|06|10420078311');
INSERT INTO `ventas_sunat` VALUES (6362, 'UURSfBXNbmbQBYxw2szlzS+x+ic=', '20611556960-01-F001-77', '20611556960|03|F001-77|79.32|520.00|2023-11-21|06|10036813062');
INSERT INTO `ventas_sunat` VALUES (6363, 'PuxsJqqlFXOwfFsygl+QuTgRYiQ=', '20611556960-01-F001-78', '20611556960|03|F001-78|61.02|400.00|2023-11-21|06|10096180671');
INSERT INTO `ventas_sunat` VALUES (6364, 'HYwwWRk5NKOx57wZOp4FwopqugA=', '20611556960-01-F001-79', '20611556960|03|F001-79|299.75|1965.00|2023-11-21|06|10036813062');
INSERT INTO `ventas_sunat` VALUES (6365, 'PQsg5CGtbqiw6hqotrf6NwZVvd4=', '20611556960-01-F001-80', '20611556960|03|F001-80|170.85|1120.00|2023-11-21|06|20537189658');
INSERT INTO `ventas_sunat` VALUES (6366, 'NpIP16z6i/Uh5tfn11Ch8Pw0SlY=', '20611556960-01-F001-81', '20611556960|03|F001-81|158.64|1040.00|2023-11-21|06|20423925028');
INSERT INTO `ventas_sunat` VALUES (6367, 'VReW8FGDtmsVOZOlAwX4nARjEr4=', '20611556960-01-F001-82', '20611556960|03|F001-82|724.58|4750.00|2023-11-21|06|20601598125');
INSERT INTO `ventas_sunat` VALUES (6368, 'ywcIDkb1rbMIaIFJgrk/o8CBXD0=', '20611556960-01-F001-83', '20611556960|03|F001-83|724.58|4750.00|2023-11-21|06|20601598125');
INSERT INTO `ventas_sunat` VALUES (6369, 'WWz730a428c7khOcdmAkGS2c918=', '20611556960-01-F001-84', '20611556960|03|F001-84|6.10|40.00|2023-11-21|06|20423925028');
INSERT INTO `ventas_sunat` VALUES (6370, '7pHAPbHt1rhVXQK7hDRfBzaZUtc=', '20611556960-01-F001-85', '20611556960|03|F001-85|1605.89|10527.50|2023-11-21|06|10769846773');
INSERT INTO `ventas_sunat` VALUES (6371, 'voNtD94JJ+ZKLtmkh9+FJLbAnrM=', '20611556960-01-F001-86', '20611556960|03|F001-86|83.90|550.00|2023-11-22|06|20604444315');
INSERT INTO `ventas_sunat` VALUES (6372, 'vwZfPUaMy1iZdKMOmGFTgGcKfSM=', '20611556960-01-F001-87', '20611556960|03|F001-87|99.67|653.39|2023-11-22|06|10417854261');
INSERT INTO `ventas_sunat` VALUES (6373, 'dZpfAf10OMHcgUx4qf2rhcFZK7w=', '20611556960-01-F001-88', '20611556960|03|F001-88|131.11|859.50|2023-11-23|06|10081976193');
INSERT INTO `ventas_sunat` VALUES (6374, 'wlhQSOXC4TMaViDQ+2VjzF1xoVc=', '20611556960-01-F001-89', '20611556960|03|F001-89|61.70|404.46|2023-11-23|06|10427599162');
INSERT INTO `ventas_sunat` VALUES (6375, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6376, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6377, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6378, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6379, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6380, 'slweKoSKeF1LE2NZoCvsoND6Gd8=', '20611556960-01-F001-90', '20611556960|03|F001-90|24.41|160.00|2023-11-23|06|20473912962');
INSERT INTO `ventas_sunat` VALUES (6381, 'Zg0Kh1Ye0M668CzL+nKUTThBOZs=', '20611556960-01-F001-91', '20611556960|03|F001-91|85.42|560.00|2023-11-23|06|10099348912');
INSERT INTO `ventas_sunat` VALUES (6382, '6tK5pslYa9yXshYp1s5vgOMDEcY=', '20611556960-01-F001-92', '20611556960|03|F001-92|36.61|240.00|2023-11-24|06|10415760847');
INSERT INTO `ventas_sunat` VALUES (6383, '6C2fd2DEoMe9HO81JUNX9qvdEtk=', '20611556960-01-F001-93', '20611556960|03|F001-93|45.76|300.00|2023-11-24|06|10103970844');
INSERT INTO `ventas_sunat` VALUES (6384, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6385, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6386, 'vCLZCuRUX2L+guiuSqwBAi2CFsI=', '20611556960-01-F001-94', '20611556960|03|F001-94|10.07|66.00|2023-11-24|06|20480731582');
INSERT INTO `ventas_sunat` VALUES (6387, '7T1moOTXHxANJsdg/J4q/HGlwrU=', '20611556960-01-F001-95', '20611556960|03|F001-95|51.86|340.00|2023-11-24|06|20602279945');
INSERT INTO `ventas_sunat` VALUES (6388, '6lzZ7WF2hj0Hb+8cmMK8nzBNKHY=', '20611556960-01-F001-96', '20611556960|03|F001-96|39.66|260.00|2023-11-24|06|10445913079');
INSERT INTO `ventas_sunat` VALUES (6389, 'egSyR0U+8dCosQSLjZm2Wqk7AwI=', '20611556960-01-F001-97', '20611556960|03|F001-97|319.65|2095.50|2023-11-25|06|20604089566');
INSERT INTO `ventas_sunat` VALUES (6390, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6391, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6392, 'W/4UPSs+dF31erRRO2bCu6zRAis=', '20611556960-01-F001-98', '20611556960|03|F001-98|183.05|1200.00|2023-11-25|06|10103970844');
INSERT INTO `ventas_sunat` VALUES (6393, 'cRlRqEJ4sx3EWn8Enup/lnCnSqA=', '20611556960-01-F001-99', '20611556960|03|F001-99|7.63|50.00|2023-11-26|06|10103970844');
INSERT INTO `ventas_sunat` VALUES (6394, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6395, '+nATl5AsmsGUJhdonzNOqhfXm5k=', '20611556960-01-F001-100', '20611556960|03|F001-100|36.61|240.00|2023-11-26|06|20553982759');
INSERT INTO `ventas_sunat` VALUES (6396, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6397, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6398, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6399, 'uHNBOtJujd+PiXG2z+WHsDIF434=', '20611556960-03-B001-1', '20611556960|03|B001-1|316.30|2073.50|2023-11-29|1|25768949');
INSERT INTO `ventas_sunat` VALUES (6400, 'seK+veRL326DUPOzg4VYRXGOkzY=', '20611556960-01-F001-101', '20611556960|03|F001-101|13.73|90.00|2023-11-29|06|10431947876');
INSERT INTO `ventas_sunat` VALUES (6401, 'eiJ5IjY9FN7/JQy6yx8A376UFoY=', '20611556960-01-F001-102', '20611556960|03|F001-102|12.20|80.00|2023-11-29|06|10431947876');
INSERT INTO `ventas_sunat` VALUES (6402, 'jJS2KCL/nCfiN7UttUSU0eGK7yg=', '20611556960-01-F001-103', '20611556960|03|F001-103|27.46|180.00|2023-11-29|06|20603641761');
INSERT INTO `ventas_sunat` VALUES (6403, 'KpzfHHDOiEqi5TrwU1GdFvR+FIY=', '20611556960-01-F001-104', '20611556960|03|F001-104|24.41|160.00|2023-11-29|06|20601442648');
INSERT INTO `ventas_sunat` VALUES (6404, 'ZCXzh2rJyzy8fr7BKiNk6vXAHaY=', '20611556960-01-F001-105', '20611556960|03|F001-105|12.20|80.00|2023-11-30|06|10484431341');
INSERT INTO `ventas_sunat` VALUES (6405, 'bnXCoj5CmJco/dhb3U6V7g9fevM=', '20611556960-01-F001-106', '20611556960|03|F001-106|4.58|30.00|2023-11-30|06|10416124898');
INSERT INTO `ventas_sunat` VALUES (6406, 'qDN3z41v8jDwI215f59gx+O3SeQ=', '20611556960-01-F001-107', '20611556960|03|F001-107|33.56|220.00|2023-11-30|06|20602279945');
INSERT INTO `ventas_sunat` VALUES (6407, 'db4BMtvlHi657QD/7r8a6r/ogio=', '20611556960-01-F001-108', '20611556960|03|F001-108|18.31|120.00|2023-11-30|06|10724977818');
INSERT INTO `ventas_sunat` VALUES (6408, '+LRRdDAvENl+dT8tLT9NI2+y42I=', '20611556960-01-F001-109', '20611556960|03|F001-109|795.77|5216.74|2023-11-30|06|10448924772');
INSERT INTO `ventas_sunat` VALUES (6409, '0/qkkt7CIVx1OJFgVF5WdoVqGOE=', '20611556960-01-F001-110', '20611556960|03|F001-110|83.90|550.00|2023-11-30|06|10103970844');
INSERT INTO `ventas_sunat` VALUES (6410, 'pL1B290ymoU5hSY6QZ+ORpuiAAg=', '20611556960-01-F001-111', '20611556960|03|F001-111|83.90|550.00|2023-11-30|06|10103970844');
INSERT INTO `ventas_sunat` VALUES (6411, 'OE0ydNC4lfJ1CJ4W56FNH7/kWro=', '20611556960-01-F001-112', '20611556960|03|F001-112|83.90|550.00|2023-11-30|06|10103970844');
INSERT INTO `ventas_sunat` VALUES (6412, 'uroNiwgyY8+QxCWPcVswAOOicDI=', '20611556960-01-F001-113', '20611556960|03|F001-113|90.00|590.00|2023-11-30|06|10103970844');
INSERT INTO `ventas_sunat` VALUES (6413, 'SKYni5R2ghn5IntvGC46eK65RTk=', '20611556960-01-F001-114', '20611556960|03|F001-114|68.64|450.00|2023-11-30|06|20609073251');
INSERT INTO `ventas_sunat` VALUES (6414, 'Vh1Cgh/P6OfcUq6eSGysIXZQuWU=', '20611556960-01-F001-115', '20611556960|03|F001-115|315.46|2068.00|2023-11-30|06|10427599162');
INSERT INTO `ventas_sunat` VALUES (6415, '0B6TMwPCuiG9fMAUFvg+pkYwrWg=', '20611556960-01-F001-116', '20611556960|03|F001-116|41.19|270.00|2023-12-01|06|10089206796');
INSERT INTO `ventas_sunat` VALUES (6416, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6417, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6418, 'XCgGsZ0iiekD6xgCBp6NkA4rH9g=', '20611556960-01-F001-117', '20611556960|03|F001-117|24.41|160.00|2023-12-01|06|10408695924');
INSERT INTO `ventas_sunat` VALUES (6419, 'YbrJ1GnCOeVznw1ya7HWsCW666Y=', '20611556960-01-F001-118', '20611556960|03|F001-118|41.19|270.00|2023-12-02|06|10089206796');
INSERT INTO `ventas_sunat` VALUES (6420, '2arSYrNLoZbsLKJwsjeYF3vG894=', '20611556960-01-F001-119', '20611556960|03|F001-119|330.71|2168.00|2023-12-04|06|20600116275');
INSERT INTO `ventas_sunat` VALUES (6421, 'u/SIUVdQ4yJMOVKNl9el0ft2Z80=', '20611556960-01-F001-120', '20611556960|03|F001-120|85.42|560.00|2023-12-04|06|10096180671');
INSERT INTO `ventas_sunat` VALUES (6422, 'SJkVgER4/JCR3zdGwJ/E8a+EZ9w=', '20611556960-01-F001-121', '20611556960|03|F001-121|31.27|205.00|2023-12-04|06|10406143614');
INSERT INTO `ventas_sunat` VALUES (6423, 'iTpv9CQhKiQasZak9yIlr1agelA=', '20611556960-01-F001-122', '20611556960|03|F001-122|38.14|250.00|2023-12-04|06|10750780381');
INSERT INTO `ventas_sunat` VALUES (6424, 'rp3U3q66vHcfG470kp8JWHyaMLM=', '20611556960-01-F001-123', '20611556960|03|F001-123|54.92|360.00|2023-12-04|06|10415822117');
INSERT INTO `ventas_sunat` VALUES (6425, 'CsU6tKYc/ME6l46WN+V8HDwgIgM=', '20611556960-01-F001-124', '20611556960|03|F001-124|106.78|700.00|2023-12-04|06|20608970577');
INSERT INTO `ventas_sunat` VALUES (6426, 'FHnrDMUttAJjN9rbYhk4qa4U3KM=', '20611556960-01-F001-125', '20611556960|03|F001-125|57.20|375.00|2023-12-05|06|10417854261');
INSERT INTO `ventas_sunat` VALUES (6427, 'feow1i/wwbjO8El9xK079ofxUJY=', '20611556960-01-F001-126', '20611556960|03|F001-126|73.22|480.00|2023-12-05|06|20604119627');
INSERT INTO `ventas_sunat` VALUES (6428, 'g/1XtqtGF+aDFN1vT0xu9TL1i3U=', '20611556960-01-F001-127', '20611556960|03|F001-127|61.86|405.53|2023-12-05|06|10427599162');
INSERT INTO `ventas_sunat` VALUES (6429, 'CDM0rvNE/KKH0v1neNBcQ6WeNk8=', '20611556960-01-F001-128', '20611556960|03|F001-128|327.20|2145.00|2023-12-05|06|10754182780');
INSERT INTO `ventas_sunat` VALUES (6430, 'GXuhpXMVXZno51lHygAyADmgL5c=', '20611556960-01-F001-129', '20611556960|03|F001-129|317.14|2079.00|2023-12-05|06|20609941376');
INSERT INTO `ventas_sunat` VALUES (6431, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6432, 'FKb12urWOjay4sF6kdmsYtKamLg=', '20611556960-01-F001-130', '20611556960|03|F001-130|36.61|240.00|2023-12-05|06|10100218301');
INSERT INTO `ventas_sunat` VALUES (6433, 'PHywv/0QShQQ3Ngr9sib/7iAqlE=', '20611556960-01-F001-131', '20611556960|03|F001-131|13.73|90.00|2023-12-05|06|20603965338');
INSERT INTO `ventas_sunat` VALUES (6434, '7vXW8Fr/bhoApIJIRFb7VBsFNZM=', '20611556960-01-F001-132', '20611556960|03|F001-132|13.73|90.00|2023-12-05|06|10419928548');
INSERT INTO `ventas_sunat` VALUES (6435, 'XvxMVDTR/p6tOuQy2b1n8TwIaLs=', '20611556960-01-F001-133', '20611556960|03|F001-133|48.81|320.00|2023-12-06|06|10408981854');
INSERT INTO `ventas_sunat` VALUES (6436, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6437, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6438, 'NB2aFKK2O6Ti7hgneJUJvSVV8Nw=', '20611556960-01-F001-134', '20611556960|03|F001-134|64.24|421.10|2023-12-06|06|20605854002');
INSERT INTO `ventas_sunat` VALUES (6439, '+682fDzvSIosYywGUkzVrE3alVY=', '20611556960-01-F001-135', '20611556960|03|F001-135|330.56|2167.00|2023-12-08|06|20609286351');
INSERT INTO `ventas_sunat` VALUES (6440, 'mZRXUbbA3GUzdq/CCDpvWXw2rNg=', '20611556960-01-F001-136', '20611556960|03|F001-136|64.07|420.00|2023-12-08|06|10076297423');
INSERT INTO `ventas_sunat` VALUES (6441, '0VitjPELuY21G9bvXOpgr0E44y4=', '20611556960-01-F001-137', '20611556960|03|F001-137|64.07|420.00|2023-12-08|06|10076297423');
INSERT INTO `ventas_sunat` VALUES (6442, 'b8NW3XnOo/9f3fcLn86EcItWprY=', '20611556960-01-F001-138', '20611556960|03|F001-138|41.19|270.00|2023-12-09|06|10417854261');
INSERT INTO `ventas_sunat` VALUES (6443, 'Jp2LGk5kcZpXaTBMd5F1PuBRdsA=', '20611556960-01-F001-139', '20611556960|03|F001-139|27.46|180.00|2023-12-09|06|10417854261');
INSERT INTO `ventas_sunat` VALUES (6444, 'BN7XyCkLKokBbbmWBibpSzFfuw4=', '20611556960-01-F001-140', '20611556960|03|F001-140|36.61|240.00|2023-12-09|06|10077045193');
INSERT INTO `ventas_sunat` VALUES (6445, 'NO5B9Y2NkftjoR4HgHDwPCUo3Kk=', '20611556960-01-F001-141', '20611556960|03|F001-141|18.31|120.00|2023-12-11|06|10099348912');
INSERT INTO `ventas_sunat` VALUES (6446, '1398vhynkWPoP8yuje0qaaZPP18=', '20611556960-01-F001-142', '20611556960|03|F001-142|44.24|290.00|2023-12-11|06|10099348912');
INSERT INTO `ventas_sunat` VALUES (6447, 'um6YsdBiozOhhDsR8oO8qpVWZhQ=', '20611556960-01-F001-143', '20611556960|03|F001-143|54.92|360.00|2023-12-11|06|20602279945');
INSERT INTO `ventas_sunat` VALUES (6448, '/ypwhk6XhW3Cdt52dqCRprLwvFc=', '20611556960-01-F001-144', '20611556960|03|F001-144|54.92|360.00|2023-12-11|06|10099348912');
INSERT INTO `ventas_sunat` VALUES (6449, 'dXO8C2lpm78nWWN8u9ZKRwidNZE=', '20611556960-01-F001-145', '20611556960|03|F001-145|36.61|240.00|2023-12-11|06|20550040132');
INSERT INTO `ventas_sunat` VALUES (6450, 'BIk+oK7yUGXewwtNHQW19AvVFVs=', '20611556960-01-F001-146', '20611556960|03|F001-146|7.63|50.00|2023-12-11|06|10406149078');
INSERT INTO `ventas_sunat` VALUES (6451, '9qrKDRqobzG+4a/wyDbXpHqxy+U=', '20611556960-01-F001-147', '20611556960|03|F001-147|2202.71|14440.00|2023-12-12|06|20604089566');
INSERT INTO `ventas_sunat` VALUES (6452, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6453, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6454, 'QPEIP5bKy7oVVVMYdL2AflJcJUQ=', '20611556960-01-F001-148', '20611556960|03|F001-148|83.90|550.00|2023-12-12|06|20608436376');
INSERT INTO `ventas_sunat` VALUES (6455, '6HpM4cABWsIk1zLLkFAITVHRQyM=', '20611556960-01-F001-149', '20611556960|03|F001-149|19.07|125.00|2023-12-12|06|10417854261');
INSERT INTO `ventas_sunat` VALUES (6456, 'aTTuPUHym9wznPYiRjN6n/AsxH0=', '20611556960-01-F001-150', '20611556960|03|F001-150|39.66|260.00|2023-12-12|06|20601598125');
INSERT INTO `ventas_sunat` VALUES (6457, '1j0JNONAJS4IDXYVYoaGWmbMw5A=', '20611556960-01-F001-151', '20611556960|03|F001-151|112.88|740.00|2023-12-13|06|20600851897');
INSERT INTO `ventas_sunat` VALUES (6458, '+ox5t5T81ZKHZXXE4pzY36AQDNk=', '20611556960-01-F001-152', '20611556960|03|F001-152|112.88|740.00|2023-12-13|06|20600851897');
INSERT INTO `ventas_sunat` VALUES (6459, 'w8Ex3Tzu923NcGeL8uOXc8VYZm8=', '20611556960-01-F001-153', '20611556960|03|F001-153|430.08|2819.40|2023-12-13|06|20600851897');
INSERT INTO `ventas_sunat` VALUES (6460, 'epi/TFLwx7+U7Ed+gqpVC+2mZOA=', '20611556960-01-F001-154', '20611556960|03|F001-154|91.53|600.00|2023-12-14|06|20515512901');
INSERT INTO `ventas_sunat` VALUES (6461, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6462, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6463, '1XA2lGv93TaV9FjJFQkRTWmT4Uc=', '20611556960-01-F001-155', '20611556960|03|F001-155|7.63|50.00|2023-12-14|06|10406149078');
INSERT INTO `ventas_sunat` VALUES (6464, 'u+FULFKrdool2WaJFPRffnjkQ14=', '20611556960-01-F001-156', '20611556960|03|F001-156|64.07|420.00|2023-12-14|06|20114035735');
INSERT INTO `ventas_sunat` VALUES (6465, '3fMR4o2fCKzQRSsZRPEec4hjRG8=', '20611556960-01-F001-157', '20611556960|03|F001-157|36.61|240.00|2023-12-14|06|20512779370');
INSERT INTO `ventas_sunat` VALUES (6466, 'LZr+crkSdg2sca196pdvR+0mx14=', '20611556960-01-F001-158', '20611556960|03|F001-158|12.20|80.00|2023-12-14|06|10413613847');
INSERT INTO `ventas_sunat` VALUES (6467, 'hx0gY3yNNH4xrGIUUCFAajrBMHQ=', '20611556960-01-F001-159', '20611556960|03|F001-159|61.02|400.00|2023-12-14|06|10464712491');
INSERT INTO `ventas_sunat` VALUES (6468, '1walpFhm1YceONzETtshqw7LMfw=', '20611556960-01-F001-160', '20611556960|03|F001-160|53.39|350.00|2023-12-14|06|20515512901');
INSERT INTO `ventas_sunat` VALUES (6469, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6470, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6471, '5JvvGwRYn4QmjuudyfxRcR9ZsyY=', '20611556960-01-F001-161', '20611556960|03|F001-161|24.41|160.00|2023-12-16|06|10420078311');
INSERT INTO `ventas_sunat` VALUES (6472, 'Ph3ZA43Fo6AdWNhQqvbki1jFzSU=', '20611556960-01-F001-162', '20611556960|03|F001-162|317.90|2084.00|2023-12-16|06|10096180671');
INSERT INTO `ventas_sunat` VALUES (6473, 'UfYxrQPcBOy/z+kUyeWQHTZiFjQ=', '20611556960-01-F001-163', '20611556960|03|F001-163|114.41|750.00|2023-12-16|06|10417854261');
INSERT INTO `ventas_sunat` VALUES (6474, 'YEk+2t+J1mj3bm2WSmO7p8acOaA=', '20611556960-01-F001-164', '20611556960|03|F001-164|85.42|560.00|2023-12-18|06|10435697858');
INSERT INTO `ventas_sunat` VALUES (6475, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6476, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6477, 'lnokJskUPmwiaGi/uOr7TgUbVcs=', '20611556960-01-F001-165', '20611556960|03|F001-165|28.98|190.00|2023-12-20|06|20601553598');
INSERT INTO `ventas_sunat` VALUES (6478, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6479, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6480, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6481, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6482, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6483, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6484, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6485, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6486, 'RxBT2LRub+kjoqIGmLKdsXpuL+I=', '20611556960-01-F001-166', '20611556960|03|F001-166|209.29|1372.00|2023-12-20|06|20604119627');
INSERT INTO `ventas_sunat` VALUES (6487, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6488, 'NJ+avU54furo+OGcCsw+RDVYc4E=', '20611556960-01-F001-167', '20611556960|03|F001-167|45.00|295.00|2023-12-21|06|20423925028');
INSERT INTO `ventas_sunat` VALUES (6489, 'gk4D4Gd2jvvG5FjD8G8xe1UKb/U=', '20611556960-01-F001-168', '20611556960|03|F001-168|314.62|2062.50|2023-12-21|06|20601442648');
INSERT INTO `ventas_sunat` VALUES (6490, '+9yZZ56iJcEYbLnb0Ceruf5H6gM=', '20611556960-01-F001-169', '20611556960|03|F001-169|68.64|450.00|2023-12-22|06|10258533696');
INSERT INTO `ventas_sunat` VALUES (6491, '/dgomDyY06cw7Qn94BU29K66SIo=', '20611556960-01-F001-170', '20611556960|03|F001-170|24.41|160.00|2023-12-23|06|20515512901');
INSERT INTO `ventas_sunat` VALUES (6492, 'bxbkZ6HhBGHfNfIYxMP42XQtUbc=', '20611556960-01-F001-171', '20611556960|03|F001-171|22.88|150.00|2023-12-23|06|20513487020');
INSERT INTO `ventas_sunat` VALUES (6493, 'PzbEQ6GwWBKsRgpj0aaB34WuJ5U=', '20611556960-01-F001-172', '20611556960|03|F001-172|36.61|240.00|2023-12-23|06|10099348912');
INSERT INTO `ventas_sunat` VALUES (6494, 'ZN2nR8XL8ITJpY5Lqo83mxDWOeg=', '20611556960-01-F001-173', '20611556960|03|F001-173|33.56|220.00|2023-12-26|06|20602279945');
INSERT INTO `ventas_sunat` VALUES (6495, 'sxccoiWtW1KTWBWiAgzjeoRNJO4=', '20611556960-01-F001-174', '20611556960|03|F001-174|79.32|520.00|2023-12-26|06|10036813062');
INSERT INTO `ventas_sunat` VALUES (6496, '0pXHQUi3ek/HX2R1pu0B88ArPgA=', '20611556960-01-F001-175', '20611556960|03|F001-175|312.94|2051.50|2023-12-26|06|10104210231');
INSERT INTO `ventas_sunat` VALUES (6497, 'WFPnt64RPHT5JmOMY7bgX0twico=', '20611556960-01-F001-176', '20611556960|03|F001-176|36.61|240.00|2023-12-27|06|20609129442');
INSERT INTO `ventas_sunat` VALUES (6498, 'G+bLqjZRQNJ84nPeguJ3EwwagrU=', '20611556960-01-F001-177', '20611556960|03|F001-177|36.61|240.00|2023-12-27|06|10099348912');
INSERT INTO `ventas_sunat` VALUES (6499, '17OH4u4gVsnrJcEpwIFK70mg0Pw=', '20611556960-01-F001-178', '20611556960|03|F001-178|768.13|5035.50|2023-12-27|06|20522954757');
INSERT INTO `ventas_sunat` VALUES (6500, 'W00MnIdvqQp8LHMIQ+GyOe7VCAk=', '20611556960-01-F001-179', '20611556960|03|F001-179|768.13|5035.50|2023-12-27|06|10734835809');
INSERT INTO `ventas_sunat` VALUES (6501, 'ur4xdzfe7InoloV42JvD5q21Q3U=', '20611556960-01-F001-180', '20611556960|03|F001-180|24.41|160.00|2023-12-27|06|10769846773');
INSERT INTO `ventas_sunat` VALUES (6502, 'M2QXxZwIRTxeRrQrLfQSmux1orA=', '20611556960-01-F001-181', '20611556960|03|F001-181|22.88|150.00|2023-12-27|06|10769846773');
INSERT INTO `ventas_sunat` VALUES (6503, 'snRAprkOVZlEn8w0dVM035x0q0o=', '20611556960-01-F001-182', '20611556960|03|F001-182|76.12|499.00|2023-12-28|06|20100340438');
INSERT INTO `ventas_sunat` VALUES (6504, 'Lyr/9vhW4ljhOD6WLgaoNPz+UHs=', '20611556960-01-F001-183', '20611556960|03|F001-183|163.22|1070.00|2023-12-28|06|10036813062');
INSERT INTO `ventas_sunat` VALUES (6505, '6pAqL0ggC0e5NTydqFMsjT/QzjE=', '20611556960-01-F001-184', '20611556960|03|F001-184|18.31|120.00|2023-12-29|06|10722366803');
INSERT INTO `ventas_sunat` VALUES (6506, 'ZLBPbbTHJwIFwfao4HOgP1Clz/s=', '20611556960-01-F001-185', '20611556960|03|F001-185|18.31|120.00|2024-01-03|06|20601553598');
INSERT INTO `ventas_sunat` VALUES (6507, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6508, 'IXgBqw21jIMxa19xEJ/kOyc/pLM=', '20611556960-01-F001-186', '20611556960|03|F001-186|24.41|160.00|2024-01-03|06|20514215741');
INSERT INTO `ventas_sunat` VALUES (6509, 'WV4Oj2jIWEr7yvUGZOr/ERhQWgU=', '20611556960-01-F001-187', '20611556960|03|F001-187|314.62|2062.50|2024-01-04|06|10445913079');
INSERT INTO `ventas_sunat` VALUES (6510, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6511, 'd1D6ps7o3YJ3KMsadsH4P7yJjbg=', '20611556960-01-F001-188', '20611556960|03|F001-188|91.53|600.00|2024-01-05|06|20480731582');
INSERT INTO `ventas_sunat` VALUES (6512, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6513, '9mb+0AZDDipIXscXi/kXbqoiajA=', '20611556960-01-F001-189', '20611556960|03|F001-189|12.20|80.00|2024-01-06|06|20606036605');
INSERT INTO `ventas_sunat` VALUES (6514, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6515, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6516, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6517, '4/ab3+f2HtbHcwSqCcWLLkiUfQo=', '20611556960-01-F001-190', '20611556960|03|F001-190|91.53|600.00|2024-01-08|06|20608665928');
INSERT INTO `ventas_sunat` VALUES (6518, 'STPWRgVLj8wVPi/B0vnU6Q91oLE=', '20611556960-01-F001-191', '20611556960|03|F001-191|58.12|381.00|2024-01-09|06|20536397397');
INSERT INTO `ventas_sunat` VALUES (6519, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6520, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6521, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6522, 'YVuP1E6JxkTn7V6hALChOQL5wPE=', '20611556960-01-F001-192', '20611556960|03|F001-192|27.46|180.00|2024-01-10|06|10406149078');
INSERT INTO `ventas_sunat` VALUES (6523, '+8ZhoIzhVoyaiA4sr+XpWpOPzTw=', '20611556960-01-F001-193', '20611556960|03|F001-193|77.80|510.00|2024-01-10|06|20571184312');
INSERT INTO `ventas_sunat` VALUES (6524, 'uCmRltuA9pRsxb7Jk53TvDA6ooc=', '20611556960-01-F001-194', '20611556960|03|F001-194|76.12|499.00|2024-01-11|06|20100131359');
INSERT INTO `ventas_sunat` VALUES (6525, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6526, 'dh34SLEENy3Xfpg1JcqW2/KmLKA=', '20611556960-01-F001-195', '20611556960|03|F001-195|76.27|500.00|2024-01-12|06|10099348912');
INSERT INTO `ventas_sunat` VALUES (6527, 'jB5HsgLciGRatBheeXq4u+4vwLA=', '20611556960-01-F001-196', '20611556960|03|F001-196|13.73|90.00|2024-01-13|06|10484431341');
INSERT INTO `ventas_sunat` VALUES (6528, 'J74bxLlFHIie+AOeJzRDAUVH5K8=', '20611556960-01-F001-197', '20611556960|03|F001-197|28.98|190.00|2024-01-14|06|20601553598');
INSERT INTO `ventas_sunat` VALUES (6529, '+Br/awGvnGFy743AuBFsFwV+ef8=', '20611556960-01-F001-198', '20611556960|03|F001-198|42.71|280.00|2024-01-15|06|20480731582');
INSERT INTO `ventas_sunat` VALUES (6530, 'DiZOXpT5Xw6Y4MiAoF9J8jl1LmA=', '20611556960-01-F001-199', '20611556960|03|F001-199|18.31|120.00|2024-01-15|06|20100047056');
INSERT INTO `ventas_sunat` VALUES (6531, 'qNRTyOhuy3QpCo/HbqDFgC73UFg=', '20611556960-01-F001-200', '20611556960|03|F001-200|18.31|120.01|2024-01-15|06|20100047056');
INSERT INTO `ventas_sunat` VALUES (6532, 'afL6lO7edGeUsnb2th/WW0wvrno=', '20611556960-01-F001-201', '20611556960|03|F001-201|18.31|120.00|2024-01-15|06|10099348912');
INSERT INTO `ventas_sunat` VALUES (6533, 'ULbtCjMwNaU07YAhdlQwkvDoeiU=', '20611556960-01-F001-202', '20611556960|03|F001-202|33.56|220.00|2024-01-15|06|20602279945');
INSERT INTO `ventas_sunat` VALUES (6534, 'x6leG//FXg2May/arspKLohW1bU=', '20611556960-01-F001-203', '20611556960|03|F001-203|88.47|579.99|2024-01-15|06|20423925028');
INSERT INTO `ventas_sunat` VALUES (6535, 'YVh8aouh2U8S9/faYQcfJnciZQE=', '20611556960-01-F001-204', '20611556960|03|F001-204|88.47|579.99|2024-01-16|06|20423925028');
INSERT INTO `ventas_sunat` VALUES (6536, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6537, 'Uf/M+UbJAs6/mYW1BgOhh2ve4js=', '20611556960-01-F001-205', '20611556960|03|F001-205|30.51|200.00|2024-01-16|06|20480731582');
INSERT INTO `ventas_sunat` VALUES (6538, '8Zp9AWlSeeTHhzeiIAtCZuAki7o=', '20611556960-01-F001-206', '20611556960|03|F001-206|382.42|2507.00|2024-01-17|06|20514488470');
INSERT INTO `ventas_sunat` VALUES (6539, 'Mu1F6mQlGKGtbrEL5bG2jgnotWY=', '20611556960-01-F001-207', '20611556960|03|F001-207|21.81|143.00|2024-01-17|06|20514488470');
INSERT INTO `ventas_sunat` VALUES (6540, 'uGOOFCSqXDyn83X1z8fWYAF9pXc=', '20611556960-01-F001-208', '20611556960|03|F001-208|18.31|120.00|2024-01-18|06|10099348912');
INSERT INTO `ventas_sunat` VALUES (6541, '7+POoYSpK35S/zvTP7mb2YzNGQc=', '20611556960-01-F001-209', '20611556960|03|F001-209|19.07|125.00|2024-01-18|06|10327798303');
INSERT INTO `ventas_sunat` VALUES (6542, 'Vu5iZrxM6aPh9GBIieXcMedGbEk=', '20611556960-01-F001-210', '20611556960|03|F001-210|86.95|570.00|2024-01-18|06|20521018322');
INSERT INTO `ventas_sunat` VALUES (6543, 'VLfEo+BYIgsKwHqfeBWSIJmPjoY=', '20611556960-01-F001-211', '20611556960|03|F001-211|64.07|420.00|2024-01-19|06|20423925028');
INSERT INTO `ventas_sunat` VALUES (6544, 'Rz2IEFYaIgNoX09aEXfojaOXyQw=', '20611556960-01-F001-212', '20611556960|03|F001-212|64.07|419.99|2024-01-18|06|20423925028');
INSERT INTO `ventas_sunat` VALUES (6545, 'DKz8cGMAt8BIDvSbAj5UekRW2zQ=', '20611556960-01-F001-213', '20611556960|03|F001-213|64.07|419.99|2024-01-19|06|20423925028');
INSERT INTO `ventas_sunat` VALUES (6546, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6547, 'yAxcJ6eON4m+vsO9nf8uJoFKwm8=', '20611556960-01-F001-214', '20611556960|03|F001-214|77.80|510.00|2024-01-20|06|20480731582');
INSERT INTO `ventas_sunat` VALUES (6548, 'bSw8HyeqkXS/JpVYlVcgbDfTOSM=', '20611556960-01-F001-215', '20611556960|03|F001-215|54.92|360.00|2024-01-20|06|20556947962');
INSERT INTO `ventas_sunat` VALUES (6549, 'ctt4qFWRxenDpIr8ZEofbsnxx2Y=', '20611556960-01-F001-216', '20611556960|03|F001-216|18.31|120.00|2024-01-20|06|20600648668');
INSERT INTO `ventas_sunat` VALUES (6550, 'XVvln8FH6v3NvRkRYgsFy1Yr8NE=', '20611556960-01-F001-217', '20611556960|03|F001-217|13.73|90.00|2024-01-22|06|20600071077');
INSERT INTO `ventas_sunat` VALUES (6551, 'KMSaGZHEmvD1JN61m0HwGU82mEg=', '20611556960-01-F001-218', '20611556960|03|F001-218|27.46|180.00|2024-01-22|06|20610368418');
INSERT INTO `ventas_sunat` VALUES (6552, 'nE5H7pBJF31iMVhUY+oiOMurJsQ=', '20611556960-01-F001-219', '20611556960|03|F001-219|83.90|550.00|2024-01-25|06|10406174056');
INSERT INTO `ventas_sunat` VALUES (6553, 'DvORvvMJJglejd2zCq3xFksQUpo=', '20611556960-01-F001-220', '20611556960|03|F001-220|83.90|550.00|2024-01-25|06|10406174056');
INSERT INTO `ventas_sunat` VALUES (6554, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6555, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6556, '-', '-', '-');
INSERT INTO `ventas_sunat` VALUES (6557, 'faaFJfIxrVSfIYYGc/BhkNwW6sk=', '20611556960-01-F001-221', '20611556960|03|F001-221|64.07|420.00|2024-01-25|06|20602607012');
INSERT INTO `ventas_sunat` VALUES (6558, '+kb+alAOXOQ8KmtNrzRZKxcYnLk=', '20611556960-01-F001-222', '20611556960|03|F001-222|38.14|250.00|2024-01-25|06|20602607012');

-- ----------------------------
-- View structure for view_productos_1
-- ----------------------------
DROP VIEW IF EXISTS `view_productos_1`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_productos_1` AS select `productos`.`id_producto` AS `id_producto`,`productos`.`cod_barra` AS `cod_barra`,`productos`.`descripcion` AS `descripcion`,`productos`.`precio` AS `precio`,`productos`.`costo` AS `costo`,`productos`.`cantidad` AS `cantidad`,`productos`.`iscbp` AS `iscbp`,`productos`.`id_empresa` AS `id_empresa`,`productos`.`sucursal` AS `sucursal`,`productos`.`ultima_salida` AS `ultima_salida`,`productos`.`codsunat` AS `codsunat`,`productos`.`usar_barra` AS `usar_barra`,`productos`.`precio_mayor` AS `precio_mayor`,`productos`.`precio_menor` AS `precio_menor`,`productos`.`razon_social` AS `razon_social`,`productos`.`ruc` AS `ruc`,`productos`.`estado` AS `estado`,`productos`.`almacen` AS `almacen`,`productos`.`precio2` AS `precio2`,`productos`.`precio3` AS `precio3`,`productos`.`precio4` AS `precio4`,`productos`.`precio_unidad` AS `precio_unidad`,`productos`.`codigo` AS `codigo` from `productos` where ((`productos`.`id_empresa` = 12) and (`productos`.`sucursal` = '1') and (`productos`.`estado` = '1') and (`productos`.`almacen` = '1')) order by `productos`.`id_producto` desc;

-- ----------------------------
-- View structure for view_productos_2
-- ----------------------------
DROP VIEW IF EXISTS `view_productos_2`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_productos_2` AS select `productos`.`id_producto` AS `id_producto`,`productos`.`cod_barra` AS `cod_barra`,`productos`.`descripcion` AS `descripcion`,`productos`.`precio` AS `precio`,`productos`.`costo` AS `costo`,`productos`.`cantidad` AS `cantidad`,`productos`.`iscbp` AS `iscbp`,`productos`.`id_empresa` AS `id_empresa`,`productos`.`sucursal` AS `sucursal`,`productos`.`ultima_salida` AS `ultima_salida`,`productos`.`codsunat` AS `codsunat`,`productos`.`usar_barra` AS `usar_barra`,`productos`.`precio_mayor` AS `precio_mayor`,`productos`.`precio_menor` AS `precio_menor`,`productos`.`razon_social` AS `razon_social`,`productos`.`ruc` AS `ruc`,`productos`.`estado` AS `estado`,`productos`.`almacen` AS `almacen`,`productos`.`precio2` AS `precio2`,`productos`.`precio3` AS `precio3`,`productos`.`precio4` AS `precio4`,`productos`.`precio_unidad` AS `precio_unidad`,`productos`.`codigo` AS `codigo` from `productos` where ((`productos`.`id_empresa` = 12) and (`productos`.`sucursal` = '1') and (`productos`.`estado` = '1') and (`productos`.`almacen` = '2')) order by `productos`.`id_producto` desc;

-- ----------------------------
-- View structure for view_ventas
-- ----------------------------
DROP VIEW IF EXISTS `view_ventas`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_ventas` AS (select `v`.`id_venta` AS `cod_v`,concat(`ds`.`abreviatura`,' | ',`v`.`serie`,' - ',`v`.`numero`) AS `sn_v`,concat(`c`.`documento`,' | ',`c`.`datos`) AS `datos_cl`,if((`v`.`apli_igv` = '1'),(`v`.`total` / (`v`.`igv` + 1)),`v`.`total`) AS `subtotal`,if((`v`.`apli_igv` = '1'),((`v`.`total` / (`v`.`igv` + 1)) * `v`.`igv`),0) AS `igv_v`,concat(`v`.`enviado_sunat`,'-',`v`.`id_tido`,'-',`v`.`id_venta`) AS `doc_ventae`,concat(`v`.`id_venta`,'--',`vs`.`nombre_xml`) AS `id_venta`,`v`.`fecha_emision` AS `fecha_emision`,`ds`.`abreviatura` AS `abreviatura`,`v`.`apli_igv` AS `apli_igv`,`v`.`igv` AS `igv`,`v`.`id_tido` AS `id_tido`,`v`.`serie` AS `serie`,`v`.`numero` AS `numero`,`c`.`documento` AS `documento`,`c`.`datos` AS `datos`,`v`.`total` AS `total`,`v`.`estado` AS `estado`,`v`.`enviado_sunat` AS `enviado_sunat`,`vs`.`nombre_xml` AS `nombre_xml` from (((`ventas` `v` left join `documentos_sunat` `ds` on((`v`.`id_tido` = `ds`.`id_tido`))) left join `clientes` `c` on((`v`.`id_cliente` = `c`.`id_cliente`))) left join `ventas_sunat` `vs` on((`v`.`id_venta` = `vs`.`id_venta`))) where ((`v`.`id_empresa` = '12') and (`v`.`sucursal` = '1')) order by `v`.`fecha_emision`,`v`.`numero`);

-- ----------------------------
-- View structure for vw_ot
-- ----------------------------
DROP VIEW IF EXISTS `vw_ot`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_ot` AS select `c`.`datos` AS `cliente`,`a`.`id` AS `id`,`a`.`num_factura` AS `num_factura`,`c`.`documento` AS `numdocumento`,lpad(`c`.`id_cliente`,8,'0') AS `idcliente`,`a`.`idproducto` AS `idproducto`,`a`.`idorden` AS `idorden`,`a`.`num_orden` AS `num_orden`,`a`.`lugar` AS `lugar`,`a`.`departamento` AS `departamento`,`a`.`provincia` AS `provincia`,`a`.`distrito` AS `distrito`,`a`.`marca` AS `marca`,`a`.`equipo` AS `equipo`,`a`.`modelo` AS `modelo`,`a`.`serie_aquina` AS `serie_aquina`,`a`.`serie_motor` AS `serie_motor`,`a`.`horometro` AS `horometro`,`a`.`fecha` AS `fecha`,`a`.`fecha_update` AS `fecha_update`,`a`.`estado` AS `estado`,`b`.`nombre` AS `ot_tipo` from ((`orden_trabajo` `a` left join `orden_trabajo_tipo` `b` on((`a`.`idorden` = `b`.`id`))) left join `clientes` `c` on((`c`.`id_cliente` = `a`.`idcliente`)));

-- ----------------------------
-- Triggers structure for table guia_remision
-- ----------------------------
DROP TRIGGER IF EXISTS `ti_guia_remision`;
delimiter ;;
CREATE TRIGGER `ti_guia_remision` AFTER INSERT ON `guia_remision` FOR EACH ROW BEGIN
DECLARE idtido_ INT;
DECLARE idempresa_ INT;
DECLARE sucursal_ INT;
SET idtido_ = 11;
SET idempresa_ = new.id_empresa;
SET sucursal_ = new.sucursal;
UPDATE documentos_empresas AS de
SET de.numero = de.numero + 1
WHERE de.id_empresa = idempresa_ AND de.id_tido = idtido_ AND de.sucursal=sucursal_;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table notas_electronicas
-- ----------------------------
DROP TRIGGER IF EXISTS `ti_notas_e`;
delimiter ;;
CREATE TRIGGER `ti_notas_e` AFTER INSERT ON `notas_electronicas` FOR EACH ROW BEGIN
  DECLARE idtido_ INT ;
  DECLARE idempresa_ INT ;
  DECLARE sucursal_ INT;
  
  
  SET idtido_ = new.tido ;
  SET idempresa_ = new.id_empresa ;
  SET sucursal_ = new.sucursal;
  
  UPDATE 
    documentos_empresas AS de 
  SET
    de.numero = de.numero + 1 
  WHERE de.id_empresa = idempresa_ 
    AND de.id_tido = idtido_ AND de.sucursal=sucursal_;
  
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table orden_trabajo
-- ----------------------------
DROP TRIGGER IF EXISTS `ot_AFTER_INSERT`;
delimiter ;;
CREATE TRIGGER `ot_AFTER_INSERT` AFTER INSERT ON `orden_trabajo` FOR EACH ROW BEGIN
	UPDATE orden_trabajo_tipo SET  num_orden=num_orden+1,
	fecha_update=now(),
	siguiente_serie=concat(serie,LPAD(num_orden, 7, '0'))
	where id = new.idorden;
    END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table ventas
-- ----------------------------
DROP TRIGGER IF EXISTS `ti_ventas`;
delimiter ;;
CREATE TRIGGER `ti_ventas` AFTER INSERT ON `ventas` FOR EACH ROW BEGIN
DECLARE idtido_ INT;
DECLARE idempresa_ INT;
DECLARE idcliente_ INT;
DECLARE total_ FLOAT;
DECLARE fecha_ DATE;
DECLARE sucursal_ INT;
SET idtido_ = new.id_tido;
SET idempresa_ = new.id_empresa;
SET idcliente_ = new.id_cliente;
SET fecha_ = new.fecha_emision;
SET total_ = new.total;
SET sucursal_ = new.sucursal;
UPDATE documentos_empresas AS de 
SET de.numero = de.numero + 1 
WHERE de.id_empresa = idempresa_ AND de.id_tido = idtido_ AND sucursal = sucursal_;
UPDATE clientes AS c 
SET c.ultima_venta = fecha_, c.total_venta = c.total_venta + total_
WHERE c.id_cliente = idcliente_;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
