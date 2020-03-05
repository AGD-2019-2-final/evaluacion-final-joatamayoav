-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
-- columna 3. En otras palabras, cuántos registros hay que tengan la clave 
-- `aaa`?
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

A = FOREACH U GENERATE FLATTEN(C3);

B = GROUP A BY $0;

C = FOREACH B GENERATE group, COUNT(A);

STORE C INTO 'output' USING PigStorage(',');
