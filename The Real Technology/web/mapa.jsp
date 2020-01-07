<%-- 
    Document   : index
    Created on : 09-abr-2016, 16:05:37
    Author     : The Real Technology
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session = "true" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="BD.cDatos"%>

<%

    HttpSession sesion = request.getSession();
    String usuario;
    String nivel;
    String liga = "";

    if (sesion.getAttribute("user") != null && session.getAttribute("nivel") != null) {
        out.print("<script>location.replace('mapa_1.jsp');</script>");
    } else {

    }

%>
<%    proceso.cPais mexico = new proceso.cPais(1);
    proceso.cPais madagascar = new proceso.cPais(2);
    proceso.cPais eua = new proceso.cPais(3);
    proceso.cPais italia = new proceso.cPais(4);
    proceso.cPais china = new proceso.cPais(5);
    proceso.cPais rusia = new proceso.cPais(6);
    proceso.cPais haiti = new proceso.cPais(7);
    proceso.cPais indonesia = new proceso.cPais(8);
    proceso.cPais india = new proceso.cPais(9);
    proceso.cPais libia = new proceso.cPais(10);
    proceso.cPais malta = new proceso.cPais(11);
    proceso.cPais niger = new proceso.cPais(12);
    proceso.cPais papua = new proceso.cPais(13);
    proceso.cPais vaticano = new proceso.cPais(14);
    proceso.cPais kazaj = new proceso.cPais(15);
    proceso.cPais chipre = new proceso.cPais(16);
    proceso.cPais islandia = new proceso.cPais(17);
    proceso.cPais estonia = new proceso.cPais(18);
    proceso.cPais nauru = new proceso.cPais(19);
    proceso.cPais colom = new proceso.cPais(20);

    String nomCom = "País: ";
    String cap = "Capital: ";
    String idi = "Idioma: ";
    String superf = "Superficie: ";
    String genti = "Gentilicio: ";
    String habit = "No. de Habitantes: ";
    String puntAlt = "Punto más alto: ";
    String moneda = "Moneda: ";

    String[] html = new String[10];

    html[0] = "<div class=pais><img width = 100px src=";
    html[1] = "</div";
    html[2] = "<div class=mascara>";


%>
<%!
    public String idiomaF(proceso.cPais pais) {
        String[] idioma;
        idioma = pais.getIdioma();
        for (int i = 0; i < idioma.length; i++) {
            String idiomaS = idioma[i];
            return idiomaS;
        }
        return "";
    }

