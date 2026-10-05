package controlador;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelo.GestorPacientes;

/**
 * Servlet encargado de eliminar pacientes.
 *
 * @author USER
 */
@WebServlet(name = "EliminarPacienteServlet", urlPatterns = {"/EliminarPacienteServlet"})
public class EliminarPacienteServlet extends HttpServlet {

    /**
     * Procesa la eliminación del paciente.
     * @param request
     * @param response
     * @throws jakarta.servlet.ServletException
     * @throws java.io.IOException
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtener el documento enviado desde la página.
        String documento = request.getParameter("documento");

        // Obtener el gestor que contiene los pacientes.
        GestorPacientes gestor =
                (GestorPacientes) getServletContext()
                        .getAttribute("gestorPacientes");

        // Eliminar el paciente.
        if (gestor != null && documento != null) {
            gestor.eliminarPaciente(documento);
        }

        // Regresar a la lista de pacientes.
        response.sendRedirect("listaPaciente.jsp");
    }
}