public class PruebaMensaje {
    public static void main(String[] args) {

        Mensaje mensaje = new Mensaje("Que onda!, Bienvenido", "Wilfrido", "Bienvenida");

     
        System.out.println("Emisor: " + mensaje.obtenerEmisor());
        System.out.println("Nombre: " + mensaje.obtenerNombreMensaje());
        System.out.println("Cuerpo: " + mensaje.obtenerCuerpo());
       

        System.out.println("\nMensaje:");
        System.out.println(mensaje.obtenerMensaje());
  
    }
}