%>
<script src='https://maps.googleapis.com/maps/api/js?key=AIzaSyCOmsgu2JEHhet1QU7rJ_L7mBRzb2nb_Ow&sensor=false&extension=.js'></script> 

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
            ['M&#233;xico', '<%=mexico.getTodo(mexico)%>', '', '', '', <%=mexico.getLati()%>, <%=mexico.getLongi()%>, 'https://mapbuildr.com/assets/img/markers/default.png'],
            ['Estados Unidos', '<%=eua.getTodo(eua)%>',
                'undefined', 'undefined', 'undefined', <%=eua.getLati()%>, <%=eua.getLongi()%>, 'https://mapbuildr.com/assets/img/markers/default.png'],
            ['Italia', '<%=italia.getTodo(italia)%>',
                'undefined', 'undefined', 'undefined', <%=italia.getLati()%>, <%=italia.getLongi()%>, 'https://mapbuildr.com/assets/img/markers/default.png'],
            ['China', '<%=china.getTodo(china)%>', 'undefined', 'undefined', 'undefined', <%=china.getLati()%>, <%=china.getLongi()%>, 'https://mapbuildr.com/assets/img/markers/default.png'],
            ['Rusia', '<%=rusia.getTodo(rusia)%>', 'undefined', 'undefined', 'undefined', <%=rusia.getLati()%>, <%=rusia.getLongi()%>, 'https://mapbuildr.com/assets/img/markers/default.png'],
            ['Hait&#237;', '<%=haiti.getTodo(haiti)%>', 'undefined', 'undefined', 'undefined',<%=haiti.getLati()%>, <%=haiti.getLongi()%>, 'https://mapbuildr.com/assets/img/markers/default.png'],
            ['Indonesia', '<%=indonesia.getTodo(indonesia)%>', 'undefined', 'undefined', 'undefined', <%=indonesia.getLati()%>, <%=indonesia.getLongi()%>, 'https://mapbuildr.com/assets/img/markers/default.png'],
            ['India', '<%=india.getTodo(india)%>', 'undefined', 'undefined', 'undefined', <%=india.getLati()%>, <%=india.getLongi()%>, 'https://mapbuildr.com/assets/img/markers/default.png'],
            ['Libia', '<%=libia.getTodo(libia)%>', 'undefined', 'undefined', 'undefined', <%=libia.getLati()%>, <%=libia.getLongi()%>, 'https://mapbuildr.com/assets/img/markers/default.png'],
            ['Malta', '<%=malta.getTodo(malta)%>', 'undefined', 'undefined', 'undefined', <%=malta.getLati()%>, <%=malta.getLongi()%>, 'https://mapbuildr.com/assets/img/markers/default.png'],
            ['N&#237;ger', '<%=niger.getTodo(niger)%>', 'undefined', 'undefined', 'undefined', <%=niger.getLati()%>, <%=niger.getLongi()%>, 'https://mapbuildr.com/assets/img/markers/default.png'],
            ['Pap&#250;a Nueva Guinea', '<%=papua.getTodo(papua)%>', 'undefined', 'undefined', 'undefined', <%=papua.getLati()%>, <%=papua.getLongi()%>, 'https://mapbuildr.com/assets/img/markers/default.png'],
            ['Ciudad del Vaticano', '<%=vaticano.getTodo(vaticano)%>', 'undefined', 'undefined', 'undefined', <%=vaticano.getLati()%>, <%=vaticano.getLongi()%>, 'https://mapbuildr.com/assets/img/markers/default.png'],
            ['Madagascar', '<%=madagascar.getTodo(madagascar)%>', 'undefined', 'undefined', 'undefined', <%=madagascar.getLati()%>, <%=madagascar.getLongi()%>, 'https://mapbuildr.com/assets/img/markers/default.png'],
            ['Kazajist&#225;n', '<%=kazaj.getTodo(kazaj)%>', 'undefined', 'undefined', 'undefined', <%=kazaj.getLati()%>, <%=kazaj.getLongi()%>, 'https://mapbuildr.com/assets/img/markers/default.png'],
            ['Chipre', '<%=chipre.getTodo(chipre)%>', 'undefined', 'undefined', 'undefined', <%=chipre.getLati()%>, <%=chipre.getLongi()%>, 'https://mapbuildr.com/assets/img/markers/default.png'],
            ['Islandia', '<%=islandia.getTodo(islandia)%>', 'undefined', 'undefined', 'undefined', <%=islandia.getLati()%>, <%=islandia.getLongi()%>, 'https://mapbuildr.com/assets/img/markers/default.png'],
            ['Estonia', '<%=estonia.getTodo(estonia)%>', 'undefined', 'undefined', 'undefined', <%=estonia.getLati()%>, <%=estonia.getLongi()%>, 'https://mapbuildr.com/assets/img/markers/default.png'],
            ['Nauru', '<%=nauru.getTodo(nauru)%>', 'undefined', 'undefined', 'undefined', <%=nauru.getLati()%>, <%=nauru.getLongi()%>, 'https://mapbuildr.com/assets/img/markers/default.png'],
            ['Colombia', '<%=colom.getTodo(colom)%>', 'undefined', 'undefined', 'undefined', <%=colom.getLati()%>, <%=colom.getLongi()%>, 'https://mapbuildr.com/assets/img/markers/default.png']
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
                }
            });
            google.maps.event.addListener(iw, 'closeclick', function () {
                infoWindowVisible(false);
            });
        }
    }



