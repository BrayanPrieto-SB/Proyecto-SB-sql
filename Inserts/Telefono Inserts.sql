declare

    bogota_num NUMBER := 6002234;
    medellin_num NUMBER := 1034678;
    cali_num NUMBER := 2983441;
    bqlla_num NUMBER := 3459111;
    itr NUMBER;
    itr1 NUMBER;
    itr2 NUMBER;
    itr3 NUMBER;
    

begin 
    itr :=1;
    itr1 :=1;
    itr2 :=1;
    itr3 :=1;
    
    FOR I IN 1..500 LOOP
        INSERT INTO telefono (telefono_id, cliente_id,indicativo_pais,indicativo_ciudad, numero) VALUES (seq_telefono.NEXTVAL,I, '0057','001', bogota_num +itr); 
        itr := itr+1;
    END LOOP;
    
    FOR j IN 15000000..15000499 LOOP
        INSERT INTO telefono (telefono_id, cliente_id,indicativo_pais,indicativo_ciudad, numero) VALUES (seq_telefono.NEXTVAL,j, '0057','004', medellin_num + itr1);  
        itr1 := itr1+1;
    END LOOP;
    
    FOR k IN 20000000..20000499 LOOP
        INSERT INTO telefono (telefono_id, cliente_id,indicativo_pais,indicativo_ciudad, numero) VALUES (seq_telefono.NEXTVAL,k, '0057','002', cali_num + itr2); 
        itr2 := itr2+1;
    END LOOP;
    
    FOR l IN 25000000..25000499 LOOP
        INSERT INTO telefono (telefono_id, cliente_id,indicativo_pais,indicativo_ciudad, numero) VALUES (seq_telefono.NEXTVAL,l,'0057','005', bqlla_num + itr3); 
        itr3 := itr3+1;
    END LOOP;

END;


