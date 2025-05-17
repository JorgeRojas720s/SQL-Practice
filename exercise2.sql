
-------Procedimientos---------------


CREATE OR REPLACE PROCEDURE INSERT_USUARIOS(
       p_n_usuario IN VARCHAR2,
       p_cedula IN VARCHAR2,
       p_nombre IN VARCHAR2,
       p_apellido IN VARCHAR2,
       p_contra IN VARCHAR2,
       p_correo IN VARCHAR2,
       p_genero IN VARCHAR2,
       p_rol IN VARCHAR2,
       message OUT VARCHAR2
)
IS
       v_genero_id NUMBER;
       v_rol_id NUMBER;


BEGIN 
    v_genero_id := INSERT_GENEROS(p_genero);
    v_rol_id := INSERT_ROLES(p_rol);


 INSERT INTO
    USUARIOS (
      N_USUARIO,
      CEDULA,
      NOMBRE,
      APELLIDO,
      GENERO_ID,
      CONTRA,
      ROL_ID,
      CORREO
    )
VALUES
    (
        p_n_usuario,
        p_cedula,
        p_nombre,
        p_apellido,
        v_genero_id,
        p_contra,
        v_rol_id,
        p_correo
    );
    
    message := 'Se insertó exitosamente el usuario';
    
    EXCEPTION
      WHEN OTHERS THEN
        message := 'Error al insertar usuario: ' || SQLERRM;
    
    
END;

---------------------------------Funciones----------------------------------
--Funcion de GENEROS
CREATE
OR REPLACE FUNCTION INSERT_GENEROS (p_genero IN VARCHAR2) RETURN NUMBER IS v_genero_id NUMBER;

BEGIN
INSERT INTO
    GENEROS (GENERO)
VALUES
    (p_genero) RETURNING ID INTO v_genero_id;

RETURN v_genero_id;

END;

--Funcion de ROLES
CREATE
OR REPLACE FUNCTION INSERT_ROLES (p_rol IN VARCHAR2) RETURN NUMBER IS v_rol_id NUMBER;

BEGIN
INSERT INTO
    ROLES (ROLE)
VALUES
    (p_rol) RETURNING ID INTO v_rol_id;

RETURN v_rol_id;

END;

---------------------------Probando----------------------
--Ver logs
select
    *
from
    user_errors
where
    name = 'INSERT_USUARIOS';

--mETER LO DATOS
DECLARE message VARCHAR2 (50);

BEGIN INSERT_USUARIOS (
    'akj-234',
    '117990469',
    'Jorge',
    'Rojas',
    'nose123',
    'jorge123@gmail.com',
    'Masculino',
    'admin',
    message
);

dbms_output.put_line (message);

END;

---vER DATOS
SELECT
    *
FROM
    USUARIOS;