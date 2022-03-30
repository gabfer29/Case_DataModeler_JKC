--GRUPO_N_JKC

/* PARTICIPANTES*/
--RM	      NOME	                                 E-MAIL
--RM92985	Bruno de Oliveira Soares Fonseca	   bruno_chimba@hotmail.com
--RM95764	Gustavo Ribeiro Ferreira	         gustavo.ferreirs@gmail.com
--RM94930	Carollina da Silva França	         carollinafran2@gmail.com
--RM94384	Gabriel Fernandes Silva	               gabriel12258@outlook.com
--RM95793	João Victor Maciel dos Santos	         victormaciel72@hotmail.com



-- Gerado por Oracle SQL Developer Data Modeler 21.4.1.349.1605
--   em:        2022-03-19 23:18:18 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE t_jck_estado (
    cd_estado NUMBER(2) NOT NULL,
    nm_estado VARCHAR2(50) NOT NULL,
    sg_estado VARCHAR2(2) NOT NULL
);

ALTER TABLE t_jck_estado ADD CONSTRAINT t_jck_estado_pk PRIMARY KEY ( cd_estado );

CREATE TABLE t_jck_tipo_lagradouro (
    cd_tipo_lagradouro NUMBER(6) NOT NULL,
    ds_tipo_lagradouro VARCHAR2(6)
);

ALTER TABLE t_jck_tipo_lagradouro ADD CONSTRAINT t_jck_tipo_lagradouro_pk PRIMARY KEY ( cd_tipo_lagradouro );

CREATE TABLE t_jkc_agenda (
    id_agenda          NUMBER(6) NOT NULL,
    cd_status_manut    NUMBER(6) NOT NULL,
    dt_visita          DATE NOT NULL,
    vl_visita          NUMBER(7, 2),
    vl_desconto        NUMBER(7, 2),
    ds_tipo_visita     VARCHAR2(50) NOT NULL,
    ds_resumida_visita VARCHAR2(4000) NOT NULL,-- Oracle Developer aceita até 4000, RN ESPECIFICA UM CAMPO GRANDE
    ds_laudo           VARCHAR2(4000) NOT NULL,-- Oracle Developer aceita até 4000, RN ESPECIFICA UM CAMPO GRANDE
    ds_status_visita   VARCHAR2(50) NOT NULL,
    dt_atendimento     DATE NOT NULL
);

ALTER TABLE t_jkc_agenda ADD CONSTRAINT t_jkc_agenda_pk PRIMARY KEY ( id_agenda,
                                                                      cd_status_manut );

CREATE TABLE t_jkc_atendimento (
    cd_atendimento NUMBER(6) NOT NULL,
    ds_local       VARCHAR2(150) NOT NULL,
    dt_atendimento DATE NOT NULL
);

ALTER TABLE t_jkc_atendimento ADD CONSTRAINT t_jkc_atendimento_pk PRIMARY KEY ( cd_atendimento );

CREATE TABLE t_jkc_automatizada (
    cd_status_automacao NUMBER(6) NOT NULL,
    ds_status_automacao VARCHAR2(20) NOT NULL,
    dt_automacao        DATE
);

ALTER TABLE t_jkc_automatizada ADD CONSTRAINT t_jkc_automatizada_pk PRIMARY KEY ( cd_status_automacao );

CREATE TABLE t_jkc_bairro (
    cd_bairro NUMBER(6) NOT NULL,
    cd_cidade NUMBER(6) NOT NULL,
    nm_bairro VARCHAR2(100) NOT NULL
);

ALTER TABLE t_jkc_bairro ADD CONSTRAINT t_jkc_bairro_pk PRIMARY KEY ( cd_bairro );

CREATE TABLE t_jkc_categoria_maquina (
    cd_categoria NUMBER(6) NOT NULL,
    nm_categoria VARCHAR2(30) NOT NULL
);

ALTER TABLE t_jkc_categoria_maquina ADD CONSTRAINT t_jkc_categoria_maquina_pk PRIMARY KEY ( cd_categoria );

CREATE TABLE t_jkc_cidade (
    cd_cidade NUMBER(6) NOT NULL,
    cd_estado NUMBER(2) NOT NULL,
    nm_cidade VARCHAR2(150) NOT NULL
);

ALTER TABLE t_jkc_cidade ADD CONSTRAINT t_jkc_cidade_pk PRIMARY KEY ( cd_cidade );

CREATE TABLE t_jkc_cliente (
    cd_cliente NUMBER(6) NOT NULL,
    nm_cliente VARCHAR2(100) NOT NULL
);

ALTER TABLE t_jkc_cliente ADD CONSTRAINT t_jkc_cliente_pk PRIMARY KEY ( cd_cliente );

