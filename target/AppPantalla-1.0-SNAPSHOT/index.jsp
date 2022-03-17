<%@page import="java.time.LocalDate"%>
<%@page import="POJOs.News"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controller.ControlNewsManager"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Noticias - IES El Rincón</title>

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
            
            final String[] listPhrases = {"1. No deseo que las mujeres tengan más poder sobre los hombres, sino que tengan más poder sobre ellas mismas.", "2. Haz sólo lo que el corazón te dice.", 
                "3. ¿Pies? para qué los tengo, si tengo alas para volar.", "", "", "4. El reto no es ser perfecto, es estar completo.", "5. Tu mayor atractivo es la confianza que tienes en ti.",
                "6. Nadie puede hacerte sentir inferior sin tu consentimiento.", "7. En la vida no hay nada que temer, sólo hay que entender.", "8. Si dejas salir tus miedos, tendrás más espacio para vivir tus sueños.", "", "",
                "9. No hay barrera, cerradura ni cerrojo que puedas imponer a la libertad de mi mente.", "10. No te quedes sentado esperando que lleguen las oportunidades, levántate y hazlas.", 
                "11. Ignoramos nuestra verdadera estatura hasta que nos ponemos en pie.", "12. Si hay verdad o mérito en la crítica, intenta aprender de esta. Si no, no le prestes atención.", "13. No vemos las cosas como son, las vemos como somos.", "", "", 
                "14. El perdón es una virtud de los valientes.", "15. Todas las batallas son ganadas o perdidas primero en nuestra mente.", "16. Sé la mejor versión de ti misma, antes de ser la copia de alguien más.", "17. Piensa en toda la belleza que aún queda a tu alrededor y sé feliz."};
            
            final String[] listAuthors = {"Mary Shelley", "Diana de Gales", "Frida Khalo", "", "", "Jane Fonda", "Beyonce", "Eleanor Roosevelt", "Marie Curie", "Marilyn Monroe", "", "", "Virginia Wolf", 
                "Sarah Breedlove", "Maya Angelou", "Hillary Clinton", "Anaïs Nin", "", "", "Indira Gandhi", "Juana de Arco", "Judy Garland", "Ana Frank"};
            int index = -1;
            
            index = LocalDate.now().getDayOfMonth() - 9;
            
            if(listPhrases[index].equals("")) index = -1;
        %>
        
        <div class="container-fluid">
            <!-- CAROUSEL -->
            <div class="row recuadro-noticia m-3">
                <div class="col-12 py-2"></div>
                <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
                    <%if(LocalDate.now().getMonthValue() == 3){%>
                            <div class="carousel-inner">
                                <div class="carousel-item active" data-bs-interval="15000">
                                    <div class="row">
                                        <%if(index < 0){%>
                                            <div class="col-12">
                                                <img class="mx-auto d-block" src="images/8m1.jpg"  width="700" height="700">
                                            </div>
                                        <%}else{%>
                                            <div class="py-5 col-6">
                                                <img class="float-start ms-5" src="images/logo.png" width="200" height="150">
                                            </div>
                                            <div class="py-5 col-6">
                                                <img class="float-end me-5" src="images/enclave.png" width="200" height="150">
                                            </div>
                                            <div class="col-2"></div>
                                            <div class="py-3 col-8 align-self-center">
                                                <p class="text-center" style="font-weight: bold;
                                                   font-family: Courier New,Courier,
                                                   Lucida Sans Typewriter,Lucida 
                                                   Typewriter,monospace;color: #1C4280;
                                                   font-size: 40px">
                                                    <%= listPhrases[index]%>
                                                </p> 
                                            </div>
                                            <div class="col-2"></div>
                                            <div class="col-2"></div>
                                            <div class="py-2 col-8">
                                                <p class="text-center" style="font-weight: bold;
                                                   font-family: Courier New,Courier,
                                                   Lucida Sans Typewriter,Lucida 
                                                   Typewriter,monospace;color: #8c52fe;
                                                   font-size: 40px">
                                                    <%= listAuthors[index]%>
                                                </p> 
                                            </div>
                                            <div class="py-5 col-12">
                                                <img class="float-end me-5" src="images/8m2.png" width="200" height="150">
                                            </div>
                                        <%}%>
                                    </div>
                                </div>  
                    <%}else if(!list.isEmpty()){%>
                        <div class="carousel-inner">
                            <div class="carousel-item active" data-bs-interval="5000">
                                <img src="<%=transparent%>" class="d-block w-100 recuadro-imagen">
                                <div class="carousel-caption d-none d-md-block">
                                    <img src="images/logo.png" width="600" height="500">
                                    <p class="fs-1 font-monospace">Noticias IES El Rincón</p>
                                </div>
                            </div>
                    <%}
                        if(LocalDate.now().getYear() == 2022)
                            if(LocalDate.now().getDayOfYear() > 59 && LocalDate.now().getDayOfYear() < 94){%>
                                <div class="carousel-item" data-bs-interval="15000">
                                    <img src="<%=transparent%>" height="400" class="d-block w-100 recuadro-imagen-complete">
                                    <div class="carousel-caption d-none d-md-block">
                                        <img src="images/game_jam_2k22.png" width="600" height="700">
                                    </div>
                                </div>
                            <%}

                        for(int i = 0; i < list.size(); i++){%>
                            <div class="carousel-item" data-bs-interval="<%=list.get(i).getMills()%>">
                                <img src="<%=transparent%>" height="400" class="d-block w-100 recuadro-imagen">
                                <div class="carousel-caption d-none d-md-block">
                                    <%String url = "https://picsum.photos/seed/" + list.get(i).getID() + "/700/400";%>
                                    <img class="py-5" src="<%=url%>">
                                    <p class="fs-1 font-monospace"><%=list.get(i).getTitle()%></p>
                                    <p class="fs-5"><%=list.get(i).getDescription()%></p>
                                </div>
                            </div>
                        <%}%>
                    </div>
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
        </div> <!-- END CONTAINER -->
    </body>
</html>