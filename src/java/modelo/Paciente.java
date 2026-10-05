package modelo;

/**
 * Representa la información de un paciente del sistema.
 *
 * @author USER
 */
public class Paciente {

    // Atributos del paciente.
    private String nombre;
    private String apellido;
    private String documento;
    private int edad;
    private String telefono;
    private String correo;

    /**
     * Constructor de la clase Paciente.
     *
     * @param nombre nombre del paciente
     * @param apellido apellido del paciente
     * @param documento documento de identidad
     * @param edad edad del paciente
     * @param telefono teléfono del paciente
     * @param correo correo electrónico del paciente
     */
    public Paciente(String nombre, String apellido, String documento,
                    int edad, String telefono, String correo) {

        this.nombre = nombre;
        this.apellido = apellido;
        this.documento = documento;
        this.edad = edad;
        this.telefono = telefono;
        this.correo = correo;
    }

    // Métodos para obtener los datos.

    public String getNombre() {
        return nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public String getDocumento() {
        return documento;
    }

    public int getEdad() {
        return edad;
    }

    public String getTelefono() {
        return telefono;
    }

    public String getCorreo() {
        return correo;
    }

    // Métodos para modificar los datos.

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public void setDocumento(String documento) {
        this.documento = documento;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }
}