CREATE TABLE t_jkc_email (
    cd_email             NUMBER(6) NOT NULL,
    cd_empresa           NUMBER(6) NOT NULL,
    cd_ramo_atuacao      NUMBER(6) NOT NULL,
    cd_potencial_cliente NUMBER(6) NOT NULL,
    cd_cliente           NUMBER(6) NOT NULL,
    ds_email             VARCHAR2(60) NOT NULL,
    ds_status_email      NUMBER(15) NOT NULL
);

ALTER TABLE t_jkc_email
    ADD CONSTRAINT t_jkc_email_pk PRIMARY KEY ( cd_email,
                                                cd_empresa,
                                                cd_ramo_atuacao,
                                                cd_potencial_cliente,
                                                cd_cliente );

CREATE TABLE t_jkc_empresa (
    cd_empresa           NUMBER(6) NOT NULL,
    cd_ramo_atuacao      NUMBER(6) NOT NULL,
    cd_potencial_cliente NUMBER(6) NOT NULL,
    cd_cliente           NUMBER(6) NOT NULL,
    nr_cnpj              NUMBER(25) NOT NULL,
    ds_razao_social      VARCHAR2(80) NOT NULL,
    ds_nome_fantasia     VARCHAR2(80) NOT NULL,
    dt_fundacao          DATE NOT NULL,
    ds_email             VARCHAR2(100) NOT NULL,
    ds_origem_contato    VARCHAR2(50) NOT NULL
);

ALTER TABLE t_jkc_empresa
    ADD CONSTRAINT t_jkc_empresa_pk PRIMARY KEY ( cd_empresa,
                                                  cd_ramo_atuacao,
                                                  cd_potencial_cliente,
                                                  cd_cliente );

CREATE TABLE t_jkc_empresa_proprietario (
    cd_proprietario      NUMBER(6) NOT NULL,
    cd_empresa           NUMBER(6) NOT NULL,
    cd_ramo_atuacao      NUMBER(6) NOT NULL,
    cd_potencial_cliente NUMBER(6) NOT NULL,
    cd_cliente           NUMBER(6) NOT NULL
);

ALTER TABLE t_jkc_empresa_proprietario
    ADD CONSTRAINT t_jkc_empresa_proprietario_pk PRIMARY KEY ( cd_proprietario,
                                                               cd_empresa,
                                                               cd_ramo_atuacao,
                                                               cd_potencial_cliente,
                                                               cd_cliente );

CREATE TABLE t_jkc_endereco (
    nr_cep               NUMBER(8) NOT NULL,
    cd_atendimento       NUMBER(6) NOT NULL,
    cd_tipo_lagradouro   NUMBER(6) NOT NULL,
    cd_bairro            NUMBER(6) NOT NULL,
    cd_empresa           NUMBER(6) NOT NULL,
    cd_ramo_atuacao      NUMBER(6) NOT NULL,
    cd_potencial_cliente NUMBER(6) NOT NULL,
    cd_cliente           NUMBER(6) NOT NULL,
    ds_lagradouro        VARCHAR2(200) NOT NULL
);

ALTER TABLE t_jkc_endereco
    ADD CONSTRAINT t_jkc_endereco_pk PRIMARY KEY ( nr_cep,
                                                   cd_empresa,
                                                   cd_ramo_atuacao,
                                                   cd_potencial_cliente,
                                                   cd_cliente );

CREATE TABLE t_jkc_equipamento_iot (
    cd_iot        NUMBER(6) NOT NULL,
    nr_serie      VARCHAR2(10) NOT NULL,
    nm_fornecedor VARCHAR2(80) NOT NULL,
    dt_instalacao DATE NOT NULL
);

ALTER TABLE t_jkc_equipamento_iot ADD CONSTRAINT t_jkc_equipamento_iot_pk PRIMARY KEY ( cd_iot );

CREATE TABLE t_jkc_maquina (
    cd_maquina          NUMBER(6) NOT NULL,
    cd_status_automacao NUMBER(6) NOT NULL,
    cd_categoria        NUMBER(6) NOT NULL,
    cd_iot              NUMBER(6) NOT NULL,
    cd_cliente          NUMBER(6) NOT NULL,
    nm_maquina          VARCHAR2(100) NOT NULL,
    ds_status_maquina   VARCHAR2(8) NOT NULL,
    cd_fabricante       NUMBER(6) NOT NULL,
    nm_fabricante       VARCHAR2(100) NOT NULL,
    cd_pais             NUMBER(3) NOT NULL,
    nm_pais             VARCHAR2(60) NOT NULL,
    ds_nome_modelo      VARCHAR2(100) NOT NULL,
    nm_serie            NUMBER(12),
    dt_fabricacao       DATE NOT NULL,
    ds_voltagem         VARCHAR2(60) NOT NULL,
    ds_categoria        VARCHAR2(100) NOT NULL
);

