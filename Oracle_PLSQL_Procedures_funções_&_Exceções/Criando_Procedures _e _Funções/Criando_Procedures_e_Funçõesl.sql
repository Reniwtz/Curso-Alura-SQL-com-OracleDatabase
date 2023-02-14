-- 1) No Oracle SQL Developer, crie uma nova janela de script.

-- 2) Siga os passos abaixo para criar uma Procedure.

-- 3) Execute o código abaixo para criar a Procedure:

CREATE PROCEDURE incluir_segmercado (
    p_id        IN NUMBER,
    p_descricao IN VARCHAR2
) IS
BEGIN
    INSERT INTO segmercado (
        id,
        descricao
    ) VALUES (
        p_id,
        upper(p_descricao)
    );

    COMMIT;
END;

-- 4) Para executar a procedure, execute:

EXECUTE incluir_segmercado(4,'Farmaceuticos');

-- 5) De maneira alternativa, você pode executar a procedure da seguinte forma:

BEGIN
    incluir_segmercado(4, 'Farmaceuticos');
END;

-- 6) Altere a procedure:

CREATE OR REPLACE PROCEDURE incluir_segmercado (
    p_id        IN segmercado.id%TYPE,
    p_descricao IN segmercado.descricao%TYPE
) IS
BEGIN
    INSERT INTO segmercado (
        id,
        descricao
    ) VALUES (
        p_id,
        upper(p_descricao)
    );

    COMMIT;
END;

-- 7) Crie a segunda procedure:

CREATE OR REPLACE PROCEDURE incluir_segmercado2 (
    p_id        IN segmercado.id%TYPE,
    p_descricao IN segmercado.descricao%TYPE
) IS
BEGIN
    INSERT INTO segmercado (
        id,
        descricao
    ) VALUES (
        p_id,
        upper(p_descricao)
    );

    COMMIT;
END;

-- 8) Crie a terceira procedure:

CREATE OR REPLACE PROCEDURE incluir_segmercado3 (
    p_id        IN segmercado.id%TYPE,
    p_descricao IN segmercado.descricao%TYPE
) IS
BEGIN
    INSERT INTO segmercado (
        id,
        descricao
    ) VALUES (
        p_id,
        upper(p_descricao)
    );

    COMMIT;
END;

-- 9) Selecione a procedure incluir_segmercado2, cliquei com o botão direito do mouse e escolha Eliminar.

-- 10) O código para eliminar é mostrado em uma janela.

-- 11) Clique em Aplicar para eliminar a procedure.

-- 12) Execute o script para eliminar a procedure incluir_segmercado3:

DROP PROCEDURE incluir_segmercado3;

-- 13) Atualize a visão do banco para verificar que a procedure foi eliminada.

14) Crie um novo script e execute o comando:

SET SERVEROUTPUT ON;COPIAR CÓDIGO

-- 15) Crie o programa PL/SQL para criar o descritor v_DESCRIÇAO:

DECLARE
   v_ID SEGMERCADO.ID%type := 1;
   v_IDSaida SEGMERCADO.ID%type;
   v_DESCRICAO SEGMERCADO.DESCRICAO%type;

BEGIN
   SELECT DESCRICAO INTO v_DESCRICAO FROM SEGMERCADO WHERE ID = v_ID;
   SELECT ID INTO v_IDSaida FROM SEGMERCADO WHERE ID = v_ID;
   dbms_output.put_line(v_DESCRICAO);
   dbms_output.put_line(v_IDSaida);

-- 16) Para criar a função obter_descricao_segmercado, execute o código:

CREATE OR REPLACE FUNCTION obter_descricao_segmercado (
    p_id IN segmercado.id%TYPE
) RETURN segmercado.descricao%TYPE IS
    v_descricao segmercado.descricao%TYPE;
BEGIN
    SELECT
        descricao
    INTO v_descricao
    FROM
        segmercado
    WHERE
        id = p_id;

    RETURN v_descricao;
END;

-- 17) Mostre o conteúdo, usando a função que você acabou de criar:

SELECT ID, obter_descricao_segmercado(ID), DESCRICAO, LOWER(DESCRICAO) FROM SEGMERCADO;

-- 18) Crie um novo script. Dentro dele, crie uma variável, use a função e mostre o valor dessa variável:

VARIABLE g_DESCRICAO VARCHAR2(100);
EXECUTE :g_DESCRICAO:=obter_descricao_segmercado(3);
PRINT g_DESCRICAO;

-- 19) Crie um programa que executa o mesmo que os passos anteriores:

SET SERVEROUTPUT ON

DECLARE
    v_descricao segmercado.descricao%TYPE;
    v_id        segmercado.id%TYPE := 2;
BEGIN
    v_descricao := obter_descricao_segmercado(v_id);
    dbms_output.put_line('A descrição do segmento de mercado é ' || v_descricao);
END;