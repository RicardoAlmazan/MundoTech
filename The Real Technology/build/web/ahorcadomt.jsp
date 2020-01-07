<%-- 
    Document   : ahorcadomt
    Created on : 23/04/2016, 11:41:03 PM
    Author     : The Real Technology
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session = "true" %>
<%@page import="java.sql.ResultSet"%>


<%

    HttpSession sesion = request.getSession();
    String usuario = "";
    String nivel;
    String liga = "";

    if ((sesion.getAttribute("user") != null && session.getAttribute("nivel") != null)) {
        if (session.getAttribute("nivel") == "2") {
            usuario = session.getAttribute("user").toString();
            nivel = session.getAttribute("nivel").toString();
            liga = "<li><a href='login.jsp?cerrar=true' class=external>Cerrar sesión " + usuario + " </a></li>";
        }
    } else {
        out.print("<script>location.replace('login.jsp');</script>");

    }

    proceso.cPais todo = new proceso.cPais();
    String palabra = "";
    String imagenes = "";
    int x = 0;
    palabra += "[" + todo.paisAleatorio() + "]";

    //palabra += "['MEXICO', 'ITALIA', 'CHINA', 'RUSIA', 'HAITI', 'INDONESIA', 'INDIA', 'LIBIA', 'MALTA', 'NIGER', 'PAPUA', 'VATICANO', 'MADAGASCAR', 'KAZAJISTAN', 'CHIPRE', 'ISLANDIA', 'ESTONIA', 'NAURU', 'COLOMBIA', 'MUNDOTECH', 'WASHINGTON'];";
    imagenes += "<img class =imagen id=\"ahorcado\" src=\"IMG/AHORCADO/id30.png\"/>";
    for (int j = 0; j < 10; j++) {
        x = 110 * j;
        imagenes += "<img class =imagen id=" + j + " src=\"IMG/AHORCADO/id0.png\"  style=\"display: none; position: absolute; top:  30%; left: " + x / 15 + "%;\"/>";
    }
    for (int j = 0; j < 10; j++) {
        x = 110 * j;
        imagenes += "<img class =imagen id=" + (j + 10) + " src=\"IMG/AHORCADO/line.png\" style=\"display: none; position: absolute; top:  50%; left: " + x / 15 + "%;\"/>";
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" type="image/png" href="IMG/logo.png" />
        <link href="CSS/estilos-ahorcado.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

        <title>Ahorcado</title>   

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
        <style>
            .modal-header, h2, .close {
                background-color: #00B0DD;
                color:white !important;
                text-align: center;
                font-size: 30px;
            }</style>
        <script>
            var opc = 0;
            var num = 0;
            var y = '';
            var palabras;
            var w;
            var e;
            var z;
            palabras = <%out.print(palabra);%>
            var palabra;


            function anotar(x) {
                y = x;
                document.getElementById("text").innerHTML = y;
                document.getElementById("ok").disabled = false;
                switch (y)
                {
                    case"A":
                        opc = 1;
                        break;
                    case"B":
                        opc = 2;
                        break;
                    case"C":
                        opc = 3;
                        break;
                    case"D":
                        opc = 4;
                        break;
                    case"E":
                        opc = 5;
                        break;
                    case"F":
                        opc = 6;
                        break;
                    case"G":
                        opc = 7;
                        break;
                    case"H":
                        opc = 8;
                        break;
                    case"I":
                        opc = 9;
                        break;
                    case"J":
                        opc = 10;
                        break;
                    case"K":
                        opc = 11;
                        break;
                    case"L":
                        opc = 12;
                        break;
                    case"M":
                        opc = 13;
                        break;
                    case"N":
                        opc = 14;
                        break;
                    case"Ñ":
                        opc = 15;
                        break;
                    case"O":
                        opc = 16;
                        break;
                    case"P":
                        opc = 17;
                        break;
                    case"Q":
                        opc = 18;
                        break;
                    case"R":
                        opc = 19;
                        break;
                    case"S":
                        opc = 20;
                        break;
                    case"T":
                        opc = 21;
                        break;
                    case"U":
                        opc = 22;
                        break;
                    case"V":
                        opc = 23;
                        break;
                    case"W":
                        opc = 24;
                        break;
                    case"X":
                        opc = 25;
                        break;
                    case"Y":
                        opc = 26;
                        break;
                    case"Z":
                        opc = 27;
                }
            }

            function crearpalabra() {
                w = 30;
                var acentos = "ÃÀÁÄÂÈÉËÊÌÍÏÎÒÓÖÔÙÚÜÛÇ";
                var original = "AAAAAEEEEIIIIOOOOUUUUC";
                num = (Math.round(Math.random() * 10) + Math.round(Math.random() * 10));
                var h;
                palabra = palabras[num];
                palabra = palabra.toUpperCase();
                for (j = 0; j < palabra.length; j++) {
                    for (k = 0; k < palabra.length; k++) {
                        if (palabra.charAt(j) == acentos.charAt(k)) {
                            palabra.charAt(j) = original.charAt(k);
                        }
                    }
                }
                h = 10;
                e = 0;
                for (j = 0; j < 10; j++) {
                    document.getElementById(j).style.display = 'none';
                    document.getElementById(h).style.display = 'none';
                    h++;
                }
                h = 10;
                for (j = 0; j < palabra.length; j++) {
                    document.getElementById(j).style.display = 'block';
                    document.getElementById(h).style.display = 'block';
                    h++;
                }
                document.getElementById('ok').style.display = 'block';
                document.getElementById('cancel').style.display = 'none';

                for (j = 0; j < palabra.length; j++) {
                    document.getElementById(j).src = "IMG/AHORCADO/id0.png";
                }
            }

            function newgame() {
                location.reload();
            }

            function valida() {
                z = 0;
                for (i = 0; i < palabra.length; i++) {
                    z++;
                    if (palabra.charAt(i) == y) {
                        document.getElementById(i).src = "IMG/AHORCADO/id" + opc + ".png";
                        e++;
                        z--;
                    }
                }
                if (z == palabra.length) {
                    w++;
                    alert("Error, la letra " + y + " no está en la palabra");
                    document.getElementById('ahorcado').src = "IMG/AHORCADO/id" + w + ".png";
                }
                if (w == 37) {
                    var letra;
                    alert("Mala suerte, ¡Has perdido!");
                    document.getElementById('ok').style.display = 'none';
                    for (i = 1; i < 28; i++) {
                        switch (i)
                        {
                            case 1:
                                letra = "A";
                                break;
                            case 2:
                                letra = "B";
                                break;
                            case 3:
                                letra = "C";
                                break;
                            case 4:
                                letra = "D";
                                break;
                            case 5:
                                letra = "E";
                                break;
                            case 6:
                                letra = "F";
                                break;
                            case 7:
                                letra = "G";
                                break;
                            case 8:
                                letra = "H";
                                break;
                            case 9:
                                letra = "I";
                                break;
                            case 10:
                                letra = "J";
                                break;
                            case 11:
                                letra = "K";
                                break;
                            case 12:
                                letra = "L";
                                break;
                            case 13:
                                letra = "M";
                                break;
                            case 14:
                                letra = "N";
                                break;
                            case 15:
                                letra = "Ñ";
                                break;
                            case 16:
                                letra = "O";
                                break;
                            case 17:
                                letra = "P";
                                break;
                            case 18:
                                letra = "Q";
                                break;
                            case 19:
                                letra = "R";
                                break;
                            case 20:
                                letra = "S";
                                break;
                            case 21:
                                letra = "T";
                                break;
                            case 22:
                                letra = "U";
                                break;
                            case 23:
                                letra = "V";
                                break;
                            case 24:
                                letra = "W";
                                break;
                            case 25:
                                letra = "X";
                                break;
                            case 26:
                                letra = "Y";
                                break;
                            case 27:
                                letra = "Z";
                        }
                        for (j = 0; j < palabra.length; j++) {
                            if (palabra.charAt(j) == letra) {
                                document.getElementById(j).src = "IMG/AHORCADO/id" + i + ".png";
                            }
                        }
                    }
                    document.getElementById('newgam').style.display = 'block';
                }
                if (e == palabra.length) {
                    alert("¡Felicidades, has ganado!");
                    document.getElementById('ok').style.display = 'none';
                    document.getElementById('newgam').style.display = 'block';
                }
                document.getElementById(y).style.display = 'none';
                document.getElementById('text').innerHTML = "";
                document.getElementById("ok").disabled = true;

            }

        </script>
    </head>
    <body>
        <!-- This section is for Splash Screen -->
        <section id="jSplash">
            <div id="circle"></div>
        </section>
        <!-- End of Splash Screen -->



        <!-- Header -->
        <header>
            <div class="sticky-nav">
                <a id="mobile-nav" class="menu-nav" href="#menu-nav"></a>

                <div id="logo">
                    <a id="goUp" href="index.jsp#home-slider" title="The Real Technology">The Real Technology</a>
                </div>


                <nav id="menu">
                    <ul id="menu-nav">
                        <li><a href="mapa_1.jsp" class="external">Mapa</a></li>
                        <li class="current"><a href="ahorcadomt.jsp">Ahorcado</a></li>
                        <li><a href="juego.jsp" class="external">Memorama</a></li>
                        <li><a href="perfil.jsp" class="external">Perfil de <%=usuario%></a></li>


                        <%out.print(liga);%>
                    </ul>

                </nav>


            </div>

        </header>

        <!-- End Header -->



        <div class="container">

            <center><%out.print(imagenes);%></center>
            <center><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
                <div id="text" width="30px" height="30px"></div><br />
                <div class="centrar">
                    <input class="letter" type="button" id="A" value="A" onclick="anotar('A');" />
                    <input type="button" class = "letter"id="B" value="B" onclick="anotar('B');" />
                    <input type="button" class = "letter"id="C" value="C" onclick="anotar('C');" />
                    <input type="button" class = "letter"id="D" value="D" onclick="anotar('D');" />
                    <input type="button" class = "letter"id="E" value="E" onclick="anotar('E');" />
                    <input type="button" class = "letter"id="F" value="F" onclick="anotar('F');" />
                    <input type="button" class = "letter"id="G" value="G" onclick="anotar('G');" />
                    <input type="button" class = "letter"id="H" value="H" onclick="anotar('H');" />
                    <input type="button" class = "letter"id="I" value="I" onclick="anotar('I');" /><br />
                    <input type="button" class = "letter"id="J" value="J" onclick="anotar('J');" />
                    <input type="button" class = "letter"id="K" value="K" onclick="anotar('K');" />
                    <input type="button" class = "letter"id="L" value="L" onclick="anotar('L');" />
                    <input type="button" class = "letter"id="M" value="M" onclick="anotar('M');" />
                    <input type="button" class = "letter"id="N" value="N" onclick="anotar('N');" />
                    <input type="button"class = "letter" id="Ñ" value="Ñ" onclick="anotar('Ñ');" />
                    <input type="button" class = "letter"id="O" value="O" onclick="anotar('O');" />
                    <input type="button" class = "letter"id="P" value="P" onclick="anotar('P');" />
                    <input type="button" class = "letter"id="Q" value="Q" onclick="anotar('Q');" /><br />
                    <input type="button" class = "letter"id="R" value="R" onclick="anotar('R');" />
                    <input type="button" class = "letter"id="S" value="S" onclick="anotar('S');" />
                    <input type="button" class = "letter"id="T" value="T" onclick="anotar('T');" />
                    <input type="button" class = "letter"id="U" value="U" onclick="anotar('U');" />
                    <input type="button" class = "letter"id="V" value="V" onclick="anotar('V');" />
                    <input type="button" class = "letter"id="W" value="W" onclick="anotar('W');" />
                    <input type="button" class = "letter"id="X" value="X" onclick="anotar('X');" />
                    <input type="button" class = "letter"id="Y" value="Y" onclick="anotar('Y');" />
                    <input type="button" class = "letter"id="Z" value="Z" onclick="anotar('Z');" />
                </div><br /><br>
                <input type="button" id="cancel" value="Crear palabra" class="btn btn-primary btn-lg" onclick="crearpalabra();" />

                <div class="modal fade mod hide" id="Instrucciones">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <%--Header de la ventana--%>
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h2 class="modal-title titulo">Instrucciones</h2>
                            </div>
                            <%--Contenido de la ventana--%>
                            <div class="modal-body">
                                <div id="instrucciones">

                                    Se crea la palabra con el boton 'Crear palabra'
                                </div>
                            </div>
                            <%--Footer de la ventana--%>
                            <div class="modal-footer">
                                <button type="button"class="btn btn-default" data-dismiss="modal" >Cerrar</button>
                                <a href="#Instrucciones2" class="btn btn-info" data-toggle="modal" data-dismiss="modal" data-backdrop="true">Siguiente</a>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade mod hide" id="Instrucciones2">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <%--Header de la ventana--%>
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h2 class="modal-title titulo">Instrucciones</h2>
                            </div>
                            <%--Contenido de la ventana--%>
                            <div class="modal-body">
                                <div id="instrucciones">

                                    Clickea sobre una de las letras en el teclado de la pagina(puedes cambiar tu eleccion clickeando sobre alguna otra letra)
                                </div>
                            </div>
                            <%--Footer de la ventana--%>
                            <div class="modal-footer">
                                <button type="button"class="btn btn-default" data-dismiss="modal" >Cerrar</button>
                                <a href="#Instrucciones3" class="btn btn-info" data-toggle="modal" data-dismiss="modal" data-backdrop="true">Siguiente</a>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade mod hide" id="Instrucciones3">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <%--Header de la ventana--%>
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h2 class="modal-title titulo">Instrucciones</h2>
                            </div>
                            <%--Contenido de la ventana--%>
                            <div class="modal-body">
                                <div id="instrucciones">
                                    Para validar la opcion da clic sobre el boton de 'OK'

                                </div>
                            </div>
                            <%--Footer de la ventana--%>
                            <div class="modal-footer">
                                <button type="button"class="btn btn-default" data-dismiss="modal" >Cerrar</button>
                                <a href="#Instrucciones4" class="btn btn-info" data-toggle="modal" data-dismiss="modal" data-backdrop="true">Siguiente</a>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade mod hide" id="Instrucciones4">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <%--Header de la ventana--%>
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true" >&times;</button>
                                <h2 class="modal-title titulo">Instrucciones</h2>
                            </div>
                            <%--Contenido de la ventana--%>
                            <div class="modal-body">
                                <div id="instrucciones">
                                    Te aparecera una alerta en la pantalla la cual te dira si tu eleccion fue correcta o incorrecta

                                </div>
                            </div>
                            <%--Footer de la ventana--%>
                            <div class="modal-footer">
                                <button type="button"class="btn btn-default" data-dismiss="modal" >Cerrar</button>
                                <a href="#Instrucciones5" class="btn btn-info" data-toggle="modal" data-dismiss="modal" data-backdrop="true">Siguiente</a>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade mod hide" id="Instrucciones5">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <%--Header de la ventana--%>
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h2 class="modal-title titulo">Instrucciones</h2>
                            </div>
                            <%--Contenido de la ventana--%>
                            <div class="modal-body">
                                <div id="instrucciones">
                                    Si fallas 7 veces perderas y se te mostrara la palabra completa a adivinar

                                </div>
                            </div>
                            <%--Footer de la ventana--%>
                            <div class="modal-footer">
                                <button type="button"class="btn btn-default" data-dismiss="modal" >Cerrar</button>
                                <a href="#Instrucciones6" class="btn btn-info" data-toggle="modal" data-dismiss="modal" data-backdrop="true">Siguiente</a>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade mod hide" id="Instrucciones6">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <%--Header de la ventana--%>
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h2 class="modal-title titulo">Instrucciones</h2>
                            </div>
                            <%--Contenido de la ventana--%>
                            <div class="modal-body">
                                <div id="instrucciones">

                                    Para volver a jugar da clic sobre el botón 'Nuevo juego'
                                </div>
                            </div>
                            <%--Footer de la ventana--%>
                            <div class="modal-footer">
                                <a href="#Instrucciones" class="btn btn-info" data-toggle="modal" data-dismiss="modal" data-backdrop="true">Repetir</a>
                                <button type="button"class="btn btn-default" data-dismiss="modal" >Cerrar</button>

                            </div>
                        </div>
                    </div>
                </div>
                <input type="button" id="ok" value="OK" onclick="valida();" class="btn btn-success" style="display: none;" disabled=true/>
                <a href="#Instrucciones" class="btn btn-info" data-toggle="modal" data-backdrop="true">Instrucciones</a>
                <input type="button" id="newgam" class="btn btn-default" value="Nuevo juego" onclick="newgame();" style="display: none;"/>
            </center>
        </div>

        <!-- Js  -->
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
    </body>
