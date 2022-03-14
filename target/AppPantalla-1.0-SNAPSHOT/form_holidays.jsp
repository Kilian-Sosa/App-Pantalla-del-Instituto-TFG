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
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <!-- JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
    </head>
    
    <body>
        <!-- JAVA -->
        <% 
            int rol = -1;
            String url = "";
            if(session.getAttribute("rol") == null || rol == 0){
                session.setAttribute("flag", false);
                response.sendRedirect("menu.jsp");
            }
            rol = Integer.parseInt(session.getAttribute("rol").toString());
            //url = "https://avatars.dicebear.com/api/initials/" + session.getAttribute("email").toString() + ".svg?size=70&r=50";
            url = "https://avatars.dicebear.com/api/identicon/" + session.getAttribute("email").toString() + ".svg?b=white&size=70&r=50";
        %>
        <div class="container">
            <!-- HEADER -->
            <div class="row py-3">
                <div class="py-2 col-12">
                    <img class="float-start" src="https://cdn.discordapp.com/attachments/944571344786432021/945247676029616178/logo.png" width="200" height="150">
                    <div class="float-end col-2 me-4">
                        <img class="pt-5 mx-auto d-block" src="<%= url%>">
                        <p class="fs-5 py-3 font-monospace text-center"><%= session.getAttribute("name")%></p>
                    </div>
                </div>

        <%
            String action = request.getParameter("action");            
            if(action != null){
                if(action.compareTo("insert") == 0) { action = "Insertar"; %>
                    <p class="fs-1 text-center font-monospace">Añadir Festivo</p>
                <% } else if(action.compareTo("edit") == 0) { action = "Editar"; %>
                    <p class="fs-1 text-center font-monospace">Editar Festivo</p>
                <% }
            } %>
            </div>

            <!-- FORMULARIO -->
            <div class="row">
                <form method="POST" action="form_noticias.jsp">
                    <input type="hidden" name="id" value="0">
                    
                    <!-- NOMBRE -->
                    <div class="col-8 mx-auto">
                        <input type="text" class="form-control fs-5 text-center" name="title" placeholder="Titulo Festivo" value="">
                    </div>
                    
                    <div class="row justify-content-center">
                        <!-- FECHA INICIO -->
                        <div class="py-3 col-2 align-self-center">
                            <div class="input-group date" id="datepicker">
                                <input type="text" class="form-control" placeholder="Fecha inicio" name="dateinit"> <!-- value=" //dateInit%> -->
                                <span class="input-group-append">
                                    <span class="input-group-text bg-white d-block">
                                        <i class="fa fa-calendar"></i>
                                    </span>
                                </span>
                            </div>
                        </div>

                        <!-- FECHA FIN -->
                        <div class="py-3 col-2 align-self-start">
                            <div class="input-group date" id="datepicker2">
                                <input type="text" class="form-control" placeholder="Fecha fin" name="datefin">  <!-- value=" //dateFin%> -->
                                <span class="input-group-append">
                                    <span class="input-group-text bg-white d-block">
                                        <i class="fa fa-calendar"></i>
                                    </span>
                                </span>
                            </div>
                        </div>
                    </div>

                    <script type="text/javascript">
                        $(function() {
                            
                            $('#datepicker').datepicker({format: 'dd/mm/yyyy', startDate: '-0d', todayHighlight: 'true', weekStart:'1'});
                            $('#datepicker2').datepicker({format: 'dd/mm/yyyy', startDate: '+1d', todayHighlight: 'true', weekStart:'1'});
                        });
                    </script>

                    <!-- BOTON AÑADIR -->
                    <div class="py-3 col-3 mx-auto d-grid gap-2">
                        <!-- <input type="hiden" name="email" value=" //email%>"> -->
                        <input type="hidden" name="action" value="Añadir">
                        <input type="submit" value="<%= action%>" class="btn btn-primary">
                    </div>    
                </form>
                    
                <form method="POST" action="festivos.jsp">
                    <div class="col-3 mx-auto d-grid gap-2">
                        <input type="submit" value="Volver a Festivos" class="btn btn-secondary">
                    </div>
                </form>
            </div>
                    
        </div> <!-- CIERRE CONTAINER -->
    </body>
</html>
