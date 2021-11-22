/* 
Utilizando o MER Acima Realize as seguintes Operações:
1-Crie as tabelas no banco de dados relacional e insira registros em todas as tabelas (2,0)
2-Crie um Índice na tabela paciente, utilizando o campo nome (0,5)
3-Crie um Índice na tabela consulta, utilizando o campo data (0,5)
4-Utilizando o operador BETWEEN mostre todas as consultas do dia 14/06/2021 ate 19/06/2021 (0,5)
5-Utilizando o operador LIKE liste todos os cliente que tenham o sobrenome SILVA (0,5)
6-Crie uma view com os dados das CONSULTAS agendadas trazendo os dados dos pacientes e dos médicos (1,0)
7-Transforme o modelo RELACIONAL acima em um modelo DOCUMENTAL NOSQL (2,0)
*/
-- Criando o banco de dados
create database P2_lbd;

-- 1-Crie as tabelas no banco de dados relacional e insira registros em todas as tabelas (2,0)
-- Criando a tabela PACIENTE
create table PACIENTE (
codigoPaciente numeric, 
nomePaciente varchar(30), 
telefonePac varchar(15), 
genero varchar(20), 
idade numeric,
primary key (codigoPaciente)
);

-- Criando uma sequencia de pacientes
INSERT INTO sequence VALUES (seq_paciente);

-- Para popular a tabela
insert into PACIENTE (codigoPaciente, nomePaciente, telefonePac, genero, idade)
             values(seq_paciente.nextval, 'Ana Maria', '98745-7485', 'Feminino', '32');

insert into PACIENTE (codigoPaciente, nomePaciente, telefonePac, genero, idade)
             values(seq_paciente.nextval, 'Bruno Cesar', '97485-1245', 'Masculino', '29');
             
insert into PACIENTE (codigoPaciente, nomePaciente, telefonePac, genero, idade)
             values(seq_paciente.nextval, 'Carla Souza', '94356-8040', 'Feminino', '43');
             
insert into PACIENTE (codigoPaciente, nomePaciente, telefonePac, genero, idade)
             values(seq_paciente.nextval, 'Douglas Silva', '97841-3698', 'Masculino', '19');             

-- Criando a tabela MEDICO
create table MEDICO (
codigoMedico numeric, 
nomeMedico varchar(40), 
telefoneMed varchar(15), 
crm numeric, 
especialidade varchar(25),
primary key (codigoMedico)
);

-- Criando uma sequencia de medicos
INSERT INTO sequence VALUES (seq_medico);

-- Populando a tabela
insert into MEDICO (codigoMedico, nomeMedico, telefoneMed, crm, especialidade)
             values(seq_medico.nextval, 'Augusto Soares', '94578-2356', '45879', 'Pediatria');

insert into MEDICO (codigoMedico, nomeMedico, telefoneMed, crm, especialidade)
             values(seq_medico.nextval, 'Bruna Rodrigues', '97489-1478', '32659', 'Ortopedia');

insert into MEDICO (codigoMedico, nomeMedico, telefoneMed, crm, especialidade)
             values(seq_medico.nextval, 'Carolina Suzana', '96543-8722', '74859', 'Otorrinolaringologia');
             
insert into MEDICO (codigoMedico, nomeMedico, telefoneMed, crm, especialidade)
             values(seq_medico.nextval, 'Daniele Silva', '98569-2587', '45879', 'Clinica Geral');             

-- Criando a tabela CONSULTA
create table CONSULTA (
	codigoConsulta numeric,
	dataConsulta timestamp,
	historico varchar(50),
	status numeric,
	codigoMed numeric,
	codigoPac numeric,
	primary key (codigoConsulta),
    CONSTRAINT fk_med
    FOREIGN KEY (codigoMed)
    REFERENCES MEDICO (codigoMedico),
    CONSTRAINT fk_pac
    FOREIGN KEY (codigoPac)
    REFERENCES PACIENTE (codigoPaciente)
);

-- Criando uma sequencia de consultas
INSERT INTO sequence VALUES (seq_consulta);

