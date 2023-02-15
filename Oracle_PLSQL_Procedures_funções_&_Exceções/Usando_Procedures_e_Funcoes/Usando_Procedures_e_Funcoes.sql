-- 1) Crie um novo script com a conex�o CURSO PLSQL.

-- 2) Para incluir um novo cliente, crie uma procedure incluir_cliente, executando o seguinte c�digo:

CREATE OR REPLACE PROCEDURE incluir_cliente (
    p_id          cliente.id%TYPE,
    p_razao       cliente.razao_social%TYPE,
    p_cnpj        cliente.cnpj%TYPE,
    p_segmercado  cliente.segmercado_id%TYPE,
    p_faturamento cliente.faturamento_previsto%TYPE,
    p_categoria   cliente.categoria%TYPE
) IS
BEGIN
    INSERT INTO cliente VALUES (
        p_id,
        p_razao,
        p_cnpj,
        p_segmercado,
        sysdate,
        p_faturamento,
        p_categoria
    );

    COMMIT;
END;

-- 3) Execute o programa.

-- 4) Mostre as tabelas e execute incluir_cliente:

SELECT * FROM CLIENTE;
SELECT * FROM SEGMERCADO;
EXECUTE incluir_cliente (1, 'SUPERMERCADOS CAMPEAO', '1234567890', 1, 90000, 'MEDIO GRANDE');

-- 5) Crie um novo script e exiba a sa�da na tela:

SET SERVEROUTPUT ON

-- 6) O novo programa seguir� a seguinte regra

-- PEQUENO FATURA AT� 10000

-- MEDIO ENTRE 10001 E 50000

-- MEDIO GRANDE ENTRE 50001 E 100000

-- GRANDE MAIS DE 100000

-- 7) Crie o programa para classificar o cliente:

DECLARE
    v_faturamento cliente.faturamento_previsto%TYPE := 120000;
    v_categoria   cliente.categoria%TYPE;
BEGIN
    IF v_faturamento <= 10000 THEN
        v_categoria := 'PEQUENO';
    ELSIF v_faturamento <= 50000 THEN
        v_categoria := 'M�DIO';
    ELSIF v_faturamento <= 100000 THEN
        v_categoria := 'M�DIO GRANDE';
    ELSE
        v_categoria := 'GRANDE';
    END IF;

    dbms_output.put_line('A Categoria � ' || v_categoria);
END;


-- 8) Em uma nova janela de script, crie a fun��o categoria_cliente:

CREATE OR REPLACE FUNCTION categoria_cliente (
    p_faturamento IN cliente.faturamento_previsto%TYPE
) RETURN cliente.categoria%TYPE IS
    v_categoria cliente.categoria%TYPE;
BEGIN
    IF p_faturamento <= 10000 THEN
        v_categoria := 'PEQUENO';
    ELSIF p_faturamento <= 50000 THEN
        v_categoria := 'M�DIO';
    ELSIF p_faturamento <= 100000 THEN
        v_categoria := 'M�DIO GRANDE';
    ELSE
        v_categoria := 'GRANDE';
    END IF;

    RETURN v_categoria;
END;

-- 9) Declare a vari�vel, execute a fun��o categoria_cliente e imprima a vari�vel v_categoria:

VARIABLE g_CATEGORIA VARCHAR2(100);
EXECUTE :g_CATEGORIA:=categoria_cliente(120000);
PRINT g_CATEGORIA;

-- 10) Complemente a procedure para calcular a categoria de cliente.

-- 11) Primeiramente, crie uma nova �rea de script para escrever essa procedure.

-- 12) O c�digo da nova procedure ser�:

CREATE OR REPLACE PROCEDURE incluir_cliente (
    p_id          cliente.id%TYPE,
    p_razao       cliente.razao_social%TYPE,
    p_cnpj        cliente.cnpj%TYPE,
    p_segmercado  cliente.segmercado_id%TYPE,
    p_faturamento cliente.faturamento_previsto%TYPE
) IS
    v_categoria cliente.categoria%TYPE;
BEGIN
    v_categoria := categoria_cliente(p_faturamento);
    INSERT INTO cliente VALUES (
        p_id,
        p_razao,
        p_cnpj,
        p_segmercado,
        sysdate,
        p_faturamento,
        v_categoria
    );

    COMMIT;
END;

-- 13) Mostre o conte�do de CLIENTE:

SELECT * FROM CLIENTE;

-- 14) Execute a procedure para incluir os novos clientes, passando os par�metros:

EXECUTE incluir_cliente(2, 'SUPERMERCADO DO VALE','11111111111',1,90000);
EXECUTE incluir_cliente(3, 'SUPERMERCADO CARIOCA','22222222222',1,30000);

-- 15) Verifique o conte�do da tabela CLIENTE.