</script>
<style>
    .modal-header, h2, .close {
        background-color: #00A0DF;
        color:white !important;
        text-align: center;
        font-size: 30px;
    }
    .modal-footer {
        background-color: #f9f9f9;
    }
</style>
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
        <link href="CSS/estilos-login.css" rel="stylesheet" type="text/css"/>
        <meta name="description" content="The Real Technology" /> 
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
                        <li><a href="index.jsp#home-slider" class="external">Inicio</a></li>
                        <li class="current"><a href="mapa.jsp">Mapa</a></li>
                        <li><a href="juego.jsp" class="external">Juegos</a></li>
                        <li><a href="#login" class="external" data-toggle="modal">Iniciar Sesión</a></li>         
                    </ul>
                </nav>
            </div>
        </header>
        <!-- End Header -->
        <!-- Modal -->
        <div class="modal fade" id="login" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header" style="padding:35px 50px;">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h2><span class="glyphicon glyphicon-lock"></span>Iniciar sesión</h2>
                    </div>
                    <div class="modal-body" style="padding:40px 50px;">
                        <form name="flogin" id="flogin" action="login.jsp" method="POST" onsubmit="valida();" role="form">
                            <center><div class="form-group">
                                    <label for="username"><span class="glyphicon glyphicon-user"></span>Nombre de Usuario</label>
                                    <input type="text" name="txtUsuario" id="username" placeholder="Ingresa tu nombre de usuario" class="form-control btn-block" />
                                </div>
                                <div class="form-group">
                                    <label for="passsword"><span class="glyphicon glyphicon-eye-open"></span> Contraseña</label>
                                    <input type="password" name="txtContra" id="password" class="form-control  btn-block" onpaste="return false" placeholder="Ingresa tu contraseña" />
                                </div>
                                <%                        cDatos op = new cDatos();

                                    if (request.getParameter("btnIngresar") != null) {
                                        String nombre = request.getParameter("txtUsuario");
                                        String contra = request.getParameter("txtContra");
                                        String paterno = "";
                                        String gametag = "";
                                        String nombreReal = "";
                                        String email = "";
                                        String imagen = "";
                                        String src = "Archivos/";

                                        switch (op.loguear(nombre, contra)) {
                                            case 1:
                                                sesion.setAttribute("user", nombre);
                                                sesion.setAttribute("nivel", "1");
                                                response.sendRedirect("indexMain.jsp");
                                                break;

                                            case 2:
                                                ldn.cAlumno alums = new ldn.cAlumno();
                                                alums.setGametag(nombre);
                                                nombreReal = alums.getNombre();
                                                paterno = alums.getPaterno();

                                                email = alums.getEmail();
                                                imagen = alums.getImagen();
                                                sesion.setAttribute("user", nombre);
                                                sesion.setAttribute("nivel", "2");
                                                sesion.setAttribute("nombre", nombreReal);
                                                sesion.setAttribute("imagen", src + imagen);
                                                sesion.setAttribute("paterno", paterno);

                                                sesion.setAttribute("email", email);
                                                response.sendRedirect("mapa_1.jsp");
                                                break;
                                            case 3:
                                                sesion.setAttribute("user", nombre);
                                                sesion.setAttribute("nivel", "3");
                                                response.sendRedirect("mapa_agregar.jsp");
                                                break;
                                            default:
                                                out.write("<div class='form-group has-error'><label class='control-label'>Usuario o contraseña incorrectos</label></div>");
                                                break;
                                        }
                                    }


                                %> 
                            </center><button type="submit" name="btnIngresar" id="ingresar" class="btn btn-info btn-block"><span class="glyphicon glyphicon-off"></span>Ingresar</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <a class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span>Cancelar</a>
                        <p class="text-muted text-center">¿No tienes una cuenta? <br><a href="registro.jsp" class="btn btn-link">Regístrate</a></p>
                    </div>
                </div>

            </div>
        </div> 
    </div>
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
    <script src="JS/login_Valida.js" type="text/javascript"></script>
</body>
</html>
