
package xmlmo;
import java.io.File;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import Conexion.CrudDb;

public class ClsGeneDom   {
    public ClsGeneDom ()
    {
    }
        
        //opcion = false, es insertar
        //opcion = true, es actualizar
	public void setInsUpd(String nombreArchivo, boolean opcion) {
		try {
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			DocumentBuilder db = dbf.newDocumentBuilder();
			File file = new File(nombreArchivo).getAbsoluteFile();
			if (file.exists()) {
				Document doc = db.parse(file);
				Element docEle = doc.getDocumentElement();
				System.out.println("Root=>>"+ docEle.getNodeName());
                                
                                // a los nodos
				NodeList Usuario = docEle.getElementsByTagName("usuario");

				System.out.println("Total de items: " + Usuario.getLength());
                                
                                //recorer nodo
				if (Usuario != null && Usuario.getLength() > 0) {
					for (int i = 0; i < Usuario.getLength(); i++) {

						Node node = Usuario.item(i);

						if (node.getNodeType() == Node.ELEMENT_NODE) {

							Element e = (Element) node;
							NodeList nodeList = e.getElementsByTagName("id");
							String id = nodeList.item(0).getChildNodes().item(0).getNodeValue();

							nodeList = e.getElementsByTagName("nombre");
							String nombre = nodeList.item(0).getChildNodes().item(0).getNodeValue();

							nodeList = e.getElementsByTagName("apellido");
							String apellido = nodeList.item(0).getChildNodes().item(0).getNodeValue();
                                                        
                                                        nodeList = e.getElementsByTagName("login");
							String login = nodeList.item(0).getChildNodes().item(0).getNodeValue();
                                                        
                                                        nodeList = e.getElementsByTagName("password");
							String password = nodeList.item(0).getChildNodes().item(0).getNodeValue();
                                                        
                                                        nodeList = e.getElementsByTagName("sessionid");
							String sessionid = nodeList.item(0).getChildNodes().item(0).getNodeValue();
                                                        
                                                        if(opcion  == false){
                                                        System.out.println("Ins");
                                                        
                                                        CrudDb insertcls = new CrudDb();
                                                        insertcls.ins(id, nombre, apellido, login, password, sessionid);
                                                        }
                                                        
                                                        if(opcion  == true){
                                                         System.out.println("upd");
                                                          CrudDb insertcls = new CrudDb();
                                                         insertcls.upd(id, nombre, apellido, login, password, sessionid);
                                                        }
						}
					}
				} else {
					System.exit(1);
				}
			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}
   
        
      public void setDel(String nombreArchivo) {
		try {
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			DocumentBuilder db = dbf.newDocumentBuilder();
			File file = new File(nombreArchivo);
			if (file.exists()) {
				Document doc = db.parse(file);
				Element docEle = doc.getDocumentElement();
				docEle.getNodeName();
                                
                                // a los nodos
				NodeList Usuario = docEle.getElementsByTagName("usuario");
                            
                                //recorer nodo
				if (Usuario != null && Usuario.getLength() > 0) {
					for (int i = 0; i < Usuario.getLength(); i++) {

						Node node = Usuario.item(i);

						if (node.getNodeType() == Node.ELEMENT_NODE) {

							Element e = (Element) node;
							NodeList nodeList = e.getElementsByTagName("id");
							String elimi = nodeList.item(0).getChildNodes().item(0).getNodeValue();
                                                        CrudDb elimCls = new CrudDb();
                                                        elimCls.del(elimi);
                                                        System.out.println("Del");
						}
					}
				} else {
					System.exit(1);
				}
			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}
      

}

