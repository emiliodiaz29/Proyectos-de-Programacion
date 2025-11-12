    public class PruebaContestadora {
    public static void main(String[] args) {
    Contestadora contestadora = new Contestadora();
    //creamos un nuevo objeto de la calse contestadora.
        try {
            
            contestadora.agregarMensaje(new Mensaje("Hola 1", "A quien la llega 1", "Mensaje 1"));
            contestadora.agregarMensaje(new Mensaje("Hola 2", "A quien la llega 2", "Mensaje 2"));
            contestadora.agregarMensaje(new Mensaje("Hola 3", "A quien la llega 3", "Mensaje 3"));
            contestadora.agregarMensaje(new Mensaje("Hola 4", "A quien la llega 4", "Mensaje 4"));
            contestadora.agregarMensaje(new Mensaje("Hola 5", "A quien la llega 5", "Mensaje 5"));
            contestadora.agregarMensaje(new Mensaje("Hola 6", "A quien la llega 6", "Mensaje 6"));
            contestadora.agregarMensaje(new Mensaje("Hola 7", "A quien la llega 7", "Mensaje 7"));
            contestadora.agregarMensaje(new Mensaje("Hola 8", "A quien la llega 8", "Mensaje 8"));
            contestadora.agregarMensaje(new Mensaje("Hola 9", "A quien la llega 9", "Mensaje 9"));
            contestadora.agregarMensaje(new Mensaje("Hola 10", "A quien la llega 10", "Mensaje 10"));

            // queremos meter otro mensaje cuando la contestadora ya se lleno

            contestadora.agregarMensaje(new Mensaje("Hola 11", "A quien la llega 11", "Mensaje 11"));
        } catch (ContestadoraLlenaException e) {
            System.out.println("Error: " + e.getMessage());
        }

        try {
            //para leer los mensajes
            Mensaje mensaje1 = contestadora.obtenerMensaje(0);
            System.out.println("Mensaje 1: " + mensaje1.obtenerMensaje());

            Mensaje mensaje5 = contestadora.obtenerMensaje(4);
            System.out.println("Mensaje 5: " + mensaje5.obtenerMensaje());

            // Intentar leer un mensaje en una posición inválida
            Mensaje mensajeInvalido = contestadora.obtenerMensaje(10);
            System.out.println("Mensaje Invalido: " + mensajeInvalido.obtenerMensaje());
        } catch (PosicionInvalidaException e) {
            System.out.println("Error, esa posicion no existe " + e.getMessage());
        }

        try {
          //para borrar los mensajes especificos
            contestadora.borrarMensaje(2);
            contestadora.borrarMensaje(4);

           //intentamos borrar un mensaje en una posicion que no existe 
            contestadora.borrarMensaje(10);
        } catch (PosicionInvalidaException e) {
            System.out.println("Error, esa posicion no existe " + e.getMessage());
        } catch (MensajeInexistenteException e) {
            System.out.println("Error, ese mensaje no existe " + e.getMessage());
        }

        try {
           //vaciamos la constentadora
            contestadora.vaciarContestadora();
        } catch (ContestadoraVaciaException e) {
            System.out.println("Error, la contestadora ya esta vacia " + e.getMessage());
        }

        //sacamos la info de la contestadora
        System.out.println(contestadora.obtenerInformacionContestadora());
    }
}
