/**
 * Class Mensaje
 * //
 * @author Diaz Santivañez Carlos Emilio
 * @version java version "19.0.1"
 */
public class Mensaje {

    private String cuerpo;
    private String emisor;
    private String nombreMensaje;

    /**  Método constructor Mensaje (String cuerpo, String emisor, String nombreMensaje)
     * Un constructor que inicializa los atributos con 
     * los parametros de entrada que recibe el metodo.
     * @param cuerpo varaible String que recibe el cuerpo del mensaje
     * @param emisor variable String que recibe el nombre del emisor del mensaje
     * @param nombreMensaje variable String que recibe el nombre de como se llama el mensaje
    * */ 
    // Constructor 
    public Mensaje (String cuerpo, String emisor, String nombreMensaje) {
        this.cuerpo = cuerpo;
        this.emisor = emisor;
        this.nombreMensaje = nombreMensaje;
    }
    //Metodos de acceso
    /**  Método obtenerCuerpo()
    * Un metodo que devuelve lo que exista en la variable cuerpo.
    * @return String
    * regresa un String que representa lo que hay en la variable cuerpo. 
    * */  
    public String obtenerCuerpo() {
        String cuerpo= this.cuerpo;
        return cuerpo;
    }

    /**  Método obtenerEmisor()
    * Un metodo que devuelve lo que exista en la variable emisor.
    * @return String
    * regresa un String que representa lo que hay en la variable emisor. 
    * */  
    public String obtenerEmisor() {
        String emisor= this.emisor;
        return emisor;
    }
    
    /**  Método obtenerNombreMensaje()
    * Un metodo que devuelve lo que exista en la variable nombreMensaje.
    * @return String
    * regresa un String que representa lo que hay en la variable nombreMensaje. 
    * */  
    public String obtenerNombreMensaje() {
        String nombreMensaje= this.nombreMensaje;
        return nombreMensaje;
    }
    //Metodo para la cadena
    /**  Método obtenerMensaje()
    * Un metodo que devuelve en forma de cadena el mensaje.
    * @return String
    * regresa un String que representa el mensaje que se emite. 
    * */  
    public String obtenerMensaje() {
        String cadena = "De: " + emisor + "\n" +
                "Nombre: " + nombreMensaje + "\n" +
                "Cuerpo: " + cuerpo;
        return cadena;
                
    }
}//Termina Mensaje
