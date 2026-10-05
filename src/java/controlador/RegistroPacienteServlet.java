package controlador;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelo.GestorPacientes;
import modelo.Paciente;

/**

* Servlet encargado de gestionar el registro de pacientes.
*
* @author USER
  */
  @WebServlet(name = "RegistroPacienteServlet", urlPatterns = {"/RegistroPacienteServlet"})
  public class RegistroPacienteServlet extends HttpServlet {

  // Gestor que almacena los pacientes registrados.
  private static final GestorPacientes gestor = new GestorPacientes();

  /**

  * Procesa las solicitudes HTTP.
  *
  * @param request solicitud HTTP
  * @param response respuesta HTTP
  * @throws jakarta.servlet.ServletException
  * @throws java.io.IOException
    */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

    // Codificación de los datos recibidos.
    request.setCharacterEncoding("UTF-8");

    // Obtener los datos del formulario.
    String nombre = request.getParameter("nombre");
    String apellido = request.getParameter("apellido");
    String documento = request.getParameter("documento");
    int edad = Integer.parseInt(request.getParameter("edad"));
    String telefono = request.getParameter("telefono");
    String correo = request.getParameter("correo");

    // Crear el paciente.
    Paciente paciente = new Paciente(
    nombre,
    apellido,
    documento,
    edad,
    telefono,
    correo
    );

    // Agregar el paciente.
    gestor.agregarPaciente(paciente);

    // Compartir el gestor con las páginas JSP.
    getServletContext().setAttribute("gestorPacientes", gestor);

    // Redirigir a la lista enviando un mensaje de confirmación.
    response.sendRedirect("listaPaciente.jsp?mensaje=registrado");
    }

  /**

  * Atiende las solicitudes GET.
  *
  * @param request solicitud HTTP
  * @param response respuesta HTTP
  * @throws jakarta.servlet.ServletException
  * @throws java.io.IOException
    */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

    processRequest(request, response);
    }

  /**

  * Atiende las solicitudes POST.
  *
  * @param request solicitud HTTP
  * @param response respuesta HTTP
  * @throws jakarta.servlet.ServletException
  * @throws java.io.IOException
    */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

    processRequest(request, response);
    }
    }
