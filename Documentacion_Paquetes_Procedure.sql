-- 			Parametros insert
-- apellido
-- id
-- password
-- session
-- login
-- nombre
CALL T_USUARIO_TAPI.ins('APELLIDO',1,'PASSWORD','SESSION','LOGIN','NOMBRE');
/
CALL T_USUARIO_TAPI.ins('APELLIDO',2,'PASSWORD','SESSION','LOGIN','NOMBRE');
/
CALL T_USUARIO_TAPI.ins('APELLIDO',3,'PASSWORD','SESSION','LOGIN','NOMBRE');
/

-- 			Parametros update
-- apellido
-- id
-- password
-- session
-- login
-- nombre
CALL T_USUARIO_TAPI.UPD('APELLIDO UPDATE',2,'PASSWORD','SESSION','LOGIN','NOMBRE')
/

-- 			Parametros delete
-- id
CALL T_USUARIO_TAPI.DEL(3);
/


