package modelo;

import java.util.ArrayList;
import java.util.List;

/**
 * Gestiona los pacientes registrados en el sistema.
 *
 * @author USER
 */
public class GestorPacientes {

    // Lista donde se almacenan los pacientes.
    private final List<Paciente> pacientes;

    /**
     * Constructor del gestor de pacientes.
     */
    public GestorPacientes() {
        pacientes = new ArrayList<>();
    }

    /**
     * Agrega un paciente a la lista.
     *
     * @param paciente paciente que se desea registrar
     */
    public void agregarPaciente(Paciente paciente) {
        pacientes.add(paciente);
    }

    /**
     * Obtiene la lista de pacientes registrados.
     *
     * @return lista de pacientes
     */
    public List<Paciente> obtenerPacientes() {
        return pacientes;
    }

    /**
     * Elimina un paciente utilizando su número de documento.
     *
     * @param documento documento del paciente que se desea eliminar
     */
    public void eliminarPaciente(String documento) {

        pacientes.removeIf(paciente ->
                paciente.getDocumento().equals(documento)
        );
    }

    /**
     * Busca un paciente utilizando su número de documento.
     *
     * @param documento documento del paciente que se desea buscar
     * @return paciente encontrado o null si no existe
     */
    public Paciente buscarPorDocumento(String documento) {

        for (Paciente paciente : pacientes) {

            if (paciente.getDocumento().equals(documento)) {
                return paciente;
            }
        }

        return null;
    }
}