-- Insere dados/popula a tabela CONSULTA
insert into CONSULTA (codigoConsulta, dataConsulta, historico, status, codigoMed, codigoPac)
              values(seq_consulta.nextval, to_date ('2021-11-15 09:30:15','yyyy/mm/dd hh24:mi:ss'), 
              'Primeira consulta', '1', 1, 4);

insert into CONSULTA (codigoConsulta, dataConsulta, historico, status, codigoMed, codigoPac)
              values(seq_consulta.nextval, to_date ('2021-11-21 12:47:53','yyyy/mm/dd hh24:mi:ss'), 
              'Retorno para apresentação de exames', '2', 2, 3);

insert into CONSULTA (codigoConsulta, dataConsulta, historico, status, codigoMed, codigoPac)
              values(seq_consulta.nextval, to_date ('2021-11-18 15:41:20','yyyy/mm/dd hh24:mi:ss'), 
              'Acompanhamento', '3', 3, 2);
              
insert into CONSULTA (codigoConsulta, dataConsulta, historico, status, codigoMed, codigoPac)
              values(seq_consulta.nextval, to_date ('2021-11-13 17:32:13','yyyy/mm/dd hh24:mi:ss'), 
              'Primeira consulta', '1', 4, 1);              

-- Criando a tabela de RECEITA
create table RECEITA (
	codigoReceita numeric,
	dataReceita date,
	descritivo varchar(150),
	codigoConsulta numeric,
	primary key (codigoReceita),
    CONSTRAINT fk_receita
    FOREIGN KEY (codigoReceita)
    REFERENCES RECEITA (codigoReceita)
);

-- Criando uma sequencia de receitas
INSERT INTO sequence VALUES (seq_receita);

-- Populando a tabela
insert into RECEITA (codigoReceita, dataReceita, descritivo, codigoConsulta)
              values(seq_receita.nextval, date '2021-11-16', 'Tomar 1 capsula 3x ao dia, 8 em 8 horas', 4);
              
insert into RECEITA (codigoReceita, dataReceita, descritivo, codigoConsulta)
              values(seq_receita.nextval, date '2021-11-15', 'Tomar 300ml 2x ao dia', 3);              

insert into RECEITA (codigoReceita, dataReceita, descritivo, codigoConsulta)
              values(seq_receita.nextval, date '2021-11-16', 'Tomar 2 capsula 1x ao dia', 2);

insert into RECEITA (codigoReceita, dataReceita, descritivo, codigoConsulta)
              values(seq_receita.nextval, date '2021-11-21', 'Caso tenha febre, tomar paracetamol de 6 em 6 horas', 1);

/***********************************************************************************************/

-- 2-Crie um Índice na tabela paciente, utilizando o campo nome (0,5)

CREATE INDEX nome_pac_i ON PACIENTE (nomePaciente);

/***********************************************************************************************/

-- 3-Crie um Índice na tabela consulta, utilizando o campo data (0,5)

CREATE INDEX data_i ON CONSULTA (dataConsulta);

/***********************************************************************************************/

-- 4-Utilizando o operador BETWEEN mostre todas as consultas do dia 14/06/2021 ate 19/06/2021 (0,5)

SELECT * FROM CONSULTA
WHERE dataConsulta BETWEEN To_Date('2021-06-14', 'yyyy/mm/dd') AND To_Date('2021-06-19', 'yyyy/mm/dd');

/***********************************************************************************************/

-- 5-Utilizando o operador LIKE liste todos os cliente que tenham o sobrenome SILVA (0,5)

SELECT * FROM PACIENTE WHERE nomePaciente LIKE '%Silva%';


/***********************************************************************************************/

-- 6-Crie uma view com os dados das CONSULTAS agendadas trazendo os dados dos pacientes e dos médicos (1,0)

SELECT * FROM CONSULTA C LEFT JOIN MEDICO M ON C.codigoMed = M.codigoMedico LEFT JOIN PACIENTE P 
ON C.codigoPac = P.codigoPaciente;

/***********************************************************************************************/

-- 7-Transforme o modelo RELACIONAL acima em um modelo DOCUMENTAL NOSQL (2,0)
/* arquivo separado */




