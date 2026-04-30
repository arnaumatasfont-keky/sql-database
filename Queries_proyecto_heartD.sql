-- 1. Distribución general de la enfermedad --
-- Insight: Entender cuantos pacientes tienen enfermedad vs los que no --
USE heart_db;

SELECT
	CASE
		WHEN hm.diagnosis_id = 0 THEN 'Ausencia de enfermedad cardiovascular'
        ELSE 'Con enfermedad cardiovascular'
	END AS Estado_salud_paciente,
    COUNT(*) AS total_pacientes
FROM heart_main AS hm
JOIN dim_target AS dt ON hm.diagnosis_id = dt.diagnosis_id
group by Estado_salud_paciente;


-- 2. Edad promedio de la enfermedad cardiovascular -- 
-- Comprobar la relación entre la edad y la enfermedad cardiovascular --

SELECT 
    CASE 
        WHEN h.diagnosis_id = 0 THEN 'Sano' 
        ELSE 'Con Enfermedad' 
    END AS estado_salud,
    ROUND(AVG(h.age), 1) AS edad_media,
    MIN(h.age) AS edad_minima,
    MAX(h.age) AS edad_maxima
FROM heart_main h
JOIN dim_target t ON h.diagnosis_id = t.diagnosis_id
GROUP BY estado_salud;

-- 3. Distribución por género
-- Identificar diferencias en la enfermedad entre hombres y mujeres
SELECT 
    ds.sex_desc AS Genero,
    CASE WHEN hm.diagnosis_id = 0 THEN 'Sano' ELSE 'Enfermo' END AS Estado,
    COUNT(*) AS Total_Pacientes,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(PARTITION BY ds.sex_desc), 2) AS Porcentaje_por_Genero
FROM heart_main AS hm
JOIN dim_sex AS ds ON hm.sex_id = ds.sex_id
GROUP BY ds.sex_desc, Estado;

-- 4. Tipo de chest pain en pacientes enfermos
-- Identificar diferencias en la enfermedad entre hombres y mujeres

SELECT 
    dc.cp_name AS Simptoma_Principal,
    dt.diagnosis_desc AS Estado_enfermedad,
    COUNT(*) AS Casos_Detectados,
    CAST(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(PARTITION BY dt.diagnosis_desc) AS SIGNED) AS Porcentaje_total
FROM heart_main AS hm
JOIN dim_cp AS dc ON hm.cp_id = dc.cp_id
JOIN dim_target AS dt ON hm.diagnosis_id = dt.diagnosis_id
GROUP BY dc.cp_name, dt.diagnosis_desc, hm.diagnosis_id
HAVING Casos_Detectados >= 5
ORDER BY hm.diagnosis_id ASC, Porcentaje_total DESC;

-- 5. Relación entre niveles de colesterol y presencia de enfermedad y gravedad.
-- filtrar solo los casos más significativos

SELECT
dt.diagnosis_desc,
AVG(hm.chol) AS media_chol,
COUNT(*) AS num_pacientes
FROM heart_main AS hm
JOIN dim_target AS dt ON hm.diagnosis_id = dt.diagnosis_id
GROUP BY dt.diagnosis_id
ORDER BY media_chol DESC;

-- 6. Relación entre los niveles de presión arterial y presencia de enfermedad y gravedad.

SELECT
dt.diagnosis_desc,
AVG(hm.trestbps) AS media_presion_arterial,
COUNT(*) AS num_pacientes
FROM heart_main AS hm
JOIN dim_target AS dt ON hm.diagnosis_id = dt.diagnosis_id
GROUP BY dt.diagnosis_id
ORDER BY media_presion_arterial DESC;