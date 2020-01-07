<%-- 
    Document   : index
    Created on : 09-abr-2016, 16:05:37
    Author     : The Real Technology
    

String[] mexico_idioma = mexico.getIdioma();
    for (int x=0; x<mexico_idioma.length; x++)
    {
    out.print(mexico_idioma[x]);
    }
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session = "true" %>
<%@page import="java.sql.ResultSet"%>


<%

    HttpSession sesion = request.getSession();
    String usuario;
    String nivel;
    String liga = "";
    String liga1 = "";
    String liga2 = "";

    if (sesion.getAttribute("user") != null && session.getAttribute("nivel") != null) {
        usuario = session.getAttribute("user").toString();
        nivel = session.getAttribute("nivel").toString();
        liga = "<li><a href='login.jsp?cerrar=true' class=external>Cerrar sesión " + usuario + " </a></li>";
        if (session.getAttribute("nivel") == "2") {
            liga1 = "<li><a href='perfil.jsp' class=external>Perfil</a></li>";
            liga2 = "<li><a href='juego.jsp' class=external>Juegos</a></li>";
        }
        else {out.print("<script>location.replace('login.jsp');</script>");}
    } else {
        out.print("<script>location.replace('login.jsp');</script>");

    }
    proceso.cPais todo = new proceso.cPais();
    String todos = todo.todo();
%>


<script src='https://maps.googleapis.com/maps/api/js?key=&sensor=false&extension=.js'></script> 

<script>
    google.maps.event.addDomListener(window, 'load', init);
    var map;
    function init() {
        var mapOptions = {
            center: new google.maps.LatLng(30.887012, 9.093017),
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
        }
        var mapElement = document.getElementById('TheRealTech');
        var map = new google.maps.Map(mapElement, mapOptions);
        var locations = [
    <%out.print(todos);%>


        ];
        for (i = 0; i < locations.length; i++) {
            if (locations[i][1] == 'undefined') {
                description = '';
            } else {
                description = locations[i][1];
            }
            if (locations[i][2] == 'undefined') {
                telephone = '';
            } else {
                telephone = locations[i][2];
            }
            if (locations[i][3] == 'undefined') {
                email = '';
            } else {
                email = locations[i][3];
            }
            if (locations[i][4] == 'undefined') {
                web = '';
            } else {
                web = locations[i][4];
            }
            if (locations[i][7] == 'undefined') {
                markericon = '';
            } else {
                markericon = locations[i][7];
            }
            marker = new google.maps.Marker({
                icon: markericon,
                position: new google.maps.LatLng(locations[i][5], locations[i][6]),
                map: map,
                animation: google.maps.Animation.DROP,
                title: locations[i][0],
                desc: description,
                tel: telephone,
                email: email,
                web: web
            });
            link = '';
            bindInfoWindow(marker, map, locations[i][0], description, telephone, email, web, link);
        }
        function bindInfoWindow(marker, map, title, desc, telephone, email, web, link) {
            var infoWindowVisible = (function () {
                var currentlyVisible = false;
                return function (visible) {
                    if (visible !== undefined) {
                        currentlyVisible = visible;
                    }
                    return currentlyVisible;
                };
            }());
            iw = new google.maps.InfoWindow();
            google.maps.event.addListener(marker, 'click', function () {

                if (infoWindowVisible()) {
                    iw.close();
                    infoWindowVisible(false);
                } else {
                    var html = "<div style='width: 500px;color:#000;border-radius:50%;background-color:#FFF;'>" + "<br/>" + desc + "</div>";
                    iw = new google.maps.InfoWindow({content: html});
                    iw.open(map, marker);
                    infoWindowVisible(true);


                    setTimeout(marker.setAnimation(google.maps.Animation.BOUNCE), 1500);
                }
            });
            google.maps.event.addListener(iw, 'closeclick', function () {
                infoWindowVisible(false);
            });
        }

    }



</script>
<style>


    #TheRealTech {
        height: 100%;
        width:100%;
    }
    .gm-style-iw * {
        display: block;

    }


    .pais img {
        float: right;
        opacity: 0.5;
        margin: 10px;

        border: 10px solid #eee;
        -webkit-transition: all 0.5s ease;
        -moz-transition: all 0.5s ease;
        -o-transition: all 0.5s ease;
        -webkit-box-reflect: below 0px -webkit-gradient(linear, left top, left bottom, from(transparent), color-stop(.7, transparent), to(rgba(0,0,0,0.1)));

    }

    .pais img:hover {
        opacity: 1;
        -webkit-box-reflect: below 0px -webkit-gradient(linear, left top, left bottom, from(transparent), color-stop(.7, transparent), to(rgba(0,0,0,0.4)));
        -webkit-box-shadow: 0px 0px 20px rgba(255,255,255,0.8);
        -moz-box-shadow: 0px 0px 20px rgba(255,255,255,0.8);
        box-shadow: 0px 0px 20px rgba(255,255,255,0.8);
    }
    .pais{
        font-size: 100%;
    }

    .gm-style-iw a {
        color: #4272db;
    }
