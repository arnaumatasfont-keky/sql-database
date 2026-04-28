CREATE DATABASE IF NOT EXISTS heart_db;
USE heart_db;

DROP TABLE IF EXISTS heart_main;
DROP TABLE IF EXISTS dim_sex;
DROP TABLE IF EXISTS dim_cp;
DROP TABLE IF EXISTS dim_fbs;
DROP TABLE IF EXISTS dim_restecg;
DROP TABLE IF EXISTS dim_exang;
DROP TABLE IF EXISTS dim_slope;
DROP TABLE IF EXISTS dim_thal;
DROP TABLE IF EXISTS dim_target;

CREATE TABLE dim_sex (
    sex_id INT PRIMARY KEY,
    sex_name VARCHAR(20)
);

CREATE TABLE dim_cp (
    cp_id INT PRIMARY KEY,
    cp_name VARCHAR(50)
);

CREATE TABLE dim_fbs (
    fbs_id INT PRIMARY KEY,
    fbs_value VARCHAR(10)
);

CREATE TABLE dim_restecg (
    restecg_id INT PRIMARY KEY,
    restecg_name VARCHAR(50)
);

CREATE TABLE dim_exang (
    exang_id INT PRIMARY KEY,
    exang_value VARCHAR(10)
);

CREATE TABLE dim_slope (
    slope_id INT PRIMARY KEY,
    slope_name VARCHAR(50)
);

CREATE TABLE dim_thal (
    thal_id INT PRIMARY KEY,
    thal_name VARCHAR(50)
);

CREATE TABLE dim_target (
    target_id INT PRIMARY KEY,
    target_name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS heart_main (
    patient_id INT PRIMARY KEY,
    age INT,
    sex_id INT,
    cp_id INT,
    fbs_id INT,
    restecg_id INT,
    exang_id INT,
    slope_id INT,
    thal_id INT,
    target_id INT,

    ca INT,
    trestbps INT,
    chol INT,
    thalach INT,
    oldpeak FLOAT,

    FOREIGN KEY (sex_id) REFERENCES dim_sex(sex_id),
    FOREIGN KEY (cp_id) REFERENCES dim_cp(cp_id),
    FOREIGN KEY (fbs_id) REFERENCES dim_fbs(fbs_id),
    FOREIGN KEY (restecg_id) REFERENCES dim_restecg(restecg_id),
    FOREIGN KEY (exang_id) REFERENCES dim_exang(exang_id),
    FOREIGN KEY (slope_id) REFERENCES dim_slope(slope_id),
    FOREIGN KEY (thal_id) REFERENCES dim_thal(thal_id),
    FOREIGN KEY (target_id) REFERENCES dim_target(target_id)
);