<%@page import="java.util.ArrayList"%>
<%@page import="POJOs.News"%>
<%@page import="controller.ControlNewsManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Noticias</title>

        <!-- CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="style.css" rel="stylesheet" />
        
        <!-- JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </head>
    
    <body>
        <%
            //String email = request.getParameter("email");
            ControlNewsManager manager = new ControlNewsManager();
            int cont = manager.execute(0);
            ArrayList<News> list = manager.getList();
            
            if(cont == 0){
                if(list == null) list = new ArrayList();
                if(list.isEmpty()){
                    list.add(new News("Todavía no hay ninguna noticia", "Introduzca una noticia", "20/02/2022", "30/02/2022"));
                    list.get(0).setUrl_Image("");
                }
                System.out.println("No existen noticias en la base de datos");
            }
            %>
        <div class="container-fluid">
            
            <!-- ENCABEZADO -->
            <div class="row">
                <div class="py-3 col-12">
                    <img class="float-start" src="https://cdn.discordapp.com/attachments/944571344786432021/945247676029616178/logo.png" width="150" height="150">
                </div>

                <div class="col-12">
                    <p class="fs-1 text-center font-monospace">Noticias</p>
                </div>
            </div>
            
            <!-- TABLA NOTICIAS -->
            <div class="row col-11 mx-auto">
                <div class="col-12">
                    <table class="table table-striped align-middle">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>URL</th>
                                <th>Titulo</th>
                                <th>Cuerpo</th>
                                <th>Autor</th>
                                <th>Dia Inicio</th>
                                <th>Dia Fin</th>
                                <th>Tipo</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>                         
                            <tr>
                                <th>0</th>
                                <td>C:\</td>
                                <td>Juan</td>
                                <td>Juan</td>
                                <td>Jose Ignacio</td>
                                <td>11/03/2022</td>
                                <td>11/03/2022</td>
                                <td>Tipo</td>
                                <td>
                                    <!-- BOTÓN EDITAR -->
                                    <form method="GET" action="form_noticias.jsp">
                                        <div class="d-grid gap-2">
                                            <input type="hidden" name="action" value="edit">
                                            <input type="submit" value="Editar" class="btn btn-primary">
                                        </div>
                                    </form>
                                </td>
                                <td>
                                    <!-- BOTÓN BORRAR -->
                                    <form method="GET" action="noticias.jsp">
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
                    <form method="GET" action="form_noticias.jsp">
                        <div class="d-grid gap-2">
                            <input type="hidden" name="action" value="insert">
                            <input type="submit" action="insert" value="Insertar" class="btn btn-primary">
                        </div>
                    </form>
                </div>
            </div>
            
        </div> <!-- CIERRE CONTAINER -->

    </body>
</html>
