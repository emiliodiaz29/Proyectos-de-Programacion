  /**
 * Class ContestadoraVaciaException
 * //
 * @author Diaz Santivañez Carlos Emilio
 * @version java version "19.0.1"
 * */    

    public class ContestadoraVaciaException extends Exception {

     /**Metodo constructor ContestadoraVaciaException(String mensaje)
     * Constructor que crea una nueva instancia de ContestadoraVaciaException 
     * con un error específico.
     * @param mensaje el mensaje de error.
     */
    public ContestadoraVaciaException(String mensaje) {
        super(mensaje);
    }
}
