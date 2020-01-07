<%-- 
    Document   : mapa_agregar
    Created on : 5/05/2016, 04:29:26 PM
    Author     : The Real Technology
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session = "true" %>
<%
    HttpSession sesion = request.getSession();
    String usuario;
    String level;
    String liga = "";
    if ((sesion.getAttribute("user") != null && session.getAttribute("nivel") != null)
            && (sesion.getAttribute("nivel") == "3")) {
        usuario = session.getAttribute("user").toString();
        level = session.getAttribute("nivel").toString();
        liga = "<li><a href='login.jsp?cerrar=true' class=external>Cerrar sesión " + usuario + " </a></li>";

    } else {
        out.print("<script>alert('Acceso denegado');"
                + "var pagina = 'javascript:history.go(-1)'; "
                + "document.location.href=pagina;"
                + "</script>");
    }

    /*
    if(ready==false){
        response.sendRedirect("login.jsp");
    }*/
    
    
%>



<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" type="image/png" href="IMG/logo.png" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width; initial-scale=1.0"> 
        <link href="_include/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/estilos-registro.css" rel="stylesheet" type="text/css"/>
        <link href="_include/css/fileinput.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <script src="http://maps.googleapis.com/maps/api/js"></script>
        <script src="JS/registroPais.js" type="text/javascript"></script>
        <script>
            function buscaDireccion()
            {
                var geocoder = new google.maps.Geocoder();
                var address = document.getElementById('direccion').value;
                geocoder.geocode({'address': address}, function (results, status)
                {
                    if (status == google.maps.GeocoderStatus.OK)
                    {
                        var latitude = results[0].geometry.location.lat();
                        var longitude = results[0].geometry.location.lng();
                        //alert('La longitud es: ' + longitude + ', la latitud es: ' + latitude);
                        document.getElementById('lat').value = latitude;
                        document.getElementById('lon').value = longitude;
                        traeMapa(latitude, longitude);
                    }
                });
            }
            function traeMapa(lat, long) {
                var mapProp = {
                    center: new google.maps.LatLng(lat, long),
                    zoom: 3,
                    maxZoom: 5,
                    minZoom: 3,
                    zoomControl: true,
                    disableDoubleClickZoom: false,
                    mapTypeControl: true,
                    scaleControl: false,
                    scrollwheel: true,
                    panControl: true,
                    streetViewControl: false,
                    draggable: true,
                    overviewMapControl: false,
                    overviewMapControlOptions: {
                        opened: false,
                    },
                    mapTypeId: google.maps.MapTypeId.ROADMAP,
                    styles: [{"featureType": "water", "elementType": "geometry", "stylers": [{"color": "#333739"}]}, {"featureType": "landscape", "elementType": "geometry", "stylers": [{"color": "#2ecc71"}]}, {"featureType": "poi", "stylers": [{"color": "#2ecc71"}, {"lightness": -7}]}, {"featureType": "road.highway", "elementType": "geometry", "stylers": [{"color": "#2ecc71"}, {"lightness": -28}]}, {"featureType": "road.arterial", "elementType": "geometry", "stylers": [{"color": "#2ecc71"}, {"visibility": "on"}, {"lightness": -15}]}, {"featureType": "road.local", "elementType": "geometry", "stylers": [{"color": "#2ecc71"}, {"lightness": -18}]}, {"elementType": "labels.text.fill", "stylers": [{"color": "#ffffff"}]}, {"elementType": "labels.text.stroke", "stylers": [{"visibility": "off"}]}, {"featureType": "transit", "elementType": "geometry", "stylers": [{"color": "#2ecc71"}, {"lightness": -34}]}, {"featureType": "administrative", "elementType": "geometry", "stylers": [{"visibility": "on"}, {"color": "#333739"}, {"weight": 0.8}]}, {"featureType": "poi.park", "stylers": [{"color": "#2ecc71"}]}, {"featureType": "road", "elementType": "geometry.stroke", "stylers": [{"color": "#333739"}, {"weight": 0.3}, {"lightness": 10}]}],
                };

                var map = new google.maps.Map(document.getElementById("elMapa"), mapProp);
                // marcador rojito
                var marker = new google.maps.Marker({
                    position: new google.maps.LatLng(lat, long),
                    map: map,
                    title: "Este es el país seleccionado."
                });

            }
            //google.maps.event.addDomListener(window, 'load', initialize);
        </script>

        <title>Agregar países.</title>
    </head>
    <body>

        <div class="container boxlogin text-center jumbotron">

            <h1 style="font-size: 35px; padding-bottom: 30px;">Agregar países.</h1>

            <form action="mapa_agregar.jsp" method="POST" class="form-horizontal" name="formulario1" role="form" >
                
                <div class="form-group" id="nombreDiv">
                    <label for="nombre " class="col-lg-2 control-label">Nombre del país:</label>
                    <div class="col-lg-10 form-control-static">
                        <input type="text" name="direccion" class="form-control" id="direccion"  onchange="buscaDireccion()"
                               placeholder="Introduce el nombre del país." maxlength="20">
                        <span id="erroPais" class=""></span>
                    </div>
                </div>
                <div class="form-group hide" id="capitalDiv">
                    <label for="capital" class="col-lg-2 control-label">Capital:</label>
                    <div class="col-lg-10">
                        <input type="text" name="capital" class="form-control" id="capital" placeholder="Teclea la capital del pais."
                               maxlength="100" required>
                        <span id="errorEmail" class=""></span>
                    </div>
                </div>

                <div class="form-group" id="gametagDiv">
                    <label for="lat" class="col-lg-2 control-label">Latitud:</label>
                    <div class="col-lg-10">

                        <input type="text" name="lat" class="form-control" id="lat" readonly
                                maxlength="30" required>
                        <span id="errorGametag" class=""></span>
                    </div>
                </div>
                
                <div class="form-group" id="emailDiv">
                    <label for="lon" class="col-lg-2 control-label">Longitud:</label>
                    <div class="col-lg-10">
                        <input type="text" name="lon" class="form-control" id="lon" readonly
                               maxlength="100" required>
                        <span id="errorEmail" class=""></span>
                    </div>
                </div>
                
                
                
                <div id="elMapa" style="width:100%; height:500px;"></div>
                <div class="form-group" id="boton">
                    <div class="col-lg-offset-1 col-lg-10">
                        <input type="button" class="btn btn-primary" value="Continuar" onclick="next();">
                    </div>
                </div>
                <div class="form-group hide" id="enviar">
                    <div class="col-lg-offset-1 col-lg-10">
                        <input type="submit" class="btn btn-primary" value="Continuar">
                    </div>
                </div>
            </form>

        </div>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script> <!-- jQuery Core -->
        
        <script src="_include/js/fileinput.min.js" type="text/javascript"></script>


    </body>
</html>

