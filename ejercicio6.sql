-----Funciones pRINCIPAL---------

CREATE OR REPLACE FUNCTION GET_INFO_EQUIPO(
    p_equipo_id IN NUMBER,
) RETURN VARCHAR2 
IS
    v_resultado_equipo VARCHAR2(5000);
    --Retorno de las otras funciones
    v_resultado_estado VARCHAR(1000);
    v_resultado_torre VARCHAR(1000);
    v_resultado_monitor VARCHAR(1000);
    v_resultado_teclado VARCHAR(1000);
    v_resultado_raton VARCHAR(1000);
    v_resultado_otro VARCHAR(1000);

    --Los ID
    v_estado_id NUMBER;  
    v_torre_id NUMBER; 
    v_monitor_id NUMBER;  
    v_teclado_id NUMBER; 
    v_raton_id NUMBER;  
    v_otro_id NUMBER; 
BEGIN

---A LAS FUNCIONES PASARLES LO QUE SAQUE DE IDS DE EQUIP

    SELECT estado_id, torre_id, monitor_id, teclado_id, raton_id, otro_id 
    INTO v_estado_id,v_torre_id,v_monitor_id,v_teclado_id,v_raton_id,v_otro_id
    FROM EQUIPOS 
    WHERE ID = p_equipo_id;

--AQUI AHORITA RETORNO A LAS VARIALES LO DE LAS FUNCIONES

    v_resultado_estado := GET_INFO_ESTADOS(v_estado_id);
    v_resultado_torre := GET_INFO_TORRES(v_torre_id);
    v_resultado_monitor := GET_INFO_MONITORES(v_monitor_id);
    v_resultado_teclado := GET_INFO_TECLADOS(v_teclado_id);
    v_resultado_raton := GET_INFO_RATONES(v_raton_id);
    v_resultado_otro := GET_INFO_OTROS(v_otro_id);

    v_resultado_equipo := 'Resulado:' ||  CHR(10) ||
                        v_resultado_estado  ||  CHR(10) ||
                        v_resultado_torre ||  CHR(10) ||
                        v_resultado_monitor ||  CHR(10) ||
                        v_resultado_teclado ||  CHR(10) ||
                        v_resultado_raton ||  CHR(10) ||
                        v_resultado_otro ||  CHR(10);
 
    IF v_resultado_equipo IS NULL THEN
        RETURN 'No se encontraron equipos';
    ELSE
        RETURN v_resultado_equipo;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RETURN 'Error al obtener la info del equipo: ' || SQLERRM;
END;
----------------------------------------------------------------------

----Funtion para obtener el estado
CREATE OR REPLACE FUNCTION GET_INFO_ESTADOS(
    p_estado_id IN NUMBER
) RETURN VARCHAR2 
IS
    v_resultado VARCHAR2(1000);
BEGIN
    FOR registro IN (
        SELECT
            estado AS information
        FROM
            ESTADOS
        WHERE
            ID = p_estado_id
    ) LOOP
        v_resultado := v_resultado || registro.information || CHR(10);
    END LOOP;

    IF v_resultado IS NULL THEN
        RETURN 'No se encontraron ESTADOS';
    ELSE
        RETURN v_resultado;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RETURN 'Error al obtener la info de ESTADOS: ' || SQLERRM;
END;


----Funtion para obtener la torre
CREATE OR REPLACE FUNCTION GET_INFO_TORRES(
    p_torre_id IN NUMBER
) RETURN VARCHAR2 
IS
    v_resultado VARCHAR2(1000);
    v_resultado_disco VARCHAR2(1000);
    v_resultado_memoria VARCHAR2(1000);
    v_disco_id NUMBER;  
    v_memoria_id NUMBER; 
BEGIN


    SELECT disco_id, memoria_id 
    INTO v_disco_id, v_memoria_id 
    FROM TORRES 
    WHERE ID = p_torre_id;

    v_resultado_disco := GET_INFO_DISCOS(disco_id);
    v_resultado_memoria := GET_INFO_MEMORIAS(memoria_id);


    FOR registro IN (
        SELECT
            procesador || ',' || CHR(10) ||
            n_bien || ',' || CHR(10) ||
            n_serie || ',' || CHR(10) ||
            marca || ',' || CHR(10) ||
            modelo  AS information
        FROM
            TORRES
        WHERE
            ID = p_torre_id
    ) LOOP

        v_resultado := v_resultado || registro.information || CHR(10) ||
                    v_resultado_disco || CHR(10) || v_resultado_memoria;
    END LOOP;

    IF v_resultado IS NULL THEN
        RETURN 'No se encontraron TORRES';
    ELSE
        RETURN v_resultado;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RETURN 'Error al obtener la info de TORRES: ' || SQLERRM;
END;





----Funtion para obtener EL DISCO
CREATE OR REPLACE FUNCTION GET_INFO_DISCOS(
    p_disco_id IN NUMBER
) RETURN VARCHAR2 
IS
    v_resultado VARCHAR2(1000);
