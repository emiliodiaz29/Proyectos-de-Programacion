  /**
 * Class MensajeInexistenteException
 * //
 * @author Diaz Santivañez Carlos Emilio
 * @version java version "19.0.1"
 * */

    public class MensajeInexistenteException extends Exception {

     /**Metodo constructor MensajeInexistenteException(String mensaje)
     * Constructor que crea una nueva instancia de MensajeInexistenteException 
     * con un error específico.
     * @param mensaje el mensaje de error.
     */
    public MensajeInexistenteException(String mensaje) {
        super(mensaje);
    }
}
