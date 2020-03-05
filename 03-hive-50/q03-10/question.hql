-- 
-- Pregunta
-- ===========================================================================
--
-- Para resolver esta pregunta use el archivo `data.tsv`.
--
-- Construya una consulta que ordene la tabla por letra y valor (3ra columna).
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

DROP TABLE IF EXISTS U;

CREATE TABLE U (Letra STRING, Fecha DATE, Numero INT) 
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
TBLPROPERTIES ("skip.header.line.count"="0");

LOAD DATA LOCAL INPATH 'data.tsv' INTO TABLE U;

INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE

SELECT DISTINCT Numero
FROM U
ORDER BY Numero ASC
LIMIT 5;