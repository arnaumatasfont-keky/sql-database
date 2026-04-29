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


-- 4. Tipo de chest pain vs enfermedad
-- Identificar diferencias en la enfermedad entre hombres y mujeres


-- 5. Tipos de chest pain más relevantes en pacientes con enfermedad
-- filtrar solo los casos más significativos