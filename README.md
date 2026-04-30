# Proyecto: Heart Disease Risk Analysis
---
## Objetivo del proyecto
Entender qué factores están relacionados con enfermedades cardíacas  e identificar patrones de riesgo usando datos clinicos

## Dataset
El dataset proviene de una fuente pública de datos médicos sobre enfermedades cardíacas.

Se han analizado 303, habian dos nulos y nos quedamos con 301

Estructura de la base de datos (modelo en estrella):

- heart_main → tabla principal con datos clínicos de los pacientes
- dim_target → estado de salud (con o sin enfermedad)
- dim_sex → género del paciente
- dim_cp → tipo de dolor en el pecho
- dim_fbs → azúcar en sangre en ayunas
- dim_restecg → resultados electrocardiográficos
- dim_exang → angina inducida por ejercicio
- dim_slope → pendiente del segmento ST
- dim_thal → resultado de prueba de talasemia

Variables principales:
- age → edad del paciente
- sex_id → género
- cp_id → tipo de dolor en el pecho
- chol → colesterol
- trestbps → presión arterial
- target_id → presencia de enfermedad cardíaca

### Hipotesis: (esto es lo que comprobaremos con datos)
1. La edad influye en la probabilidad de enfermedad cardíaca
2. Los hombres tienen mayor incidencia que las mujeres
3. El tipo de chest pain está fuertemente relacionado con la enfermedad
4. El colesterol alto está asociado a mayor riesgo

---

## Proceso de análisis

- Análisis exploratorio de datos (EDA) para entender la estructura del dataset
    Revisión de variables numéricas y categóricas
    Detección de valores nulos o inconsistencias
    Análisis de distribución de variables como edad, colesterol y presión arterial
    Identificación de posibles patrones iniciales entre variables y el target
- Limpieza y transformación de datos en Python (Pandas)
- Creación de tablas normalizadas modelo Star Schema (modelo estrella):
    heart_main = tabla central (datos médicos)
    dim_* = tablas descriptivas
- Creación de base de datos en MySQL
- Importación de datos desde CSV
- Análisis mediante consultas SQL con JOINs, GROUP BY y agregaciones
- Cálculo de métricas descriptivas

###  KPIs calculados
- Número total de pacientes en el dataset
- Porcentaje de pacientes con y sin enfermedad cardíaca
- Edad media de los pacientes por grupo (con/sin enfermedad)
- Distribución de pacientes por género
- Número de casos según tipo de dolor en el pecho (chest pain)
- Media de colesterol por grupo de salud
- Media de presión arterial por grupo de salud

### 3. Métricas clave usadas
- COUNT() → para calcular el número total de registros y casos
- AVG() → para obtener medias de variables numéricas
- MIN / MAX → para identificar rangos de edad y valores clínicos
- GROUP BY → para segmentar los datos por categorías (género, enfermedad, etc.)
- JOIN → para combinar la tabla principal con las dimensiones
- CASE WHEN → para crear categorías interpretables (sano / enfermo)
- WINDOW FUNCTIONS → para calcular porcentajes dentro de grupo

---

## Resultados / Insights (hallagoz más importanes, claros y accionables)
- Los pacientes con enfermedad suelen tener mayor edad
- Hay más casos en hombres que en mujeres
- El tipo de chest pain está relacionado con la enfermedad
- El colesterol no parece tan determinante como esperábamos


---

## Próximos pasos (qué extenderias si tuvieras más datos o más tiempo)
- Explorar más relaciones entre variables que no se han analizado todavía  
- Probar a responder nuevas preguntas con SQL  
- Mejorar el análisis con más datos si estuvieran disponibles  

---

## Cómo replicar el proyecto (enlace al notebook, queries SQL o dasboard)
1. Clonar el repositorio
2. Ejecutar el script SQL para crear la base de datos
3. Importar los CSV en MySQL Workbench
4. Ejecutar las queries de análisis
5. Abrir el notebook (.ipynb) para ver el reporte completo

## Presentación
https://docs.google.com/presentation/d/1fh9VZepyrgAXzbcyBB2EsQT7TYLD8YdmQ-0-_3hSgds/edit?slide=id.p#slide=id.p 