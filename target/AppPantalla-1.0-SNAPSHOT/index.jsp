<%@page import="POJOs.News"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controller.ControlNewsManager"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carousel Noticias</title>

        <!-- CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" />
        
        <!-- JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </head>
    
    <body>
        <!-- JAVA -->
        <%
            String transparent = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/9c64cfe3-bb3b-4ae8-b5a6-d2f39d21ff87/d3jme6i-8c702ad4-4b7a-4763-9901-99f8b4f038b0.png/v1/fill/w_600,h_400,strp/fondo_transparente_png_by_imsnowbieber_d3jme6i-fullview.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NDAwIiwicGF0aCI6IlwvZlwvOWM2NGNmZTMtYmIzYi00YWU4LWI1YTYtZDJmMzlkMjFmZjg3XC9kM2ptZTZpLThjNzAyYWQ0LTRiN2EtNDc2My05OTAxLTk5ZjhiNGYwMzhiMC5wbmciLCJ3aWR0aCI6Ijw9NjAwIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.Ymv-MHRcmXXpzmL3f0xZ0mCcyU85lCLnk0jbOnCO8Zg";
            
            ControlNewsManager manager = new ControlNewsManager();
            manager.execute(4);
            ArrayList<News> list = manager.getList();
            int mills = 0;
        %>
        
        <div class="container-fluid">
            <!-- CAROUSEL -->
            <div class="row recuadro-noticia m-3">
                <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
                    <%if(!list.isEmpty()){%>
                        <div class="carousel-inner">
                            <div class="carousel-item active" data-bs-interval="<%=list.get(0).getMills()%>">
                                <img src="<%=transparent%>" class="d-block w-100 recuadro-imagen">
                                <div class="carousel-caption d-none d-md-block">
                                    <img src="images/logo.png" width="100" height="100">
                                    <p class="fs-1 font-monospace"><%=list.get(0).getTitle()%></p>
                                    <p class="fs-5"><%=list.get(0).getDescription()%></p>
                                </div>
                            </div>

                            <%for(int i = 1; i < list.size(); i++){%>
                                <div class="carousel-item" data-bs-interval="<%=list.get(i).getMills()%>">
                                    <img src="<%=transparent%>" height="400" class="d-block w-100 recuadro-imagen">
                                    <div class="carousel-caption d-none d-md-block">
                                        <img src="images/logo.png" width="100" height="100">
                                        <p class="fs-1 font-monospace"><%=list.get(i).getTitle()%></p>
                                        <p class="fs-5"><%=list.get(i).getDescription()%></p>
                                    </div>
                                </div>
                            <%}%>
                        </div>
                    <%}else{%>
                        <p class="fs-1 font-monospace">No hay ninguna noticia activa por el momento</p>
                        <div class="row">
                            <form method="POST" action="login.jsp">
                                <div class="col-3 mx-auto d-grid gap-2">
                                    <input type="submit" value="Log In" class="btn btn-secondary">
                                </div>
                            </form>
                        </div>
                    <%}%>
                    <img class="float-start" src="images/logo.png" width="150" height="150">
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div> 
                    
            <!-- RETURN BUTTON -->
            <%if(session.getAttribute("email") != null){%>
                <div class="row">
                    <form method="POST" action="news.jsp">
                        <div class="col-3 mx-auto d-grid gap-2">
                            <input type="submit" value="Volver Atrás" class="btn btn-secondary">
                        </div>
                    </form>
                </div>
            <%}%>    
            
            <%for(int i = 0; i < list.size(); i++)
                    mills += list.get(i).getMills();
            session.setAttribute("mills", mills); %>
            <%response.setHeader("Refresh", 10000 + ", url=8m.jsp?");%>
        </div> <!-- END CONTAINER -->
    </body>
</html>