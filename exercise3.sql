------Procedimientos

CREATE
OR REPLACE PROCEDURE DELETE_TIPO_ACTIVIDADES (p_mensaje OUT VARCHAR2) IS v_count NUMBER;

BEGIN
DELETE FROM TIPO_ACT;
    p_mensaje := 'Operación exitosa. Se eliminaron ';
    
EXCEPTION
    WHEN OTHERS THEN
        p_mensaje := 'Error al eliminar tipos de actividades: ' || SQLERRM;
END;



------pROBANDO---------
select
    *
from
    user_errors
where
    name = 'DELETE_TIPO_ACTIVIDADES';

----Ejecutar Procedimiento

DECLARE message VARCHAR2 (100);

BEGIN DELETE_TIPO_ACTIVIDADES (message);

dbms_output.put_line (message);

END;