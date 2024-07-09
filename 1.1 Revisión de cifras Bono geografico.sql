/*Revision de cifras Bono Geografico*/

--Cabecera_Payfile_Bono_Geografico
SELECT *
FROM
(SELECT 
	SEMANA,
	FUENTE AS ARCHIVO,
	SERVICIO,
	SUM(CONTEO) AS UNIDADES,
	SUM(IMPORTE) AS IMPORTE
FROM Cabecera_Payfile_Bono_Geografico
GROUP BY SEMANA,FUENTE,SERVICIO
UNION ALL
-- Detalle_Payfile_Bono_Geografico
SElECT
	SEMANA,
	FUENTE AS ARCHIVO,
	'GEOGRAFICO'SERVICIO,
	SUM(CONTEO) AS UNIDADES,
	SUM(IMPORTE) AS IMPORTE
FROM Detalle_Payfile_Bono_Geografico
GROUP BY SEMANA,FUENTE
UNION ALL
-- Detalle_Pago_Bonos_Geografico
SELECT
	SEMANA,
	FUENTE AS ARCHIVO,
	'GEOGRAFICO'SERVICIO,
	SUM(ACTIVADAS_TOTAL) AS UNIDADES,
	SUM(IMPORTE_BONO_GEOGRAFICO) AS IMPORTE
FROM Detalle_Pago_Bonos_Geografico
GROUP BY SEMANA,FUENTE
UNION ALL
-- Detalle_Bonos_Geografico_WEBI
SELECT
    SEMANA,
    FUENTE AS ARCHIVO,
    'GEOGRAFICO' AS SERVICIO,
    COUNT(PAIS) AS UNIDADES,
	NULL AS IMPORTE
FROM Detalle_Bonos_Geografico_WEBI
GROUP BY SEMANA, FUENTE) AS a
WHERE SEMANA = 'Semana del 17 al 23 de 06-2024'

