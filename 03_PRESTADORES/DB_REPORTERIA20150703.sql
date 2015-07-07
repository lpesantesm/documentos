-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 03, 2015 at 08:53 AM
-- Server version: 5.5.43-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `DB_REPORTERIA`
--

-- --------------------------------------------------------

--
-- Table structure for table `RPT_ARCHIVO`
--

CREATE TABLE IF NOT EXISTS `RPT_ARCHIVO` (
  `RARC_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RPT_ID` bigint(20) NOT NULL,
  `RTAR_ID` bigint(20) NOT NULL,
  `RDTA_ID` bigint(20) DEFAULT NULL,
  `RRTA_ID` bigint(20) DEFAULT NULL,
  `RARC_SQL` text,
  `RARC_SQL_CABECERA` text,
  `RARC_FUNCION` varchar(5) DEFAULT NULL,
  `RARC_FECHA_CREACION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `RARC_FECHA_MODIFICACION` timestamp NULL DEFAULT NULL,
  `RARC_ESTADO_LOGICO` varchar(1) NOT NULL,
  PRIMARY KEY (`RARC_ID`),
  KEY `RPT_ID` (`RPT_ID`),
  KEY `RDTA_ID` (`RDTA_ID`),
  KEY `RRTA_ID` (`RRTA_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `RPT_ARCHIVO`
--

INSERT INTO `RPT_ARCHIVO` (`RARC_ID`, `RPT_ID`, `RTAR_ID`, `RDTA_ID`, `RRTA_ID`, `RARC_SQL`, `RARC_SQL_CABECERA`, `RARC_FUNCION`, `RARC_FECHA_CREACION`, `RARC_FECHA_MODIFICACION`, `RARC_ESTADO_LOGICO`) VALUES
(1, 1, 2, NULL, 5, 'select distinct SUBSTRING(tcb.TCB_NOMBRE,1,1) as tipocuenta, PCON.PCON_ID, cban.CBAN_NO_CUENTA, car.CART_MONTO_PAGO, ''XXW01791'' as campo, car.CART_FECHA_COBRO, PCON.PCON_NUMERO_CONTRATO as numerosol, per.PER_CEDULA as cedula from DB_FACTURACION.CARTERA as car join DB_PREPAGA.GENERACION_CARTERA as gcar on gcar.CART_ID=car.CART_ID JOIN DB_PREPAGA.PERS_CONT AS PCON on PCON.PCON_ID=gcar.PCON_ID join DB_PREPAGA.FORMA_COBRO_CARTERA as fcc on gcar.GCAR_ID=fcc.GCAR_ID  and fcc.FCCA_ESTADO_PREDETERMINADA=1 join DB_CROCODILE.PERSONA as per on per.PER_ID=fcc.PER_ID join DB_PREPAGA.CUENTA_BANCARIA as cban on cban.PER_ID=fcc.PER_ID join DB_FACTURACION.TIPO_CUENTA_BANCARIA as tcb on tcb.TCB_ID=cban.TCB_ID join DB_FACTURACION.BANCO as ban on ban.BAN_ID=cban.BAN_ID where car.CART_ESTADO_PAGO=0 and car.CART_ESTADO_LOGICO=1 and fcc.FPAG_ID=2 and cban.BAN_ID=3 and (per.PER_NOMBRE like :texto || per.PER_CEDULA like :texto || per.PER_APELLIDO like :texto) and car.CART_FECHA_COBRO between :fecha_ini and :fecha_fin and cban.CBAN_ESTADO_PREDETERMINADA=1 and fcc.FCCA_ESTADO_LOGICO=1 and car.CART_ID not in (select CART_ID from DB_FACTURACION.PAGO WHERE PAG_ESTADO_LOGICO=1 AND PAG_ESTADO_COMPLETADO=1) union all select distinct SUBSTRING(tcb.TCB_NOMBRE,1,1) as tipocuenta, PCON.PCON_ID, cban.CBAN_NO_CUENTA, car.CART_MONTO_PAGO, ''XXW01791'' as campo, car.CART_FECHA_COBRO, PCON.PCON_NUMERO_CONTRATO as numerosol, per.PER_CEDULA as cedula from DB_FACTURACION.CARTERA as car join DB_PREPAGA.GENERACION_CARTERA as gcar on gcar.CART_ID=car.CART_ID JOIN DB_PREPAGA.PERS_CONT AS PCON on PCON.PCON_ID=gcar.PCON_ID join DB_PREPAGA.PAGO_RECURRENTE as prec on prec.PCON_ID=gcar.PCON_ID join DB_CROCODILE.PERSONA as per on per.PER_ID=prec.PER_ID join DB_PREPAGA.CUENTA_BANCARIA as cban on cban.PER_ID=prec.PER_ID join DB_FACTURACION.TIPO_CUENTA_BANCARIA as tcb on tcb.TCB_ID=cban.TCB_ID join DB_FACTURACION.BANCO as ban on ban.BAN_ID=cban.BAN_ID where car.CART_ESTADO_PAGO=0 and car.CART_ESTADO_LOGICO=1 and prec.FPAG_ID=2 and cban.BAN_ID=3 and gcar.GCAR_ID not in (select fcci.GCAR_ID from DB_PREPAGA.GENERACION_CARTERA as gcari join DB_PREPAGA.FORMA_COBRO_CARTERA as fcci on fcci.GCAR_ID=gcari.GCAR_ID and fcci.FCCA_ESTADO_PREDETERMINADA=1 where gcari.PCON_ID=gcar.PCON_ID) and (per.PER_NOMBRE like :texto || per.PER_CEDULA like :texto || per.PER_APELLIDO like :texto) and car.CART_FECHA_COBRO between :fecha_ini and :fecha_fin and cban.CBAN_ESTADO_PREDETERMINADA=1 and car.CART_ID not in (select CART_ID from DB_FACTURACION.PAGO WHERE PAG_ESTADO_LOGICO=1 AND PAG_ESTADO_COMPLETADO=1);', NULL, 'e', '2013-09-03 23:12:32', NULL, '1'),
(2, 1, 1, NULL, NULL, NULL, NULL, 'i', '2013-07-11 20:07:31', NULL, '1'),
(3, 2, 2, NULL, 2, 'select distinct car.CART_ID,''CO'' as campo1, per.PER_CEDULA as cedulapag,mon.MON_NOMBRE as moneda,car.CART_MONTO_PAGO as MONTO_PAGO,  tcb.TCB_NOMBRE as tipocuenta,  cban.CBAN_NO_CUENTA as numerocuenta,DATE_FORMAT(car.CART_FECHA_COBRO,''%Y%m%d'') as fecha,''C'' as campo2,  pertit.PER_CEDULA as cedulatit,  pcon.PCON_NUMERO_CONTRATO as numerosol,pertit.PER_NOMBRE as nombretit,pertit.PER_APELLIDO as apellidotit,pcon.PCON_id    from DB_FACTURACION.CARTERA as car     join DB_PREPAGA.GENERACION_CARTERA as gcar on gcar.CART_ID=car.CART_ID     join DB_PREPAGA.FORMA_COBRO_CARTERA as fcc on fcc.GCAR_ID=gcar.GCAR_ID and fcc.FCCA_ESTADO_PREDETERMINADA=1     join DB_PREPAGA.PERS_CONT as pcon on pcon.PCON_ID=gcar.PCON_ID     join DB_CROCODILE.PERSONA as per on per.PER_ID=fcc.PER_ID     join DB_PREPAGA.AFILIADO as afi on afi.AFI_ID=pcon.AFI_ID     join DB_CROCODILE.PERSONA as pertit on pertit.PER_ID=afi.PER_ID     join DB_PREPAGA.CUENTA_BANCARIA as cban on cban.PER_ID=fcc.PER_ID     join DB_FACTURACION.TIPO_CUENTA_BANCARIA as tcb on tcb.TCB_ID=cban.TCB_ID     join DB_FACTURACION.BANCO as ban on ban.BAN_ID=cban.BAN_ID     join DB_FACTURACION.MONEDA as mon on mon.MON_ID=1     where car.CART_ESTADO_PAGO=0 and car.CART_ESTADO_LOGICO=1 and fcc.FPAG_ID=2 and cban.BAN_ID=1    and (per.PER_NOMBRE like :texto || per.PER_CEDULA like :texto || per.PER_APELLIDO like :texto) and car.CART_FECHA_COBRO between :fecha_ini and :fecha_fin    and cban.CBAN_ESTADO_PREDETERMINADA=1 and car.CART_ID not in (  select CART_ID   from DB_FACTURACION.PAGO     where PAG_ESTADO_LOGICO=1 AND PAG_ESTADO_COMPLETADO=1) union all   select distinct car.CART_ID,''CO'' as campo1, per.PER_CEDULA as cedulapag,mon.MON_NOMBRE as moneda,car.CART_MONTO_PAGO as MONTO_PAGO,  tcb.TCB_NOMBRE as tipocuenta,  cban.CBAN_NO_CUENTA as numerocuenta,DATE_FORMAT(car.CART_FECHA_COBRO,''%Y%m%d'') as fecha,''C'' as campo2,  pertit.PER_CEDULA as cedulatit,  pcon.PCON_NUMERO_CONTRATO as numerosol,pertit.PER_NOMBRE as nombretit,pertit.PER_APELLIDO as apellidotit,pcon.PCON_id    from DB_FACTURACION.CARTERA as car     join DB_PREPAGA.GENERACION_CARTERA as gcar on gcar.CART_ID=car.CART_ID     join DB_PREPAGA.PERS_CONT as pcon on pcon.PCON_ID=gcar.PCON_ID     join DB_PREPAGA.PAGO_RECURRENTE as prec on prec.PCON_ID=gcar.PCON_ID     join DB_CROCODILE.PERSONA as per on per.PER_ID=prec.PER_ID     join DB_PREPAGA.AFILIADO as afi on afi.AFI_ID=pcon.AFI_ID     join DB_CROCODILE.PERSONA as pertit on pertit.PER_ID=afi.PER_ID     join DB_PREPAGA.CUENTA_BANCARIA as cban on cban.PER_ID=prec.PER_ID     join DB_FACTURACION.TIPO_CUENTA_BANCARIA as tcb on tcb.TCB_ID=cban.TCB_ID     join DB_FACTURACION.BANCO as ban on ban.BAN_ID=cban.BAN_ID     join DB_FACTURACION.MONEDA as mon on mon.MON_ID=1     where car.CART_ESTADO_PAGO=0 and car.CART_ESTADO_LOGICO=1 and prec.FPAG_ID=2 and cban.BAN_ID=1 and gcar.GCAR_ID not in(   select fcci.GCAR_ID   from DB_PREPAGA.GENERACION_CARTERA as gcari     join DB_PREPAGA.FORMA_COBRO_CARTERA as fcci on fcci.GCAR_ID=gcari.GCAR_ID and fcci.FCCA_ESTADO_PREDETERMINADA=1     where gcari.PCON_ID=gcar.PCON_ID)  and (per.PER_NOMBRE like :texto || per.PER_CEDULA like :texto || per.PER_APELLIDO like :texto) and car.CART_FECHA_COBRO   between :fecha_ini and :fecha_fin  and cban.CBAN_ESTADO_PREDETERMINADA=1  and car.CART_ID not in (  select CART_ID   from DB_FACTURACION.PAGO     where PAG_ESTADO_LOGICO=1 AND PAG_ESTADO_COMPLETADO=1);   ', NULL, 'e', '2013-09-19 16:10:50', NULL, '1'),
(4, 2, 1, NULL, NULL, NULL, NULL, 'i', '2013-07-11 20:07:31', NULL, '1'),
(5, 5, 3, NULL, 7, 'select distinct car.CART_ID,''CU'' as formapago, ''30'' as banco, if(tcb.TCB_ID=1,10,00) as tipocuenta, cban.CBAN_NO_CUENTA as numerocuenta, car.CART_MONTO_PAGO as valor_cobro, pcon.PCON_NUMERO_CONTRATO as contrato, ''C'' as tipodocumento, per.PER_CEDULA as cedulapagador, concat(pertit.PER_NOMBRE,'' '', pertit.PER_APELLIDO) as titular, per.PER_CEDULA as telefonopagador, DATE_FORMAT(car.CART_FECHA_COBRO,''%d/%m/%Y'') as fecha, (0.95*car.CART_MONTO_PAGO) as basedisponible, pcon.PCON_id from DB_FACTURACION.CARTERA as car   join DB_PREPAGA.GENERACION_CARTERA as gcar on gcar.CART_ID=car.CART_ID   join DB_PREPAGA.FORMA_COBRO_CARTERA as fcc on fcc.GCAR_ID=gcar.GCAR_ID and fcc.FCCA_ESTADO_PREDETERMINADA=1   join DB_PREPAGA.PERS_CONT as pcon on pcon.PCON_ID=gcar.PCON_ID   join DB_CROCODILE.PERSONA as per on per.PER_ID=fcc.PER_ID   join DB_PREPAGA.AFILIADO as afi on afi.AFI_ID=pcon.AFI_ID  join DB_CROCODILE.PERSONA as pertit on pertit.PER_ID=afi.PER_ID  join DB_PREPAGA.CUENTA_BANCARIA as cban on cban.PER_ID=fcc.PER_ID   join DB_FACTURACION.TIPO_CUENTA_BANCARIA as tcb on tcb.TCB_ID=cban.TCB_ID where car.CART_ESTADO_PAGO=0 and car.CART_ESTADO_LOGICO=1 and fcc.FPAG_ID=2 and cban.BAN_ID=4 and (per.PER_NOMBRE like :texto || per.PER_CEDULA like :texto || per.PER_APELLIDO like :texto) and car.CART_FECHA_COBRO between :fecha_ini and :fecha_fin and cban.CBAN_ESTADO_PREDETERMINADA=1 and car.CART_ID not in (select CART_ID from DB_FACTURACION.PAGO WHERE PAG_ESTADO_LOGICO=1 AND PAG_ESTADO_COMPLETADO=1) union all select distinct car.CART_ID,''CU'' as formapago, ''30'' as banco, if(tcb.TCB_ID=1,10,00) as tipocuenta, cban.CBAN_NO_CUENTA as numerocuenta, car.CART_MONTO_PAGO as valor_cobro, pcon.PCON_NUMERO_CONTRATO as contrato, ''C'' as tipodocumento, per.PER_CEDULA as cedulapagador, concat(pertit.PER_NOMBRE,'' '', pertit.PER_APELLIDO) as titular, per.PER_CEDULA as telefonopagador, DATE_FORMAT(car.CART_FECHA_COBRO,''%d/%m/%Y'') as fecha, (0.95*car.CART_MONTO_PAGO) as basedisponible, pcon.PCON_id from DB_FACTURACION.CARTERA as car   join DB_PREPAGA.GENERACION_CARTERA as gcar on gcar.CART_ID=car.CART_ID   join DB_PREPAGA.PAGO_RECURRENTE as prec on prec.PCON_ID=gcar.PCON_ID   join DB_PREPAGA.PERS_CONT as pcon on pcon.PCON_ID=gcar.PCON_ID   join DB_CROCODILE.PERSONA as per on per.PER_ID=prec.PER_ID   join DB_PREPAGA.AFILIADO as afi on afi.AFI_ID=pcon.AFI_ID  join DB_CROCODILE.PERSONA as pertit on pertit.PER_ID=afi.PER_ID  join DB_PREPAGA.CUENTA_BANCARIA as cban on cban.PER_ID=prec.PER_ID   join DB_FACTURACION.TIPO_CUENTA_BANCARIA as tcb on tcb.TCB_ID=cban.TCB_ID where car.CART_ESTADO_PAGO=0 and car.CART_ESTADO_LOGICO=1 and prec.FPAG_ID=2 and cban.BAN_ID=4 and gcar.GCAR_ID not in (select fcci.GCAR_ID from DB_PREPAGA.GENERACION_CARTERA as gcari   join DB_PREPAGA.FORMA_COBRO_CARTERA as fcci on fcci.GCAR_ID=gcari.GCAR_ID and fcci.FCCA_ESTADO_PREDETERMINADA=1 where gcari.PCON_ID=gcar.PCON_ID) and (per.PER_NOMBRE like :texto || per.PER_CEDULA like :texto || per.PER_APELLIDO like :texto) and car.CART_FECHA_COBRO between :fecha_ini and :fecha_fin and cban.CBAN_ESTADO_PREDETERMINADA=1 and car.CART_ID not in (select CART_ID from DB_FACTURACION.PAGO WHERE PAG_ESTADO_LOGICO=1 AND PAG_ESTADO_COMPLETADO=1);', NULL, 'e', '2013-09-03 23:14:46', NULL, '1'),
(6, 4, 5, NULL, NULL, 'select distinct car.CART_ID,''CU'' as formapago, ''30'' as banco, if(tcb.TCB_ID=1,10,00) as tipocuenta, cban.CBAN_NO_CUENTA as numerocuenta, car.CART_MONTO_PAGO as valor_cobro, pcon.PCON_NUMERO_CONTRATO as contrato, ''C'' as tipodocumento, per.PER_CEDULA as cedulapagador, concat(pertit.PER_NOMBRE,'' '',pertit.PER_APELLIDO) as titular, per.PER_CEDULA as telefonopagador, DATE_FORMAT(car.CART_FECHA_COBRO,''%d/%m/%Y'') as fecha, (0.95*car.CART_MONTO_PAGO) as basedisponible, pcon.PCON_id from DB_FACTURACION.CARTERA as car join DB_PREPAGA.GENERACION_CARTERA as gcar on gcar.CART_ID=car.CART_ID join DB_PREPAGA.PERS_CONT as PCON on PCON.PCON_ID=gcar.PCON_ID JOIN DB_PREPAGA.PERS_CONT AS pcon on pcon.PCON_ID=gcar.PCON_ID JOIN DB_CROCODILE.PERSONA AS pertit on pertit.PER_ID=pcon.PER_ID_AFILIADO join DB_PREPAGA.FORMA_COBRO_CARTERA as fcc on fcc.GCAR_ID=gcar.GCAR_ID  and fcc.FCCA_ESTADO_PREDETERMINADA=1 join DB_CROCODILE.PERSONA as per on per.PER_ID=fcc.PER_ID join DB_PREPAGA.CUENTA_BANCARIA as cban on cban.PER_ID=fcc.PER_ID join DB_FACTURACION.TIPO_CUENTA_BANCARIA as tcb on tcb.TCB_ID=cban.TCB_ID join DB_FACTURACION.BANCO as ban on ban.BAN_ID=cban.BAN_ID where car.CART_ESTADO_PAGO=0 and car.CART_ESTADO_LOGICO=1 and fcc.FPAG_ID=2 and (per.PER_NOMBRE like :texto || per.PER_CEDULA like :texto || per.PER_APELLIDO like :texto) and car.CART_FECHA_COBRO between :fecha_ini and :fecha_fin and cban.CBAN_ESTADO_PREDETERMINADA=1 and car.CART_ID not in (select CART_ID from DB_FACTURACION.PAGO WHERE PAG_ESTADO_LOGICO=1) union all select distinct car.CART_ID,''CU'' as formapago, ''30'' as banco, if(tcb.TCB_ID=1,10,00) as tipocuenta, cban.CBAN_NO_CUENTA as numerocuenta, car.CART_MONTO_PAGO as valor_cobro, pcon.PCON_NUMERO_CONTRATO as contrato, ''C'' as tipodocumento, per.PER_CEDULA as cedulapagador, concat(pertit.PER_NOMBRE,'' '',pertit.PER_APELLIDO) as titular, per.PER_CEDULA as telefonopagador, DATE_FORMAT(car.CART_FECHA_COBRO,''%d/%m/%Y'') as fecha, (0.95*car.CART_MONTO_PAGO) as basedisponible, pcon.PCON_id from DB_FACTURACION.CARTERA as car join DB_PREPAGA.GENERACION_CARTERA as gcar on gcar.CART_ID=car.CART_ID join DB_PREPAGA.PERS_CONT as PCON on PCON.PCON_ID=gcar.PCON_ID JOIN DB_PREPAGA.PERS_CONT AS pcon on pcon.PCON_ID=gcar.PCON_ID JOIN DB_CROCODILE.PERSONA AS pertit on pertit.PER_ID=pcon.PER_ID_AFILIADO join DB_PREPAGA.PAGO_RECURRENTE as prec on prec.PCON_ID=gcar.PCON_ID join DB_CROCODILE.PERSONA as per on per.PER_ID=prec.PER_ID join DB_PREPAGA.CUENTA_BANCARIA as cban on cban.PER_ID=prec.PER_ID join DB_FACTURACION.TIPO_CUENTA_BANCARIA as tcb on tcb.TCB_ID=cban.TCB_ID join DB_FACTURACION.BANCO as ban on ban.BAN_ID=cban.BAN_ID where car.CART_ESTADO_PAGO=0 and prec.prec_ESTADO_LOGICO=1 and prec.FPAG_ID=2 and gcar.GCAR_ID  not in ( select fcci.GCAR_ID from DB_PREPAGA.GENERACION_CARTERA as gcari join DB_PREPAGA.FORMA_COBRO_CARTERA as fcci on fcci.GCAR_ID=gcari.GCAR_ID and fcci.FCCA_ESTADO_PREDETERMINADA=1 where gcari.PCON_ID=gcar.PCON_ID ) and (per.PER_NOMBRE like :texto || per.PER_CEDULA like :texto || per.PER_APELLIDO like :texto) and car.CART_FECHA_COBRO between :fecha_ini and :fecha_fin and cban.CBAN_ESTADO_PREDETERMINADA=1 and car.CART_ID not in (select CART_ID from DB_FACTURACION.PAGO WHERE PAG_ESTADO_LOGICO=1);', NULL, 'e', '2013-07-11 20:07:31', NULL, '1'),
(7, 6, 2, NULL, 5, 'SELECT * FROM (select distinct tper.TPER_NUM_TARJETA as num_tarjeta,etar.ETAR_CODIGO_ESTABLECIMIENTO as codigo_establecimiento, DATE_FORMAT(car.CART_FECHA_COBRO,''%Y-%m-%d'') as fecha_consumo, car.CART_MONTO_PAGO as valor_consumo,''00000000000000000'' as valor_diferido , ''000'' as tipo_movimiento, ''000000'' numero_autorizacion, ''000000'' as motivo_debito, ''376653'' as bin_capturador, concat(tper.TPER_ANIO_EXPIRACION,tper.TPER_MES_EXPIRACION) as fecha_expiracion, ''00000000000000000'' as iva,''00'' as tipodiferido, ''D'' as moneda, ''000000'' espacios_libres from DB_FACTURACION.CARTERA as car join DB_PREPAGA.GENERACION_CARTERA as gcar on gcar.CART_ID=car.CART_ID join DB_PREPAGA.FORMA_COBRO_CARTERA as fcc on gcar.GCAR_ID=fcc.GCAR_ID  and fcc.FCCA_ESTADO_PREDETERMINADA=1 join DB_CROCODILE.PERSONA as per on per.PER_ID=fcc.PER_ID join DB_PREPAGA.PERS_CONT as pcon on pcon.PCON_ID=gcar.PCON_ID join DB_PREPAGA.TARCRE_PER as tper on tper.PER_ID=fcc.PER_ID join DB_FACTURACION.TAR_CREDITO_BANCO as tcba on tcba.TCBA_ID=tper.TCBA_ID join DB_CROCODILE.EMPRESA as emp on emp.EMP_ID=3 join DB_FACTURACION.EMPRESA_TARJETA as etar on etar.EMP_ID=emp.EMP_ID and etar.TCRE_ID=3 join DB_FACTURACION.TAR_CREDITO as tar on tar.TCRE_ID=tcba.TCRE_ID where car.CART_ESTADO_PAGO=0 and car.CART_ESTADO_LOGICO=1 and fcc.FPAG_ID=3 and tar.TCRE_ID=3 and (per.PER_NOMBRE like :texto || per.PER_CEDULA like :texto || per.PER_APELLIDO like :texto) and car.CART_FECHA_COBRO between :fecha_ini and :fecha_fin and tper.TPER_ESTADO_PREDETERMINADA=1  and fcc.FCCA_ESTADO_LOGICO=1 and car.CART_ID not in (select CART_ID from DB_FACTURACION.PAGO WHERE PAG_ESTADO_LOGICO=1 AND PAG_ESTADO_COMPLETADO=1) union all select distinct tper.TPER_NUM_TARJETA as num_tarjeta,etar.ETAR_CODIGO_ESTABLECIMIENTO as codigo_establecimiento, DATE_FORMAT(car.CART_FECHA_COBRO,''%Y-%m-%d'') as fecha_consumo, car.CART_MONTO_PAGO as valor_consumo,''00000000000000000'' as valor_diferido , ''000'' as tipo_movimiento, ''000000'' numero_autorizacion, ''000000'' as motivo_debito,''376653'' as bin_capturador, concat(tper.TPER_ANIO_EXPIRACION,tper.TPER_MES_EXPIRACION) as fecha_expiracion, ''00000000000000000'' as iva,''00'' as tipodiferido, ''D'' as moneda, ''000000'' espacios_libres from DB_FACTURACION.CARTERA as car join DB_PREPAGA.GENERACION_CARTERA as gcar on gcar.CART_ID=car.CART_ID join DB_PREPAGA.PAGO_RECURRENTE as prec on prec.PCON_ID=gcar.PCON_ID join DB_CROCODILE.PERSONA as per on per.PER_ID=prec.PER_ID join DB_PREPAGA.PERS_CONT as pcon on pcon.PCON_ID=gcar.PCON_ID join DB_PREPAGA.TARCRE_PER as tper on tper.PER_ID=prec.PER_ID join DB_CROCODILE.EMPRESA as emp on emp.EMP_ID=3 join DB_FACTURACION.EMPRESA_TARJETA as etar on etar.EMP_ID=emp.EMP_ID and etar.TCRE_ID=3 join DB_FACTURACION.TAR_CREDITO_BANCO as tcba on tcba.TCBA_ID=tper.TCBA_ID join DB_FACTURACION.TAR_CREDITO as tar on tar.TCRE_ID=tcba.TCRE_ID where car.CART_ESTADO_PAGO=0 and car.CART_ESTADO_LOGICO=1 and prec.FPAG_ID=3 and tar.TCRE_ID=3 and gcar.GCAR_ID not in (select fcci.GCAR_ID from DB_PREPAGA.GENERACION_CARTERA as gcari join DB_PREPAGA.FORMA_COBRO_CARTERA as fcci on fcci.GCAR_ID=gcari.GCAR_ID and fcci.FCCA_ESTADO_PREDETERMINADA=1 where gcari.PCON_ID=gcar.PCON_ID) and (per.PER_NOMBRE like :texto || per.PER_CEDULA like :texto || per.PER_APELLIDO like :texto) and car.CART_FECHA_COBRO between :fecha_ini and :fecha_fin and tper.TPER_ESTADO_PREDETERMINADA=1 and car.CART_ID not in (select CART_ID from DB_FACTURACION.PAGO WHERE PAG_ESTADO_LOGICO=1 AND PAG_ESTADO_COMPLETADO=1)) as american_export;', NULL, 'e', '2013-09-03 23:10:59', NULL, '1'),
(8, 9, 2, NULL, 5, 'select distinct 2 as tiporegistro,''00'' as filler, tper.TPER_NUM_TARJETA as numero_tarjeta,DATE_FORMAT(NOW(),''%Y-%m-%d'') as fecha_vale, car.CART_ID as numero_vale, ''00'' as identificacion_tipo_credito, ''000000'' as numero_autorizacion, car.CART_MONTO_PAGO as valor_consumo, ''0000000000000'' as valor_interes,car.CART_MONTO_PAGO as valor_bruto,''00'' as numero_cuotas,''1'' as tipo_moneda, ''0000000000000'' as valor_iva   from DB_FACTURACION.CARTERA as car     join DB_PREPAGA.GENERACION_CARTERA as gcar on gcar.CART_ID=car.CART_ID     join DB_PREPAGA.FORMA_COBRO_CARTERA as fcc on gcar.GCAR_ID=fcc.GCAR_ID  and fcc.FCCA_ESTADO_PREDETERMINADA=1     join DB_CROCODILE.PERSONA as per on per.PER_ID=fcc.PER_ID     join DB_PREPAGA.PERS_CONT as pcon on pcon.PCON_ID=gcar.PCON_ID     join DB_PREPAGA.TARCRE_PER as tper on tper.PER_ID=fcc.PER_ID and tper.PCON_ID=gcar.PCON_ID left     join DB_FACTURACION.CARTERA_TARJETA as ctar on ctar.CART_ID=car.CART_ID     join DB_FACTURACION.TAR_CREDITO_BANCO as tcba on tcba.TCBA_ID=tper.TCBA_ID     join DB_FACTURACION.TAR_CREDITO as tar on tar.TCRE_ID=tcba.TCRE_ID   where car.CART_ESTADO_PAGO=0 and car.CART_ESTADO_LOGICO=1 and fcc.FPAG_ID=3 and tar.TCRE_ID=4   and (per.PER_NOMBRE like :texto || per.PER_CEDULA like :texto || per.PER_APELLIDO like :texto) and car.CART_FECHA_COBRO between :fecha_ini and :fecha_fin  and tper.TPER_ESTADO_PREDETERMINADA=1 and car.CART_ESTADO_LOGICO=1  and fcc.FCCA_ESTADO_LOGICO=1 and car.CART_ID not in (select CART_ID      from DB_FACTURACION.PAGO   where PAG_ESTADO_LOGICO=1 and PAG_ESTADO_COMPLETADO=1)     union all    select distinct 2 as tiporegistro,''00'' as filler, tper.TPER_NUM_TARJETA as numero_tarjeta,DATE_FORMAT(NOW(),''%Y-%m-%d'') as fecha_vale, car.CART_ID as numero_vale, ''00'' as identificacion_tipo_credito, ''000000'' as numero_autorizacion, car.CART_MONTO_PAGO as valor_consumo, ''0000000000000'' as valor_interes,car.CART_MONTO_PAGO as valor_bruto,''00'' as numero_cuotas,''1'' as tipo_moneda, ''0000000000000'' as valor_iva   from DB_FACTURACION.CARTERA as car     join DB_PREPAGA.GENERACION_CARTERA as gcar on gcar.CART_ID=car.CART_ID     join DB_PREPAGA.PAGO_RECURRENTE as prec on prec.PCON_ID=gcar.PCON_ID     join DB_CROCODILE.PERSONA as per on per.PER_ID=prec.PER_ID     join DB_PREPAGA.PERS_CONT as pcon on pcon.PCON_ID=gcar.PCON_ID     join DB_PREPAGA.TARCRE_PER as tper on tper.PER_ID=prec.PER_ID and tper.PCON_ID=gcar.PCON_ID left     join DB_FACTURACION.CARTERA_TARJETA as ctar on ctar.CART_ID=car.CART_ID     join DB_FACTURACION.TAR_CREDITO_BANCO as tcba on tcba.TCBA_ID=tper.TCBA_ID     join DB_FACTURACION.TAR_CREDITO as tar on tar.TCRE_ID=tcba.TCRE_ID   where car.CART_ESTADO_PAGO=0 and car.CART_ESTADO_LOGICO=1 and prec.FPAG_ID=3   and tar.TCRE_ID=4 and gcar.GCAR_ID not in (select fcci.GCAR_ID      from DB_PREPAGA.GENERACION_CARTERA as gcari     join DB_PREPAGA.FORMA_COBRO_CARTERA as fcci on fcci.GCAR_ID=gcari.GCAR_ID and fcci.FCCA_ESTADO_PREDETERMINADA=1   where gcari.PCON_ID=gcar.PCON_ID)    and (per.PER_NOMBRE like :texto || per.PER_CEDULA like :texto || per.PER_APELLIDO like :texto) and car.CART_FECHA_COBRO between :fecha_ini and :fecha_fin    and tper.TPER_ESTADO_PREDETERMINADA=1 and car.CART_ID not in (select CART_ID      from DB_FACTURACION.PAGO   where PAG_ESTADO_LOGICO=1 and PAG_ESTADO_COMPLETADO=1);  ', 'select distinct 1 as tiporegistro, DATE_FORMAT(NOW(),''%y-%m-%d'') as fecha_transmision, temp.ETAR_CODIGO_ESTABLECIMIENTO as codigo_comercio, emp.EMP_NOMBRE as nombre_establecimiento from DB_CROCODILE.EMPRESA as emp join DB_FACTURACION.EMPRESA_TARJETA as temp on temp.EMP_ID=emp.EMP_ID and temp.TCRE_ID=4 where emp.EMP_ID=3;', 'e', '2013-09-03 21:56:59', NULL, '1'),
(9, 7, 3, NULL, 7, 'SELECT * FROM (  select  DATE_FORMAT(car.CART_FECHA_COBRO,''%d-%m-%Y'') as fecha_transaccion,'''' as numero_vale,tper.TPER_NUM_TARJETA as numero_tarjeta,  concat(tper.TPER_ANIO_EXPIRACION,''/'',tper.TPER_MES_EXPIRACION) as fecha_expiracion,''NR'' as tipo_transaccion, ''00'' as meses_diferido,  car.CART_MONTO_PAGO as valor_transaccion,''00'' as valor_iva, car.CART_MONTO_PAGO as valor_total, ctar.CTAR_AUTORIZACION as autorizacion   from DB_FACTURACION.CARTERA as car   join DB_PREPAGA.GENERACION_CARTERA as gcar on gcar.CART_ID=car.CART_ID   join DB_PREPAGA.FORMA_COBRO_CARTERA as fcc on gcar.GCAR_ID=fcc.GCAR_ID and fcc.FCCA_ESTADO_PREDETERMINADA=1   join DB_CROCODILE.PERSONA as per on per.PER_ID=fcc.PER_ID   join DB_PREPAGA.PERS_CONT as pcon on pcon.PCON_ID=gcar.PCON_ID   join DB_PREPAGA.TARCRE_PER as tper on tper.PER_ID=fcc.PER_ID and tper.PCON_ID=gcar.PCON_ID and tper.TPER_ESTADO_PREDETERMINADA=1   join DB_FACTURACION.TAR_CREDITO_BANCO as tcba on tcba.TCBA_ID=tper.TCBA_ID left   join DB_FACTURACION.CARTERA_TARJETA as ctar on ctar.CART_ID=car.CART_ID   join DB_FACTURACION.TAR_CREDITO as tar on tar.TCRE_ID=tcba.TCRE_ID   where car.CART_ESTADO_PAGO=0 and car.CART_ESTADO_LOGICO=1 and fcc.FPAG_ID=3 and tar.TCRE_ID=1   and (per.PER_NOMBRE like :texto || per.PER_CEDULA like :texto || per.PER_APELLIDO like :texto) and car.CART_FECHA_COBRO between :fecha_ini and :fecha_fin   and fcc.FCCA_ESTADO_LOGICO=1 and car.CART_ID not in (select CART_ID   from DB_FACTURACION.PAGO   where PAG_ESTADO_LOGICO=1 AND PAG_ESTADO_COMPLETADO=1)  union all  select distinct DATE_FORMAT(car.CART_FECHA_COBRO,''%d-%m-%Y'') as fecha_transaccion, '''' as numero_vale,tper.TPER_NUM_TARJETA as numero_tarjeta,  concat(tper.TPER_ANIO_EXPIRACION,''/'',tper.TPER_MES_EXPIRACION) as fecha_expiracion, ''NR'' as tipo_transaccion, ''00'' as meses_diferido, car.CART_MONTO_PAGO as valor_transaccion,''00'' as valor_iva, car.CART_MONTO_PAGO as valor_total,ctar.CTAR_AUTORIZACION as autorizacion    from DB_FACTURACION.CARTERA as car   join DB_PREPAGA.GENERACION_CARTERA as gcar on gcar.CART_ID=car.CART_ID   join DB_PREPAGA.PAGO_RECURRENTE as prec on prec.PCON_ID=gcar.PCON_ID   join DB_CROCODILE.PERSONA as per on per.PER_ID=prec.PER_ID   join DB_PREPAGA.PERS_CONT as pcon on pcon.PCON_ID=gcar.PCON_ID   join DB_PREPAGA.TARCRE_PER as tper on tper.PER_ID=prec.PER_ID and tper.PCON_ID=gcar.PCON_ID left   join DB_FACTURACION.CARTERA_TARJETA as ctar on ctar.CART_ID=car.CART_ID   join DB_FACTURACION.TAR_CREDITO_BANCO as tcba on tcba.TCBA_ID=tper.TCBA_ID   join DB_FACTURACION.TAR_CREDITO as tar on tar.TCRE_ID=tcba.TCRE_ID   where car.CART_ESTADO_PAGO=0 and car.CART_ESTADO_LOGICO=1 and prec.FPAG_ID=3 and tar.TCRE_ID=1 and gcar.GCAR_ID not in (select fcci.GCAR_ID   from DB_PREPAGA.GENERACION_CARTERA as gcari   join DB_PREPAGA.FORMA_COBRO_CARTERA as fcci on fcci.GCAR_ID=gcari.GCAR_ID and fcci.FCCA_ESTADO_PREDETERMINADA=1   where gcari.PCON_ID=gcar.PCON_ID) and (per.PER_NOMBRE like :texto || per.PER_CEDULA like :texto || per.PER_APELLIDO like :texto) and car.CART_FECHA_COBRO between :fecha_ini and :fecha_fin and tper.TPER_ESTADO_PREDETERMINADA=1 and car.CART_ID not in (select CART_ID from DB_FACTURACION.PAGO where PAG_ESTADO_LOGICO=1 AND PAG_ESTADO_COMPLETADO=1)) as mastercard_export;', 'select distinct temp.ETAR_CODIGO_ESTABLECIMIENTO as codigo_comercio, emp.EMP_NOMBRE as nombre_establecimiento from DB_CROCODILE.EMPRESA as emp join DB_FACTURACION.EMPRESA_TARJETA as temp on temp.EMP_ID=emp.EMP_ID and temp.TCRE_ID=1 where emp.EMP_ID=3;', 'e', '2013-09-06 21:31:40', NULL, '1'),
(10, 8, 3, NULL, 7, 'SELECT *   from (   select distinct DATE_FORMAT(car.CART_FECHA_COBRO,''%d-%m-%Y'') as fecha_transaccion,'''' as numero_vale,tper.TPER_NUM_TARJETA as numero_tarjeta, concat(tper.TPER_ANIO_EXPIRACION,''/'',tper.TPER_MES_EXPIRACION) as fecha_expiracion,''NR'' as tipo_transaccion, ''00'' as meses_diferido, car.CART_MONTO_PAGO as valor_transaccion,''00'' as valor_iva, car.CART_MONTO_PAGO as valor_total, ctar.CTAR_AUTORIZACION as autorizacion   from DB_FACTURACION.CARTERA as car   join DB_PREPAGA.GENERACION_CARTERA as gcar on gcar.CART_ID=car.CART_ID   join DB_PREPAGA.FORMA_COBRO_CARTERA as fcc on gcar.GCAR_ID=fcc.GCAR_ID  and fcc.FCCA_ESTADO_PREDETERMINADA=1   join DB_CROCODILE.PERSONA as per on per.PER_ID=fcc.PER_ID   join DB_PREPAGA.PERS_CONT as pcon on pcon.PCON_ID=gcar.PCON_ID   join DB_PREPAGA.TARCRE_PER as tper on tper.PER_ID=fcc.PER_ID and tper.PCON_ID=gcar.PCON_ID left   join DB_FACTURACION.CARTERA_TARJETA as ctar on ctar.CART_ID=car.CART_ID   join DB_FACTURACION.TAR_CREDITO_BANCO as tcba on tcba.TCBA_ID=tper.TCBA_ID   join DB_FACTURACION.TAR_CREDITO as tar on tar.TCRE_ID=tcba.TCRE_ID where car.CART_ESTADO_PAGO=0 and car.CART_ESTADO_LOGICO=1 and fcc.FPAG_ID=3 and tar.TCRE_ID=2 and (per.PER_NOMBRE like :texto || per.PER_CEDULA like :texto || per.PER_APELLIDO like :texto) and car.CART_FECHA_COBRO between :fecha_ini and :fecha_fin and tper.TPER_ESTADO_PREDETERMINADA=1 and car.CART_ESTADO_LOGICO=1  and fcc.FCCA_ESTADO_LOGICO=1 and car.CART_ID not in (select CART_ID    from DB_FACTURACION.PAGO WHERE PAG_ESTADO_LOGICO=1 and PAG_ESTADO_COMPLETADO=1)    union all   select distinct DATE_FORMAT(car.CART_FECHA_COBRO,''%d-%m-%Y'') as fecha_transaccion, '''' as numero_vale,tper.TPER_NUM_TARJETA as numero_tarjeta, concat(tper.TPER_ANIO_EXPIRACION,''/'',tper.TPER_MES_EXPIRACION) as fecha_expiracion, ''NR'' as tipo_transaccion, ''00'' as meses_diferido,car.CART_MONTO_PAGO as valor_transaccion,''00'' as valor_iva, car.CART_MONTO_PAGO as valor_total,ctar.CTAR_AUTORIZACION as autorizacion  from DB_FACTURACION.CARTERA as car   join DB_PREPAGA.GENERACION_CARTERA as gcar on gcar.CART_ID=car.CART_ID   join DB_PREPAGA.PAGO_RECURRENTE as prec on prec.PCON_ID=gcar.PCON_ID   join DB_CROCODILE.PERSONA as per on per.PER_ID=prec.PER_ID   join DB_PREPAGA.PERS_CONT as pcon on pcon.PCON_ID=gcar.PCON_ID   join DB_PREPAGA.TARCRE_PER as tper on tper.PER_ID=prec.PER_ID and tper.PCON_ID=gcar.PCON_ID left   join DB_FACTURACION.CARTERA_TARJETA as ctar on ctar.CART_ID=car.CART_ID   join DB_FACTURACION.TAR_CREDITO_BANCO as tcba on tcba.TCBA_ID=tper.TCBA_ID   join DB_FACTURACION.TAR_CREDITO as tar on tar.TCRE_ID=tcba.TCRE_ID where car.CART_ESTADO_PAGO=0 and car.CART_ESTADO_LOGICO=1 and prec.FPAG_ID=3 and tar.TCRE_ID=2 and gcar.GCAR_ID not in (select fcci.GCAR_ID     from DB_PREPAGA.GENERACION_CARTERA as gcari   join DB_PREPAGA.FORMA_COBRO_CARTERA as fcci on fcci.GCAR_ID=gcari.GCAR_ID and fcci.FCCA_ESTADO_PREDETERMINADA=1 where gcari.PCON_ID=gcar.PCON_ID) and (per.PER_NOMBRE like :texto || per.PER_CEDULA like :texto || per.PER_APELLIDO like :texto) and car.CART_FECHA_COBRO between :fecha_ini and :fecha_fin and tper.TPER_ESTADO_PREDETERMINADA=1 and car.CART_ID not in (select CART_ID     from DB_FACTURACION.PAGO WHERE PAG_ESTADO_LOGICO=1 and PAG_ESTADO_COMPLETADO=1)  ) as visa_export;', 'select distinct temp.ETAR_CODIGO_ESTABLECIMIENTO as codigo_comercio, emp.EMP_NOMBRE as nombre_establecimiento from DB_CROCODILE.EMPRESA as emp join DB_FACTURACION.EMPRESA_TARJETA as temp on temp.EMP_ID=emp.EMP_ID and temp.TCRE_ID=1 where emp.EMP_ID=3;', 'e', '2013-09-03 21:20:13', NULL, '1'),
(11, 10, 2, NULL, 5, 'select distinct 2 as tiporegistro,''00'' as filler, tper.TPER_NUM_TARJETA as numero_tarjeta,DATE_FORMAT(NOW(),''%Y-%m-%d'') as fecha_vale, car.CART_ID as numero_vale,  ''00'' as identificacion_tipo_credito, ''000000'' as numero_autorizacion, car.CART_MONTO_PAGO as valor_consumo, ''0000000000000'' as valor_interes, car.CART_MONTO_PAGO as valor_bruto,''00'' as numero_cuotas,''1'' as tipo_moneda, ''0000000000000'' as valor_iva    from DB_FACTURACION.CARTERA as car       join DB_PREPAGA.GENERACION_CARTERA as gcar on gcar.CART_ID=car.CART_ID       join DB_PREPAGA.FORMA_COBRO_CARTERA as fcc on gcar.GCAR_ID=fcc.GCAR_ID  and fcc.FCCA_ESTADO_PREDETERMINADA=1       join DB_CROCODILE.PERSONA as per on per.PER_ID=fcc.PER_ID       join DB_PREPAGA.PERS_CONT as pcon on pcon.PCON_ID=gcar.PCON_ID       join DB_PREPAGA.TARCRE_PER as tper on tper.PER_ID=fcc.PER_ID and tper.PCON_ID=gcar.PCON_ID left       join DB_FACTURACION.CARTERA_TARJETA as ctar on ctar.CART_ID=car.CART_ID       join DB_FACTURACION.TAR_CREDITO_BANCO as tcba on tcba.TCBA_ID=tper.TCBA_ID       join DB_FACTURACION.TAR_CREDITO as tar on tar.TCRE_ID=tcba.TCRE_ID   where car.CART_ESTADO_PAGO=0 and car.CART_ESTADO_LOGICO=1 and fcc.FPAG_ID=3 and tar.TCRE_ID=5   and (per.PER_NOMBRE like :texto || per.PER_CEDULA like :texto || per.PER_APELLIDO like :texto) and car.CART_FECHA_COBRO between :fecha_ini and :fecha_fin   and tper.TPER_ESTADO_PREDETERMINADA=1 and car.CART_ESTADO_LOGICO=1  and fcc.FCCA_ESTADO_LOGICO=1 and car.CART_ID not in (select CART_ID      from DB_FACTURACION.PAGO   where PAG_ESTADO_LOGICO=1 and PAG_ESTADO_COMPLETADO=1)     union all    select distinct 2 as tiporegistro,''00'' as filler, tper.TPER_NUM_TARJETA as numero_tarjeta,DATE_FORMAT(NOW(),''%Y-%m-%d'') as fecha_vale, car.CART_ID as numero_vale,  ''00'' as identificacion_tipo_credito, ''000000'' as numero_autorizacion, car.CART_MONTO_PAGO as valor_consumo, ''0000000000000'' as valor_interes, car.CART_MONTO_PAGO as valor_bruto,''00'' as numero_cuotas,''1'' as tipo_moneda, ''0000000000000'' as valor_iva    from DB_FACTURACION.CARTERA as car       join DB_PREPAGA.GENERACION_CARTERA as gcar on gcar.CART_ID=car.CART_ID       join DB_PREPAGA.PAGO_RECURRENTE as prec on prec.PCON_ID=gcar.PCON_ID       join DB_CROCODILE.PERSONA as per on per.PER_ID=prec.PER_ID       join DB_PREPAGA.PERS_CONT as pcon on pcon.PCON_ID=gcar.PCON_ID       join DB_PREPAGA.TARCRE_PER as tper on tper.PER_ID=prec.PER_ID and tper.PCON_ID=gcar.PCON_ID left       join DB_FACTURACION.CARTERA_TARJETA as ctar on ctar.CART_ID=car.CART_ID       join DB_FACTURACION.TAR_CREDITO_BANCO as tcba on tcba.TCBA_ID=tper.TCBA_ID       join DB_FACTURACION.TAR_CREDITO as tar on tar.TCRE_ID=tcba.TCRE_ID   where car.CART_ESTADO_PAGO=0 and car.CART_ESTADO_LOGICO=1 and prec.FPAG_ID=3   and tar.TCRE_ID=5 and gcar.GCAR_ID not in (select fcci.GCAR_ID      from DB_PREPAGA.GENERACION_CARTERA as gcari       join DB_PREPAGA.FORMA_COBRO_CARTERA as fcci on fcci.GCAR_ID=gcari.GCAR_ID and fcci.FCCA_ESTADO_PREDETERMINADA=1   where gcari.PCON_ID=gcar.PCON_ID)    and (per.PER_NOMBRE like :texto || per.PER_CEDULA like :texto || per.PER_APELLIDO like :texto) and car.CART_FECHA_COBRO between :fecha_ini and :fecha_fin   and tper.TPER_ESTADO_PREDETERMINADA=1 and car.CART_ID not in (select CART_ID      from DB_FACTURACION.PAGO   where PAG_ESTADO_LOGICO=1 and PAG_ESTADO_COMPLETADO=1);  ', NULL, 'e', '2013-09-03 22:27:35', NULL, '1'),
(12, 11, 5, NULL, NULL, NULL, NULL, 'e', '2013-07-18 22:21:57', NULL, '1');

-- --------------------------------------------------------

--
-- Table structure for table `RPT_ARCHIVO_COLUMNA`
--

CREATE TABLE IF NOT EXISTS `RPT_ARCHIVO_COLUMNA` (
  `RACO_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RACO_DESCRIPCION` varchar(1000) NOT NULL,
  `RACO_TIPO_DATO` varchar(100) NOT NULL,
  `RACO_FECHA_CREACION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `RACO_FECHA_MODIFICACION` timestamp NULL DEFAULT NULL,
  `RACO_ESTADO_LOGICO` varchar(1) NOT NULL,
  PRIMARY KEY (`RACO_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `RPT_ARCHIVO_COLUMNA`
--

INSERT INTO `RPT_ARCHIVO_COLUMNA` (`RACO_ID`, `RACO_DESCRIPCION`, `RACO_TIPO_DATO`, `RACO_FECHA_CREACION`, `RACO_FECHA_MODIFICACION`, `RACO_ESTADO_LOGICO`) VALUES
(1, 'Fecha', 'timestamp', '2013-07-11 20:07:31', NULL, '1'),
(2, 'Banco', 'VARCHAR(1000)', '2013-07-11 20:07:31', NULL, '1'),
(3, 'Codigo', 'varchar(1000)', '2013-07-11 20:07:31', NULL, '1'),
(4, 'Moneda', 'varchar(30)', '2013-07-11 20:07:31', NULL, '1'),
(5, 'Valor', 'decimal(12,2)', '2013-07-11 20:07:31', NULL, '1'),
(6, 'Valor Procesado', 'decimal(12,2)', '2013-07-11 20:07:31', NULL, '1'),
(7, 'Saldo', 'decimal(12,2)', '2013-07-11 20:07:31', NULL, '1'),
(8, 'Estado', 'varchar(50)', '2013-07-11 20:07:31', NULL, '1'),
(9, 'Referencia Adicional', 'varchar(100)', '2013-07-11 20:07:31', NULL, '1');

-- --------------------------------------------------------

--
-- Table structure for table `RPT_ARCH_COLUM`
--

CREATE TABLE IF NOT EXISTS `RPT_ARCH_COLUM` (
  `RACL_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RARC_ID` bigint(20) NOT NULL,
  `RACO_ID` bigint(20) NOT NULL,
  `RACL_FECHA_CREACION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `RACL_FECHA_MODIFICACION` timestamp NULL DEFAULT NULL,
  `RACL_ESTADO_LOGICO` varchar(1) NOT NULL,
  PRIMARY KEY (`RACL_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `RPT_ARCH_COLUM`
--

INSERT INTO `RPT_ARCH_COLUM` (`RACL_ID`, `RARC_ID`, `RACO_ID`, `RACL_FECHA_CREACION`, `RACL_FECHA_MODIFICACION`, `RACL_ESTADO_LOGICO`) VALUES
(1, 1, 1, '2013-07-11 20:07:31', NULL, '1'),
(2, 1, 2, '2013-07-11 20:07:31', NULL, '1'),
(3, 1, 3, '2013-07-11 20:07:31', NULL, '1'),
(4, 1, 4, '2013-07-11 20:07:31', NULL, '1'),
(5, 1, 5, '2013-07-11 20:07:31', NULL, '1'),
(6, 1, 6, '2013-07-11 20:07:31', NULL, '1'),
(7, 1, 7, '2013-07-11 20:07:31', NULL, '1'),
(8, 1, 8, '2013-07-11 20:07:31', NULL, '1');

-- --------------------------------------------------------

--
-- Table structure for table `RPT_DATA`
--

CREATE TABLE IF NOT EXISTS `RPT_DATA` (
  `RDAT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RDAT_CLAVE` varchar(100) NOT NULL,
  `RDAT_VALOR` varchar(45) NOT NULL,
  `RDAT_TDAT` varchar(45) DEFAULT NULL,
  `RDAT_FECHA_CREACION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `RDAT_FECHA_MODIFICACION` timestamp NULL DEFAULT NULL,
  `RDAT_ESTADO_LOGICO` varchar(1) NOT NULL,
  PRIMARY KEY (`RDAT_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `RPT_DATA`
--

INSERT INTO `RPT_DATA` (`RDAT_ID`, `RDAT_CLAVE`, `RDAT_VALOR`, `RDAT_TDAT`, `RDAT_FECHA_CREACION`, `RDAT_FECHA_MODIFICACION`, `RDAT_ESTADO_LOGICO`) VALUES
(1, ':texto', 'idtext', '2', '2013-07-11 20:07:31', NULL, '1'),
(2, ':fecha_ini', 'idfechaini', '2', '2013-07-11 20:07:31', NULL, '1'),
(3, ':fecha_fin', 'idfechafin', '2', '2013-07-11 20:07:31', NULL, '1'),
(4, 'idreporte', '1', NULL, '2013-07-11 20:07:31', NULL, '1');

-- --------------------------------------------------------

--
-- Table structure for table `RPT_DATA_FILTRO`
--

CREATE TABLE IF NOT EXISTS `RPT_DATA_FILTRO` (
  `RDFI_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RDFI_DESCRIPCION` varchar(100) DEFAULT NULL,
  `RDAT_ID` bigint(20) DEFAULT NULL,
  `RFIL_ID` bigint(20) DEFAULT NULL,
  `RDFI_FECHA_CREACION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `RDFI_FECHA_MODIFICACION` timestamp NULL DEFAULT NULL,
  `RDFI_ESTADO_LOGICO` varchar(1) NOT NULL,
  PRIMARY KEY (`RDFI_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `RPT_DATA_FILTRO`
--

INSERT INTO `RPT_DATA_FILTRO` (`RDFI_ID`, `RDFI_DESCRIPCION`, `RDAT_ID`, `RFIL_ID`, `RDFI_FECHA_CREACION`, `RDFI_FECHA_MODIFICACION`, `RDFI_ESTADO_LOGICO`) VALUES
(1, NULL, 1, 1, '2013-07-11 20:07:31', NULL, '1'),
(2, NULL, 2, 2, '2013-07-11 20:07:31', NULL, '1'),
(3, NULL, 3, 3, '2013-07-11 20:07:31', NULL, '1');

-- --------------------------------------------------------

--
-- Table structure for table `RPT_DELIMITADOR_CAMPO`
--

CREATE TABLE IF NOT EXISTS `RPT_DELIMITADOR_CAMPO` (
  `RDCA_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RDCA_NOMBRE` varchar(50) NOT NULL,
  `RDCA_FECHA_CREACION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `RDCA_FECHA_MODIFICACION` timestamp NULL DEFAULT NULL,
  `RDCA_ESTADO_LOGICO` varchar(1) NOT NULL,
  PRIMARY KEY (`RDCA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `RPT_DELI_TARC`
--

CREATE TABLE IF NOT EXISTS `RPT_DELI_TARC` (
  `RDTA_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RTAR_ID` bigint(20) NOT NULL,
  `RDCA_ID` bigint(20) NOT NULL,
  `RDTA_FECHA_CREACION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `RDTA_FECHA_MODIFICACION` timestamp NULL DEFAULT NULL,
  `RDTA_ESTADO_LOGICO` varchar(1) NOT NULL,
  PRIMARY KEY (`RDTA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `RPT_ETIQUETA`
--

CREATE TABLE IF NOT EXISTS `RPT_ETIQUETA` (
  `RETI_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RETI_NOMBRE` varchar(50) NOT NULL,
  `RETI_LABEL` varchar(45) DEFAULT NULL,
  `RETI_MESSAGE` varchar(70) NOT NULL,
  `RETI_CAB_STYLE` varchar(250) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'campo permite agregar estilos a la cabecera',
  `RETI_HTML_OPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'campo permite agregar html options a las columnas',
  `RETI_FNT_VALUE` varchar(250) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'campo permite agregar una funcion que reciba el valor de la columna',
  `RETI_FECHA_CREACION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `RETI_FECHA_MODIFICACION` timestamp NULL DEFAULT NULL,
  `RETI_ESTADO_LOGICO` varchar(1) NOT NULL,
  PRIMARY KEY (`RETI_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `RPT_ETIQUETA`
--

INSERT INTO `RPT_ETIQUETA` (`RETI_ID`, `RETI_NOMBRE`, `RETI_LABEL`, `RETI_MESSAGE`, `RETI_CAB_STYLE`, `RETI_HTML_OPTION`, `RETI_FNT_VALUE`, `RETI_FECHA_CREACION`, `RETI_FECHA_MODIFICACION`, `RETI_ESTADO_LOGICO`) VALUES
(1, 'id', NULL, '', NULL, NULL, NULL, '2013-07-11 20:07:32', NULL, '1'),
(2, 'cedulapaga', 'Identification', 'GENERAL', NULL, NULL, NULL, '2013-08-12 16:48:58', NULL, '1'),
(3, 'nombrepaga', 'Names', 'PERSONA', NULL, NULL, NULL, '2013-07-11 20:07:32', NULL, '1'),
(4, 'apellidopaga', 'Last Names', 'PERSONA', NULL, NULL, NULL, '2013-07-11 20:07:32', NULL, '1'),
(5, 'valor_cobro', 'Value Collection', 'CARTERA', '{"style": "text-align: right"}', '{"style": "text-align: right; width: 55px"}', 'CARTERA::agregardolar', '2013-09-19 16:56:43', NULL, '1'),
(6, 'tipocuenta', 'Type Bank Account', 'BANCO', NULL, NULL, NULL, '2013-07-11 20:07:32', NULL, '1'),
(8, 'fecha', 'Collection Date', 'CARTERA', '{"style": "text-align: center"}', '{"style": "text-align: center"}', NULL, '2013-09-19 16:57:48', NULL, '1'),
(9, 'numcuenta', 'Bank Account Number', 'BANCO', '{"style": "text-align: right"}', '{"style": "text-align: right"}', NULL, '2013-09-19 16:58:48', NULL, '1'),
(10, 'banco', 'Bank', 'GENERAL', NULL, NULL, NULL, '2013-07-11 20:07:32', NULL, '1'),
(11, 'cedulatit', 'DNI', 'AFILIADO', NULL, NULL, NULL, '2013-07-11 20:07:32', NULL, '1'),
(12, 'nombretit', 'Names', 'AFILIADO', NULL, NULL, NULL, '2013-07-11 20:07:32', NULL, '1'),
(13, 'apellidotit', 'Last Names', 'AFILIADO', NULL, NULL, NULL, '2013-07-11 20:07:32', NULL, '1'),
(14, 'contrato', 'Agreement', 'PERS_CONT', '{"style": "text-align: right"}', '{"style": "text-align: right; width: 75px"}', NULL, '2013-09-19 16:59:31', NULL, '1'),
(15, 'nombrespaga', 'Charge to', 'CARTERA', NULL, NULL, 'CARTERA::agregarTooltip', '2013-07-11 20:07:32', NULL, '1'),
(16, 'titular', 'Titular', 'GENERAL', NULL, NULL, 'CARTERA::agregarTooltip', '2013-07-11 20:07:32', NULL, '1'),
(17, 'num_tarjeta', 'Card Number', 'TARJETA_CREDITO', '{"style": "text-align: right"}', '{"style": "text-align: right"}', NULL, '2013-09-19 16:58:40', NULL, '1'),
(18, 'codigo_sec', 'Security code', 'TARJETA_CREDITO', NULL, NULL, NULL, '2013-07-11 20:07:32', NULL, '1'),
(19, 'fecha_expiracion', 'Expiration Date', 'TARJETA_CREDITO', NULL, NULL, NULL, '2013-07-11 20:07:32', NULL, '1'),
(20, 'contrato', 'Contract', 'CONTRATO', '{"style": "text-align: right"}', '{"style": "text-align: right; width: 75px"}', NULL, '2013-09-19 16:59:25', NULL, '1'),
(21, 'tarjeta', 'Credit Card', 'TARJETA_CREDITO', '{"style": "text-align: center"}', '{"style": "text-align: center"}', NULL, '2013-09-19 16:58:10', NULL, '1'),
(22, 'autorizacion', 'Authorization', 'TARJETA_CREDITO', '{"style": "text-align: right"}', '{"style": "text-align: center"}', NULL, '2013-09-19 16:58:05', NULL, '1'),
(23, 'boton_autorizacion', 'Authorize', 'TARJETA_CREDITO', '{"style": "text-align: center"}', '{"style": "text-align: center"}', 'CARTERA::boton_autorizar', '2013-09-19 16:58:01', NULL, '1');

-- --------------------------------------------------------

--
-- Table structure for table `RPT_ETIQUETA_REPORTE`
--

CREATE TABLE IF NOT EXISTS `RPT_ETIQUETA_REPORTE` (
  `RERP_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RETI_ID` bigint(20) NOT NULL,
  `RPT_ID` bigint(20) NOT NULL,
  `RERP_DESCRIPCION` varchar(100) DEFAULT NULL,
  `RERP_FECHA_CREACION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `RERP_FECHA_MODIFICACION` timestamp NULL DEFAULT NULL,
  `RERP_ESTADO_LOGICO` varchar(1) NOT NULL,
  PRIMARY KEY (`RERP_ID`),
  KEY `RETI_ID` (`RETI_ID`),
  KEY `RPT_ID` (`RPT_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=90 ;

--
-- Dumping data for table `RPT_ETIQUETA_REPORTE`
--

INSERT INTO `RPT_ETIQUETA_REPORTE` (`RERP_ID`, `RETI_ID`, `RPT_ID`, `RERP_DESCRIPCION`, `RERP_FECHA_CREACION`, `RERP_FECHA_MODIFICACION`, `RERP_ESTADO_LOGICO`) VALUES
(3, 2, 1, NULL, '2013-07-11 20:07:32', NULL, '1'),
(4, 15, 1, NULL, '2013-07-11 20:07:32', NULL, '1'),
(5, 6, 1, NULL, '2013-07-11 20:07:32', NULL, '1'),
(6, 9, 1, NULL, '2013-07-11 20:07:32', NULL, '1'),
(7, 8, 1, NULL, '2013-07-11 20:07:32', NULL, '1'),
(8, 5, 1, NULL, '2013-07-11 20:07:32', NULL, '1'),
(10, 1, 2, NULL, '2013-07-11 20:07:32', NULL, '1'),
(11, 2, 2, NULL, '2013-07-11 20:07:32', NULL, '1'),
(12, 15, 2, NULL, '2013-07-11 20:07:32', NULL, '1'),
(13, 16, 2, NULL, '2013-07-11 20:07:32', NULL, '1'),
(14, 6, 2, NULL, '2013-07-11 20:07:32', NULL, '1'),
(15, 9, 2, NULL, '2013-07-11 20:07:32', NULL, '1'),
(16, 8, 2, NULL, '2013-07-11 20:07:32', NULL, '1'),
(17, 5, 2, NULL, '2013-07-11 20:07:32', NULL, '1'),
(18, 12, 2, NULL, '2013-07-11 20:07:32', NULL, '0'),
(19, 2, 4, NULL, '2013-07-18 18:49:28', NULL, '1'),
(20, 14, 4, NULL, '2013-07-18 18:50:58', NULL, '0'),
(21, 15, 4, NULL, '2013-07-18 18:49:05', NULL, '1'),
(22, 6, 4, NULL, '2013-07-18 18:48:57', NULL, '1'),
(23, 9, 4, NULL, '2013-07-18 18:48:47', NULL, '1'),
(24, 5, 4, NULL, '2013-07-18 18:48:40', NULL, '1'),
(25, 10, 4, NULL, '2013-07-18 18:48:30', NULL, '1'),
(26, 10, 4, NULL, '2013-07-11 20:07:32', NULL, '0'),
(27, 14, 4, NULL, '2013-07-11 20:07:32', NULL, '0'),
(28, 2, 1, NULL, '2013-07-11 20:07:32', NULL, '0'),
(29, 15, 1, NULL, '2013-07-11 20:07:32', NULL, '0'),
(30, 2, 5, NULL, '2013-07-11 20:07:32', NULL, '1'),
(31, 15, 5, NULL, '2013-07-11 20:07:32', NULL, '1'),
(32, 5, 5, NULL, '2013-07-11 20:07:32', NULL, '1'),
(33, 14, 5, NULL, '2013-07-11 20:07:32', NULL, '1'),
(34, 8, 5, NULL, '2013-07-11 20:07:32', NULL, '1'),
(35, 6, 5, NULL, '2013-07-11 20:07:32', NULL, '1'),
(36, 9, 5, NULL, '2013-07-11 20:07:32', NULL, '1'),
(37, 2, 6, NULL, '2013-07-11 20:07:32', NULL, '1'),
(38, 15, 6, NULL, '2013-07-11 20:07:32', NULL, '1'),
(39, 20, 6, NULL, '2013-07-11 20:07:32', NULL, '1'),
(40, 8, 6, NULL, '2013-07-11 20:07:32', NULL, '1'),
(41, 17, 6, NULL, '2013-07-11 20:07:32', NULL, '1'),
(42, 18, 6, NULL, '2013-07-17 18:19:15', NULL, '0'),
(43, 19, 6, NULL, '2013-07-11 20:07:32', NULL, '1'),
(44, 5, 6, NULL, '2013-07-11 20:07:32', NULL, '1'),
(45, 2, 7, NULL, '2013-07-11 20:07:32', NULL, '1'),
(46, 15, 7, NULL, '2013-07-11 20:07:32', NULL, '1'),
(47, 20, 7, NULL, '2013-07-11 20:07:32', NULL, '1'),
(48, 8, 7, NULL, '2013-07-11 20:07:32', NULL, '1'),
(49, 17, 7, NULL, '2013-07-11 20:07:32', NULL, '1'),
(50, 18, 7, NULL, '2013-07-11 20:07:32', NULL, '0'),
(51, 19, 7, NULL, '2013-07-11 20:07:32', NULL, '0'),
(52, 5, 7, NULL, '2013-07-11 20:07:32', NULL, '1'),
(53, 2, 8, NULL, '2013-07-11 20:07:32', NULL, '1'),
(54, 15, 8, NULL, '2013-07-11 20:07:32', NULL, '1'),
(55, 20, 8, NULL, '2013-07-11 20:07:32', NULL, '1'),
(56, 8, 8, NULL, '2013-07-11 20:07:32', NULL, '1'),
(57, 17, 8, NULL, '2013-07-11 20:07:32', NULL, '1'),
(58, 18, 8, NULL, '2013-07-11 20:07:32', NULL, '0'),
(59, 19, 8, NULL, '2013-07-11 20:07:32', NULL, '0'),
(60, 5, 8, NULL, '2013-07-11 20:07:32', NULL, '1'),
(61, 2, 9, NULL, '2013-07-11 20:07:32', NULL, '1'),
(62, 15, 9, NULL, '2013-07-11 20:07:32', NULL, '1'),
(63, 20, 9, NULL, '2013-07-11 20:07:32', NULL, '1'),
(64, 8, 9, NULL, '2013-07-11 20:07:32', NULL, '1'),
(65, 17, 9, NULL, '2013-07-11 20:07:32', NULL, '1'),
(66, 18, 9, NULL, '2013-07-17 18:20:13', NULL, '0'),
(67, 19, 9, NULL, '2013-07-11 20:07:32', NULL, '1'),
(68, 5, 9, NULL, '2013-07-11 20:07:32', NULL, '1'),
(69, 2, 10, NULL, '2013-07-11 20:07:32', NULL, '1'),
(70, 15, 10, NULL, '2013-07-11 20:07:32', NULL, '1'),
(71, 20, 10, NULL, '2013-07-11 20:07:32', NULL, '1'),
(72, 8, 10, NULL, '2013-07-11 20:07:32', NULL, '1'),
(73, 17, 10, NULL, '2013-07-11 20:07:32', NULL, '1'),
(74, 18, 10, NULL, '2013-07-17 18:31:44', NULL, '0'),
(75, 19, 10, NULL, '2013-07-11 20:07:32', NULL, '1'),
(76, 5, 10, NULL, '2013-07-11 20:07:32', NULL, '1'),
(77, 2, 11, NULL, '2013-07-11 20:07:32', NULL, '1'),
(78, 15, 11, NULL, '2013-07-11 20:07:32', NULL, '1'),
(79, 20, 11, NULL, '2013-07-11 20:07:32', NULL, '1'),
(80, 8, 11, NULL, '2013-07-11 20:07:32', NULL, '1'),
(81, 17, 11, NULL, '2013-07-11 20:07:32', NULL, '1'),
(82, 18, 11, NULL, '2013-07-17 16:46:51', NULL, '0'),
(83, 19, 11, NULL, '2013-07-11 20:07:32', NULL, '1'),
(84, 5, 11, NULL, '2013-07-11 20:07:32', NULL, '1'),
(85, 21, 11, NULL, '2013-07-11 20:07:32', NULL, '1'),
(86, 22, 7, NULL, '2013-07-11 20:07:32', NULL, '1'),
(87, 22, 8, NULL, '2013-07-11 20:07:32', NULL, '1'),
(88, 23, 7, NULL, '2013-07-11 20:07:32', NULL, '1'),
(89, 23, 8, NULL, '2013-07-11 20:07:32', NULL, '1');

-- --------------------------------------------------------

--
-- Table structure for table `RPT_EXP_REGULAR`
--

CREATE TABLE IF NOT EXISTS `RPT_EXP_REGULAR` (
  `RERE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RERE_VALUE` text NOT NULL,
  `RERE_NOMBRE` varchar(70) DEFAULT NULL,
  `RERE_FECHA_CREACION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `RERE_FECHA_MODFICACION` timestamp NULL DEFAULT NULL,
  `RERE_ESTADO_LOGICO` varchar(1) NOT NULL,
  `RERE_DESCRIPCION` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`RERE_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `RPT_EXP_REGULAR`
--

INSERT INTO `RPT_EXP_REGULAR` (`RERE_ID`, `RERE_VALUE`, `RERE_NOMBRE`, `RERE_FECHA_CREACION`, `RERE_FECHA_MODFICACION`, `RERE_ESTADO_LOGICO`, `RERE_DESCRIPCION`) VALUES
(1, '/^[0-9]+$/', 'NATURALES', '2013-07-11 20:07:32', NULL, '1', 'NUMEROS POSITIVOS'),
(2, '/^[a-z]$/', 'CADENAS', '2013-07-11 20:07:32', NULL, '1', 'LETRAS DE LA A A LA Z'),
(3, '(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d', 'FECHA', '2013-07-11 20:07:32', NULL, '1', 'FECHA TIPO DD/MM/YYY');

-- --------------------------------------------------------

--
-- Table structure for table `RPT_FILTRO`
--

CREATE TABLE IF NOT EXISTS `RPT_FILTRO` (
  `RFIL_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RTF_ID` bigint(20) NOT NULL,
  `RPAR_ID` bigint(20) DEFAULT NULL,
  `RFIL_ID_ELEMT_HTML` varchar(100) NOT NULL,
  `RFIL_VALOR` text NOT NULL,
  `RFIL_TIPO_VALOR` varchar(100) NOT NULL,
  `RFIL_LABEL` varchar(90) DEFAULT NULL,
  `RFIL_CON_AJAX` tinyint(1) NOT NULL,
  `RFIL_URL` varchar(1000) DEFAULT NULL,
  `RFIL_CAMPO_UPDATE` varchar(100) DEFAULT NULL,
  `RFIL_LANGUAGE` varchar(100) DEFAULT NULL,
  `RFIL_DIV_ID` varchar(50) DEFAULT NULL,
  `RFIL_FECHA_CREACION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `RFIL_FECHA_MODFICACION` timestamp NULL DEFAULT NULL,
  `RFIL_ESTADO_LOGICO` varchar(1) NOT NULL,
  `RFIL_INDICE_DEFAULT` bigint(20) DEFAULT NULL,
  `RFIL_ENTIDAD` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`RFIL_ID`),
  KEY `RPT_FILTRO_ibfk_1` (`RFIL_ID`),
  KEY `RPAR_ID` (`RPAR_ID`),
  KEY `REPORTE_FILTRO_ibfk_1` (`RTF_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `RPT_FILTRO`
--

INSERT INTO `RPT_FILTRO` (`RFIL_ID`, `RTF_ID`, `RPAR_ID`, `RFIL_ID_ELEMT_HTML`, `RFIL_VALOR`, `RFIL_TIPO_VALOR`, `RFIL_LABEL`, `RFIL_CON_AJAX`, `RFIL_URL`, `RFIL_CAMPO_UPDATE`, `RFIL_LANGUAGE`, `RFIL_DIV_ID`, `RFIL_FECHA_CREACION`, `RFIL_FECHA_MODFICACION`, `RFIL_ESTADO_LOGICO`, `RFIL_INDICE_DEFAULT`, `RFIL_ENTIDAD`) VALUES
(1, 5, 1, 'idtext', '', 'text', 'Search', 1, '', '', 'CARTERA', '', '2013-07-11 20:07:32', NULL, '1', 1, ''),
(2, 2, 2, 'idfechaini', '2011-01-01', 'fecha', 'start date', 0, '', '', 'CARTERA', 'idfechaini', '2013-07-11 20:07:32', NULL, '1', 1, 'CARTERA'),
(3, 2, 3, 'idfechafin', '2014-01-01', 'fecha', 'end date', 0, NULL, NULL, 'CARTERA', 'idfechafin', '2013-07-11 20:07:32', NULL, '1', 1, 'CARTERA'),
(4, 6, NULL, 'idboton', '', 'boton', 'Search', 1, '', 'idgridcobros', 'CARTERA', 'idboton', '2013-07-11 20:07:32', NULL, '1', 1, 'CARTERA');

-- --------------------------------------------------------

--
-- Table structure for table `RPT_FILTRO_INTERNO`
--

CREATE TABLE IF NOT EXISTS `RPT_FILTRO_INTERNO` (
  `RFIN_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RFIN_RFIL_ID` varchar(100) NOT NULL,
  `RFIN_RFIL_NOMBRE` varchar(100) NOT NULL,
  `RFIL_ID` bigint(20) NOT NULL,
  `RFIN_LANGUAJE` varchar(100) DEFAULT NULL,
  `RFIN_FECHA_CREACION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `RFIN_FECHA_MODIFICACION` timestamp NULL DEFAULT NULL,
  `RFIN_ESTADO_LOGICO` varchar(1) NOT NULL,
  PRIMARY KEY (`RFIN_ID`),
  KEY `fk_RPT_FILTRO_INTERNO_1` (`RFIL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `RPT_FILTRO_REPORTE`
--

CREATE TABLE IF NOT EXISTS `RPT_FILTRO_REPORTE` (
  `RFRE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RPT_ID` bigint(20) NOT NULL,
  `RFIL_ID` bigint(20) NOT NULL,
  `RFRE_FECHA_CREACION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `RFRE_FECHA_MODIFICACION` timestamp NULL DEFAULT NULL,
  `RFRE_ESTADO_LOGICO` varchar(1) NOT NULL,
  PRIMARY KEY (`RFRE_ID`),
  KEY `RPT_ID` (`RPT_ID`),
  KEY `RFIL_ID` (`RFIL_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `RPT_FILTRO_REPORTE`
--

INSERT INTO `RPT_FILTRO_REPORTE` (`RFRE_ID`, `RPT_ID`, `RFIL_ID`, `RFRE_FECHA_CREACION`, `RFRE_FECHA_MODIFICACION`, `RFRE_ESTADO_LOGICO`) VALUES
(1, 1, 1, '2013-07-11 20:07:32', NULL, '1'),
(2, 1, 2, '2013-07-11 20:07:32', NULL, '1'),
(3, 1, 3, '2013-07-11 20:07:32', NULL, '1'),
(5, 2, 1, '2013-07-11 20:07:32', NULL, '1'),
(6, 2, 2, '2013-07-11 20:07:32', NULL, '1'),
(7, 2, 3, '2013-07-11 20:07:32', NULL, '1'),
(9, 4, 1, '2013-07-11 20:07:32', NULL, '1'),
(10, 4, 2, '2013-07-11 20:07:32', NULL, '1'),
(11, 4, 3, '2013-07-11 20:07:32', NULL, '1'),
(12, 5, 1, '2013-07-11 20:07:32', NULL, '1'),
(13, 5, 2, '2013-07-11 20:07:32', NULL, '1'),
(14, 5, 3, '2013-07-11 20:07:32', NULL, '1'),
(15, 6, 1, '2013-07-11 20:07:32', NULL, '1'),
(16, 6, 2, '2013-07-11 20:07:32', NULL, '1'),
(17, 6, 3, '2013-07-11 20:07:32', NULL, '1'),
(18, 7, 1, '2013-07-11 20:07:32', NULL, '1'),
(19, 7, 2, '2013-07-11 20:07:32', NULL, '1'),
(20, 7, 3, '2013-07-11 20:07:32', NULL, '1'),
(21, 8, 1, '2013-07-11 20:07:32', NULL, '1'),
(22, 8, 2, '2013-07-11 20:07:32', NULL, '1'),
(23, 8, 3, '2013-07-11 20:07:32', NULL, '1'),
(24, 9, 1, '2013-07-11 20:07:32', NULL, '1'),
(25, 9, 2, '2013-07-11 20:07:32', NULL, '1'),
(26, 9, 3, '2013-07-11 20:07:32', NULL, '1'),
(27, 10, 1, '2013-07-11 20:07:32', NULL, '1'),
(28, 10, 2, '2013-07-11 20:07:32', NULL, '1'),
(29, 10, 3, '2013-07-11 20:07:32', NULL, '1'),
(30, 11, 1, '2013-07-11 20:07:32', NULL, '1'),
(31, 11, 2, '2013-09-02 23:07:25', NULL, '0'),
(32, 11, 3, '2013-09-02 23:07:25', NULL, '0');

-- --------------------------------------------------------

--
-- Table structure for table `RPT_GOGR`
--

CREATE TABLE IF NOT EXISTS `RPT_GOGR` (
  `RGOG_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RTSU_ID` bigint(20) NOT NULL,
  `GOGR_ID` bigint(20) NOT NULL,
  `RGOG_FECHA_CREACION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `RGOG_FECHA_MODIFICACION` timestamp NULL DEFAULT NULL,
  `RGOG_ESTADO_LOGICO` varchar(1) NOT NULL,
  PRIMARY KEY (`RGOG_ID`),
  KEY `RPT_ID` (`RTSU_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `RPT_GOGR`
--

INSERT INTO `RPT_GOGR` (`RGOG_ID`, `RTSU_ID`, `GOGR_ID`, `RGOG_FECHA_CREACION`, `RGOG_FECHA_MODIFICACION`, `RGOG_ESTADO_LOGICO`) VALUES
(1, 1, 2, '2013-07-11 20:07:32', NULL, '1'),
(2, 1, 12, '2013-07-11 20:07:32', NULL, '0'),
(3, 1, 22, '2013-07-11 20:07:32', NULL, '0'),
(4, 6, 2, '2013-07-11 20:07:32', NULL, '1'),
(5, 6, 12, '2013-07-11 20:07:32', NULL, '0'),
(6, 6, 22, '2013-07-11 20:07:32', NULL, '0');

-- --------------------------------------------------------

--
-- Table structure for table `RPT_PARAMETROS`
--

CREATE TABLE IF NOT EXISTS `RPT_PARAMETROS` (
  `RPAR_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RERE_ID` bigint(20) NOT NULL,
  `RPAR_VALOR` varchar(100) NOT NULL,
  `RPAR_NOMBRE` varchar(50) NOT NULL,
  `RPAR_FECHA_CREACION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `RPAR_FECHA_MODIFICACION` timestamp NULL DEFAULT NULL,
  `RPAR_ESTADO_LOGICO` varchar(1) NOT NULL,
  `RPAR_TIPO_PARAM` int(11) DEFAULT NULL,
  PRIMARY KEY (`RPAR_ID`),
  KEY `RERE_ID` (`RERE_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `RPT_PARAMETROS`
--

INSERT INTO `RPT_PARAMETROS` (`RPAR_ID`, `RERE_ID`, `RPAR_VALOR`, `RPAR_NOMBRE`, `RPAR_FECHA_CREACION`, `RPAR_FECHA_MODIFICACION`, `RPAR_ESTADO_LOGICO`, `RPAR_TIPO_PARAM`) VALUES
(1, 2, '%%', ':texto', '2013-07-11 20:07:32', NULL, '1', 2),
(2, 3, '2011-12-04', ':fecha_ini', '2013-07-11 20:07:32', NULL, '1', 2),
(3, 3, '2013-12-04', ':fecha_fin', '2013-07-11 20:07:32', NULL, '1', 2);

-- --------------------------------------------------------

--
-- Table structure for table `RPT_PARAMETRO_REPORTE`
--

CREATE TABLE IF NOT EXISTS `RPT_PARAMETRO_REPORTE` (
  `RPRE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RPT_ID` bigint(20) NOT NULL,
  `RPAR_ID` bigint(20) NOT NULL,
  `RPRE_DECRIPCION` varchar(100) DEFAULT NULL,
  `RPRE_FECHA_CREACION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `RPRE_FECHA_MODIFICACION` timestamp NULL DEFAULT NULL,
  `RPRE_ESTADO_LOGICO` varchar(1) NOT NULL,
  PRIMARY KEY (`RPRE_ID`),
  KEY `RPT_ID` (`RPT_ID`),
  KEY `RPAR_ID` (`RPAR_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `RPT_PARAMETRO_REPORTE`
--

INSERT INTO `RPT_PARAMETRO_REPORTE` (`RPRE_ID`, `RPT_ID`, `RPAR_ID`, `RPRE_DECRIPCION`, `RPRE_FECHA_CREACION`, `RPRE_FECHA_MODIFICACION`, `RPRE_ESTADO_LOGICO`) VALUES
(1, 1, 1, 'gye-:texto', '2013-07-11 20:07:32', NULL, '1'),
(2, 1, 2, 'gye-:fecha_ini', '2013-07-11 20:07:32', NULL, '1'),
(3, 1, 3, 'gye-:fecha_fin', '2013-07-11 20:07:32', NULL, '1'),
(4, 2, 1, 'pich-:texto', '2013-07-11 20:07:32', NULL, '1'),
(5, 2, 2, 'pich-:fecha_ini', '2013-07-11 20:07:32', NULL, '1'),
(6, 2, 3, 'pich-:fecha_fin', '2013-07-11 20:07:32', NULL, '1'),
(7, 4, 1, 'deb-:texto', '2013-07-11 20:07:32', NULL, '1'),
(8, 4, 2, 'deb-:fecha_ini', '2013-07-11 20:07:32', NULL, '1'),
(9, 4, 3, 'deb-:fecha_fin', '2013-07-11 20:07:32', NULL, '1'),
(13, 5, 1, 'paci-:texto', '2013-07-11 20:07:32', NULL, '1'),
(14, 5, 2, 'paci-:fecha_ini', '2013-07-11 20:07:32', NULL, '1'),
(15, 5, 3, 'paci-:fecha_fin', '2013-07-11 20:07:32', NULL, '1'),
(16, 6, 1, NULL, '2013-07-11 20:07:32', NULL, '1'),
(17, 6, 2, NULL, '2013-07-11 20:07:32', NULL, '1'),
(18, 6, 3, NULL, '2013-07-11 20:07:32', NULL, '1'),
(19, 7, 1, NULL, '2013-07-11 20:07:32', NULL, '1'),
(20, 7, 2, NULL, '2013-07-11 20:07:32', NULL, '1'),
(21, 7, 3, NULL, '2013-07-11 20:07:32', NULL, '1'),
(22, 8, 1, NULL, '2013-07-11 20:07:32', NULL, '1'),
(23, 8, 2, NULL, '2013-07-11 20:07:32', NULL, '1'),
(24, 8, 3, NULL, '2013-07-11 20:07:32', NULL, '1'),
(25, 9, 1, NULL, '2013-07-11 20:07:32', NULL, '1'),
(26, 9, 2, NULL, '2013-07-11 20:07:32', NULL, '1'),
(27, 9, 3, NULL, '2013-07-11 20:07:32', NULL, '1'),
(28, 10, 1, NULL, '2013-07-11 20:07:32', NULL, '1'),
(29, 10, 2, NULL, '2013-07-11 20:07:32', NULL, '1'),
(30, 10, 3, NULL, '2013-07-11 20:07:32', NULL, '1'),
(31, 11, 1, NULL, '2013-07-11 20:07:32', NULL, '1'),
(32, 11, 2, NULL, '2013-07-11 20:07:32', NULL, '1'),
(33, 11, 3, NULL, '2013-07-11 20:07:32', NULL, '1');

-- --------------------------------------------------------

--
-- Table structure for table `RPT_RCAMP_TARCH`
--

CREATE TABLE IF NOT EXISTS `RPT_RCAMP_TARCH` (
  `RRTA_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RRCA_ID` bigint(20) NOT NULL,
  `RTAR_ID` bigint(20) NOT NULL,
  `RRTA_FECHA_CREACION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `RRTA_FECHA_MODIFICACION` timestamp NULL DEFAULT NULL,
  `RRTA_ESTADO_LOGICO` varchar(1) NOT NULL,
  PRIMARY KEY (`RRTA_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `RPT_RCAMP_TARCH`
--

INSERT INTO `RPT_RCAMP_TARCH` (`RRTA_ID`, `RRCA_ID`, `RTAR_ID`, `RRTA_FECHA_CREACION`, `RRTA_FECHA_MODIFICACION`, `RRTA_ESTADO_LOGICO`) VALUES
(1, 1, 2, '2013-07-11 20:07:33', NULL, '1'),
(2, 2, 2, '2013-07-11 20:07:33', NULL, '1'),
(3, 3, 2, '2013-07-11 20:07:33', NULL, '1'),
(4, 4, 2, '2013-07-11 20:07:33', NULL, '1'),
(5, 5, 2, '2013-07-11 20:07:33', NULL, '1'),
(6, 3, 3, '2013-07-11 20:07:33', NULL, '1'),
(7, 6, 3, '2013-07-11 20:07:33', NULL, '1'),
(8, 2, 3, '2013-07-11 20:07:33', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `RPT_REGLA_CAMPO`
--

CREATE TABLE IF NOT EXISTS `RPT_REGLA_CAMPO` (
  `RRCA_ID` int(11) NOT NULL AUTO_INCREMENT,
  `RRCA_NOMBRE` varchar(50) DEFAULT NULL,
  `RRCA_DESCRIPCION` varchar(50) DEFAULT NULL,
  `RRCA_FECHA_CREACION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `RRCA_FECHA_MODIFICACION` timestamp NULL DEFAULT NULL,
  `RRCA_ESTADO_LOGICO` varchar(1) NOT NULL,
  PRIMARY KEY (`RRCA_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `RPT_REGLA_CAMPO`
--

INSERT INTO `RPT_REGLA_CAMPO` (`RRCA_ID`, `RRCA_NOMBRE`, `RRCA_DESCRIPCION`, `RRCA_FECHA_CREACION`, `RRCA_FECHA_MODIFICACION`, `RRCA_ESTADO_LOGICO`) VALUES
(1, '\\b', 'tecla retroceso', '2013-07-11 20:07:33', NULL, '1'),
(2, '\\t', 'tecla tab', '2013-07-11 20:07:33', NULL, '1'),
(3, '\\n', 'tecla enter', '2013-07-11 20:07:33', NULL, '1'),
(4, '\\s', 'tecla espacio', '2013-07-11 20:07:33', NULL, '1'),
(5, '', 'sin espacio', '2013-07-11 20:07:33', NULL, '1'),
(6, ',', 'coma', '2013-07-23 13:59:38', NULL, '1');

-- --------------------------------------------------------

--
-- Table structure for table `RPT_REPORTE`
--

CREATE TABLE IF NOT EXISTS `RPT_REPORTE` (
  `RPT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RPT_NOMBRE` varchar(100) DEFAULT NULL,
  `RPT_SQL` text NOT NULL,
  `RPT_SCRIPT` text,
  `RPT_SUB_TITULO` varchar(100) DEFAULT NULL,
  `RPT_OBSERVACION` varchar(200) DEFAULT NULL,
  `RPT_FECHA_CREACION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `RPT_FECHA_MODIFICACION` timestamp NULL DEFAULT NULL,
  `RPT_ESTADO_LOGICO` varchar(1) NOT NULL,
  `RPT_UPDATE` varchar(70) DEFAULT NULL,
  `RPT_CONTROLLER` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`RPT_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `RPT_REPORTE`
--

INSERT INTO `RPT_REPORTE` (`RPT_ID`, `RPT_NOMBRE`, `RPT_SQL`, `RPT_SCRIPT`, `RPT_SUB_TITULO`, `RPT_OBSERVACION`, `RPT_FECHA_CREACION`, `RPT_FECHA_MODIFICACION`, `RPT_ESTADO_LOGICO`, `RPT_UPDATE`, `RPT_CONTROLLER`) VALUES
(1, 'RPT_DEB_GYE', 'select distinct  car.CART_ID as id , per.PER_CEDULA as cedulapaga, concat(per.PER_NOMBRE ,'' '', per.PER_APELLIDO) as nombrespaga,gcar.pcon_id as idsolicitud,  car.CART_MONTO_PAGO as valor_cobro, tcb.TCB_NOMBRE as tipocuenta, DATE_FORMAT(car.CART_FECHA_COBRO,''%Y-%m-%d'') as fecha, cban.CBAN_NO_CUENTA as numcuenta   from {{dbname:dbfacturacion}}.CARTERA as car   join {{dbname:dbprepaga}}.GENERACION_CARTERA as gcar on gcar.CART_ID=car.CART_ID   join {{dbname:dbprepaga}}.FORMA_COBRO_CARTERA as fcc on gcar.GCAR_ID=fcc.GCAR_ID  and fcc.FCCA_ESTADO_PREDETERMINADA=1   join {{dbname:db}}.PERSONA as per on per.PER_ID=fcc.PER_ID   join {{dbname:dbprepaga}}.CUENTA_BANCARIA as cban on cban.PER_ID=fcc.PER_ID   join {{dbname:dbfacturacion}}.TIPO_CUENTA_BANCARIA as tcb on tcb.TCB_ID=cban.TCB_ID   join {{dbname:dbfacturacion}}.BANCO as ban on ban.BAN_ID=cban.BAN_ID   where car.CART_ESTADO_PAGO=0 and car.CART_ESTADO_LOGICO=1 and fcc.FPAG_ID=2 and cban.BAN_ID=3  and (per.PER_NOMBRE like :texto || per.PER_CEDULA like :texto || per.PER_APELLIDO like :texto) and car.CART_FECHA_COBRO between :fecha_ini and :fecha_fin  and cban.CBAN_ESTADO_PREDETERMINADA=1 and fcc.FCCA_ESTADO_LOGICO=1 and car.CART_ID not in (select CART_ID   from {{dbname:dbfacturacion}}.PAGO   where PAG_ESTADO_LOGICO=1 and PAG_ESTADO_COMPLETADO=1)   union all  select distinct   car.CART_ID as id , per.PER_CEDULA as cedulapaga, concat(per.PER_NOMBRE ,'' '', per.PER_APELLIDO) as nombrespaga, gcar.pcon_id as idcontrato,  car.CART_MONTO_PAGO as valor_cobro, tcb.TCB_NOMBRE as tipocuenta, DATE_FORMAT(car.CART_FECHA_COBRO,''%Y-%m-%d'') as fecha, cban.CBAN_NO_CUENTA as numcuenta   from {{dbname:dbfacturacion}}.CARTERA as car   join {{dbname:dbprepaga}}.GENERACION_CARTERA as gcar on gcar.CART_ID=car.CART_ID   join {{dbname:dbprepaga}}.PAGO_RECURRENTE as prec on prec.PCON_ID=gcar.PCON_ID and prec.PREC_ESTADO_PREDETERMINADO   join {{dbname:db}}.PERSONA as per on per.PER_ID=prec.PER_ID   join {{dbname:dbprepaga}}.CUENTA_BANCARIA as cban on cban.PER_ID=prec.PER_ID   join {{dbname:dbfacturacion}}.TIPO_CUENTA_BANCARIA as tcb on tcb.TCB_ID=cban.TCB_ID   join {{dbname:dbfacturacion}}.BANCO as ban on ban.BAN_ID=cban.BAN_ID   where car.CART_ESTADO_PAGO=0 and car.CART_ESTADO_LOGICO=1 and prec.FPAG_ID=2 and cban.BAN_ID=3 and gcar.GCAR_ID not in (select fcci.GCAR_ID   from {{dbname:dbprepaga}}.GENERACION_CARTERA as gcari   join {{dbname:dbprepaga}}.FORMA_COBRO_CARTERA as fcci on fcci.GCAR_ID=gcari.GCAR_ID and fcci.FCCA_ESTADO_PREDETERMINADA=1   where gcari.PCON_ID=gcar.PCON_ID)  and (per.PER_NOMBRE like :texto || per.PER_CEDULA like :texto || per.PER_APELLIDO like :texto) and car.CART_FECHA_COBRO between :fecha_ini and :fecha_fin  and cban.CBAN_ESTADO_PREDETERMINADA=1 and car.CART_ID not in (select CART_ID   from {{dbname:dbfacturacion}}.PAGO   where PAG_ESTADO_LOGICO=1 and PAG_ESTADO_COMPLETADO=1); ', NULL, 'Banco Guayaquil', NULL, '2013-09-16 17:09:55', '0000-00-00 00:00:00', '1', 'idgrid', 'DEBITOS/debxBan'),
(2, 'RPT_DEB_PICH', 'select distinct car.CART_ID as id, per.PER_CEDULA as cedulapaga,concat(per.PER_NOMBRE ,'' '', per.PER_APELLIDO) as nombrespaga, car.CART_MONTO_PAGO as valor_cobro,  tcb.TCB_NOMBRE as tipocuenta, cban.CBAN_NO_CUENTA as numcuenta,DATE_FORMAT(car.CART_FECHA_COBRO,''%Y-%m-%d'') as fecha, concat(pertit.PER_NOMBRE,'' '', pertit.PER_APELLIDO) as titular from {{dbname:dbfacturacion}}.CARTERA as car   join {{dbname:dbprepaga}}.GENERACION_CARTERA as gcar on gcar.CART_ID=car.CART_ID   join {{dbname:dbprepaga}}.FORMA_COBRO_CARTERA as fcc on fcc.GCAR_ID=gcar.GCAR_ID and fcc.FCCA_ESTADO_PREDETERMINADA=1   join {{dbname:dbprepaga}}.PERS_CONT as pcon on pcon.PCON_ID=gcar.PCON_ID   join {{dbname:db}}.PERSONA as per on per.PER_ID=fcc.PER_ID   JOIN {{dbname:dbprepaga}}.AFILIADO AS afi on afi.AFI_ID=pcon.AFI_ID  JOIN {{dbname:db}}.PERSONA AS pertit on pertit.PER_ID=afi.PER_ID  join {{dbname:dbprepaga}}.CUENTA_BANCARIA as cban on cban.PER_ID=fcc.PER_ID   join {{dbname:dbfacturacion}}.TIPO_CUENTA_BANCARIA as tcb on tcb.TCB_ID=cban.TCB_ID   join {{dbname:dbfacturacion}}.BANCO as ban on ban.BAN_ID=cban.BAN_ID   join {{dbname:dbfacturacion}}.MONEDA as mon on mon.MON_ID=1   where car.CART_ESTADO_PAGO=0 and car.CART_ESTADO_LOGICO=1 and fcc.FPAG_ID=2 and cban.BAN_ID=1    and (per.PER_NOMBRE like :texto || per.PER_CEDULA like :texto || per.PER_APELLIDO like :texto) and car.CART_FECHA_COBRO between :fecha_ini and :fecha_fin    and cban.CBAN_ESTADO_PREDETERMINADA=1 and car.CART_ID not in (select CART_ID from {{dbname:dbfacturacion}}.PAGO   where PAG_ESTADO_LOGICO=1 AND PAG_ESTADO_COMPLETADO=1)   union all   select distinct car.CART_ID as id, per.PER_CEDULA as cedulapaga,concat(per.PER_NOMBRE ,'' '', per.PER_APELLIDO) as nombrespaga, car.CART_MONTO_PAGO as valor_cobro,   tcb.TCB_NOMBRE as tipocuenta, cban.CBAN_NO_CUENTA as numcuenta,DATE_FORMAT(car.CART_FECHA_COBRO,''%Y-%m-%d'') as fecha,   concat(pertit.PER_NOMBRE,pertit.PER_APELLIDO) as titular from {{dbname:dbfacturacion}}.CARTERA as car   join {{dbname:dbprepaga}}.GENERACION_CARTERA as gcar on gcar.CART_ID=car.CART_ID   join {{dbname:dbprepaga}}.PERS_CONT as pcon on pcon.PCON_ID=gcar.PCON_ID   join {{dbname:dbprepaga}}.PAGO_RECURRENTE as prec on prec.PCON_ID=gcar.PCON_ID   join {{dbname:db}}.PERSONA as per on per.PER_ID=prec.PER_ID   JOIN {{dbname:dbprepaga}}.AFILIADO AS afi on afi.AFI_ID=pcon.AFI_ID  JOIN {{dbname:db}}.PERSONA AS pertit on pertit.PER_ID=afi.PER_ID  join {{dbname:dbprepaga}}.CUENTA_BANCARIA as cban on cban.PER_ID=prec.PER_ID   join {{dbname:dbfacturacion}}.TIPO_CUENTA_BANCARIA as tcb on tcb.TCB_ID=cban.TCB_ID   join {{dbname:dbfacturacion}}.BANCO as ban on ban.BAN_ID=cban.BAN_ID   join {{dbname:dbfacturacion}}.MONEDA as mon on mon.MON_ID=1   where car.CART_ESTADO_PAGO=0 and car.CART_ESTADO_LOGICO=1 and prec.FPAG_ID=2 and cban.BAN_ID=1 and gcar.GCAR_ID not in( select fcci.GCAR_ID   from {{dbname:dbprepaga}}.GENERACION_CARTERA as gcari   join {{dbname:dbprepaga}}.FORMA_COBRO_CARTERA as fcci on fcci.GCAR_ID=gcari.GCAR_ID and fcci.FCCA_ESTADO_PREDETERMINADA=1   where gcari.PCON_ID=gcar.PCON_ID)  and (per.PER_NOMBRE like :texto || per.PER_CEDULA like :texto || per.PER_APELLIDO like :texto)   and car.CART_FECHA_COBRO between :fecha_ini and :fecha_fin  and cban.CBAN_ESTADO_PREDETERMINADA=1 and car.CART_ID not in (select CART_ID from {{dbname:dbfacturacion}}.PAGO   where PAG_ESTADO_LOGICO=1 AND PAG_ESTADO_COMPLETADO=1);', NULL, 'Banco Pichincha', NULL, '2013-09-16 17:10:32', '0000-00-00 00:00:00', '1', 'cobros_bancos', 'DEBITOS/debxBan'),
(3, 'RPT_DEB_BOL', 'select distinct car.CART_ID as id, per.PER_CEDULA,mon.MON_NOMBRE, car.CART_MONTO_PAGO as CART_MONTO_PAGO, tcb.TCB_NOMBRE, cban.CBAN_NO_CUENTA, DATE_FORMAT(car.CART_FECHA_COBRO,''%d/%m/%Y'') as FECHA, pertit.PER_CEDULA, pertit.PER_APELLIDO , pertit.PER_NOMBRE,car.CART_MONTO_PAGO as CART_MONTO_PAGO from {{dbname:dbfacturacion}}.CARTERA as car join {{dbname:dbprepaga}}.GENERACION_CARTERA as gcar on gcar.CART_ID=car.CART_ID join {{dbname:dbprepaga}}.PERS_CONT as pcon on pcon.PCON_ID=gcar.PCON_ID join {{dbname:dbprepaga}}.FORMA_COBRO_CARTERA as fcc on gcar.GCAR_ID=fcc.GCAR_ID  and fcc.FCCA_ESTADO_PREDETERMINADA=1 join {{dbname:db}}.PERSONA as per on per.PER_ID=fcc.PER_ID join {{dbname:db}}.PERSONA as pertit on pertit.PER_ID=pcon.PER_ID_AFILIADO join {{dbname:dbprepaga}}.CUENTA_BANCARIA as cban on cban.PER_ID=fcc.PER_ID join {{dbname:dbfacturacion}}.TIPO_CUENTA_BANCARIA as tcb on tcb.TCB_ID=cban.TCB_ID join {{dbname:dbfacturacion}}.BANCO as ban on ban.BAN_ID=cban.BAN_ID join {{dbname:dbfacturacion}}.MONEDA as mon on mon.MON_ID=1 where car.CART_ESTADO_PAGO=0 and car.CART_ESTADO_LOGICO=1 and fcc.FPAG_ID=2 and cban.BAN_ID=2 and (per.PER_NOMBRE like :texto || per.PER_CEDULA like :texto || per.PER_APELLIDO like :texto) and car.CART_FECHA_COBRO between :fecha_ini and :fecha_fin and cban.CBAN_ESTADO_PREDETERMINADA=1 and fcc.FCCA_ESTADO_LOGICO=1 and car.CART_ID not in (select CART_ID from {{dbname:dbfacturacion}}.PAGO WHERE PAG_ESTADO_LOGICO=1) union all select distinct  car.CART_ID as id, per.PER_CEDULA, mon.MON_NOMBRE, car.CART_MONTO_PAGO as CART_MONTO_PAGO, tcb.TCB_NOMBRE, cban.CBAN_NO_CUENTA, DATE_FORMAT(car.CART_FECHA_COBRO,''%d/%m/%Y'') as FECHA, pertit.PER_CEDULA, pertit.PER_APELLIDO , pertit.PER_NOMBRE,car.CART_MONTO_PAGO as CART_MONTO_PAGO from {{dbname:dbfacturacion}}.CARTERA as car join {{dbname:dbprepaga}}.GENERACION_CARTERA as gcar on gcar.CART_ID=car.CART_ID join {{dbname:dbprepaga}}.PERS_CONT as pcon on pcon.PCON_ID=gcar.PCON_ID join {{dbname:dbprepaga}}.PAGO_RECURRENTE as prec on prec.PCON_ID=gcar.PCON_ID join {{dbname:db}}.PERSONA as per on per.PER_ID=prec.PER_ID join {{dbname:db}}.PERSONA as pertit on pertit.PER_ID=pcon.PER_ID_AFILIADO join {{dbname:dbprepaga}}.CUENTA_BANCARIA as cban on cban.PER_ID=prec.PER_ID join {{dbname:dbfacturacion}}.TIPO_CUENTA_BANCARIA as tcb on tcb.TCB_ID=cban.TCB_ID join {{dbname:dbfacturacion}}.BANCO as ban on ban.BAN_ID=cban.BAN_ID join {{dbname:dbfacturacion}}.MONEDA as mon on mon.MON_ID=1 where car.CART_ESTADO_PAGO=0 and car.CART_ESTADO_LOGICO=1 and prec.FPAG_ID=2 and cban.BAN_ID=2 and gcar.GCAR_ID not in (select fcci.GCAR_ID from {{dbname:dbprepaga}}.GENERACION_CARTERA as gcari join {{dbname:dbprepaga}}.FORMA_COBRO_CARTERA as fcci on fcci.GCAR_ID=gcari.GCAR_ID and fcci.FCCA_ESTADO_PREDETERMINADA=1 where gcari.PCON_ID=gcar.PCON_ID) and (per.PER_NOMBRE like :texto || per.PER_CEDULA like :texto || per.PER_APELLIDO like :texto) and car.CART_FECHA_COBRO between :fecha_ini and :fecha_fin and cban.CBAN_ESTADO_PREDETERMINADA=1 and car.CART_ID not in (select CART_ID from {{dbname:dbfacturacion}}.PAGO WHERE PAG_ESTADO_LOGICO=1);', NULL, 'Banco Bolivariano', NULL, '2013-09-16 17:11:09', '0000-00-00 00:00:00', '0', 'cobros_bancos', 'DEBITOS/debxBan'),
(4, 'RPT_DEBITO', 'select distinct car.CART_ID as id, per.PER_CEDULA as cedulapaga, concat(per.PER_NOMBRE,'' '',per.PER_APELLIDO) as nombrespaga, PCON.PCON_ID  as idsolicitud, PCON.PCON_NUMERO_CONTRATO  as contrato, car.CART_MONTO_PAGO as valor_cobro, tcb.TCB_NOMBRE as tipocuenta, DATE_FORMAT(car.CART_FECHA_COBRO,''%Y-%m-%d'') as fecha, cban.CBAN_NO_CUENTA as numcuenta, ban.BAN_NOMBRE as banco from {{dbname:dbfacturacion}}.CARTERA as car join {{dbname:dbprepaga}}.GENERACION_CARTERA as gcar on gcar.CART_ID=car.CART_ID join {{dbname:dbprepaga}}.PERS_CONT as PCON on PCON.PCON_ID=gcar.PCON_ID join {{dbname:dbprepaga}}.FORMA_COBRO_CARTERA as fcc on fcc.GCAR_ID=gcar.GCAR_ID  and fcc.FCCA_ESTADO_PREDETERMINADA=1 join {{dbname:db}}.PERSONA as per on per.PER_ID=fcc.PER_ID join {{dbname:dbprepaga}}.CUENTA_BANCARIA as cban on cban.PER_ID=fcc.PER_ID join {{dbname:dbfacturacion}}.TIPO_CUENTA_BANCARIA as tcb on tcb.TCB_ID=cban.TCB_ID join {{dbname:dbfacturacion}}.BANCO as ban on ban.BAN_ID=cban.BAN_ID where car.CART_ESTADO_PAGO=0 and car.CART_ESTADO_LOGICO=1 and fcc.FPAG_ID=2 and (per.PER_NOMBRE like :texto || per.PER_CEDULA like :texto || per.PER_APELLIDO like :texto) and car.CART_FECHA_COBRO between :fecha_ini and :fecha_fin and cban.CBAN_ESTADO_PREDETERMINADA=1 and car.CART_ID not in (select CART_ID from {{dbname:dbfacturacion}}.PAGO WHERE PAG_ESTADO_LOGICO=1 AND PAG_ESTADO_COMPLETADO=1) union all select distinct car.CART_ID as id, per.PER_CEDULA as cedulapaga, concat(per.PER_NOMBRE,'' '',per.PER_APELLIDO) as nombrespaga, PCON.PCON_ID  as idsolicitud, PCON.PCON_NUMERO_CONTRATO  as solicitud, car.CART_MONTO_PAGO as valor_cobro, tcb.TCB_NOMBRE as tipocuenta, DATE_FORMAT(car.CART_FECHA_COBRO,''%Y-%m-%d'') as fecha, cban.CBAN_NO_CUENTA as numcuenta, ban.BAN_NOMBRE as banco from {{dbname:dbfacturacion}}.CARTERA as car join {{dbname:dbprepaga}}.GENERACION_CARTERA as gcar on gcar.CART_ID=car.CART_ID join {{dbname:dbprepaga}}.PERS_CONT as PCON on PCON.PCON_ID=gcar.PCON_ID join {{dbname:dbprepaga}}.PAGO_RECURRENTE as prec on prec.PCON_ID=gcar.PCON_ID join {{dbname:db}}.PERSONA as per on per.PER_ID=prec.PER_ID join {{dbname:dbprepaga}}.CUENTA_BANCARIA as cban on cban.PER_ID=prec.PER_ID join {{dbname:dbfacturacion}}.TIPO_CUENTA_BANCARIA as tcb on tcb.TCB_ID=cban.TCB_ID join {{dbname:dbfacturacion}}.BANCO as ban on ban.BAN_ID=cban.BAN_ID where car.CART_ESTADO_PAGO=0 and prec.prec_ESTADO_LOGICO=1 and prec.FPAG_ID=2 and gcar.GCAR_ID  not in ( select fcci.GCAR_ID from {{dbname:dbprepaga}}.GENERACION_CARTERA as gcari join {{dbname:dbprepaga}}.FORMA_COBRO_CARTERA as fcci on fcci.GCAR_ID=gcari.GCAR_ID and fcci.FCCA_ESTADO_PREDETERMINADA=1 where gcari.PCON_ID=gcar.PCON_ID ) and (per.PER_NOMBRE like :texto || per.PER_CEDULA like :texto || per.PER_APELLIDO like :texto) and car.CART_FECHA_COBRO between :fecha_ini and :fecha_fin and cban.CBAN_ESTADO_PREDETERMINADA=1 and car.CART_ID not in (select CART_ID from {{dbname:dbfacturacion}}.PAGO WHERE PAG_ESTADO_LOGICO=1 AND PAG_ESTADO_COMPLETADO=1);', NULL, 'Débito Bancario', NULL, '2013-09-16 17:11:31', '0000-00-00 00:00:00', '1', 'cobros_bancos', 'DEBITOS/debxBan'),
(5, 'RPT_DEB_PAC', 'select distinct car.CART_ID as id, per.PER_CEDULA as cedulapaga,concat(per.PER_NOMBRE ,'' '', per.PER_APELLIDO) as nombrespaga, car.CART_MONTO_PAGO as valor_cobro,    pcon.PCON_NUMERO_CONTRATO as contrato, DATE_FORMAT(car.CART_FECHA_COBRO,''%Y-%m-%d'') as fecha, tcb.TCB_NOMBRE as tipocuenta, cban.CBAN_NO_CUENTA as numcuenta        from  {{dbname:dbfacturacion}}.CARTERA as car       join {{dbname:dbprepaga}}.GENERACION_CARTERA as gcar on gcar.CART_ID=car.CART_ID       join {{dbname:dbprepaga}}.FORMA_COBRO_CARTERA as fcc on fcc.GCAR_ID=gcar.GCAR_ID    and fcc.FCCA_ESTADO_PREDETERMINADA=1       join {{dbname:dbprepaga}}.PERS_CONT as pcon on pcon.PCON_ID=gcar.PCON_ID       join {{dbname:db}}.PERSONA as per on per.PER_ID=fcc.PER_ID       join {{dbname:dbprepaga}}.AFILIADO AS afi on afi.AFI_ID=pcon.AFI_ID   join {{dbname:db}}.PERSONA AS pertit on pertit.PER_ID=afi.PER_ID    join {{dbname:dbprepaga}}.CUENTA_BANCARIA as cban on cban.PER_ID=fcc.PER_ID       join {{dbname:dbfacturacion}}.TIPO_CUENTA_BANCARIA as tcb on tcb.TCB_ID=cban.TCB_ID   where car.CART_ESTADO_PAGO=0      and car.CART_ESTADO_LOGICO=1    and fcc.FPAG_ID=2    and cban.BAN_ID=4       and (per.PER_NOMBRE like :texto || per.PER_CEDULA like :texto || per.PER_APELLIDO like :texto)    and car.CART_FECHA_COBRO between :fecha_ini    and :fecha_fin        and cban.CBAN_ESTADO_PREDETERMINADA=1    and car.CART_ID not in (select CART_ID      from  {{dbname:dbfacturacion}}.PAGO   where PAG_ESTADO_LOGICO=1 AND PAG_ESTADO_COMPLETADO=1)   union all   select distinct car.CART_ID as id,   per.PER_CEDULA as cedulapaga,  concat(per.PER_NOMBRE ,'' '', per.PER_APELLIDO) as nombrespaga, car.CART_MONTO_PAGO as valor_cobro,     pcon.PCON_NUMERO_CONTRATO as contrato,  DATE_FORMAT(car.CART_FECHA_COBRO,''%Y-%m-%d'') as fecha, tcb.TCB_NOMBRE as tipocuenta, cban.CBAN_NO_CUENTA as numcuenta        from  {{dbname:dbfacturacion}}.CARTERA as car       join {{dbname:dbprepaga}}.GENERACION_CARTERA as gcar on gcar.CART_ID=car.CART_ID       join {{dbname:dbprepaga}}.PAGO_RECURRENTE as PREC on PREC.PCON_ID=gcar.PCON_ID       join {{dbname:dbprepaga}}.PERS_CONT as pcon on pcon.PCON_ID=gcar.PCON_ID       join {{dbname:db}}.PERSONA as per on per.PER_ID=PREC.PER_ID       join {{dbname:dbprepaga}}.AFILIADO AS afi on afi.AFI_ID=pcon.AFI_ID    join {{dbname:db}}.PERSONA AS pertit on pertit.PER_ID=afi.PER_ID    join {{dbname:dbprepaga}}.CUENTA_BANCARIA as cban on cban.PER_ID=PREC.PER_ID       join {{dbname:dbfacturacion}}.TIPO_CUENTA_BANCARIA as tcb on tcb.TCB_ID=cban.TCB_ID   where car.CART_ESTADO_PAGO=0    and car.CART_ESTADO_LOGICO=1    and PREC.FPAG_ID=2      and cban.BAN_ID=4    and gcar.GCAR_ID not in (select fcci.GCAR_ID      from  {{dbname:dbprepaga}}.GENERACION_CARTERA as gcari       join {{dbname:dbprepaga}}.FORMA_COBRO_CARTERA as fcci on fcci.GCAR_ID=gcari.GCAR_ID    and fcci.FCCA_ESTADO_PREDETERMINADA=1   where gcari.PCON_ID=gcar.PCON_ID)       and (per.PER_NOMBRE like :texto || per.PER_CEDULA like :texto || per.PER_APELLIDO like :texto)    and car.CART_FECHA_COBRO between :fecha_ini    and :fecha_fin        and cban.CBAN_ESTADO_PREDETERMINADA=1  and car.CART_ID not in (select CART_ID     from  {{dbname:dbfacturacion}}.PAGO   where PAG_ESTADO_LOGICO=1 AND PAG_ESTADO_COMPLETADO=1);   ', NULL, 'Banco Pacífico', NULL, '2013-09-16 17:11:58', '0000-00-00 00:00:00', '1', 'cobros_bancos', 'DEBITOS/debxBan'),
(6, 'RPT_TAR_AME', 'select distinct car.CART_ID as id, per.PER_CEDULA as cedulapaga, concat(per.PER_NOMBRE ,'' '', per.PER_APELLIDO) as nombrespaga, gcar.PCON_id as idsolicitud,   pcon.PCON_NUMERO_CONTRATO as contrato, DATE_FORMAT(car.CART_FECHA_COBRO,''%Y-%m-%d'') as fecha, tper.TPER_NUM_TARJETA as num_tarjeta,   concat(tper.TPER_ANIO_EXPIRACION,'' / '',tper.TPER_MES_EXPIRACION) as fecha_expiracion, car.CART_MONTO_PAGO as valor_cobro   from {{dbname:dbfacturacion}}.CARTERA as car   join {{dbname:dbprepaga}}.GENERACION_CARTERA as gcar on gcar.CART_ID=car.CART_ID   join {{dbname:dbprepaga}}.FORMA_COBRO_CARTERA as fcc on gcar.GCAR_ID=fcc.GCAR_ID  and fcc.FCCA_ESTADO_PREDETERMINADA=1   join {{dbname:db}}.PERSONA as per on per.PER_ID=fcc.PER_ID   join {{dbname:dbprepaga}}.PERS_CONT as pcon on pcon.PCON_ID=gcar.PCON_ID   join {{dbname:dbprepaga}}.TARCRE_PER as tper on tper.PER_ID=fcc.PER_ID and tper.PCON_ID=gcar.PCON_ID join {{dbname:dbfacturacion}}.TAR_CREDITO_BANCO as tcba on tcba.TCBA_ID=tper.TCBA_ID   join {{dbname:dbfacturacion}}.TAR_CREDITO as tar on tar.TCRE_ID=tcba.TCRE_ID where car.CART_ESTADO_PAGO=0 and car.CART_ESTADO_LOGICO=1 and fcc.FPAG_ID=3   and tar.TCRE_ID=3   and (per.PER_NOMBRE like :texto || per.PER_CEDULA like :texto || per.PER_APELLIDO like :texto) and car.CART_FECHA_COBRO between :fecha_ini and :fecha_fin  and tper.TPER_ESTADO_PREDETERMINADA=1 and fcc.FCCA_ESTADO_LOGICO=1 and car.CART_ID not in (select CART_ID   from {{dbname:dbfacturacion}}.PAGO WHERE PAG_ESTADO_LOGICO=1 AND PAG_ESTADO_COMPLETADO=1) union all select distinct car.CART_ID as id, per.PER_CEDULA as cedulapaga,   concat(per.PER_NOMBRE ,'' '', per.PER_APELLIDO) as nombrespaga, gcar.PCON_id as idsolicitud,   pcon.PCON_NUMERO_CONTRATO as contrato, DATE_FORMAT(car.CART_FECHA_COBRO,''%Y-%m-%d'') as fecha, tper.TPER_NUM_TARJETA as num_tarjeta,   concat(tper.TPER_ANIO_EXPIRACION,'' / '',tper.TPER_MES_EXPIRACION) as fecha_expiracion, car.CART_MONTO_PAGO as valor_cobro   from {{dbname:dbfacturacion}}.CARTERA as car   join {{dbname:dbprepaga}}.GENERACION_CARTERA as gcar on gcar.CART_ID=car.CART_ID   join {{dbname:dbprepaga}}.PAGO_RECURRENTE as prec on prec.PCON_ID=gcar.PCON_ID   join {{dbname:db}}.PERSONA as per on per.PER_ID=prec.PER_ID   join {{dbname:dbprepaga}}.PERS_CONT as pcon on pcon.PCON_ID=gcar.PCON_ID   join {{dbname:dbprepaga}}.TARCRE_PER as tper on tper.PER_ID=prec.PER_ID   join {{dbname:dbfacturacion}}.TAR_CREDITO_BANCO as tcba on tcba.TCBA_ID=tper.TCBA_ID   join {{dbname:dbfacturacion}}.TAR_CREDITO as tar on tar.TCRE_ID=tcba.TCRE_ID where car.CART_ESTADO_PAGO=0 and car.CART_ESTADO_LOGICO=1 and prec.FPAG_ID=3   and tar.TCRE_ID=3 and gcar.GCAR_ID not in (select fcci.GCAR_ID   from {{dbname:dbprepaga}}.GENERACION_CARTERA as gcari   join {{dbname:dbprepaga}}.FORMA_COBRO_CARTERA as fcci on fcci.GCAR_ID=gcari.GCAR_ID and fcci.FCCA_ESTADO_PREDETERMINADA=1 where gcari.PCON_ID=gcar.PCON_ID)   and (per.PER_NOMBRE like :texto || per.PER_CEDULA like :texto || per.PER_APELLIDO like :texto) and car.CART_FECHA_COBRO between :fecha_ini and :fecha_fin   and tper.TPER_ESTADO_PREDETERMINADA=1 and car.CART_ID not in (select CART_ID   from {{dbname:dbfacturacion}}.PAGO WHERE PAG_ESTADO_LOGICO=1 AND PAG_ESTADO_COMPLETADO=1); ', NULL, 'American Express', NULL, '2013-09-16 17:12:33', NULL, '1', 'cobros_bancos', 'DEBITOS/debxBan'),
(7, 'RPT_TAR_MASTER', 'select distinct car.CART_ID as id, per.PER_CEDULA as cedulapaga, concat(per.PER_NOMBRE ,'' '', per.PER_APELLIDO) as nombrespaga, gcar.PCON_id as idsolicitud, pcon.PCON_NUMERO_CONTRATO as contrato, DATE_FORMAT(car.CART_FECHA_COBRO,''%Y-%m-%d'') as fecha, tper.TPER_NUM_TARJETA as num_tarjeta, tper.TPER_CODE_VERIFICACION as codigo_sec, concat(tper.TPER_ANIO_EXPIRACION,''/'',tper.TPER_MES_EXPIRACION) as fecha_expiracion, car.CART_MONTO_PAGO as valor_cobro, ctar.CTAR_AUTORIZACION as autorizacion, car.CART_ID as boton_autorizacion from {{dbname:dbfacturacion}}.CARTERA as car join {{dbname:dbprepaga}}.GENERACION_CARTERA as gcar on gcar.CART_ID=car.CART_ID join {{dbname:dbprepaga}}.FORMA_COBRO_CARTERA as fcc on gcar.GCAR_ID=fcc.GCAR_ID and fcc.FCCA_ESTADO_PREDETERMINADA=1 join {{dbname:db}}.PERSONA as per on per.PER_ID=fcc.PER_ID join {{dbname:dbprepaga}}.PERS_CONT as pcon on pcon.PCON_ID=gcar.PCON_ID join {{dbname:dbprepaga}}.TARCRE_PER as tper on tper.PER_ID=fcc.PER_ID and tper.PCON_ID=gcar.PCON_ID and tper.TPER_ESTADO_PREDETERMINADA=1 join {{dbname:dbfacturacion}}.TAR_CREDITO_BANCO as tcba on tcba.TCBA_ID=tper.TCBA_ID left join {{dbname:dbfacturacion}}.CARTERA_TARJETA as ctar on ctar.CART_ID=car.CART_ID join {{dbname:dbfacturacion}}.TAR_CREDITO as tar on tar.TCRE_ID=tcba.TCRE_ID where car.CART_ESTADO_PAGO=0 and car.CART_ESTADO_LOGICO=1 and fcc.FPAG_ID=3 and tar.TCRE_ID=1 and (per.PER_NOMBRE like :texto || per.PER_CEDULA like :texto || per.PER_APELLIDO like :texto) and car.CART_FECHA_COBRO between :fecha_ini and :fecha_fin and fcc.FCCA_ESTADO_LOGICO=1 and car.CART_ID not in (select CART_ID from {{dbname:dbfacturacion}}.PAGO WHERE PAG_ESTADO_LOGICO=1 and PAG_ESTADO_COMPLETADO=1) union all select distinct car.CART_ID as id, per.PER_CEDULA as cedulapaga, concat(per.PER_NOMBRE ,'' '', per.PER_APELLIDO) as nombrespaga, gcar.PCON_id as idsolicitud, pcon.PCON_NUMERO_CONTRATO as contrato, DATE_FORMAT(car.CART_FECHA_COBRO,''%Y-%m-%d'') as fecha, tper.TPER_NUM_TARJETA as num_tarjeta, tper.TPER_CODE_VERIFICACION as codigo_sec, concat(tper.TPER_ANIO_EXPIRACION,''/'',tper.TPER_MES_EXPIRACION) as fecha_expiracion, car.CART_MONTO_PAGO as valor_cobro, ctar.CTAR_AUTORIZACION as autorizacion, car.CART_ID as boton_autorizacion from {{dbname:dbfacturacion}}.CARTERA as car join {{dbname:dbprepaga}}.GENERACION_CARTERA as gcar on gcar.CART_ID=car.CART_ID join {{dbname:dbprepaga}}.PAGO_RECURRENTE as prec on prec.PCON_ID=gcar.PCON_ID join {{dbname:db}}.PERSONA as per on per.PER_ID=prec.PER_ID join {{dbname:dbprepaga}}.PERS_CONT as pcon on pcon.PCON_ID=gcar.PCON_ID join {{dbname:dbprepaga}}.TARCRE_PER as tper on tper.PER_ID=prec.PER_ID and tper.PCON_ID=gcar.PCON_ID left join {{dbname:dbfacturacion}}.CARTERA_TARJETA as ctar on ctar.CART_ID=car.CART_ID join {{dbname:dbfacturacion}}.TAR_CREDITO_BANCO as tcba on tcba.TCBA_ID=tper.TCBA_ID join {{dbname:dbfacturacion}}.TAR_CREDITO as tar on tar.TCRE_ID=tcba.TCRE_ID where car.CART_ESTADO_PAGO=0 and car.CART_ESTADO_LOGICO=1 and prec.FPAG_ID=3 and tar.TCRE_ID=1 and gcar.GCAR_ID not in (select fcci.GCAR_ID from {{dbname:dbprepaga}}.GENERACION_CARTERA as gcari join {{dbname:dbprepaga}}.FORMA_COBRO_CARTERA as fcci on fcci.GCAR_ID=gcari.GCAR_ID and fcci.FCCA_ESTADO_PREDETERMINADA=1 where gcari.PCON_ID=gcar.PCON_ID) and (per.PER_NOMBRE like :texto || per.PER_CEDULA like :texto || per.PER_APELLIDO like :texto) and car.CART_FECHA_COBRO between :fecha_ini and :fecha_fin and tper.TPER_ESTADO_PREDETERMINADA=1 and car.CART_ID not in (select CART_ID from {{dbname:dbfacturacion}}.PAGO WHERE PAG_ESTADO_LOGICO=1 AND PAG_ESTADO_COMPLETADO=1);', NULL, 'Mastercard', NULL, '2013-09-16 17:12:52', NULL, '1', 'cobros_bancos', 'DEBITOS/debxBan'),
(8, 'RPT_TAR_VISA', 'select distinct car.CART_ID as id, per.PER_CEDULA as cedulapaga, concat(per.PER_NOMBRE ,'' '', per.PER_APELLIDO) as nombrespaga, gcar.PCON_id as idsolicitud, pcon.PCON_NUMERO_CONTRATO as contrato, DATE_FORMAT(car.CART_FECHA_COBRO,''%Y-%m-%d'') as fecha, tper.TPER_NUM_TARJETA as num_tarjeta, tper.TPER_CODE_VERIFICACION as codigo_sec, concat(tper.TPER_ANIO_EXPIRACION,''/'',tper.TPER_MES_EXPIRACION) as fecha_expiracion, car.CART_MONTO_PAGO as valor_cobro, ctar.CTAR_AUTORIZACION as autorizacion, car.CART_ID as boton_autorizacion from {{dbname:dbfacturacion}}.CARTERA as car join {{dbname:dbprepaga}}.GENERACION_CARTERA as gcar on gcar.CART_ID=car.CART_ID join {{dbname:dbprepaga}}.FORMA_COBRO_CARTERA as fcc on gcar.GCAR_ID=fcc.GCAR_ID  and fcc.FCCA_ESTADO_PREDETERMINADA=1 join {{dbname:db}}.PERSONA as per on per.PER_ID=fcc.PER_ID join {{dbname:dbprepaga}}.PERS_CONT as pcon on pcon.PCON_ID=gcar.PCON_ID join {{dbname:dbprepaga}}.TARCRE_PER as tper on tper.PER_ID=fcc.PER_ID and tper.PCON_ID=gcar.PCON_ID left join {{dbname:dbfacturacion}}.CARTERA_TARJETA as ctar on ctar.CART_ID=car.CART_ID join {{dbname:dbfacturacion}}.TAR_CREDITO_BANCO as tcba on tcba.TCBA_ID=tper.TCBA_ID join {{dbname:dbfacturacion}}.TAR_CREDITO as tar on tar.TCRE_ID=tcba.TCRE_ID where car.CART_ESTADO_PAGO=0 and car.CART_ESTADO_LOGICO=1 and fcc.FPAG_ID=3 and tar.TCRE_ID=2 and (per.PER_NOMBRE like :texto || per.PER_CEDULA like :texto || per.PER_APELLIDO like :texto) and car.CART_FECHA_COBRO between :fecha_ini and :fecha_fin and tper.TPER_ESTADO_PREDETERMINADA=1 and car.CART_ESTADO_LOGICO=1  and fcc.FCCA_ESTADO_LOGICO=1 and car.CART_ID not in (select CART_ID from {{dbname:dbfacturacion}}.PAGO WHERE PAG_ESTADO_LOGICO=1 and PAG_ESTADO_COMPLETADO=1) union all select distinct car.CART_ID as id, per.PER_CEDULA as cedulapaga, concat(per.PER_NOMBRE ,'' '', per.PER_APELLIDO) as nombrespaga, gcar.PCON_id as idsolicitud, pcon.PCON_NUMERO_CONTRATO as contrato, DATE_FORMAT(car.CART_FECHA_COBRO,''%Y-%m-%d'') as fecha, tper.TPER_NUM_TARJETA as num_tarjeta, tper.TPER_CODE_VERIFICACION as codigo_sec, concat(tper.TPER_ANIO_EXPIRACION,''/'',tper.TPER_MES_EXPIRACION) as fecha_expiracion, car.CART_MONTO_PAGO as valor_cobro, ctar.CTAR_AUTORIZACION as autorizacion, car.CART_ID as boton_autorizacion from {{dbname:dbfacturacion}}.CARTERA as car join {{dbname:dbprepaga}}.GENERACION_CARTERA as gcar on gcar.CART_ID=car.CART_ID join {{dbname:dbprepaga}}.PAGO_RECURRENTE as prec on prec.PCON_ID=gcar.PCON_ID join {{dbname:db}}.PERSONA as per on per.PER_ID=prec.PER_ID join {{dbname:dbprepaga}}.PERS_CONT as pcon on pcon.PCON_ID=gcar.PCON_ID join {{dbname:dbprepaga}}.TARCRE_PER as tper on tper.PER_ID=prec.PER_ID and tper.PCON_ID=gcar.PCON_ID left join {{dbname:dbfacturacion}}.CARTERA_TARJETA as ctar on ctar.CART_ID=car.CART_ID join {{dbname:dbfacturacion}}.TAR_CREDITO_BANCO as tcba on tcba.TCBA_ID=tper.TCBA_ID join {{dbname:dbfacturacion}}.TAR_CREDITO as tar on tar.TCRE_ID=tcba.TCRE_ID where car.CART_ESTADO_PAGO=0 and car.CART_ESTADO_LOGICO=1 and prec.FPAG_ID=3 and tar.TCRE_ID=2 and gcar.GCAR_ID not in (select fcci.GCAR_ID from {{dbname:dbprepaga}}.GENERACION_CARTERA as gcari join {{dbname:dbprepaga}}.FORMA_COBRO_CARTERA as fcci on fcci.GCAR_ID=gcari.GCAR_ID and fcci.FCCA_ESTADO_PREDETERMINADA=1 where gcari.PCON_ID=gcar.PCON_ID) and (per.PER_NOMBRE like :texto || per.PER_CEDULA like :texto || per.PER_APELLIDO like :texto) and car.CART_FECHA_COBRO between :fecha_ini and :fecha_fin and tper.TPER_ESTADO_PREDETERMINADA=1 and car.CART_ID not in (select CART_ID from {{dbname:dbfacturacion}}.PAGO WHERE PAG_ESTADO_LOGICO=1 and PAG_ESTADO_COMPLETADO=1);', NULL, 'Visa', NULL, '2013-09-16 17:13:16', NULL, '1', 'cobros_bancos', 'DEBITOS/debxBan'),
(9, 'RPT_TAR_DINNERS', 'select distinct car.CART_ID as id, per.PER_CEDULA as cedulapaga, concat(per.PER_NOMBRE ,'' '', per.PER_APELLIDO) as nombrespaga, gcar.PCON_id as idsolicitud,  pcon.PCON_NUMERO_CONTRATO as contrato, DATE_FORMAT(car.CART_FECHA_COBRO,''%Y-%m-%d'') as fecha, tper.TPER_NUM_TARJETA as num_tarjeta,  concat(tper.TPER_ANIO_EXPIRACION,'' / '',tper.TPER_MES_EXPIRACION) as fecha_expiracion, car.CART_MONTO_PAGO as valor_cobro     from {{dbname:dbfacturacion}}.CARTERA as car   join {{dbname:dbprepaga}}.GENERACION_CARTERA as gcar on gcar.CART_ID=car.CART_ID   join {{dbname:dbprepaga}}.FORMA_COBRO_CARTERA as fcc on gcar.GCAR_ID=fcc.GCAR_ID  and fcc.FCCA_ESTADO_PREDETERMINADA=1   join {{dbname:db}}.PERSONA as per on per.PER_ID=fcc.PER_ID   join {{dbname:dbprepaga}}.PERS_CONT as pcon on pcon.PCON_ID=gcar.PCON_ID   join {{dbname:dbprepaga}}.TARCRE_PER as tper on tper.PER_ID=fcc.PER_ID and tper.PCON_ID=gcar.PCON_ID left   join {{dbname:dbfacturacion}}.CARTERA_TARJETA as ctar on ctar.CART_ID=car.CART_ID   join {{dbname:dbfacturacion}}.TAR_CREDITO_BANCO as tcba on tcba.TCBA_ID=tper.TCBA_ID   join {{dbname:dbfacturacion}}.TAR_CREDITO as tar on tar.TCRE_ID=tcba.TCRE_ID where car.CART_ESTADO_PAGO=0 and car.CART_ESTADO_LOGICO=1 and fcc.FPAG_ID=3 and tar.TCRE_ID=4 /* and (per.PER_NOMBRE like :texto || per.PER_CEDULA like :texto || per.PER_APELLIDO like :texto) and car.CART_FECHA_COBRO between :fecha_ini and :fecha_fin */ and tper.TPER_ESTADO_PREDETERMINADA=1 and car.CART_ESTADO_LOGICO=1  and fcc.FCCA_ESTADO_LOGICO=1 and car.CART_ID not in (select CART_ID    from {{dbname:dbfacturacion}}.PAGO WHERE PAG_ESTADO_LOGICO=1 and PAG_ESTADO_COMPLETADO=1)   union all   select distinct car.CART_ID as id, per.PER_CEDULA as cedulapaga, concat(per.PER_NOMBRE ,'' '', per.PER_APELLIDO) as nombrespaga, gcar.PCON_id as idsolicitud,  pcon.PCON_NUMERO_CONTRATO as contrato, DATE_FORMAT(car.CART_FECHA_COBRO,''%Y-%m-%d'') as fecha, tper.TPER_NUM_TARJETA as num_tarjeta,  concat(tper.TPER_ANIO_EXPIRACION,'' / '',tper.TPER_MES_EXPIRACION) as fecha_expiracion, car.CART_MONTO_PAGO as valor_cobro       from {{dbname:dbfacturacion}}.CARTERA as car   join {{dbname:dbprepaga}}.GENERACION_CARTERA as gcar on gcar.CART_ID=car.CART_ID   join {{dbname:dbprepaga}}.PAGO_RECURRENTE as prec on prec.PCON_ID=gcar.PCON_ID   join {{dbname:db}}.PERSONA as per on per.PER_ID=prec.PER_ID   join {{dbname:dbprepaga}}.PERS_CONT as pcon on pcon.PCON_ID=gcar.PCON_ID   join {{dbname:dbprepaga}}.TARCRE_PER as tper on tper.PER_ID=prec.PER_ID and tper.PCON_ID=gcar.PCON_ID left   join {{dbname:dbfacturacion}}.CARTERA_TARJETA as ctar on ctar.CART_ID=car.CART_ID   join {{dbname:dbfacturacion}}.TAR_CREDITO_BANCO as tcba on tcba.TCBA_ID=tper.TCBA_ID   join {{dbname:dbfacturacion}}.TAR_CREDITO as tar on tar.TCRE_ID=tcba.TCRE_ID where car.CART_ESTADO_PAGO=0 and car.CART_ESTADO_LOGICO=1 and prec.FPAG_ID=3   and tar.TCRE_ID=4 and gcar.GCAR_ID not in (select fcci.GCAR_ID    from {{dbname:dbprepaga}}.GENERACION_CARTERA as gcari   join {{dbname:dbprepaga}}.FORMA_COBRO_CARTERA as fcci on fcci.GCAR_ID=gcari.GCAR_ID and fcci.FCCA_ESTADO_PREDETERMINADA=1 where gcari.PCON_ID=gcar.PCON_ID)   /*and (per.PER_NOMBRE like :texto || per.PER_CEDULA like :texto || per.PER_APELLIDO like :texto) and car.CART_FECHA_COBRO between :fecha_ini and :fecha_fin */  and tper.TPER_ESTADO_PREDETERMINADA=1 and car.CART_ID not in (select CART_ID    from {{dbname:dbfacturacion}}.PAGO WHERE PAG_ESTADO_LOGICO=1 and PAG_ESTADO_COMPLETADO=1); ', NULL, 'Diners', NULL, '2013-09-16 17:13:35', NULL, '1', 'cobros_bancos', 'DEBITOS/debxBan'),
(10, 'RPT_TAR_DISCOVER', 'select distinct car.CART_ID as id, per.PER_CEDULA as cedulapaga, concat(per.PER_NOMBRE ,'' '', per.PER_APELLIDO) as nombrespaga, gcar.PCON_id as idsolicitud,  pcon.PCON_NUMERO_CONTRATO as contrato, DATE_FORMAT(car.CART_FECHA_COBRO,''%Y-%m-%d'') as fecha, tper.TPER_NUM_TARJETA as num_tarjeta,  concat(tper.TPER_ANIO_EXPIRACION,'' / '',tper.TPER_MES_EXPIRACION) as fecha_expiracion,  car.CART_MONTO_PAGO as valor_cobro     from {{dbname:dbfacturacion}}.CARTERA as car     join {{dbname:dbprepaga}}.GENERACION_CARTERA as gcar on gcar.CART_ID=car.CART_ID     join {{dbname:dbprepaga}}.FORMA_COBRO_CARTERA as fcc on gcar.GCAR_ID=fcc.GCAR_ID  and fcc.FCCA_ESTADO_PREDETERMINADA=1     join {{dbname:db}}.PERSONA as per on per.PER_ID=fcc.PER_ID     join {{dbname:dbprepaga}}.PERS_CONT as pcon on pcon.PCON_ID=gcar.PCON_ID     join {{dbname:dbprepaga}}.TARCRE_PER as tper on tper.PER_ID=fcc.PER_ID and tper.PCON_ID=gcar.PCON_ID left     join {{dbname:dbfacturacion}}.CARTERA_TARJETA as ctar on ctar.CART_ID=car.CART_ID     join {{dbname:dbfacturacion}}.TAR_CREDITO_BANCO as tcba on tcba.TCBA_ID=tper.TCBA_ID     join {{dbname:dbfacturacion}}.TAR_CREDITO as tar on tar.TCRE_ID=tcba.TCRE_ID   where car.CART_ESTADO_PAGO=0 and car.CART_ESTADO_LOGICO=1 and fcc.FPAG_ID=3 and tar.TCRE_ID=5   and (per.PER_NOMBRE like :texto || per.PER_CEDULA like :texto || per.PER_APELLIDO like :texto) and car.CART_FECHA_COBRO between :fecha_ini and :fecha_fin   and tper.TPER_ESTADO_PREDETERMINADA=1 and car.CART_ESTADO_LOGICO=1  and fcc.FCCA_ESTADO_LOGICO=1 and car.CART_ID not in (select CART_ID      from {{dbname:dbfacturacion}}.PAGO   where PAG_ESTADO_LOGICO=1 and PAG_ESTADO_COMPLETADO=1)     union all    select distinct car.CART_ID as id, per.PER_CEDULA as cedulapaga, concat(per.PER_NOMBRE ,'' '', per.PER_APELLIDO) as nombrespaga, gcar.PCON_id as idsolicitud,  pcon.PCON_NUMERO_CONTRATO as contrato, DATE_FORMAT(car.CART_FECHA_COBRO,''%Y-%m-%d'') as fecha, tper.TPER_NUM_TARJETA as num_tarjeta,  concat(tper.TPER_ANIO_EXPIRACION,'' / '',tper.TPER_MES_EXPIRACION) as fecha_expiracion,  car.CART_MONTO_PAGO as valor_cobro     from {{dbname:dbfacturacion}}.CARTERA as car     join {{dbname:dbprepaga}}.GENERACION_CARTERA as gcar on gcar.CART_ID=car.CART_ID     join {{dbname:dbprepaga}}.PAGO_RECURRENTE as prec on prec.PCON_ID=gcar.PCON_ID     join {{dbname:db}}.PERSONA as per on per.PER_ID=prec.PER_ID     join {{dbname:dbprepaga}}.PERS_CONT as pcon on pcon.PCON_ID=gcar.PCON_ID     join {{dbname:dbprepaga}}.TARCRE_PER as tper on tper.PER_ID=prec.PER_ID and tper.PCON_ID=gcar.PCON_ID left     join {{dbname:dbfacturacion}}.CARTERA_TARJETA as ctar on ctar.CART_ID=car.CART_ID     join {{dbname:dbfacturacion}}.TAR_CREDITO_BANCO as tcba on tcba.TCBA_ID=tper.TCBA_ID     join {{dbname:dbfacturacion}}.TAR_CREDITO as tar on tar.TCRE_ID=tcba.TCRE_ID   where car.CART_ESTADO_PAGO=0 and car.CART_ESTADO_LOGICO=1 and prec.FPAG_ID=3   and tar.TCRE_ID=5 and gcar.GCAR_ID not in (select fcci.GCAR_ID      from {{dbname:dbprepaga}}.GENERACION_CARTERA as gcari     join {{dbname:dbprepaga}}.FORMA_COBRO_CARTERA as fcci on fcci.GCAR_ID=gcari.GCAR_ID and fcci.FCCA_ESTADO_PREDETERMINADA=1   where gcari.PCON_ID=gcar.PCON_ID)    and (per.PER_NOMBRE like :texto || per.PER_CEDULA like :texto || per.PER_APELLIDO like :texto) and car.CART_FECHA_COBRO between :fecha_ini and :fecha_fin   and tper.TPER_ESTADO_PREDETERMINADA=1 and car.CART_ID not in (select CART_ID      from {{dbname:dbfacturacion}}.PAGO   where PAG_ESTADO_LOGICO=1 and PAG_ESTADO_COMPLETADO=1);  ', '', 'Discover', NULL, '2013-09-16 17:13:59', NULL, '1', 'cobros_bancos', 'DEBITOS/debxBan'),
(11, 'RPT_TARJETA_CREDITO', 'select distinct car.CART_ID as id, per.PER_CEDULA as cedulapaga, concat(per.PER_NOMBRE ,'' '', per.PER_APELLIDO) as nombrespaga, gcar.PCON_id as idsolicitud,   pcon.PCON_NUMERO_CONTRATO as contrato, DATE_FORMAT(car.CART_FECHA_COBRO,''%Y-%m-%d'') as fecha, tper.TPER_NUM_TARJETA as num_tarjeta,    concat(tper.TPER_ANIO_EXPIRACION,'' / '',tper.TPER_MES_EXPIRACION) as fecha_expiracion, car.CART_MONTO_PAGO as valor_cobro,   tar.TCRE_NOMBRE as tarjeta   from {{dbname:dbfacturacion}}.CARTERA as car       join {{dbname:dbprepaga}}.GENERACION_CARTERA as gcar on gcar.CART_ID=car.CART_ID       join {{dbname:dbprepaga}}.FORMA_COBRO_CARTERA as fcc on gcar.GCAR_ID=fcc.GCAR_ID  and fcc.FCCA_ESTADO_PREDETERMINADA=1       join {{dbname:db}}.PERSONA as per on per.PER_ID=fcc.PER_ID       join {{dbname:dbprepaga}}.PERS_CONT as pcon on pcon.PCON_ID=gcar.PCON_ID       join {{dbname:dbprepaga}}.TARCRE_PER as tper on tper.PER_ID=fcc.PER_ID and tper.PCON_ID=gcar.PCON_ID left       join {{dbname:dbfacturacion}}.CARTERA_TARJETA as ctar on ctar.CART_ID=car.CART_ID       join {{dbname:dbfacturacion}}.TAR_CREDITO_BANCO as tcba on tcba.TCBA_ID=tper.TCBA_ID       join {{dbname:dbfacturacion}}.TAR_CREDITO as tar on tar.TCRE_ID=tcba.TCRE_ID       where car.CART_ESTADO_PAGO=0 and car.CART_ESTADO_LOGICO=1 and fcc.FPAG_ID=3  and (per.PER_NOMBRE like :texto || per.PER_CEDULA like :texto || per.PER_APELLIDO like :texto) and car.CART_FECHA_COBRO between :fecha_ini and :fecha_fin    and tper.TPER_ESTADO_PREDETERMINADA=1 and car.CART_ESTADO_LOGICO=1  and fcc.FCCA_ESTADO_LOGICO=1 and car.CART_ID not in (select CART_ID        from {{dbname:dbfacturacion}}.PAGO       where PAG_ESTADO_LOGICO=1 and PAG_ESTADO_COMPLETADO=1)       union all     select distinct car.CART_ID as id, per.PER_CEDULA as cedulapaga, concat(per.PER_NOMBRE ,'' '', per.PER_APELLIDO) as nombrespaga, gcar.PCON_id as idsolicitud,   pcon.PCON_NUMERO_CONTRATO as contrato, DATE_FORMAT(car.CART_FECHA_COBRO,''%Y-%m-%d'') as fecha, tper.TPER_NUM_TARJETA as num_tarjeta,    concat(tper.TPER_ANIO_EXPIRACION,'' / '',tper.TPER_MES_EXPIRACION) as fecha_expiracion, car.CART_MONTO_PAGO as valor_cobro,   tar.TCRE_NOMBRE as tarjeta   from {{dbname:dbfacturacion}}.CARTERA as car       join {{dbname:dbprepaga}}.GENERACION_CARTERA as gcar on gcar.CART_ID=car.CART_ID       join {{dbname:dbprepaga}}.PAGO_RECURRENTE as prec on prec.PCON_ID=gcar.PCON_ID       join {{dbname:db}}.PERSONA as per on per.PER_ID=prec.PER_ID       join {{dbname:dbprepaga}}.PERS_CONT as pcon on pcon.PCON_ID=gcar.PCON_ID       join {{dbname:dbprepaga}}.TARCRE_PER as tper on tper.PER_ID=prec.PER_ID and tper.PCON_ID=gcar.PCON_ID left       join {{dbname:dbfacturacion}}.CARTERA_TARJETA as ctar on ctar.CART_ID=car.CART_ID       join {{dbname:dbfacturacion}}.TAR_CREDITO_BANCO as tcba on tcba.TCBA_ID=tper.TCBA_ID       join {{dbname:dbfacturacion}}.TAR_CREDITO as tar on tar.TCRE_ID=tcba.TCRE_ID       where car.CART_ESTADO_PAGO=0 and car.CART_ESTADO_LOGICO=1 and prec.FPAG_ID=3 and gcar.GCAR_ID not in (select fcci.GCAR_ID        from {{dbname:dbprepaga}}.GENERACION_CARTERA as gcari       join {{dbname:dbprepaga}}.FORMA_COBRO_CARTERA as fcci on fcci.GCAR_ID=gcari.GCAR_ID and fcci.FCCA_ESTADO_PREDETERMINADA=1       where gcari.PCON_ID=gcar.PCON_ID)     and (per.PER_NOMBRE like :texto || per.PER_CEDULA like :texto || per.PER_APELLIDO like :texto) and car.CART_FECHA_COBRO between :fecha_ini and :fecha_fin    and tper.TPER_ESTADO_PREDETERMINADA=1 and car.CART_ID not in (select CART_ID        from {{dbname:dbfacturacion}}.PAGO       where PAG_ESTADO_LOGICO=1 and PAG_ESTADO_COMPLETADO=1);   ', NULL, 'Tarjeta de Crédito', NULL, '2013-09-16 17:14:18', NULL, '1', 'cobros_bancos', 'DEBITOS/debxBan');

-- --------------------------------------------------------

--
-- Table structure for table `RPT_TIPO_ARCHIVO`
--

CREATE TABLE IF NOT EXISTS `RPT_TIPO_ARCHIVO` (
  `RTAR_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RTAR_NOMBRE` varchar(100) DEFAULT NULL,
  `RTAR_FECHA_MODIFICACION` timestamp NULL DEFAULT NULL,
  `RTAR_FECHA_CREACION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `RTAR_ESTADO_LOGICO` varchar(1) NOT NULL,
  `RTAR_IMAGEN_URL` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`RTAR_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `RPT_TIPO_ARCHIVO`
--

INSERT INTO `RPT_TIPO_ARCHIVO` (`RTAR_ID`, `RTAR_NOMBRE`, `RTAR_FECHA_MODIFICACION`, `RTAR_FECHA_CREACION`, `RTAR_ESTADO_LOGICO`, `RTAR_IMAGEN_URL`) VALUES
(1, 'xls', NULL, '2013-07-11 20:07:33', '1', 'excel.png'),
(2, 'txt', NULL, '2013-07-11 20:07:33', '1', 'txt.png'),
(3, 'csv', NULL, '2013-07-11 20:07:33', '1', 'csv_off.png'),
(4, 'pdf', NULL, '2013-07-11 20:07:33', '1', 'pdf.png'),
(5, 'zip', NULL, '2013-07-11 20:07:33', '1', 'zip.png');

-- --------------------------------------------------------

--
-- Table structure for table `RPT_TIPO_FILTRO`
--

CREATE TABLE IF NOT EXISTS `RPT_TIPO_FILTRO` (
  `RTF_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RTF_NOMBRE` varchar(1000) NOT NULL,
  `RTF_OBSERVACION` varchar(70) DEFAULT NULL,
  `RTF_FECHA_CREACION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `RTF_FECHA_MODFICACION` timestamp NULL DEFAULT NULL,
  `RTF_ESTADO_LOGICO` varchar(1) NOT NULL,
  PRIMARY KEY (`RTF_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `RPT_TIPO_FILTRO`
--

INSERT INTO `RPT_TIPO_FILTRO` (`RTF_ID`, `RTF_NOMBRE`, `RTF_OBSERVACION`, `RTF_FECHA_CREACION`, `RTF_FECHA_MODFICACION`, `RTF_ESTADO_LOGICO`) VALUES
(1, 'SELECT', 'COMBOS', '2013-07-11 20:07:33', NULL, '1'),
(2, 'TEXTO', 'FECHA', '2013-07-11 20:07:33', NULL, '1'),
(3, 'CHECKBOX', NULL, '2013-07-11 20:07:33', NULL, '1'),
(4, 'RADIOBUTTOM', NULL, '2013-07-11 20:07:33', NULL, '1'),
(5, 'TEXTO', 'NOMBRE', '2013-07-11 20:07:33', NULL, '1'),
(6, 'BUTTOM', NULL, '2013-07-11 20:07:33', NULL, '1');

-- --------------------------------------------------------

--
-- Table structure for table `RPT_TITULO_SUBTITULO`
--

CREATE TABLE IF NOT EXISTS `RPT_TITULO_SUBTITULO` (
  `RTSU_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RPT_ID_TITULO` bigint(20) DEFAULT NULL,
  `RPT_ID_SUB_TITULO` bigint(20) DEFAULT NULL,
  `RTSU_FECHA_CREACION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `RTSU_FECHA_MODIFICACION` timestamp NULL DEFAULT NULL,
  `RTSU_ESTADO_LOGICO` varchar(1) NOT NULL,
  PRIMARY KEY (`RTSU_ID`),
  KEY `RPT_ID_TITULO` (`RPT_ID_TITULO`),
  KEY `RPT_ID_SUB_TITULO` (`RPT_ID_SUB_TITULO`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `RPT_TITULO_SUBTITULO`
--

INSERT INTO `RPT_TITULO_SUBTITULO` (`RTSU_ID`, `RPT_ID_TITULO`, `RPT_ID_SUB_TITULO`, `RTSU_FECHA_CREACION`, `RTSU_FECHA_MODIFICACION`, `RTSU_ESTADO_LOGICO`) VALUES
(1, 4, NULL, '2013-07-11 20:07:33', NULL, '1'),
(2, 4, 1, '2013-07-11 20:07:33', NULL, '1'),
(3, 4, 2, '2013-07-11 20:07:33', NULL, '1'),
(4, 4, 3, '2013-07-11 20:07:33', NULL, '1'),
(5, 4, 5, '2013-07-11 20:07:33', NULL, '1'),
(6, 11, NULL, '2013-07-11 20:07:33', NULL, '1'),
(7, 11, 6, '2013-07-11 20:07:33', NULL, '1'),
(8, 11, 7, '2013-07-11 20:07:33', NULL, '1'),
(9, 11, 8, '2013-07-11 20:07:33', NULL, '1'),
(10, 11, 9, '2013-07-11 20:07:33', NULL, '1'),
(11, 11, 10, '2013-07-11 20:07:33', NULL, '1');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `RPT_ARCHIVO`
--
ALTER TABLE `RPT_ARCHIVO`
  ADD CONSTRAINT `RDTA_ID` FOREIGN KEY (`RDTA_ID`) REFERENCES `RPT_DELI_TARC` (`RDTA_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `RPT_ID` FOREIGN KEY (`RPT_ID`) REFERENCES `RPT_REPORTE` (`RPT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `RRTA_ID` FOREIGN KEY (`RRTA_ID`) REFERENCES `RPT_RCAMP_TARCH` (`RRTA_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `RPT_ETIQUETA_REPORTE`
--
ALTER TABLE `RPT_ETIQUETA_REPORTE`
  ADD CONSTRAINT `RPT_ETIQUETA_REPORTE_ibfk_1` FOREIGN KEY (`RETI_ID`) REFERENCES `RPT_ETIQUETA` (`RETI_ID`),
  ADD CONSTRAINT `RPT_ETIQUETA_REPORTE_ibfk_2` FOREIGN KEY (`RETI_ID`) REFERENCES `RPT_ETIQUETA` (`RETI_ID`),
  ADD CONSTRAINT `RPT_ETIQUETA_REPORTE_ibfk_3` FOREIGN KEY (`RPT_ID`) REFERENCES `RPT_REPORTE` (`RPT_ID`);

--
-- Constraints for table `RPT_FILTRO`
--
ALTER TABLE `RPT_FILTRO`
  ADD CONSTRAINT `REPORTE_FILTRO_ibfk_1` FOREIGN KEY (`RTF_ID`) REFERENCES `RPT_TIPO_FILTRO` (`RTF_ID`),
  ADD CONSTRAINT `REPORTE_FILTRO_ibfk_2` FOREIGN KEY (`RPAR_ID`) REFERENCES `RPT_PARAMETROS` (`RPAR_ID`);

--
-- Constraints for table `RPT_FILTRO_INTERNO`
--
ALTER TABLE `RPT_FILTRO_INTERNO`
  ADD CONSTRAINT `fk_RPT_FILTRO_INTERNO_1` FOREIGN KEY (`RFIL_ID`) REFERENCES `RPT_FILTRO` (`RFIL_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `RPT_FILTRO_REPORTE`
--
ALTER TABLE `RPT_FILTRO_REPORTE`
  ADD CONSTRAINT `RPT_FILTRO_REPORTE_ibfk_1` FOREIGN KEY (`RPT_ID`) REFERENCES `RPT_REPORTE` (`RPT_ID`),
  ADD CONSTRAINT `RPT_FILTRO_REPORTE_ibfk_4` FOREIGN KEY (`RFIL_ID`) REFERENCES `RPT_FILTRO` (`RFIL_ID`);

--
-- Constraints for table `RPT_GOGR`
--
ALTER TABLE `RPT_GOGR`
  ADD CONSTRAINT `RPT_GOGR_ibfk_2` FOREIGN KEY (`RTSU_ID`) REFERENCES `RPT_REPORTE` (`RPT_ID`),
  ADD CONSTRAINT `RPT_GOGR_ibfk_3` FOREIGN KEY (`RTSU_ID`) REFERENCES `RPT_TITULO_SUBTITULO` (`RTSU_ID`),
  ADD CONSTRAINT `RPT_GOGR_ibfk_4` FOREIGN KEY (`RTSU_ID`) REFERENCES `RPT_TITULO_SUBTITULO` (`RTSU_ID`);

--
-- Constraints for table `RPT_PARAMETROS`
--
ALTER TABLE `RPT_PARAMETROS`
  ADD CONSTRAINT `RPT_PARAMETROS_ibfk_2` FOREIGN KEY (`RERE_ID`) REFERENCES `RPT_EXP_REGULAR` (`RERE_ID`);

--
-- Constraints for table `RPT_PARAMETRO_REPORTE`
--
ALTER TABLE `RPT_PARAMETRO_REPORTE`
  ADD CONSTRAINT `RPT_PARAMETRO_REPORTE_ibfk_1` FOREIGN KEY (`RPT_ID`) REFERENCES `RPT_REPORTE` (`RPT_ID`),
  ADD CONSTRAINT `RPT_PARAMETRO_REPORTE_ibfk_2` FOREIGN KEY (`RPT_ID`) REFERENCES `RPT_REPORTE` (`RPT_ID`),
  ADD CONSTRAINT `RPT_PARAMETRO_REPORTE_ibfk_3` FOREIGN KEY (`RPT_ID`) REFERENCES `RPT_REPORTE` (`RPT_ID`),
  ADD CONSTRAINT `RPT_PARAMETRO_REPORTE_ibfk_4` FOREIGN KEY (`RPT_ID`) REFERENCES `RPT_REPORTE` (`RPT_ID`),
  ADD CONSTRAINT `RPT_PARAMETRO_REPORTE_ibfk_5` FOREIGN KEY (`RPT_ID`) REFERENCES `RPT_REPORTE` (`RPT_ID`),
  ADD CONSTRAINT `RPT_PARAMETRO_REPORTE_ibfk_6` FOREIGN KEY (`RPT_ID`) REFERENCES `RPT_REPORTE` (`RPT_ID`),
  ADD CONSTRAINT `RPT_PARAMETRO_REPORTE_ibfk_7` FOREIGN KEY (`RPAR_ID`) REFERENCES `RPT_PARAMETROS` (`RPAR_ID`);

--
-- Constraints for table `RPT_TITULO_SUBTITULO`
--
ALTER TABLE `RPT_TITULO_SUBTITULO`
  ADD CONSTRAINT `RPT_TITULO_SUBTITULO_ibfk_1` FOREIGN KEY (`RPT_ID_TITULO`) REFERENCES `RPT_REPORTE` (`RPT_ID`),
  ADD CONSTRAINT `RPT_TITULO_SUBTITULO_ibfk_2` FOREIGN KEY (`RPT_ID_SUB_TITULO`) REFERENCES `RPT_REPORTE` (`RPT_ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
