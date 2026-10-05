package controlador;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelo.GestorPacientes;
import modelo.Paciente;

@WebServlet("/ActualizarPacienteServlet")
public class ActualizarPacienteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String documentoOriginal = request.getParameter("documentoOriginal");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String documento = request.getParameter("documento");
        String edadTexto = request.getParameter("edad");
        String telefono = request.getParameter("telefono");
        String correo = request.getParameter("correo");

        int edad = Integer.parseInt(edadTexto);

        GestorPacientes gestor =
                (GestorPacientes) getServletContext()
                        .getAttribute("gestorPacientes");

        Paciente paciente = gestor.buscarPorDocumento(documentoOriginal);

        if (paciente != null) {

            paciente.setNombre(nombre);
            paciente.setApellido(apellido);
            paciente.setDocumento(documento);
            paciente.setEdad(edad);
            paciente.setTelefono(telefono);
            paciente.setCorreo(correo);

        }

        response.sendRedirect("listaPaciente.jsp");
    }
}