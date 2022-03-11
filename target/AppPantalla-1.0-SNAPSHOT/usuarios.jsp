<%-- 
    Document   : index
    Created on : Jan 17, 2022, 8:21:18 AM
    Author     : Hector
--%>

<%@page import="java.util.ArrayList"%>
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
        <!-- CODIGO JAVA -->
        <%
        
        %>
        
        <div class="container-fluid">
            
            <!-- ENCABEZADO -->
            <div class="row">
                <div class="py-3 col-12">
                    <img class="float-start" src="https://cdn.discordapp.com/attachments/944571344786432021/945247676029616178/logo.png" width="150" height="150">
                </div>
                
                <div class="col-12">
                    <p class="fs-1 text-center font-monospace">Usuarios</p>
                </div>
            </div>
            
            <!-- TABLA USUARIOS -->
            <div class="row col-11 mx-auto">
                <div class="col-12">
                    <table class="table table-striped align-middle">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Correo</th>
                                <th>Contraseña</th>
                                <th>Rol</th>
                                <th>Ausencia</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>                         
                            <tr>
                                <th>0</th>
                                <td>Nombre y Apellidos</td>
                                <td>correo@gmail.com</td>
                                <td>**********</td>
                                <td>Admin</td>
                                <td>NO</td>
                                <td>
                                    <!-- BOTÓN EDITAR -->
                                    <form method="GET" action="form_usuarios.jsp">
                                        <div class="d-grid gap-2">
                                            <input type="hidden" name="accion" value="edit">
                                            <input type="submit" value="Editar" class="btn btn-primary">
                                        </div>
                                    </form>
                                </td>
                                <td>
                                    <!-- BOTÓN BORRAR -->
                                    <form method="GET" action="usuarios.jsp">
                                        <div class="d-grid gap-2">
                                            <input type="hidden" name="accion" value="elim">
                                            <input type="submit" value="Eliminar" class="btn btn-secondary">
                                        </div>
                                    </form>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            
            
            <div class="row py-5 col-11 mx-auto justify-content-evenly">
                <!-- BOTÓN VOLVER -->
                <div class="col-3">
                    <form method="GET" action="menu.jsp">
                        <div class="d-grid gap-2">
                            <input type="submit" value="Volver Atrás" class="btn btn-secondary">
                        </div>
                    </form>
                </div>
                
                <!-- BOTÓN INSERTAR -->
                <div class="col-9">
                    <form method="GET" action="form_usuarios.jsp">
                        <div class="d-grid gap-2">
                            <input type="hidden" name="action" value="insert">
                            <input type="submit" value="Insertar" class="btn btn-primary">
                        </div>
                    </form>
                </div>
            </div>
                        
        </div> <!-- CIERRE CONTAINER -->
        
    </body>
</html>
