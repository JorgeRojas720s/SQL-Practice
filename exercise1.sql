---------------------------------Objetos--------------------------------------

--Objetos para estado
CREATE
OR REPLACE TYPE estadoOBJ AS OBJECT (estado VARCHAR2 (15));

--Objetos para torre
CREATE
OR REPLACE TYPE torreOBJ AS OBJECT (
    procesador VARCHAR2 (20),
    n_bien VARCHAR2 (20),
    n_serie VARCHAR2 (20),
    marca VARCHAR2 (20),
    modelo VARCHAR2 (20)
);

--Objetos para monitor
CREATE
OR REPLACE TYPE monitorOBJ AS OBJECT (
    tipo VARCHAR2 (20),
    n_bien VARCHAR2 (20),
    n_serie VARCHAR2 (20),
    marca VARCHAR2 (20),
    modelo VARCHAR2 (20)
);

--Objetos para teclado
CREATE
OR REPLACE TYPE tecladoOBJ AS OBJECT (
    n_bien VARCHAR2 (20),
    n_serie VARCHAR2 (20),
    marca VARCHAR2 (20),
    modelo VARCHAR2 (20)
);

--Objetos para raton
CREATE
OR REPLACE TYPE ratonOBJ AS OBJECT (
    n_bien VARCHAR2 (20),
    n_serie VARCHAR2 (20),
    marca VARCHAR2 (20),
    modelo VARCHAR2 (20)
);

--Objetos para otro
CREATE
OR REPLACE TYPE otroOBJ AS OBJECT (
    dispositivo VARCHAR2 (20),
    n_bien VARCHAR2 (20),
    n_serie VARCHAR2 (20),
    marca VARCHAR2 (20),
    modelo VARCHAR2 (20)
);
---------------------------------Procedimiento Inicial-------------------------------------------

CREATE OR REPLACE PROCEDURE INSERT_EQUIPOS(
       obj_estado IN estadoOBJ,
       obj_monitor IN monitorOBJ,
       obj_teclado IN tecladoOBJ,
       obj_raton IN ratonOBJ,
       obj_otro IN otroOBJ,
       message OUT VARCHAR2
)
IS
       v_estado_id NUMBER;
       v_monitor_id NUMBER;
       v_teclado_id NUMBER;
       v_raton_id NUMBER;
       v_otro_id NUMBER;

BEGIN 
    v_estado_id := INSERT_ESTADOS(obj_estado.estado);
    v_monitor_id := INSERT_MONITORES(obj_monitor.tipo, obj_monitor.n_bien, obj_monitor.n_serie, obj_monitor.marca, obj_monitor.modelo);
    v_teclado_id := INSERT_TECLADOS(obj_teclado.n_bien, obj_teclado.n_serie, obj_teclado.marca, obj_teclado.modelo);
    v_raton_id := INSERT_RATONES(obj_raton.n_bien, obj_raton.n_serie, obj_raton.marca, obj_raton.modelo);
    v_otro_id := INSERT_OTROS(obj_otro.dispositivo, obj_otro.n_bien, obj_otro.n_serie, obj_otro.marca, obj_otro.modelo);
    
    message := 'Se insertó exitosamente';
    
    EXCEPTION
      WHEN OTHERS THEN
        message := 'Error al insertar: ' || SQLERRM;
    
    
END;

---------------------------------Funciones-------------------------------------------
--Funcion de estados
CREATE
OR REPLACE FUNCTION INSERT_ESTADOS (p_estado IN VARCHAR2) RETURN NUMBER IS v_estado_id NUMBER;

BEGIN
INSERT INTO
    ESTADOS (estado)
VALUES
    (p_estado) RETURNING ID INTO v_estado_id;

RETURN v_estado_id;

END;

--Funcion de Monitores
CREATE
OR REPLACE FUNCTION INSERT_MONITORES (
    p_tipo IN VARCHAR2,
    p_n_bien IN VARCHAR2,
    p_n_serie IN VARCHAR2,
    p_marca IN VARCHAR2,
    p_modelo IN VARCHAR2
) RETURN NUMBER IS v_monitor_id NUMBER;

BEGIN
INSERT INTO
    MONITORES (Tipo, N_bien, N_serie, Marca, Modelo)
VALUES
    (p_tipo, p_n_bien, p_n_serie, p_marca, p_modelo) RETURNING ID INTO v_monitor_id;

RETURN v_monitor_id;

END;

--fUNCION DE TECLADOS
CREATE
OR REPLACE FUNCTION INSERT_TECLADOS (
    p_n_bien IN VARCHAR2,
    p_n_serie IN VARCHAR2,
    p_marca IN VARCHAR2,
    p_modelo IN VARCHAR2
) RETURN NUMBER IS v_teclado_id NUMBER;

BEGIN
INSERT INTO
    TECLADOS (N_bien, N_serie, Marca, Modelo)
VALUES
    (p_n_bien, p_n_serie, p_marca, p_modelo) RETURNING ID INTO v_teclado_id;

RETURN v_teclado_id;

END;

-----Funcion de Raton
CREATE
OR REPLACE FUNCTION INSERT_RATONES (
    p_n_bien IN VARCHAR2,
    p_n_serie IN VARCHAR2,
    p_marca IN VARCHAR2,
    p_modelo IN VARCHAR2
) RETURN NUMBER IS v_raton_id NUMBER;

BEGIN
INSERT INTO
    RATONES (N_bien, N_serie, Marca, Modelo)
VALUES
    (p_n_bien, p_n_serie, p_marca, p_modelo) RETURNING ID INTO v_raton_id;

RETURN v_raton_id;

END;

-- Funcion de Otro
CREATE
OR REPLACE FUNCTION INSERT_OTROS (
    p_dispositivo IN VARCHAR2,
    p_n_bien IN VARCHAR2,
    p_n_serie IN VARCHAR2,
    p_marca IN VARCHAR2,
    p_modelo IN VARCHAR2
) RETURN NUMBER IS v_otro_id NUMBER;

BEGIN
INSERT INTO
    OTROS (Dispositivo, N_bien, N_serie, Marca, Modelo)
VALUES
    (
        p_dispositivo,
        p_n_bien,
        p_n_serie,
        p_marca,
        p_modelo
    ) RETURNING ID INTO v_otro_id;

RETURN v_otro_id;

END;

---------------------------Probando---------------------------------------
--Ver logs
select
    *
from
    user_errors
where
    name = 'INSERT_EQUIPOS';

----Ver si objetos son validos
select
    object_name,
    status
from
    user_objects
where
    object_type = 'TYPE'
order by
    object_name;

DECLARE message VARCHAR(50);

BEGIN INSERT_EQUIPOS (
    estadoOBJ ('Bueno'),
    monitorOBJ ('Dragon', 'SI', '123', 'Tech', '2018'),
    tecladoOBJ ('SI', '123', 'Tech', '2018'),
    ratonOBJ ('SI', '123', 'Tech', '2018'),
    otroOBJ ('Nose', 'SI', '123', 'Tech', '2018'),
    message
);

dbms_output.put_line (message);

END;