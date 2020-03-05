-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
-- la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
-- columna 3 separados por coma. La tabla debe estar ordenada por las 
-- columnas 1, 2 y 3.
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

A = FOREACH U GENERATE (C1, C2) AS A1, FLATTEN(C3);

B = GROUP A BY A1;

C = FOREACH B GENERATE group, COUNT($1);

D = FOREACH C GENERATE FLATTEN($0) AS (A1, A2), $1 AS D1;

E = FOREACH D GENERATE (A1, D1, A2) AS E1, A2 AS E2;

F = FOREACH E GENERATE E1, FLATTEN(E2) AS (F1, F2);

G = GROUP F BY $0;

H = FOREACH G GENERATE group, COUNT($1);

I = FOREACH H GENERATE FLATTEN($0) AS (I1:CHARARRAY, I2:INT, I3:BAG{}), $1 AS I4;

J = FOREACH I GENERATE I1, I4, I2;

K = ORDER J BY $0, $1, $2;

STORE K INTO 'output' USING PigStorage(',');
