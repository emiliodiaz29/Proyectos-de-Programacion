/**
 * Class Contestadora
 * //
 * @author Diaz Santivañez Carlos Emilio
 * @version java version "19.0.1"
 */
import java.io.*;
import java.util.List;

public class Contestadora {
    private static final int capmax = 10;
    private Mensaje[] mensajes;
    private int contadorMensajes;

    // Constructor de la clase Contestadora
    /**  Método constructor Contestadora ()
     * Un constructor que crea una instancia de la clase Contestadora
     * ademas de que inicializa el areglo de mensajes y su contador
     * */ 

    public Contestadora() {
        mensajes = new Mensaje[capmax];
        contadorMensajes = 0;
        cargarMensajesDesdeArchivo();
    }

    // Metodo para obtener los mensajes guardados
    public Mensaje[] obtenerMensajes() {
        return mensajes;
    }

    // Metodo para guardar un mensaje en la contestadora
    /** Metodo void guardarMensaje(Mensaje mensaje)
     * Metodo que guarda un mensaje en la contestadora.
     * @param mensaje lo que se quiere guardar en la contestadora.
     * @throws ContestadoraLlenaException la excepcion que se lanza en caso de que 
     * la contestadora está llena y no se pueden guardar mas mensajes.
     * */
    public void guardarMensaje(Mensaje mensaje) throws ContestadoraLlenaException {
        //indicamos que este método puede lanzar una excepción de tipo ContestadoraLlenaException
        if (contadorMensajes >= capmax) {
            throw new ContestadoraLlenaException("La contestadora está llena. No se pueden guardar más mensajes.");
        }
        //lo usamos para lanzar una excepcion de tipo ContestadoraLlenaException en caso de que 
        //la contestadora esté llena y no se puedan guardar más mensajes
        mensajes[contadorMensajes] = mensaje;
        contadorMensajes++;
        guardarMensajesEnArchivo();
    }

    // Metodo para leer un mensaje en una posición dada
      /** Metodo Mensaje leerMensaje(Int indice)
     * Metodo que lee y retorna el mensaje ubicado en la posición especificada
     * @param indice indica que mensaje se quiere leer
     * @return el mensaje que pedimos
     * @throws PosicionInvalidaException la excepcion que se lanza en caso de que 
     * el indice no sea valido.
     * */
    public Mensaje leerMensaje(int indice) throws PosicionInvalidaException {
        //indicamos que este método puede lanzar una excepción de tipo PosicionInvalidaException
        if (indice < 0 || indice >= contadorMensajes) {
            throw new PosicionInvalidaException("La posicion del mensaje es inválida.");
             //lo usamos para lanzar una excepcion de tipo PosicionInvalidaException en caso de que 
        //el indicesea invalido
        }
        return mensajes[indice];
    }

    // Metodo para agregar un mensaje a la contestadora (utiliza guardarMensaje)
    /** Metodo void agregarMensaje (Mensaje mensaje)
     * Metodo que agrega un nuevo mensaje a la contestadora.
     * @param mensaje inidca el mensaje que queremos guardar
     * @throws ContestadoraLlenaExceptionla excepcion que se lanza en caso de que
     * la contestadora este llena y no se pueden guardar mas mensajes.
     * */
    public void agregarMensaje(Mensaje mensaje) throws ContestadoraLlenaException {
        guardarMensaje(mensaje);
    //mantenemos bajo control al ContestadoraLlenaException 
    }


    // Metodo para obtener un mensaje en una posición dada (utiliza leerMensaje)
     /** Metodo Mensaje obtenerMensaje (int indice)
     * Metodo que agrega devuelve el mensaje que le pedimos egun su inidce. 
     * @param indice inidca indice del mensaje que queremos
     * @return el mensaje segun el inidce
     * @throws PosicionInvalidaException la excepcion que se lanza en caso de que 
     * el indice no sea valido.
     */
    public Mensaje obtenerMensaje(int indice) throws PosicionInvalidaException {
        return leerMensaje(indice);
    }

