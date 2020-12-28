CREATE OR REPLACE PACKAGE PK_EMPRESAS IS

    -- Crear Convenio
    PROCEDURE CREAR_CONVENIO (
        EMP_TEL_LOCAL_NIT              IN  EMP_TEL_LOCAL.EMP_TEL_LOCAL_NIT%TYPE,
        NOMBRE                         IN  EMP_TEL_LOCAL.NOMBRE%TYPE,
        CORREO                         IN  EMP_TEL_LOCAL.CORREO%TYPE,
        VALOR_MINUTO                   IN  EMP_TEL_LOCAL.VALOR_MINUTO%TYPE
     );

    FUNCTION LISTAR_EMPS RETURN EMP_TAB;

END PK_EMPRESAS;


CREATE OR REPLACE PACKAGE BODY PK_EMPRESAS IS

     -- Crear Convenio
    PROCEDURE CREAR_CONVENIO (
        EMP_TEL_LOCAL_NIT              IN  EMP_TEL_LOCAL.EMP_TEL_LOCAL_NIT%TYPE,
        NOMBRE                         IN  EMP_TEL_LOCAL.NOMBRE%TYPE,
        CORREO                         IN  EMP_TEL_LOCAL.CORREO%TYPE,
        VALOR_MINUTO                   IN  EMP_TEL_LOCAL.VALOR_MINUTO%TYPE
        
    ) IS
        CONVENIO_VAL EMP_TEL_LOCAL.CONVENIO_NO%TYPE := SEQ_CONVENIOS.NEXTVAL;
    BEGIN
        INSERT INTO EMP_TEL_LOCAL (
            EMP_TEL_LOCAL_NIT,
            NOMBRE,
            CORREO,
            VALOR_MINUTO,
            CONVENIO_NO
        ) VALUES (
            EMP_TEL_LOCAL_NIT,
            NOMBRE,
            CORREO,
            VALOR_MINUTO,
            CONVENIO_VAL
        );
        COMMIT;
    END;
        
    -- Listar Nit y nombre de todas las empresas.
    FUNCTION LISTAR_EMPS
    RETURN EMP_TAB
        IS
            L_EMP_TAB EMP_TAB := EMP_TAB();
            N INTEGER := 0;
        BEGIN
            FOR R IN (SELECT EMP_TEL_LOCAL_NIT, NOMBRE FROM EMP_TEL_LOCAL)
            LOOP
                L_EMP_TAB.EXTEND;
                N := N + 1;
                L_EMP_TAB(N) := EMP_OBJ(R.EMP_TEL_LOCAL_NIT, R.NOMBRE);
            END LOOP;
        RETURN L_EMP_TAB;
    END;
    

END PK_EMPRESAS;




--Query del resumen por empresa.

SELECT  EMP.NOMBRE AS NOMBRE, SUM((CEIL(LLAM.DURACION * 24 * 60))) AS MINUTOS, SUM((CEIL(LLAM.DURACION * 24 * 60) * EMP.VALOR_MINUTO)) AS VALOR FROM LLAMADA LLAM 
    JOIN CLIENTE CLI ON (CLI.CLIENTE_ID= LLAM.CLIENTE_ID) 
    JOIN EMP_TEL_LOCAL EMP ON (CLI.EMP_TEL_LOCAL_NIT=EMP.EMP_TEL_LOCAL_NIT) GROUP BY EMP.NOMBRE; 




