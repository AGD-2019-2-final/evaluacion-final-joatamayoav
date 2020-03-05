-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
-- aparece cada letra minúscula en la columna 2.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
U = LOAD 'data.tsv' USING PigStorage('\t')
    AS (C1:CHARARRAY,
        C2:BAG{Tuple()},
        C3:MAP[CHARARRAY]);

A = FOREACH U GENERATE FLATTEN(C2) AS (C1:CHARARRAY);

B = GROUP A BY C1;

C = FOREACH B GENERATE group, COUNT(A);

STORE C INTO 'output';