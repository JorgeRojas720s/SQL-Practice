--Meter campo "comentarios vacio"
INSERT INTO FEEDBACK (USUARIO_ID, COMENTARIOS) VALUES (2,NULL);


-----Procedimientos----

CREATE
OR REPLACE PROCEDURE UPDATE_FEEDBACK (p_mensaje OUT VARCHAR2) 
IS

BEGIN
    UPDATE FEEDBACK 
    SET COMENTARIOS = 'Informacion almacenada de forma automatica'
    WHERE COMENTARIOS IS NULL;

    p_mensaje := 'Se actualizaron los campos ';
    
EXCEPTION
    WHEN OTHERS THEN
        p_mensaje := 'Error al actuaizar el FEEDBACK ' || SQLERRM;
END;


-----Probando-----
select
    *
from
    user_errors
where
    name = 'UPDATE_FEEDBACK';



----Ejecutar Procedimiento

DECLARE message VARCHAR2 (100);

BEGIN UPDATE_FEEDBACK (message);

dbms_output.put_line (message);

END;