BEGIN
    FOR registro IN (
        SELECT
            disco_duro AS information
             
        FROM
            DISCOS
        WHERE
            ID = p_disco_id
    ) LOOP
        v_resultado := v_resultado || registro.information || CHR(10);
    END LOOP;

    IF v_resultado IS NULL THEN
        RETURN 'No se encontraron DISCOS';
    ELSE
        RETURN v_resultado;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RETURN 'Error al obtener la info de DISCOS: ' || SQLERRM;
END;



----Funtion para obtener LA MEMORIA
CREATE OR REPLACE FUNCTION GET_INFO_MEMORIAS(
    p_memoria_id IN NUMBER
) RETURN VARCHAR2 
IS
    v_resultado VARCHAR2(1000);
BEGIN
    FOR registro IN (
        SELECT
            marca || ',' || CHR(10) ||
            capacidad AS information
             
        FROM
            MEMORIAS
        WHERE
            ID = p_memoria_id
    ) LOOP
        v_resultado := v_resultado || registro.information || CHR(10);
    END LOOP;

    IF v_resultado IS NULL THEN
        RETURN 'No se encontraron MEMORIAS';
    ELSE
        RETURN v_resultado;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RETURN 'Error al obtener la info de MEMORIAS: ' || SQLERRM;
END;



----Funtion para obtener EL MONITOR
CREATE OR REPLACE FUNCTION GET_INFO_MONITORES(
    p_monitor_id IN NUMBER
) RETURN VARCHAR2 
IS
    v_resultado VARCHAR2(1000);
BEGIN
    FOR registro IN (
        SELECT
            tipo || ',' || CHR(10) ||
            n_bien || ',' || CHR(10) ||
            n_serie || ',' || CHR(10) ||
            marca || ',' || CHR(10) ||
            modelo AS information
             
        FROM
            MONITORES
        WHERE
            ID = p_monitor_id
    ) LOOP
        v_resultado := v_resultado || registro.information || CHR(10);
    END LOOP;

    IF v_resultado IS NULL THEN
        RETURN 'No se encontraron MONITORES';
    ELSE
        RETURN v_resultado;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RETURN 'Error al obtener la info de MONITORES: ' || SQLERRM;
END;



----Funtion para obtener EL TECLADO
CREATE OR REPLACE FUNCTION GET_INFO_TECLADOS(
    p_teclado_id IN NUMBER
) RETURN VARCHAR2 
IS
    v_resultado VARCHAR2(1000);
BEGIN
    FOR registro IN (
        SELECT
            n_bien || ',' || CHR(10) ||
            n_serie || ',' || CHR(10) ||
            marca || ',' || CHR(10) ||
            modelo AS information
             
        FROM
            TECLADOS
        WHERE
            ID = p_teclado_id
    ) LOOP
        v_resultado := v_resultado || registro.information || CHR(10);
    END LOOP;

    IF v_resultado IS NULL THEN
        RETURN 'No se encontraron TECLADOS';
    ELSE
        RETURN v_resultado;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RETURN 'Error al obtener la info de TECLADOS: ' || SQLERRM;
END;


----Funtion para obtener EL RATON
CREATE OR REPLACE FUNCTION GET_INFO_RATONES(
    p_raton_id IN NUMBER
) RETURN VARCHAR2 
IS
    v_resultado VARCHAR2(1000);
BEGIN
    FOR registro IN (
        SELECT
            n_bien || ',' || CHR(10) ||
            n_serie || ',' || CHR(10) ||
            marca || ',' || CHR(10) ||
            modelo AS information
             
        FROM
            RATONES
        WHERE
            ID = p_raton_id
    ) LOOP
        v_resultado := v_resultado || registro.information || CHR(10);
    END LOOP;

    IF v_resultado IS NULL THEN
        RETURN 'No se encontraron RATONES';
    ELSE
        RETURN v_resultado;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RETURN 'Error al obtener la info de RATONES: ' || SQLERRM;
END;


----Funtion para obtener OTROS
CREATE OR REPLACE FUNCTION GET_INFO_OTROS(
    p_otros_id IN NUMBER
) RETURN VARCHAR2 
IS
    v_resultado VARCHAR2(1000);
BEGIN
    FOR registro IN (
        SELECT
            dispositivo || ',' || CHR(10) ||
            n_bien || ',' || CHR(10) ||
            n_serie || ',' || CHR(10) ||
            marca || ',' || CHR(10) ||
            modelo AS information
             
        FROM
            OTROS
        WHERE
            ID = p_otros_id
    ) LOOP
        v_resultado := v_resultado || registro.information || CHR(10);
    END LOOP;

    IF v_resultado IS NULL THEN
        RETURN 'No se encontraron OTROS';
    ELSE
        RETURN v_resultado;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RETURN 'Error al obtener la info de OTROS: ' || SQLERRM;
END;
