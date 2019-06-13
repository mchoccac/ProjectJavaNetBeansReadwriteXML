================
Proyecto 1: evaluacion

insertar, update y delete
//opcion = false, es insertar
parse.setInsUpd("C:\\Users\\usera\\Documents\\NetBeansProjects\\evaluacion\\build\\classes\\paquetexml\\archivoxml.xml",
false);

//opcion = true, es update
parse.setInsUpd("C:\\Users\\usera\\Documents\\NetBeansProjects\\evaluacion\\build\\classes\\paquetexml\\archivoxml.xml",
true);      

//eliminar todo            
parse.setDel("C:\\Users\\usera\\Documents\\NetBeansProjects\\evaluacion\\build\\classes\\paquetexml\\archivoxml.xml");

================
Proyecto 2 Pagina Web: ProyectoLogin
El el archivo de xml se encuentra en 
\WEB-INF\classes\com\app\paquetexml\archivoxml.xml

el codigo LoginServlet.java hay que apuntar el archivo de archivoxml.xml
el metodo authenticationService.authenticate("C:\\Users\\usera\\Desktop\\ProyectoMynorChoc\\ProyectoLogin\\build\\web\\WEB-INF\\classes\\com\\app\\paquetexml\\archivoxml.xml",paramUsername, paramPassword)
esto es para validados en xml


===============
ojdbc7.jar para la coneccion de la base de datos

===============
para el xml se usa la librerias que incluye jdk estas son

import java.io.File;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
===============
