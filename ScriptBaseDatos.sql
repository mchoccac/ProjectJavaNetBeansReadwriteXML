--------------------------------------------------------
-- Archivo creado  - jueves-abril-25-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence ALUMNOS1_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PRUEBA"."ALUMNOS1_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE   ;
--------------------------------------------------------
--  DDL for Sequence CAMPOSXML_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PRUEBA"."CAMPOSXML_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE   ;
--------------------------------------------------------
--  DDL for Sequence SEQUENCE_USUARIO
--------------------------------------------------------

   CREATE SEQUENCE  "PRUEBA"."SEQUENCE_USUARIO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 23 CACHE 20 NOORDER  NOCYCLE   ;
--------------------------------------------------------
--  DDL for Sequence TAB_ALUMNO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PRUEBA"."TAB_ALUMNO_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE   ;
--------------------------------------------------------
--  DDL for Table T_USUARIO
--------------------------------------------------------

  CREATE TABLE "PRUEBA"."T_USUARIO" 
   (	"ID_USUARIO" NUMBER(*,0), 
	"NOMBRE" VARCHAR2(50 BYTE), 
	"APELLIDO" VARCHAR2(50 BYTE), 
	"LOGIN" VARCHAR2(50 BYTE), 
	"PASSWORD" VARCHAR2(50 BYTE), 
	"SESIONID" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into PRUEBA.T_USUARIO
SET DEFINE OFF;
Insert into PRUEBA.T_USUARIO (ID_USUARIO,NOMBRE,APELLIDO,LOGIN,PASSWORD,SESIONID) values (1,'Juanxxxx','Perez','juan','p1234','HT3435DGVFG');
Insert into PRUEBA.T_USUARIO (ID_USUARIO,NOMBRE,APELLIDO,LOGIN,PASSWORD,SESIONID) values (2,'Ernestossss','Lopez','lopez','edfvd','ML3895DGVTY');
Insert into PRUEBA.T_USUARIO (ID_USUARIO,NOMBRE,APELLIDO,LOGIN,PASSWORD,SESIONID) values (3,'Juliowwwww','Sorto','Sorto','edfvd','ML5825DGPQY');
--------------------------------------------------------
--  DDL for Index PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PRUEBA"."PK" ON "PRUEBA"."T_USUARIO" ("ID_USUARIO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Procedure PRC_ACTUALIZA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRUEBA"."PRC_ACTUALIZA" (pidusu in INTEGER,pnombre in varchar2, papellido in varchar2, plogin in varchar2,
                                        ppass in varchar2,pidsession in varchar2) is
vidusu int := pidusu;
vnom char(20):= pnombre;
vape char(25):= papellido;
vlogin varchar2(10):=plogin;
vpass varchar2(10):= ppass;
vids varchar2(10):= pidsession;

begin
 update tbl_usuario set nombre=vnom,apellido=vape,login=vlogin,password=vpass,sessionid=vids
 where idusuario = vidusu;
 commit;
 end;

/
--------------------------------------------------------
--  DDL for Procedure PRC_CONSULTA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRUEBA"."PRC_CONSULTA" AS 
vnom varchar2(20);
vape varchar2(25);
vlogin varchar2(10);
vpass varchar2(10);
vids varchar2(20);
BEGIN
  select nombre,
         apellido,
         login,
         password,
         sessionid
into vnom,
        vape,
        vlogin,
        vpass,
        vids
         from tbl_usuario;
END PRC_CONSULTA;

/
--------------------------------------------------------
--  DDL for Procedure PRC_ELIMINA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRUEBA"."PRC_ELIMINA" (pidusu in INTEGER) is
vidusu int := pidusu;
begin
 delete from tbl_usuario
 where idusuario = vidusu;
 end;

/
--------------------------------------------------------
--  DDL for Procedure PRC_INSERTA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRUEBA"."PRC_INSERTA" (pnombre in varchar2, papellido in varchar2, plogin in varchar2,
                                        ppass in varchar2,pidsession in varchar2) is
vnom char(20):= pnombre;
vape char(25):= papellido;
vlogin varchar2(10):=plogin;
vpass varchar2(10):= ppass;
vids varchar2(10):= pidsession;

