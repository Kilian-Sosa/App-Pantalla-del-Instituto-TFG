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
        <div class="container">

            <!-- ENCABEZADO -->
            <div class="row">
                <div class="py-3 col-12">
                    <img class="float-start" src="https://cdn.discordapp.com/attachments/944571344786432021/945247676029616178/logo.png" width="150" height="150">
                </div>

        <%
            String action = request.getParameter("action");
            //String email = request.getParameter("email");
            String title = "";
            String description = "";
            String dateInit = "";
            String dateFin = "";
            String url_Image = "";
            
            ControlNewsManager manager = new ControlNewsManager();
            
            if(action != null){
                if(action.compareTo("insert") == 0) { %>
                    <p class="fs-1 text-center font-monospace">Añadir Noticia</p>
                <% } else if(action.compareTo("edit") == 0) { %>
                    <p class="fs-1 text-center font-monospace">Editar Noticia</p>
                <%} else if(action.compareTo("Añadir") == 0) {
                    if(request.getParameter("title") != null) title = request.getParameter("title");
                    if(request.getParameter("email") != null) description = request.getParameter("email");
                    if(request.getParameter("dateinit") != null) dateInit = request.getParameter("dateinit");
                    if(request.getParameter("datefin") != null) dateFin = request.getParameter("datefin");
                    if(request.getParameter("url_image") != null) url_Image = request.getParameter("url_image");
                    %>
                    
                    <div class="py-3 col-12">
                        <p class="fs-1 text-center font-monospace">Añadir Noticia</p>
                    </div>
                    <% if(title.isBlank()) { %>
                        <div class="alert alert-danger" role="alert">El título no puede estar en blanco</div>
                    <% } else if(dateInit.isBlank() || dateFin.isBlank()) { %>
                        <div class="alert alert-danger" role="alert">Escoja las fechas</div>
                    <% } else {
                        manager.setTitle(title);
                        manager.setDescription(description);
                        manager.setDateInit(dateInit);
                        manager.setDateFin(dateFin);
                        //manager.setAuthor(email);

                        if(!url_Image.isBlank()) manager.setUrl_Image(url_Image);%>
                            <div class="alert alert-success" role="alert">Se ha añadido la noticia correctamente</div>
                    <% }
                } else if(action.compareTo("Editar") == 0) { %>
                    <div class="py-3 col-12">
                        <p class="fs-1 text-center font-monospace">Editar Noticia</p>
                    </div>
                <% }
            } %>
            </div>

            <!-- FORMULARIO -->
            <div class="row">
                <form method="GET" action="form_noticias.jsp">
                    <input type="hidden" name="id" value="0">
                    
                    <!-- TITULO -->
                    <div class="col-8 mx-auto">
                        <input type="text" class="form-control fs-5 text-center" name="title" placeholder="Titulo Noticia" value="<%= title%>">
                    </div>
                    
                    <!-- CUERPO -->
                    <div class="py-3 col-8 mx-auto">
                        <textarea rows="6" type="text" class="form-control fs-5 text-center text-justify" name="description" placeholder="Cuerpo Noticia"><%= description%></textarea>
                    </div>
                    
                    <!-- IMAGEN -->
                    <div class="py-3 col-8 mx-auto">
                        <input class="form-control" type="file" id="formFile" name="url_image" value="<%= url_Image%>">
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
                            
                            $('#datepicker').datepicker({format: 'dd/mm/yyyy', startDate: '-0d', todayHighlight: 'true', weekStart:'1', });
                            $('#datepicker2').datepicker({format: 'dd/mm/yyyy', startDate: '+1d', todayHighlight: 'true', weekStart:'1'});
                        });
                        
                        /*$(function() {
                            $('#datepicker').datepicker({format: 'dd/mm/yyyy', startDate: '-0d'});
                            $('#datepicker2').datepicker({format: 'dd/mm/yyyy', startDate: '+1d'});
                        });*/
                    </script>

                    <!-- BOTON AÑADIR -->
                    <div class="py-3 col-3 mx-auto d-grid gap-2">
                        <!-- <input type="hiden" name="email" value=" //email%>"> -->
                        <input type="hidden" name="action" value="Añadir">
                        <input type="submit" value="<%= action%>" class="btn btn-primary">
                    </div>    
                </form>
                    
                <form method="GET" action="noticias.jsp">
                    <div class="col-3 mx-auto d-grid gap-2">
                        <input type="submit" value="Volver a Noticias" class="btn btn-secondary">
                    </div>
                </form>
            </div>
                    
        </div> <!-- CIERRE CONTAINER -->
    </body>
</html>
