<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IES El Rincón</title>
        <link href="bootstrap.min.css" rel="stylesheet"/>
        <style type="text/css">	 
            body {
                background-color: #8c52fe;
                font-family: Courier New,Courier,Lucida Sans Typewriter,Lucida Typewriter,monospace; 
                color: white;
                font-size: 60px;
            }

            p.author{
                font-weight: bold;
            }
        </style> 
    </head>
    <body>
        <%            
            /*
            *   This page shows a different phrase each day
            *
            *   Two constant String arrays; filled with the phrase and the author of each phrase
            *   The phrases changes depending on the day of month, starting the 9th, otherwise it shows only one image
            */
            
            final String[] listPhrases = {"1. No deseo que las mujeres tengan más poder sobre los hombres, sino que tengan más poder sobre ellas mismas.", "2. Haz sólo lo que el corazón te dice.", 
                "3. ¿Pies? para qué los tengo, si tengo alas para volar.", "", "", "4. El reto no es ser perfecto, es estar completo.", "5. Tu mayor atractivo es la confianza que tienes en ti.",
                "6. Nadie puede hacerte sentir inferior sin tu consentimiento.", "7. En la vida no hay nada que temer, sólo hay que entender.", "8. Si dejas salir tus miedos, tendrás más espacio para vivir tus sueños.", "", "",
                "9. No hay barrera, cerradura ni cerrojo que puedas imponer a la libertad de mi mente.", "10. No te quedes sentado esperando que lleguen las oportunidades, levántate y hazlas.", 
                "11. Ignoramos nuestra verdadera estatura hasta que nos ponemos en pie.", "12. Si hay verdad o mérito en la crítica, intenta aprender de esta. Si no, no le prestes atención.", "13. No vemos las cosas como son, las vemos como somos.", "", "", 
                "14. El perdón es una virtud de los valientes.", "15. Todas las batallas son ganadas o perdidas primero en nuestra mente.", "16. Sé la mejor versión de ti misma, antes de ser la copia de alguien más.", "17. Piensa en toda la belleza que aún queda a tu alrededor y sé feliz."};
            
            final String[] listAuthors = {"Mary Shelley", "Diana de Gales", "Frida Khalo", "", "", "Jane Fonda", "Beyonce", "Eleanor Roosevelt", "Marie Curie", "Marilyn Monroe", "", "", "Virginia Wolf", 
                "Sarah Breedlove", "Maya Angelou", "Hillary Clinton", "Anaïs Nin", "", "", "Indira Gandhi", "Juana de Arco", "Judy Garland", "Ana Frank"};
            Date date = new Date();
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(date);
            
            int index = -1;
            
            index = calendar.get(Calendar.DAY_OF_MONTH) - 9;
            
            if(listPhrases[index].equals("")) index = -1;
        %>
        <div class="container">
            <!-- Header -->
            <div class="row">
                <%if(index < 0){%>
                    <div class="col-12">
                        <!-- <img class="float-end" src="http://localhost:8080/project/images/1.png" width="800" height="800"> -->
                        <img class="mx-auto d-block" src="https://cdn.discordapp.com/attachments/805062115923853332/950684718272245760/274874367_5197310233622873_4714063330912770654_n.jpg"  width="800" height="800">
                    </div>
                <%}else{%>    
                    <div class="py-5 col-6">
                        <!-- <img class="float-start" src="http://localhost:8080/project/images/logo.png" width="200" height="150"> -->
                        <img class="float-start" src="https://cdn.discordapp.com/attachments/944571344786432021/945247676029616178/logo.png" width="200" height="150">
                    </div>
                    
                    <div class="py-5 col-6">
                        <!-- <img class="float-end" src="http://localhost:8080/project/images/2.png" width="200" height="150"> -->
                        <img class="float-end" src="https://cdn.discordapp.com/attachments/805062115923853332/950515907606741072/imagen_2022-03-07_221033-removebg-preview.png" width="200" height="150">
                    </div>

                    <div class="py-3 col-12">
                        <p class="text-center">
                            <%= listPhrases[index]%>
                        </p> 
                    </div>

                    <div class="py-2 col-12">
                        <p class="text-center author">
                            <%= listAuthors[index]%>
                        </p> 
                    </div>
                        
                    <div class="py-2 col-12">
                        <!-- <img class="float-end" src="http://localhost:8080/project/images/3.png" width="200" height="150"> -->
                        <img class="float-end" src="https://cdn.discordapp.com/attachments/805062115923853332/950524343077711942/imagen_2022-03-07_224343-removebg-preview.png" width="200" height="150">
                    </div>
                <%}%>
            </div>
        </div> 
    </body>
</html>
