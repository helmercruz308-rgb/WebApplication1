```jsp
<%@page import="modelo.Paciente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Editar Paciente</title>

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
                max-width: 800px;
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

            .formulario {
                background: white;
                padding: 30px;
                border-radius: 0 0 12px 12px;
                box-shadow: 0 5px 20px rgba(0, 0, 0, 0.10);
            }

            .campo {
                margin-bottom: 18px;
            }

            label {
                display: block;
                margin-bottom: 7px;
                font-weight: bold;
                color: #333;
            }

            input {
                width: 100%;
                padding: 12px;
                border: 1px solid #ccc;
                border-radius: 7px;
                font-size: 15px;
                outline: none;
            }

            input:focus {
                border-color: #1976d2;
                box-shadow: 0 0 4px rgba(25, 118, 210, 0.3);
            }

            .botones {
                margin-top: 25px;
                display: flex;
                gap: 10px;
                flex-wrap: wrap;
            }

            .btn {
                display: inline-block;
                padding: 12px 20px;
                border: none;
                border-radius: 7px;
                text-decoration: none;
                font-size: 15px;
                cursor: pointer;
                font-weight: bold;
            }

            .btn-guardar {
                background: #1976d2;
                color: white;
            }

            .btn-guardar:hover {
                background: #1565c0;
            }

            .btn-volver {
                background: #6c757d;
                color: white;
            }

            .btn-volver:hover {
                background: #545b62;
            }

            .mensaje {
                background: #fff3cd;
                color: #856404;
                border: 1px solid #ffeeba;
                padding: 15px;
                border-radius: 7px;
            }

            @media (min-width: 650px) {

                .fila {
                    display: flex;
                    gap: 20px;
                }

                .fila .campo {
                    flex: 1;
                }
            }
        </style>
    </head>

    <body>

        <div class="contenedor">

            <div class="encabezado">
                <h1>Editar Paciente</h1>
                <p>Modifique la información del paciente seleccionado</p>
            </div>

            <%
                Paciente paciente =
                        (Paciente) request.getAttribute("paciente");
            %>

            <div class="formulario">

                <% if (paciente != null) { %>

                    <form action="ActualizarPacienteServlet" method="POST">

                        <input type="hidden"
                               name="documentoOriginal"
                               value="<%= paciente.getDocumento() %>">

                        <div class="fila">

                            <div class="campo">

                                <label for="nombre">
                                    Nombre
                                </label>

                                <input type="text"
                                       id="nombre"
                                       name="nombre"
                                       value="<%= paciente.getNombre() %>"
                                       required>

                            </div>

                            <div class="campo">

                                <label for="apellido">
                                    Apellido
                                </label>

                                <input type="text"
                                       id="apellido"
                                       name="apellido"
                                       value="<%= paciente.getApellido() %>"
                                       required>

                            </div>

                        </div>

                        <div class="fila">

                            <div class="campo">

                                <label for="documento">
                                    Documento
                                </label>

                                <input type="text"
                                       id="documento"
                                       name="documento"
                                       value="<%= paciente.getDocumento() %>"
                                       required>

                            </div>

                            <div class="campo">

                                <label for="edad">
                                    Edad
                                </label>

                                <input type="number"
                                       id="edad"
                                       name="edad"
                                       value="<%= paciente.getEdad() %>"
                                       min="0"
                                       max="120"
                                       required>

                            </div>

                        </div>

                        <div class="fila">

                            <div class="campo">

                                <label for="telefono">
                                    Teléfono
                                </label>

                                <input type="tel"
                                       id="telefono"
                                       name="telefono"
                                       value="<%= paciente.getTelefono() %>"
                                       required>

                            </div>

                            <div class="campo">

                                <label for="correo">
                                    Correo electrónico
                                </label>

                                <input type="email"
                                       id="correo"
                                       name="correo"
                                       value="<%= paciente.getCorreo() %>"
                                       required>

                            </div>

                        </div>

                        <div class="botones">

                            <button type="submit"
                                    class="btn btn-guardar">
                                Guardar cambios
                            </button>

                            <a href="listaPaciente.jsp"
                               class="btn btn-volver">
                                Cancelar
                            </a>

                        </div>

                    </form>

                <% } else { %>

                    <div class="mensaje">
                        No se encontró el paciente que desea editar.
                    </div>

                    <br>

                    <a href="listaPaciente.jsp"
                       class="btn btn-volver">
                        Volver a la lista
                    </a>

                <% } %>

            </div>

        </div>

    </body>
</html>
```