ALTER TABLE t_jkc_maquina
    ADD CONSTRAINT t_jkc_maquina_pk PRIMARY KEY ( cd_maquina,
                                                  cd_status_automacao,
                                                  cd_categoria,
                                                  cd_iot,
                                                  cd_cliente );

CREATE TABLE t_jkc_potencial_cliente (
    cd_potencial_cliente NUMBER(6) NOT NULL,
    nm_potencial_cliente VARCHAR2(100) NOT NULL
);

ALTER TABLE t_jkc_potencial_cliente ADD CONSTRAINT t_jkc_potencial_cliente_pk PRIMARY KEY ( cd_potencial_cliente );

CREATE TABLE t_jkc_proprietario (
    cd_proprietario NUMBER(6) NOT NULL,
    nm_proprietario VARCHAR2(80) NOT NULL,
    ds_apelido      VARCHAR2(30) NOT NULL,
    dt_nascimento   DATE NOT NULL,
    ds_genero       VARCHAR2(1) NOT NULL,
    ds_email        VARCHAR2(80) NOT NULL,
    cd_ddi          NUMBER(3),
    cd_ddd          NUMBER(3) NOT NULL,
    nr_numero       NUMBER(10) NOT NULL
);

ALTER TABLE t_jkc_proprietario ADD CONSTRAINT t_jkc_proprietario_pk PRIMARY KEY ( cd_proprietario );

CREATE TABLE t_jkc_ramo_atuacao (
    cd_ramo_atuacao NUMBER(6) NOT NULL,
    ds_ramo_atuacao VARCHAR2(100) NOT NULL
);

ALTER TABLE t_jkc_ramo_atuacao ADD CONSTRAINT t_jkc_ramo_atuacao_pk PRIMARY KEY ( cd_ramo_atuacao );

CREATE TABLE t_jkc_status_manutencao (
    cd_status_manut NUMBER(6) NOT NULL,
    ds_status_manut VARCHAR2(30) NOT NULL
);

ALTER TABLE t_jkc_status_manutencao ADD CONSTRAINT t_jkc_status_manutencao_pk PRIMARY KEY ( cd_status_manut );

CREATE TABLE t_jkc_telefones (
    cd_telefone_pj       NUMBER NOT NULL,
    cd_potencial_cliente NUMBER(6) NOT NULL,
    cd_cliente           NUMBER(6) NOT NULL,
    cd_empresa           NUMBER(6) NOT NULL,
    cd_ramo_atuacao      NUMBER(6) NOT NULL,
    ds_status_telefone   VARCHAR2(15),
    cd_ddi_pj            NUMBER(3),
    cd_ddd_pj            NUMBER(3) NOT NULL,
    nr_telefone_pj       NUMBER(10) NOT NULL
);

ALTER TABLE t_jkc_telefones
    ADD CONSTRAINT t_jkc_telefones_pk PRIMARY KEY ( cd_telefone_pj,
                                                    cd_empresa,
                                                    cd_ramo_atuacao,
                                                    cd_potencial_cliente,
                                                    cd_cliente );

CREATE TABLE t_jkc_visita (
    cd_visita               NUMBER(6) NOT NULL,
    cd_empresa              NUMBER(6) NOT NULL,
    cd_ramo_atuacao         NUMBER(6) NOT NULL,
    cd_potencial_cliente    NUMBER(6) NOT NULL,
    cd_cliente              NUMBER(6) NOT NULL,
    iid_agenda              NUMBER(6) NOT NULL,
    cd_status_manut         NUMBER(6) NOT NULL,
    dt_hora_agenda          DATE NOT NULL,
    dt_hora_atendimento     DATE NOT NULL,
    dt_hora_fim_atendimento DATE NOT NULL
);

ALTER TABLE t_jkc_visita ADD CONSTRAINT t_jkc_visita_pk PRIMARY KEY ( cd_visita );

ALTER TABLE t_jkc_endereco
    ADD CONSTRAINT atendimento_fk FOREIGN KEY ( cd_atendimento )
        REFERENCES t_jkc_atendimento ( cd_atendimento );

ALTER TABLE t_jkc_maquina
    ADD CONSTRAINT automatizada_fk FOREIGN KEY ( cd_status_automacao )
        REFERENCES t_jkc_automatizada ( cd_status_automacao );

ALTER TABLE t_jkc_endereco
    ADD CONSTRAINT bairro_fk FOREIGN KEY ( cd_bairro )
        REFERENCES t_jkc_bairro ( cd_bairro );

ALTER TABLE t_jkc_maquina
    ADD CONSTRAINT categoria_maquina_fk FOREIGN KEY ( cd_categoria )
        REFERENCES t_jkc_categoria_maquina ( cd_categoria );

ALTER TABLE t_jkc_agenda
    ADD CONSTRAINT cd_status_manut FOREIGN KEY ( cd_status_manut )
        REFERENCES t_jkc_status_manutencao ( cd_status_manut );

