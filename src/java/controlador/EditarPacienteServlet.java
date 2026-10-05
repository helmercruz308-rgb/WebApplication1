package controlador;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelo.GestorPacientes;
import modelo.Paciente;

@WebServlet("/EditarPacienteServlet")
public class EditarPacienteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String documento = request.getParameter("documento");

        GestorPacientes gestor =
                (GestorPacientes) getServletContext()
                        .getAttribute("gestorPacientes");

        Paciente paciente = gestor.buscarPorDocumento(documento);

        if (paciente != null) {
            request.setAttribute("paciente", paciente);

            request.getRequestDispatcher("/editarPaciente.jsp")
                    .forward(request, response);
        } else {
            response.sendRedirect("listaPaciente.jsp");
        }
    }
}