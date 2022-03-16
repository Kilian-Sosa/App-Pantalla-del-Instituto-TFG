<html lang="en">
    <head>
        <meta charset="ISO-8859-1">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Noticias  -  IES El Rincón</title>
        <link rel="stylesheet" href="css/StylePrincipalNoticias.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <%
            GestionNoticia gn = new GestionNoticia();
            //TOTAL NOTICIAS Y NUEVO ARRAYLIST PARA LAS QUE ENTREN EN RANGO
            List<Noticia> noticias = gn.consultarNoticias();
            List<Noticia> noticiasEnRango = new ArrayList();
            //FECHA Y HORA ACTUAL
            LocalDate fechaActual = LocalDate.now();
            LocalTime horaActual = LocalTime.now();
            int numNoticia, duracion, segundos;
            //FORMATO DE ENTRADA Y SALIDA
            String input = "yyyy-MM-dd";
            String output = "d 'de' MMMM 'del' yyyy";
            Locale LOCALE_MX = new Locale("es", "ES");
            String fechaEnFormato="";
            
            //PARA QUE ME AÑADA LAS NOTICIAS QUE ENTRAN EN RANGO SOLO
            for(Noticia cada: noticias){      
                if((LocalDate.parse(cada.getFechaInicio()).isBefore(fechaActual) && LocalDate.parse(cada.getFechaFinal()).isAfter(fechaActual)) || LocalDate.parse(cada.getFechaInicio()).isEqual(fechaActual) || LocalDate.parse(cada.getFechaFinal()).isEqual(fechaActual)){
                    if((LocalTime.parse(cada.getHoraInicio()).isBefore(horaActual) && LocalTime.parse(cada.getHoraFinal()).isAfter(horaActual)) || LocalTime.parse(cada.getHoraInicio()).equals(horaActual) || LocalTime.parse(cada.getHoraFinal()).equals(horaActual)){
                        noticiasEnRango.add(cada);                        
                    }
                }
            }
            
            //SI EL INDICE ES NULO COMIENZA EN 0 Y RESETEA EL ARRAYLIST
            if (request.getParameter("indice") == null) {
                numNoticia = 0;
            //LE CAMBIO EL VALOR A NUMNOTICIA
            } else {
                numNoticia = Integer.parseInt(request.getParameter("indice"));
            }
            
            //FECHA CON FORMATO MAS VISTOSO
            try {
                fechaEnFormato = new SimpleDateFormat(output, LOCALE_MX).format(new SimpleDateFormat(input, LOCALE_MX).parse(noticiasEnRango.get(numNoticia).getFechaInicio()));
            } catch (ParseException ex) {
                System.out.println(ex.getMessage());
            }
            
        %>
        <div>
            <h1>Noticias</h1>
        </div>
        <section>
            <h3><%=noticiasEnRango.get(numNoticia).getTitulo()%></h3>
            <img src="<%=noticiasEnRango.get(numNoticia).getImagen()%>" class="d-block w-100" alt="<%=noticiasEnRango.get(numNoticia).getId()%>" alt=""/>
            <p class="date"><%=fechaEnFormato%></p>
            <p><%=noticiasEnRango.get(numNoticia).getInformacion()%></p>
        </section>
        <%
            //DURACION DE LA NOTICIA Y EL NUMERO DE LA NOTICIA
            duracion=noticiasEnRango.get(numNoticia).getDuracion();
            numNoticia = numNoticia+1;
            
            //DEPENDE DE LA DURACION SON 1 2 O 3 MINUTOS
            switch(duracion){
                case 1: 
                    segundos=60;
                    break; 
                case 2: 
                    segundos=120;
                    break;
                case 3: 
                    segundos=180;
                    break;
                default:
                    segundos=15;
                    break;
            }
            
            //SI EL NUMNOTICIA ES MAYOR QUE EL TAMAÑO DEL ARRAYLIST
            if(numNoticia > noticiasEnRango.size()-1){
                response.setHeader("Refresh", segundos+", url=index.jsp?indice=0");
                noticiasEnRango=new ArrayList();
            }else{
                response.setHeader("Refresh", segundos+", url=index.jsp?indice="+numNoticia);
            }
        %>
    </body>
</html>
