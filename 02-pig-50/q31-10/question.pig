-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- Cuente la cantidad de personas nacidas por año.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
u = LOAD 'data.csv' USING PigStorage(',') 
    AS (id:int, 
        firstname:CHARARRAY, 
        surname:CHARARRAY, 
        birthday:CHARARRAY, 
        color:CHARARRAY, 
        quantity:INT);
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
A = FOREACH u GENERATE birthday, ToDate(birthday,'yyyy-MM-dd') as fecha;
B = FOREACH A GENERATE GetYear(fecha) as year;
C = GROUP B BY year;
D = FOREACH C GENERATE group, COUNT(B);

STORE D INTO 'output' USING PigStorage(','); 
