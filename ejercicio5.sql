-----Funciones


CREATE OR REPLACE FUNCTION GET_INFO_EQUIPO_TALLER(
    p_num_equipo IN NUMBER,
    p_fecha IN DATE
) RETURN VARCHAR2 
IS
    v_resultado VARCHAR2(4000);
BEGIN
    FOR registro IN (
        SELECT
            fecha || ',' || CHR(10) ||
            origen || ',' || CHR(10) || 
            localidad || ',' || CHR(10) ||
            proceso || ',' || CHR(10) ||
            descripcion AS information
        FROM
            TALLER_ACT
        WHERE
            ID = p_num_equipo
            AND TRUNC(FECHA) = TRUNC(p_fecha)
    ) LOOP
        v_resultado := v_resultado || registro.information || CHR(10);
    END LOOP;

    IF v_resultado IS NULL THEN
        RETURN 'No se encontraron reparaciones para el equipo ' || p_num_equipo || 
               ' en la fecha ' || TO_CHAR(p_fecha, 'DD/MM/YYYY');
    ELSE
        RETURN v_resultado;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RETURN 'Error al obtener la info del equipo: ' || SQLERRM;
END;

----Proobando----

--Ver logs
select
    *
from
    user_errors
where
    name = 'GET_INFO_EQUIPO_TALLER';
    
    
-----Procesar-----

DECLARE
    v_resultado VARCHAR2(4000);
BEGIN
    v_resultado := GET_INFO_EQUIPO_TALLER(1, TO_DATE('17/05/2025', 'DD/MM/YYYY')); 
    DBMS_OUTPUT.PUT_LINE('Resultado: ' || CHR(10) || v_resultado);
END;