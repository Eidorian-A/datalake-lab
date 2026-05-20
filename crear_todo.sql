-- ============================================================================
-- CONFIGURACIÓN GLOBAL DE SEGURIDAD (Ejecutar como superusuario 'postgres')
-- ============================================================================

-- ============================================================================
-- CONFIGURACIÓN GRUPO 1 (Filtro: UK, 2016-2018)
-- ============================================================================
CREATE DATABASE uk_cyber;

-- Revocar el permiso por defecto para que usuarios externos no se conecten
REVOKE CONNECT ON DATABASE uk_cyber FROM PUBLIC;

-- Crear el usuario
CREATE USER uk1 WITH PASSWORD 'PasswordGrupo1*2026';

-- Conceder permiso de conexión solo a su base de datos
GRANT CONNECT ON DATABASE uk_cyber TO uk1;

-- Conectarse a la base de datos recién creada para estructurar la tabla
\c uk_cyber

CREATE TABLE IF NOT EXISTS amenazas_cyber (
    id SERIAL PRIMARY KEY, -- 'SERIAL' es el AUTO_INCREMENT en PostgreSQL
    pais VARCHAR(5) DEFAULT 'UK',
    anio INT,
    tipo_ataque VARCHAR(150),
    industria_atacada VARCHAR(150)
);

-- Dar permisos sobre las tablas y secuencias dentro de esta base de datos
GRANT ALL PRIVILEGES ON TABLE amenazas_cyber TO uk1;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO uk1;

-- ============================================================================
-- CONFIGURACIÓN GRUPO 2 (Filtro: Francia, 2018-2020)
-- ============================================================================
\c postgres
CREATE DATABASE francia_cyber;
REVOKE CONNECT ON DATABASE francia_cyber FROM PUBLIC;

CREATE USER french2 WITH PASSWORD 'PasswordGrupo2*2026';
GRANT CONNECT ON DATABASE francia_cyber TO french2;

\c francia_cyber
CREATE TABLE IF NOT EXISTS amenazas_cyber (
    id SERIAL PRIMARY KEY,
    pais VARCHAR(15) DEFAULT 'Francia',
    anio INT,
    perdida_financiera DECIMAL(15, 2),
    numero_afectados INT
);

GRANT ALL PRIVILEGES ON TABLE amenazas_cyber TO french2;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO french2;

-- ============================================================================
-- CONFIGURACIÓN GRUPO 3 (Filtro: Brazil, 2020-2022)
-- ============================================================================
\c postgres
CREATE DATABASE brazil_cyber;
REVOKE CONNECT ON DATABASE brazil_cyber FROM PUBLIC;

CREATE USER brazil3 WITH PASSWORD 'PasswordGrupo3*2026';
GRANT CONNECT ON DATABASE brazil_cyber TO brazil3;

\c brazil_cyber
CREATE TABLE IF NOT EXISTS amenazas_cyber (
    id SERIAL PRIMARY KEY,
    pais VARCHAR(15) DEFAULT 'Brazil',
    anio INT,
    fuente_ataque VARCHAR(150),
    tipo_vulnerabilidad VARCHAR(150)
);

GRANT ALL PRIVILEGES ON TABLE amenazas_cyber TO brazil3;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO brazil3;

-- ============================================================================
-- CONFIGURACIÓN GRUPO 4 (Filtro: Japón, 2022-2024)
-- ============================================================================
\c postgres
CREATE DATABASE japon_cyber;
REVOKE CONNECT ON DATABASE japon_cyber FROM PUBLIC;

CREATE USER japon4 WITH PASSWORD 'PasswordGrupo4*2026';
GRANT CONNECT ON DATABASE japon_cyber TO japon4;

\c japon_cyber -- <<< ¡CORREGIDO AQUÍ! Ahora apunta directo a japon_cyber
CREATE TABLE IF NOT EXISTS amenazas_cyber (
    id SERIAL PRIMARY KEY,
    pais VARCHAR(15) DEFAULT 'Japon',
    anio INT,
    mecanismo_defensa VARCHAR(150),
    tiempo_resolucion_horas INT
);

GRANT ALL PRIVILEGES ON TABLE amenazas_cyber TO japon4;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO japon4;