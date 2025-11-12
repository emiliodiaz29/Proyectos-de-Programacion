  /**
 * Class PosicionInvalidaException
 * //
 * @author Diaz Santivañez Carlos Emilio
 * @version java version "19.0.1"
 * */
 
    public class PosicionInvalidaException extends Exception {

     /**Metodo constructor PosicionInvalidaException(String mensaje)
     * Constructor que crea una nueva instancia de PosicionInvalidaException 
     * con un error específico.
     * @param mensaje el mensaje de error.
     */
    public PosicionInvalidaException(String mensaje) {
        super(mensaje);
    }
}
