
package paquetexml;
import xmlmo.ClsGeneDom;

public class GeneDom {
    
	public static void main(String[] args) {
            ClsGeneDom parse = new ClsGeneDom();
            
            //opcion = false, es insertar
            parse.setInsUpd("C:\\Users\\usera\\Documents\\NetBeansProjects\\evaluacion\\build\\classes\\paquetexml\\archivoxml.xml",
            false);

            //opcion = false, es insertar
            parse.setInsUpd("C:\\Users\\usera\\Documents\\NetBeansProjects\\evaluacion\\build\\classes\\paquetexml\\archivoxml.xml",
            true);      
            
            parse.setDel("C:\\Users\\usera\\Documents\\NetBeansProjects\\evaluacion\\build\\classes\\paquetexml\\archivoxml.xml");
            
        }
    
}

