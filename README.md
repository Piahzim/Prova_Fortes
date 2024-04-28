CRIAÇÃO DE TABELAS E BANCO DE DADOS

CREATE DATABASE "Fortes2"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
	

CREATE TABLE ABASTECIMENTO(
        COD_ABASTECIMENTO              SERIAL PRIMARY KEY,
        DATA_COMPRA                    TIMESTAMP NOT NULL,
	Hora_compra                    TIME NOT NULL,
        cod_TANQUE                     integer NOT NULL,
        cod_BOMBA                      integer NOT NULL,
        VLR_ABASTECIMENTO              NUMERIC(14, 2) NOT NULL,
        VLR_IMPOSTO                    NUMERIC(14, 2) NOT NULL)
		
CREATE TABLE TIPO_COMBUSTIVEL(
        COD_COMBUSTIVEL                     SERIAL PRIMARY KEY,
        TIPO_TANQUE                    VARCHAR(60))
		
CREATE TABLE tanque(
        COD_TANQUE                  SERIAL PRIMARY KEY,
        COD_TIPO_COMBUSTIVEL        integer NOT NULL)
		
CREATE TABLE bomba(
        COD_bomba                 SERIAL PRIMARY KEY,
        COD_tanque                integer NOT NULL)

		
ALTER TABLE ABASTECIMENTO
  ADD  CONSTRAINT fk_TANQUE_ABASTECIMENTO FOREIGN KEY (cod_TANQUE)
  REFERENCES TANQUE ( cod_TANQUE ) 

ALTER TABLE ABASTECIMENTO
  ADD  CONSTRAINT fk_bomba_ABASTECIMENTO FOREIGN KEY (cod_BOMBA)
  REFERENCES bomba ( cod_BOMBA ) 
  
ALTER TABLE tanque
  ADD  CONSTRAINT fk_Tipo_COMBUSTIVEL_Tanque FOREIGN KEY (COD_TIPO_COMBUSTIVEL)
  REFERENCES TIPO_COMBUSTIVEL ( COD_COMBUSTIVEL ) 

ALTER TABLE bomba
  ADD  CONSTRAINT fk_Tipo_tanque_bomba FOREIGN KEY (COD_tanque)
  REFERENCES tanque ( COD_TANQUE ) 
  
 
  

INSERT INTO TIPO_COMBUSTIVEL (TIPO_TANQUE) VALUES ('Gasolina'),('Diesel')

INSERT INTO tanque (COD_TIPO_COMBUSTIVEL) VAlues (1),(2)

INSERT INTO bomba (COD_tanque) VAlues (1),(1),(2),(2)