    // Metodo para borrar un mensaje en una posición dada
    /**Metodo void borrarMensaje (int indice)
     * Metodo que borra un mensaje de la contestadora segun la
     * posición  que se indique.
     * @param indice indica la posición del mensaje que se quiere borrar.
     * @throws PosicionInvalidaException la excepcion que se lanza en caso de que 
     * la posición del mensaje sea inválida.
     * @throws MensajeInexistenteException la excepcion que se lanza en caso de que 
     * no haya mensajes para borrar.
     * */
    public void borrarMensaje(int indice) throws PosicionInvalidaException, MensajeInexistenteException {
         //indicamos que este método puede lanzar una excepción de tipo PosicionInvalidaException y MensajeInexistenteException
        if (indice < 0 || indice >= contadorMensajes) {
            throw new PosicionInvalidaException("La posicion del mensaje es invalida.");
              //lo usamos para lanzar una excepcion de tipo PosicionInvalidaException en caso de que 
        //el indice sea invalido
        }

        if (contadorMensajes == 0) {
            throw new MensajeInexistenteException("No hay mensajes para borrar.");
        }
        //lo usamos en caso de que no exista tal mensaje. 

        for (int i = indice; i < contadorMensajes - 1; i++) {
            mensajes[i] = mensajes[i + 1];
        }

        contadorMensajes--;
        mensajes[contadorMensajes] = null;

        guardarMensajesEnArchivo();
        //este metodo permite borrar un mensaje de la contestadora en x posición, mientras
        // lanza excepciones en caso de que la posición sea inválida o no haya mensajes para borrar
    }

    // Metodo para vaciar la contestadora (borrar todos los mensajes)
    /**Metodo void vaciarContestadora ()
     * Metodo que vacía la contestadora.
     * @throws ContestadoraVaciaException la excepcion que se lanza en caso de que
     * la contestadora ya este vacia.
     * */
    public void vaciarContestadora() throws ContestadoraVaciaException {
        if (contadorMensajes == 0) {
            throw new ContestadoraVaciaException("La contestadora ya esta vacía.");
        }

        contadorMensajes = 0;
        mensajes = new Mensaje[capmax];

        guardarMensajesEnArchivo();
    //este metodo nos deja vaciar la contestadora borrando todos los mensajes
    //ademas lanza una excepción en caso de que la contestadora ya esté vacía.
    }
    // Metodo para obtener la información de la contestadora (los mensajes guardados)
    /** Metodo String obtenerInformacionContestadora ()
     * Metodo que obtiene la información de la contestadora.
     * @return regresa la cadena de texto que representa la información de la contestadora.
     * */
    public String obtenerInformacionContestadora() {
    String informacion = "Contestadora:\n";

    if (contadorMensajes == 0) {
        informacion += "No hay mensajes guardados.\n";
    } else {
        for (int i = 0; i < contadorMensajes; i++) {
            informacion += "Mensaje " + (i + 1) + ":\n";
            informacion += mensajes[i].obtenerMensaje() + "\n";
        }
    }

    return informacion;
    // construimos una cadena que representa la información de la contestadora, 
    //estamos incluyendo los mensajes guardados 
}


    // Metodo privado para guardar los mensajes en un archivo
    /**Metodo void guardarMensajesEnArchivo ()
     * Metodo que guarda los mensajes de la contestadora en un archivo csv.
     * Es capaz de almacenar los mensajes de la contestadora en un archivo 
     * mediante un ObjectOutputStream.
     * */
    private void guardarMensajesEnArchivo() {
        try {
            ObjectOutputStream file = new ObjectOutputStream(new FileOutputStream("mensajesContestadora.csv"));
            file.writeObject(mensajes);
            file.writeInt(contadorMensajes);
            file.close();
        } catch (IOException e) {
            System.out.println("Error al guardar los mensajes en el archivo.");
        }
        //este metodo  se encarga de almacenar los mensajes de la contestadora en un archivo mediante un ObjectOutputStream.
    }

    // Metodo privado para cargar los mensajes desde un archivo
    /** Metodo void cargarMensajesDesdeArchivo()
     * Metodo que se encarga de cargar los mensajes de la contestadora desde un archivo.
     * */
    private void cargarMensajesDesdeArchivo() {
        try {
            ObjectInputStream ois = new ObjectInputStream(new FileInputStream("mensajesContestadora.csv"));
            mensajes = (Mensaje[]) ois.readObject();
            contadorMensajes = ois.readInt();
            ois.close();
        } catch (IOException | ClassNotFoundException e) {
            System.out.println("No se pudo cargar los mensajes desde el archivo.");
        }
    }
//este método  lo usamos para cargar los mensajes previamente guardados desde el archivo "mensajesContestadora.txt
}//Termina Contestadora
