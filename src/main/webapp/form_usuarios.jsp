<%-- 
    Document   : formulario
    Created on : Jan 18, 2022, 8:12:45 AM
    Author     : Hector
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestión Alumnos</title>

        <!-- CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="style.css" rel="stylesheet" />
        
        <!-- JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </head>
    
    <body>
        <div class="container">
            <!-- ENCABEZADO -->
            <div class="row">
                <div class="py-3 col-12">
                    <img class="float-start" src="https://cdn.discordapp.com/attachments/944571344786432021/945247676029616178/logo.png" width="150" height="150">
                </div>
                
                <div class="col-12">
                    <h1 class="fs-1 text-center font-monospace">
                    <%
                        String accion = request.getParameter("accion");
                        String valor = "";
                        String id = "", nombre = "", correo = "", contraseña = "", rol = "", ausencia = "";
                        if(accion != null) {
                            if(accion.compareTo("insert") == 0){
                                valor = "Insertar";
                                out.print(valor);
                                
                            } else if(accion.compareTo("edit") == 0){
                                valor = "Editar";
                                /*id = request.getParameter("id");
                                nombre = request.getParameter("nombre");
                                correo = request.getParameter("correo");
                                contraseña = request.getParameter("contraseña");
                                rol = request.getParameter("rol");
                                ausencia = request.getParameter("ausencia");*/
                                out.print(valor);
                            }
                        }
                    %>
                        Usuario
                    </h1>
                </div>
            </div>

            <!-- FORMULARIO -->
            <div class="row">
                <div class="py-3 col-8 mx-auto">
                    <form method="GET" action="index.jsp">
                        <input type="hidden" name="id" value="<%= id%>">
                        <div class="mb-3">
                            <label for="nombre" class="form-label">Nombre del Usuario</label>
                            <input type="text" class="form-control" name="nombre" max="20" value="<%= nombre%>">
                        </div>

                        <div class="mb-3">
                            <label for="correo" class="form-label">Correo del Usuario</label>
                            <input type="text" class="form-control" name="correo" max="80" value="<%= correo%>">
                        </div>

                        <div class="mb-3">
                            <label for="contraseña" class="form-label">Contraseña del Usuario</label>
                            <input type="text" class="form-control" name="direccion" max="20" value="<%= contraseña%>">
                        </div>

                        <div class="mb-3">
                            <label for="rol" class="form-label">Rol del Usuario</label>
                            <select class="form-select" name="nota" aria-label="Default select example">
                                <option selected value=<%= rol%>><%= rol%></option>
                                <option value="admin">Administrador</option>
                                <option value="director">Director</option>
                                <option value="profesor">Profesor</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label for="ausencia" class="form-label">Ausencia</label>
                            <input type="text" class="form-control" name="ausencia" value="<%= ausencia%>">
                        </div>
                        
                        <input name="accion" type="hidden" value="<%= accion%>">
                        <div class="col-8 mx-auto d-grid gap-2">
                            <input class="btn btn-primary" type="submit" value="<%= valor%>">
                        </div>
                    </form>
                </div>
            </div>
            
            <!-- BOTÓN VOLVER -->
            <div class="row">
                <form method="GET" action="menu.jsp">
                    <div class="col-3 mx-auto d-grid gap-2">
                        <input type="submit" value="Volver Atrás" class="btn btn-secondary">
                    </div>
                </form>
            </div>
        </div> <!-- CIERRE CONTAINER -->

        <!-- Bootstrap JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>
