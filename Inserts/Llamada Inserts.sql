DECLARE
    ITR_CLIENTE NUMBER;
    ITR_NUM NUMBER;
    ITR_INICIO NUMBER;
    ITR_FIN NUMBER;
    FECHA_INI VARCHAR2(50) := '01-JAN-2020 00:00:00';
    FECHA_FIN VARCHAR2(50) := '01-JAN-2020 00:00:10';
BEGIN
    ITR_CLIENTE := 1;
    ITR_INICIO := 0;
    ITR_FIN :=0;


FOR J IN 1..500 LOOP
    FOR I IN 1..50 LOOP
        INSERT INTO LLAMADA (LLAMADA_ID, CLIENTE_ID, ARCHIVO_ID, TEL_ORIGEN, TEL_DESTINO, PAIS_ID,NOMBRE_DESTINO, FECHA_INICIO, FECHA_FIN, DURACION) VALUES 
                    (SEQ_LLAMADA.NEXTVAL,
                    J, 
                    NULL, 
                    PK_LLAMADA.TEL_CLIENTE(J), 
                    '0001-305-'||TO_CHAR(7869556 + J * 3), 
                    PK_LLAMADA.BUSCAR_PAISID(('0001-305-'||TO_CHAR(7869556 + J * 3))), 
                    PK_LLAMADA.BUSCAR_DESTINO('0001-305-'||TO_CHAR(7869556 + J * 3)), 
                    TO_DATE((CAST(FECHA_INI AS DATE) + ITR_INICIO)), 
                    TO_DATE((CAST(FECHA_FIN AS DATE) + ITR_FIN)), 
                    PK_LLAMADA.CALCULAR_DURACION(TO_DATE((CAST(FECHA_INI AS DATE) + ITR_INICIO)),TO_DATE((CAST(FECHA_FIN AS DATE) + ITR_FIN))));
        ITR_INICIO := ITR_INICIO + 4.8005;
        ITR_FIN := ITR_FIN + 4.8008;


    END LOOP;
    ITR_INICIO := 0;
    ITR_FIN :=0;
END LOOP;

FOR J IN 15000000..15000499 LOOP
    FOR I IN 1..50 LOOP
        INSERT INTO LLAMADA (LLAMADA_ID, CLIENTE_ID, ARCHIVO_ID, TEL_ORIGEN, TEL_DESTINO, PAIS_ID,NOMBRE_DESTINO, FECHA_INICIO, FECHA_FIN, DURACION) VALUES 
                    (SEQ_LLAMADA.NEXTVAL,
                    J, 
                    NULL, 
                    PK_LLAMADA.TEL_CLIENTE(J), 
                    '0034-091-'||TO_CHAR(9654326 + J * 2), 
                    PK_LLAMADA.BUSCAR_PAISID(('0034-091-'||TO_CHAR(9654326 + J * 2))), 
                    PK_LLAMADA.BUSCAR_DESTINO('0034-091-'||TO_CHAR(9654326 + J * 2)), 
                    TO_DATE((CAST(FECHA_INI AS DATE) + ITR_INICIO)), 
                    TO_DATE((CAST(FECHA_FIN AS DATE) + ITR_FIN)), 
                    PK_LLAMADA.CALCULAR_DURACION(TO_DATE((CAST(FECHA_INI AS DATE) + ITR_INICIO)),TO_DATE((CAST(FECHA_FIN AS DATE) + ITR_FIN))));
        ITR_INICIO := ITR_INICIO + 4.8015;
        ITR_FIN := ITR_FIN + 4.8018;


    END LOOP;
    ITR_INICIO := 0;
    ITR_FIN :=0;
END LOOP;


FOR J IN 20000000..20000499 LOOP
    FOR I IN 1..50 LOOP
        INSERT INTO LLAMADA (LLAMADA_ID, CLIENTE_ID, ARCHIVO_ID, TEL_ORIGEN, TEL_DESTINO, PAIS_ID,NOMBRE_DESTINO, FECHA_INICIO, FECHA_FIN, DURACION) VALUES 
                    (SEQ_LLAMADA.NEXTVAL,
                    J, 
                    NULL, 
                    PK_LLAMADA.TEL_CLIENTE(J), 
                    '0058-212-'||TO_CHAR(2386944 + J * 4), 
                    PK_LLAMADA.BUSCAR_PAISID(('0058-212-'||TO_CHAR(2386944 + J * 4))), 
                    PK_LLAMADA.BUSCAR_DESTINO('0058-212-'||TO_CHAR(2386944 + J * 4)), 
                    TO_DATE((CAST(FECHA_INI AS DATE) + ITR_INICIO)), 
                    TO_DATE((CAST(FECHA_FIN AS DATE) + ITR_FIN)), 
                    PK_LLAMADA.CALCULAR_DURACION(TO_DATE((CAST(FECHA_INI AS DATE) + ITR_INICIO)),TO_DATE((CAST(FECHA_FIN AS DATE) + ITR_FIN))));
        ITR_INICIO := ITR_INICIO + 4.8014;
        ITR_FIN := ITR_FIN + 4.8017;


    END LOOP;
    ITR_INICIO := 0;
    ITR_FIN :=0;
END LOOP;



FOR J IN 25000000..25000499 LOOP
    FOR I IN 1..50 LOOP
        INSERT INTO LLAMADA (LLAMADA_ID, CLIENTE_ID, ARCHIVO_ID, TEL_ORIGEN, TEL_DESTINO, PAIS_ID,NOMBRE_DESTINO, FECHA_INICIO, FECHA_FIN, DURACION) VALUES 
                    (SEQ_LLAMADA.NEXTVAL,
                    J, 
                    NULL, 
                    PK_LLAMADA.TEL_CLIENTE(J), 
                    '0058-212-'||TO_CHAR(1327896 + J * 3), 
                    PK_LLAMADA.BUSCAR_PAISID(('0058-212-'||TO_CHAR(1327896 + J * 3))), 
                    PK_LLAMADA.BUSCAR_DESTINO('0058-212-'||TO_CHAR(1327896 + J * 3)), 
                    TO_DATE((CAST(FECHA_INI AS DATE) + ITR_INICIO)), 
                    TO_DATE((CAST(FECHA_FIN AS DATE) + ITR_FIN)), 
                    PK_LLAMADA.CALCULAR_DURACION(TO_DATE((CAST(FECHA_INI AS DATE) + ITR_INICIO)),TO_DATE((CAST(FECHA_FIN AS DATE) + ITR_FIN))));
        ITR_INICIO := ITR_INICIO + 4.8012;
        ITR_FIN := ITR_FIN + 4.8014;


    END LOOP;
    ITR_INICIO := 0;
    ITR_FIN :=0;
END LOOP;


END;



