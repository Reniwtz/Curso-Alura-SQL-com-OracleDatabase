--1) No Oracle SQL Developer, crie um novo script com a conex�o CURSO PLSQL.

--2) Execute o comando INSERT:

INSERT INTO SEGMERCADO (ID, DESCRICAO) VALUES (1, 'Varejo');
--Voc� receber� um erro.

--3) Crie um novo script com a conex�o CONEX�O M�QUINA LOCAL e execute o seguinte comando:

ALTER USER cursoplsql QUOTA UNLIMITED ON USERS;
--4) Volte ao script com a conex�o CURSO PLSQL e mostre o conte�do da tabela SEGMERCADO:

SELECT * FROM SEGMERCADO;COPIAR C�DIGO
--5) Crie um programa para inserir dados na tabela, executando o seguinte c�digo:

DECLARE
   v_ID NUMBER(5) := 2;
   v_DESCRICAO VARCHAR2(100) := 'Industria';
BEGIN
   INSERT INTO SEGMERCADO (ID, DESCRICAO) VALUES (v_ID, v_DESCRICAO);
COMMIT;
END;

--6) Utilize o comando %type:

DECLARE
   v_ID SEGMERCADO.ID%type := 3;
   v_DESCRICAO SEGMERCADO.DESCRICAO%type := 'Atacado';
BEGIN
   INSERT INTO SEGMERCADO (ID, DESCRICAO) VALUES (v_ID, v_DESCRICAO);
COMMIT;
END;

--7) Exiba o conte�do da tabela SEGMERCADO:

SELECT * FROM SEGMERCADO;

--8) Crie um script novo, usando a conex�o CURSO PLSQL.

--9) Mostre o conte�do de SEGMERCADO, usando as op��es da palavra atacado, com as sele��es:

SELECT * FROM SEGMERCADO;
SELECT * FROM SEGMERCADO WHERE DESCRICAO = 'Atacado';
SELECT * FROM SEGMERCADO WHERE DESCRICAO = 'atacado';

--10) Use a fun��o UPPER:

SELECT * FROM SEGMERCADO WHERE UPPER(DESCRICAO) = 'ATACADO';

--11) Fa�a o programa, executando os c�digos:

DECLARE
   v_ID SEGMERCADO.ID%type := 4;
   v_DESCRICAO SEGMERCADO.DESCRICAO%type := 'Atacado';
BEGIN
   INSERT INTO SEGMERCADO (ID, DESCRICAO) VALUES (v_ID, UPPER(v_DESCRICAO));
   COMMIT;
END;

--12) Apague o registro onde o ID � 4:

DELETE FROM SEGMERCADO WHERE ID = 4;

--13) Crie um novo script vazio.

--14) Mostre o conte�do da tabela SEGMERCADO:

SELECT * FROM SEGMERCADO;

--15) Use o comando UPDATE para alterar a tabela:

DECLARE
   v_ID SEGMERCADO.ID%type := 3;
   v_DESCRICAO SEGMERCADO.DESCRICAO%type := 'Atacadista';
BEGIN
   UPDATE SEGMERCADO SET DESCRICAO = UPPER(v_DESCRICAO) WHERE ID = v_ID;
   v_ID := 1;
   v_DESCRICAO := 'Varejista';
   UPDATE SEGMERCADO SET DESCRICAO = UPPER(v_DESCRICAO) WHERE ID = v_ID;
   v_ID := 2;
   v_DESCRICAO := 'Industrial';
   UPDATE SEGMERCADO SET DESCRICAO = UPPER(v_DESCRICAO) WHERE ID = v_ID;
   COMMIT;
END;

--16) Crie uma nova conex�o com CURSO PLSQL.

--17) Execute os seguintes comandos:

DECLARE
   v_ID SEGMERCADO.ID%type := 5;
   v_DESCRICAO SEGMERCADO.DESCRICAO%type := 'Esportistas';
BEGIN
   INSERT INTO SEGMERCADO (ID, DESCRICAO) VALUES (v_ID, UPPER(v_DESCRICAO));
   COMMIT;
END;

--18) Para excluir o ID 5, execute o c�digo:

DECLARE
   v_ID SEGMERCADO.ID%type := 5;
BEGIN
   DELETE FROM SEGMERCADO WHERE ID = v_ID;
   COMMIT;
END;

--19) Para fazer uma inclus�o de segmento de mercado na tabela SEGMERCADO, execute:

DECLARE
   v_ID SEGMERCADO.ID%type := 4;
   v_DESCRICAO SEGMERCADO.DESCRICAO%type := 'Atacado';
BEGIN
   INSERT INTO SEGMERCADO (ID, DESCRICAO) VALUES (v_ID, UPPER(v_DESCRICAO));
   COMMIT;
END;

--20) Veja a altera��o do segmento de mercado na tabela:

DECLARE
   v_ID SEGMERCADO.ID%type := 3;
   v_DESCRICAO SEGMERCADO.DESCRICAO%type := 'Atacadista';
BEGIN
   UPDATE SEGMERCADO SET DESCRICAO = UPPER(v_DESCRICAO) WHERE ID = v_ID;
   COMMIT;
END;

--21) Exclua um segmento de mercado em SEGMERCADO:

DECLARE
   v_ID SEGMERCADO.ID%type := 5;
BEGIN
   DELETE FROM SEGMERCADO WHERE ID = v_ID;
   COMMIT;
END;