begin
 insert into tbl_usuario (idusuario,nombre,apellido,login,password,sessionid)
 values(sequence_usuario.NextVal,vnom,vape,vlogin,vpass,vids);
 end;

/
--------------------------------------------------------
--  DDL for Package T_USUARIO_TAPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "PRUEBA"."T_USUARIO_TAPI" 
is

type T_USUARIO_tapi_rec is record (
APELLIDO  T_USUARIO.APELLIDO%type
,ID_USUARIO  T_USUARIO.ID_USUARIO%type
,PASSWORD  T_USUARIO.PASSWORD%type
,SESIONID  T_USUARIO.SESIONID%type
,LOGIN  T_USUARIO.LOGIN%type
,NOMBRE  T_USUARIO.NOMBRE%type
);
type T_USUARIO_tapi_tab is table of T_USUARIO_tapi_rec;

-- insert
procedure ins (
p_APELLIDO in T_USUARIO.APELLIDO%type default null 
,p_ID_USUARIO in T_USUARIO.ID_USUARIO%type
,p_PASSWORD in T_USUARIO.PASSWORD%type default null 
,p_SESIONID in T_USUARIO.SESIONID%type default null 
,p_LOGIN in T_USUARIO.LOGIN%type default null 
,p_NOMBRE in T_USUARIO.NOMBRE%type default null 
);
-- update
procedure upd (
p_APELLIDO in T_USUARIO.APELLIDO%type default null 
,p_ID_USUARIO in T_USUARIO.ID_USUARIO%type
,p_PASSWORD in T_USUARIO.PASSWORD%type default null 
,p_SESIONID in T_USUARIO.SESIONID%type default null 
,p_LOGIN in T_USUARIO.LOGIN%type default null 
,p_NOMBRE in T_USUARIO.NOMBRE%type default null 
);
-- delete
procedure del (
p_ID_USUARIO in T_USUARIO.ID_USUARIO%type
);
end T_USUARIO_tapi;


/
--------------------------------------------------------
--  DDL for Package Body T_USUARIO_TAPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "PRUEBA"."T_USUARIO_TAPI" 
is
-- insert
procedure ins (
p_APELLIDO in T_USUARIO.APELLIDO%type default null 
,p_ID_USUARIO in T_USUARIO.ID_USUARIO%type
,p_PASSWORD in T_USUARIO.PASSWORD%type default null 
,p_SESIONID in T_USUARIO.SESIONID%type default null 
,p_LOGIN in T_USUARIO.LOGIN%type default null 
,p_NOMBRE in T_USUARIO.NOMBRE%type default null 
) is
begin
insert into T_USUARIO(
APELLIDO
,ID_USUARIO
,PASSWORD
,SESIONID
,LOGIN
,NOMBRE
) values (
p_APELLIDO
,p_ID_USUARIO
,p_PASSWORD
,p_SESIONID
,p_LOGIN
,p_NOMBRE
);end;
-- update
procedure upd (
p_APELLIDO in T_USUARIO.APELLIDO%type default null 
,p_ID_USUARIO in T_USUARIO.ID_USUARIO%type
,p_PASSWORD in T_USUARIO.PASSWORD%type default null 
,p_SESIONID in T_USUARIO.SESIONID%type default null 
,p_LOGIN in T_USUARIO.LOGIN%type default null 
,p_NOMBRE in T_USUARIO.NOMBRE%type default null 
) is
begin
update T_USUARIO set
APELLIDO = p_APELLIDO
,PASSWORD = p_PASSWORD
,SESIONID = p_SESIONID
,LOGIN = p_LOGIN
,NOMBRE = p_NOMBRE
where ID_USUARIO = p_ID_USUARIO;
end;
-- del
procedure del (
p_ID_USUARIO in T_USUARIO.ID_USUARIO%type
) is
begin
delete from T_USUARIO
where ID_USUARIO = p_ID_USUARIO;
end;
end T_USUARIO_tapi;

/
--------------------------------------------------------
--  Constraints for Table T_USUARIO
--------------------------------------------------------

  ALTER TABLE "PRUEBA"."T_USUARIO" ADD CONSTRAINT "PK" PRIMARY KEY ("ID_USUARIO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "PRUEBA"."T_USUARIO" MODIFY ("ID_USUARIO" NOT NULL ENABLE);
