CREATE OR REPLACE PACKAGE PK_EMPRESAS IS

    -- Crear Convenio
    PROCEDURE CREAR_CONVENIO (
        EMP_TEL_LOCAL_NIT              IN  EMP_TEL_LOCAL.EMP_TEL_LOCAL_NIT%TYPE,
        NOMBRE                         IN  EMP_TEL_LOCAL.NOMBRE%TYPE,
        CORREO                         IN  EMP_TEL_LOCAL.CORREO%TYPE,
        VALOR_MINUTO                   IN  EMP_TEL_LOCAL.VALOR_MINUTO%TYPE
     );
    -- Listar Nit y nombre de todas las empresas.

    FUNCTION LISTAR_EMPS RETURN EMP_TAB;
   
    -- Informacion por empresas por mes filtrado
    function filtro_mes  (
        anio                            IN number,
        mes                             IN  number,
        nit                             in emp_Tel_local.emp_tel_local_nit%type
        ) return SYS_REFCURSOR;
    
    --resumen de consumos por empresa.
        
    function resumen_empresas (
                    anio     IN number,
                    mes     IN  number
                    ) return sys_refcursor;

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
    
    -- Informacion por empresas por mes filtrado

    function filtro_mes (
                    anio     IN  number,
                    mes     IN  number,
                    nit     in emp_tel_local.emp_tel_local_nit%type) 
    return sys_refcursor
    as
        l_cursor sys_refcursor;
    BEGIN 
    OPEN l_cursor FOR
        select  /*+ FIRST_ROWS */ llam.fecha_inicio as fecha, llam.tel_origen as num_origen, llam.tel_destino as num_destino, ceil(llam.duracion * 24 * 60) as duracion,  llam.nombre_destino as destino, ceil(llam.duracion *24 *60) * emp.valor_minuto as valor_total, emp.valor_minuto as valor_unidad  
        from llamada llam 
        join cliente cli on llam.cliente_id = cli.cliente_id  
        join emp_tel_local emp on  emp.EMP_TEL_LOCAL_NIT = cli.emp_tel_local_nit 
        where extract(year from llam.fecha_inicio) = anio and extract(month from llam.fecha_inicio) = mes 
        and emp.EMP_TEL_LOCAL_NIT =  nit order by llam.fecha_inicio;
    return l_cursor;
    END;


    --resumen de consumos por empresa.


    function resumen_empresas (
                    anio in number,
                    mes     IN  number) 
    return sys_refcursor
    as
        l_cursor sys_refcursor;
    BEGIN 
    OPEN l_cursor FOR
    SELECT  EMP.NOMBRE AS NOMBRE, 
    SUM((ceil(LLAM.DURACION * 24 * 60 ))) AS MINUTOS, 
    SUM((CEIL(LLAM.DURACION * 24 * 60) * EMP.VALOR_MINUTO)) AS VALOR 
    FROM LLAMADA LLAM 
        JOIN CLIENTE CLI ON (CLI.CLIENTE_ID = LLAM.CLIENTE_ID) 
        JOIN EMP_TEL_LOCAL EMP ON (CLI.EMP_TEL_LOCAL_NIT=EMP.EMP_TEL_LOCAL_NIT) and extract(year from llam.fecha_inicio) = anio and extract(month from llam.fecha_inicio) = mes GROUP BY EMP.NOMBRE; 
    return l_cursor;
    end ;

    

END PK_EMPRESAS;




select * from emp_tel_local;







