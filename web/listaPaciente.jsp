<%@page import="modelo.GestorPacientes"%>
<%@page import="modelo.Paciente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
        <title>Lista de Pacientes</title>


    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f0f4f8;
            color: #333;
        }

        .contenedor {
            width: 95%;
            max-width: 1200px;
            margin: 40px auto;
        }

        .encabezado {
            background: #1976d2;
            color: white;
            padding: 25px;
            border-radius: 12px 12px 0 0;
        }

        .encabezado h1 {
            margin: 0;
            font-size: 30px;
        }

        .encabezado p {
            margin: 8px 0 0;
            font-size: 15px;
        }

        .contenido {
            background: white;
            padding: 25px;
            border-radius: 0 0 12px 12px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.10);
        }

        /* Mensaje de confirmación */

        .mensaje-exito {
            background: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
            padding: 15px;
            border-radius: 7px;
            margin-bottom: 20px;
            font-weight: bold;
            animation: aparecer 0.4s ease;
        }

        @keyframes aparecer {

            from {
                opacity: 0;
                transform: translateY(-5px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .tabla-contenedor {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        th {
            background: #1565c0;
            color: white;
            padding: 14px 10px;
            text-align: left;
        }

        td {
            padding: 13px 10px;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background: #f5f9fd;
        }

        .acciones {
            white-space: nowrap;
        }

        .btn {
            display: inline-block;
            padding: 8px 13px;
            border-radius: 6px;
            text-decoration: none;
            color: white;
            font-size: 14px;
            margin-right: 5px;
            transition: 0.2s;
        }

        .btn:hover {
            transform: translateY(-1px);
        }

        .editar {
            background: #f39c12;
        }

        .editar:hover {
            background: #d68910;
        }

        .eliminar {
            background: #e74c3c;
        }

        .eliminar:hover {
            background: #c0392b;
        }

        .btn-registrar {
            display: inline-block;
            margin-top: 25px;
            padding: 12px 20px;
            background: #27ae60;
            color: white;
            text-decoration: none;
            border-radius: 7px;
            font-weight: bold;
            transition: 0.2s;
        }

        .btn-registrar:hover {
            background: #219150;
            transform: translateY(-1px);
        }

        .btn-inicio {
            display: inline-block;
            margin-top: 25px;
            margin-left: 8px;
            padding: 12px 20px;
            background: #6c757d;
            color: white;
            text-decoration: none;
            border-radius: 7px;
            font-weight: bold;
            transition: 0.2s;
        }

        .btn-inicio:hover {
            background: #545b62;
        }

        .sin-pacientes {
            background: #fff3cd;
            color: #856404;
            border: 1px solid #ffeeba;
            padding: 15px;
            border-radius: 7px;
            margin-bottom: 10px;
        }

        /* Adaptación para celulares */

        @media (max-width: 700px) {

            .contenedor {
                width: 98%;
                margin: 20px auto;
            }

            .encabezado h1 {
                font-size: 24px;
            }

            .contenido {
                padding: 15px;
            }

            .btn-registrar,
            .btn-inicio {
                display: block;
                width: 100%;
                margin-left: 0;
                text-align: center;
            }

            .btn-inicio {
                margin-top: 10px;
            }
        }

    </style>

</head>

<body>

    <div class="contenedor">

        <div class="encabezado">

            <h1>Gestión de Pacientes</h1>

            <p>
                Lista de pacientes registrados en el sistema
            </p>

        </div>

        <div class="contenido">

            <%
                /*
                 * Obtener el mensaje enviado por el Servlet.
                 */
                String mensaje =
                        request.getParameter("mensaje");
            %>

            <% if ("registrado".equals(mensaje)) { %>

                <div class="mensaje-exito">
                    ✓ Paciente registrado correctamente.
                </div>

            <% } %>


            <%
                /*
                 * Obtener el gestor de pacientes.
                 */
                GestorPacientes gestor =
                        (GestorPacientes)
                        application.getAttribute("gestorPacientes");
            %>


            <% if (gestor != null
                    && !gestor.obtenerPacientes().isEmpty()) { %>


                <div class="tabla-contenedor">

                    <table>

                        <tr>

                            <th>Nombre</th>

                            <th>Apellido</th>

                            <th>Documento</th>

                            <th>Edad</th>

                            <th>Teléfono</th>

                            <th>Correo</th>

                            <th>Acciones</th>

                        </tr>


                        <%

                            for (Paciente paciente :
                                    gestor.obtenerPacientes()) {

                        %>


                        <tr>

                            <td>
                                <%= paciente.getNombre() %>
                            </td>

                            <td>
                                <%= paciente.getApellido() %>
                            </td>

                            <td>
                                <%= paciente.getDocumento() %>
                            </td>

                            <td>
                                <%= paciente.getEdad() %>
                            </td>

                            <td>
                                <%= paciente.getTelefono() %>
                            </td>

                            <td>
                                <%= paciente.getCorreo() %>
                            </td>


                            <td class="acciones">

                                <a class="btn editar"
                                   href="EditarPacienteServlet?documento=<%= paciente.getDocumento() %>">

                                    Editar

                                </a>


                                <a class="btn eliminar"
                                   href="EliminarPacienteServlet?documento=<%= paciente.getDocumento() %>"
                                   onclick="return confirm('¿Está seguro de eliminar este paciente?');">

                                    Eliminar

                                </a>

                            </td>

                        </tr>


                        <%

                            }

                        %>

                    </table>

                </div>


            <% } else { %>


                <div class="sin-pacientes">

                    No hay pacientes registrados actualmente.

                </div>


            <% } %>


            <div>

                <a class="btn-registrar"
                   href="registroPaciente.jsp">

                    + Registrar paciente

                </a>


                <a class="btn-inicio"
                   href="index.html">

                    ← Volver al inicio

                </a>

            </div>

        </div>

    </div>

</body>


</html>