</style>


<!DOCTYPE html>
<!--[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="es"> <![endif]-->
<!--[if (IE 7)&!(IEMobile)]><html class="no-js lt-ie9 lt-ie8" lang="es"><![endif]-->
<!--[if (IE 8)&!(IEMobile)]><html class="no-js lt-ie9" lang="es"><![endif]-->
<!--[if (IE 9)]><html class="no-js ie9" lang="es"><![endif]-->
<!--[if gt IE 8]><!--> <html lang="es"> <!--<![endif]-->
    <head>
        <link rel="icon" type="image/png" href="IMG/logo.png" />
        <!-- Meta Tags -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

        <title>.:Mapa:.</title>   

        <meta name="description" content="Insert Your Site Description" /> 

        <!-- Mobile Specifics -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="HandheldFriendly" content="true"/>
        <meta name="MobileOptimized" content="320"/>   

        <!-- Mobile Internet Explorer ClearType Technology -->
        <!--[if IEMobile]>  <meta http-equiv="cleartype" content="on">  <![endif]-->

        <!-- Bootstrap -->
        <link href="_include/css/bootstrap.min.css" rel="stylesheet">

        <!-- Main Style -->
        <link href="_include/css/main.css" rel="stylesheet">

        <!-- Supersized -->
        <link href="_include/css/supersized.css" rel="stylesheet">
        <link href="_include/css/supersized.shutter.css" rel="stylesheet">

        <!-- FancyBox -->
        <link href="_include/css/fancybox/jquery.fancybox.css" rel="stylesheet">

        <!-- Font Icons -->
        <link href="_include/css/fonts.css" rel="stylesheet">

        <!-- Shortcodes -->
        <link href="_include/css/shortcodes.css" rel="stylesheet">

        <!-- Responsive -->
        <link href="_include/css/bootstrap-responsive.min.css" rel="stylesheet">
        <link href="_include/css/responsive.css" rel="stylesheet">

        <!-- Supersized -->
        <link href="_include/css/supersized.css" rel="stylesheet">
        <link href="_include/css/supersized.shutter.css" rel="stylesheet">

        <!-- Google Font -->
        <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,200italic,300,300italic,400italic,600,600italic,700,700italic,900' rel='stylesheet' type='text/css'>

        <!-- Fav Icon -->
        <link rel="shortcut icon" href="#">

        <link rel="apple-touch-icon" href="#">
        <link rel="apple-touch-icon" sizes="114x114" href="#">
        <link rel="apple-touch-icon" sizes="72x72" href="#">
        <link rel="apple-touch-icon" sizes="144x144" href="#">

        <!-- Modernizr -->
        <script src="_include/js/modernizr.js"></script>

        <!-- Analytics -->
        <script type="text/javascript">

    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'Insert Your Code']);
    _gaq.push(['_trackPageview']);

    (function () {
        var ga = document.createElement('script');
        ga.type = 'text/javascript';
        ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(ga, s);
    })();

        </script>
        <!-- End Analytics -->


    </head>


    <body>

        <!-- Header -->
        <header>
            <div class="sticky-nav" style="z-index: 100">
                <a id="mobile-nav" class="menu-nav" href="#menu-nav"></a>

                <div id="logo">
                    <a id="goUp" href="index.jsp#home-slider" title="The Real Technology">The Real Technology</a>
                </div>


                <nav id="menu">
                    <ul id="menu-nav">
                        <li class="current"><a href="mapa.jsp">Mapa</a></li>
                            <%=liga2%>
                            <%=liga1%>
                            <%out.print(liga);%>                
                    </ul>

                </nav>


            </div>

        </header>

        <!-- End Header -->

        <!-- Js -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script> <!-- jQuery Core -->
        <script src="_include/js/bootstrap.min.js"></script> <!-- Bootstrap -->
        <script src="_include/js/supersized.3.2.7.min.js"></script> <!-- Slider -->
        <script src="_include/js/waypoints.js"></script> <!-- WayPoints -->
        <script src="_include/js/waypoints-sticky.js"></script> <!-- Waypoints for Header -->
        <script src="_include/js/jquery.isotope.js"></script> <!-- Isotope Filter -->
        <script src="_include/js/jquery.fancybox.pack.js"></script> <!-- Fancybox -->
        <script src="_include/js/jquery.fancybox-media.js"></script> <!-- Fancybox for Media -->
        <script src="_include/js/jquery.tweet.js"></script> <!-- Tweet -->
        <script src="_include/js/plugins.js"></script> <!-- Contains: jPreloader, jQuery Easing, jQuery ScrollTo, jQuery One Page Navi -->
        <script src="_include/js/main.js"></script> <!-- Default JS -->
        <!-- End Js -->
        <div id='TheRealTech' style="z-index: 50; width: 100%;"></div>
        <footer>
            <p class="credits">&copy;2016  <a title="The Real Technology">The Real Technology</a> 
        </footer>
        <!-- End Footer -->
    </body>

</html>