ALTER TABLE t_jkc_empresa
    ADD CONSTRAINT cliente_fk FOREIGN KEY ( cd_potencial_cliente )
        REFERENCES t_jkc_potencial_cliente ( cd_potencial_cliente );

ALTER TABLE t_jkc_maquina
    ADD CONSTRAINT cliente_fkv2 FOREIGN KEY ( cd_cliente )
        REFERENCES t_jkc_cliente ( cd_cliente );

ALTER TABLE t_jkc_endereco
    ADD CONSTRAINT empresa_fk FOREIGN KEY ( cd_empresa,
                                            cd_ramo_atuacao,
                                            cd_potencial_cliente,
                                            cd_cliente )
        REFERENCES t_jkc_empresa ( cd_empresa,
                                   cd_ramo_atuacao,
                                   cd_potencial_cliente,
                                   cd_cliente );

ALTER TABLE t_jkc_telefones
    ADD CONSTRAINT empresa_fkv2 FOREIGN KEY ( cd_empresa,
                                              cd_ramo_atuacao,
                                              cd_potencial_cliente,
                                              cd_cliente )
        REFERENCES t_jkc_empresa ( cd_empresa,
                                   cd_ramo_atuacao,
                                   cd_potencial_cliente,
                                   cd_cliente );

ALTER TABLE t_jkc_maquina
    ADD CONSTRAINT equipamento_iot_fk FOREIGN KEY ( cd_iot )
        REFERENCES t_jkc_equipamento_iot ( cd_iot );

ALTER TABLE t_jkc_empresa_proprietario
    ADD CONSTRAINT jkc_empresa_fk FOREIGN KEY ( cd_empresa,
                                                cd_ramo_atuacao,
                                                cd_potencial_cliente,
                                                cd_cliente )
        REFERENCES t_jkc_empresa ( cd_empresa,
                                   cd_ramo_atuacao,
                                   cd_potencial_cliente,
                                   cd_cliente );

ALTER TABLE t_jkc_empresa_proprietario
    ADD CONSTRAINT jkc_proprietario_fk FOREIGN KEY ( cd_proprietario )
        REFERENCES t_jkc_proprietario ( cd_proprietario );

ALTER TABLE t_jkc_empresa
    ADD CONSTRAINT ramo_atuacao_fk FOREIGN KEY ( cd_ramo_atuacao )
        REFERENCES t_jkc_ramo_atuacao ( cd_ramo_atuacao );

ALTER TABLE t_jkc_bairro
    ADD CONSTRAINT t_jkc_bairro_t_jkc_cidade_fk FOREIGN KEY ( cd_cidade )
        REFERENCES t_jkc_cidade ( cd_cidade );

ALTER TABLE t_jkc_cidade
    ADD CONSTRAINT t_jkc_cidade_t_jck_estado_fk FOREIGN KEY ( cd_estado )
        REFERENCES t_jck_estado ( cd_estado );

ALTER TABLE t_jkc_email
    ADD CONSTRAINT t_jkc_email_t_jkc_empresa_fk FOREIGN KEY ( cd_empresa,
                                                              cd_ramo_atuacao,
                                                              cd_potencial_cliente,
                                                              cd_cliente )
        REFERENCES t_jkc_empresa ( cd_empresa,
                                   cd_ramo_atuacao,
                                   cd_potencial_cliente,
                                   cd_cliente );

ALTER TABLE t_jkc_empresa
    ADD CONSTRAINT t_jkc_empresa_t_jkc_cliente_fk FOREIGN KEY ( cd_cliente )
        REFERENCES t_jkc_cliente ( cd_cliente );

ALTER TABLE t_jkc_visita
    ADD CONSTRAINT t_jkc_visita_t_jkc_agenda_fk FOREIGN KEY ( iid_agenda,
                                                              cd_status_manut )
        REFERENCES t_jkc_agenda ( id_agenda,
                                  cd_status_manut );

ALTER TABLE t_jkc_visita
    ADD CONSTRAINT t_jkc_visita_t_jkc_empresa_fk FOREIGN KEY ( cd_empresa,
                                                               cd_ramo_atuacao,
                                                               cd_potencial_cliente,
                                                               cd_cliente )
        REFERENCES t_jkc_empresa ( cd_empresa,
                                   cd_ramo_atuacao,
                                   cd_potencial_cliente,
                                   cd_cliente );

ALTER TABLE t_jkc_endereco
    ADD CONSTRAINT tipo_lagradouro_fk FOREIGN KEY ( cd_tipo_lagradouro )
        REFERENCES t_jck_tipo_lagradouro ( cd_tipo_lagradouro );



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            21
-- CREATE INDEX                             0
-- ALTER TABLE                             41
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
