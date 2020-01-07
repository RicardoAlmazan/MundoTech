<%-- 
    Document   : perfil
    Created on : 25/04/2016, 09:39:35 PM
    Author     : Personal
--%>

<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session = "true" %>
<%@page import="java.sql.ResultSet"%>


<%

    HttpSession sesion = request.getSession();
    String usuario = "";
    String nivel;
    String liga = "";
    String nombre = "";
    String imagen = "";
    String paterno = "";
    String email = "";

    if ((sesion.getAttribute("user") != null && session.getAttribute("nivel") != null) &&
            (session.getAttribute("nivel") == "2"))  {
        
        usuario = sesion.getAttribute("user").toString();
        nivel = sesion.getAttribute("nivel").toString();
        nombre = sesion.getAttribute("nombre").toString();
        imagen = sesion.getAttribute("imagen").toString();
        paterno = sesion.getAttribute("paterno").toString();
        email = sesion.getAttribute("email").toString();
        liga = "<li><a href='login.jsp?cerrar=true' class=external>Cerrar sesión " + usuario + " </a></li>";
    } else {
        response.sendRedirect("login.jsp");

    }

%>
<!DOCTYPE html>
<!--[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if (IE 7)&!(IEMobile)]><html class="no-js lt-ie9 lt-ie8" lang="en"><![endif]-->
<!--[if (IE 8)&!(IEMobile)]><html class="no-js lt-ie9" lang="en"><![endif]-->
<!--[if (IE 9)]><html class="no-js ie9" lang="en"><![endif]-->
<!--[if gt IE 8]><!--> <html lang="en-US"> <!--<![endif]-->
    <head>
        <link rel="icon" type="image/png" href="<%=imagen%>" />
        <!-- Meta Tags -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

        <title>Perfil de <%=usuario%></title>   
        <style>
            .progress-bar-azulito{
                background-color:  #00B0DD;
                color: #fff;
                margin: auto 0;
                text-align: center;
                align-content: center;
                top: 0%;
            }
        </style>
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

    </head>


    <body>

        <!-- Splash -->
        <section id="jSplash">
            <div id="circle"></div>
        </section>
        <!-- End of Splash Screen -->

        <!-- Header -->
        <header>
            <div class="sticky-nav">
                <a id="mobile-nav" class="menu-nav" href="#menu-nav"></a>

                <div id="logo">
                    <a id="goUp" href="index.jsp" title="The Real Technology">The Real Technology</a>
                </div>

                <nav id="menu">
                    <ul id="menu-nav">
                        <li><a href="index.jsp" class="external">Inicio</a></li>
                        <li><a href="mapa_1.jsp" class="external">Mapa</a></li>
                        <li><a href="juego.jsp" class="external">Juegos</a></li>
                        <li class="current"><a href="perfil.jsp">Perfil de <%=usuario%></a></li>
                            <%=liga%>

                    </ul>
                </nav>

            </div>
        </header>
        <!-- / Header -->

        <!-- Perfil -->
        <div id="shortcodes" class="page">
            <div class="container" style="height:100%">

                <!-- Title Page -->
                <div class="row">
                    <div class="span12">
                        <div class="title-page">
                            <img src="<%=imagen%>" class="img-circle" width="180px" ><br>
                            <a href="registroImagen.jsp" data-toggle="tooltip" title="" data-original-title="Puedes poner la imagen que quieras">
                                Cambiar Imagen</a>
                            <h2 class="title"><%=nombre%></h2>

                            <h3 class="title-description">@<%=usuario%> </h3>

                        </div>
                    </div>
                </div>
                <!--Cierre de Titulo -->
                <!-- Start Accordion/Toggle Section -->
                <div class="row">



                    <div class="span6">
                        <h3 class="spec">Información</h3>

                        <!-- Toggle -->
                        <div class="accordion" id="toggleArea">

                            <div class="accordion-group">
                                <div class="accordion-heading togglize">
                                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#" href="#collapseOne">
                                        Sobre <%=nombre%> 
                                        <span class="font-icon-plus"></span>
                                        <span class="font-icon-minus"></span>
                                    </a>
                                </div>
                                <div id="collapseOne" class="accordion-body collapse">
                                    <div class="accordion-inner" charset=UTF-8>
                                        <form  action="actualiza.jsp" method="POST" name="formu">
                                            <span class="col-lg-2 control-label">Nombre completo:</span> <input class="form-control-static" type="text" value="<%=nombre + " " + paterno%>" disabled="true" name="nombre" id="nombre"/><br>
                                            
                                            <span class="col-lg-2 control-label" style="padding-right: 75px;"> E-mail: </span>
                                            <input class="form-control-static" type="text" value="<%=email%>" disabled="true" name="email" id="email"/>
                                            <input type="button" class="btn btn-info form-control-static" style="float: right;" onclick="document.formu.email.disabled = false;" value="Modificar"/>
                                        </form>
                                    </div>
                                </div>
                            </div>

                            <div class="accordion-group">
                                <div class="accordion-heading togglize">
                                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#" href="#collapseTwo">
                                        Puntuaciones
                                        <span class="font-icon-plus"></span>
                                        <span class="font-icon-minus"></span>
                                    </a>
                                </div>
                                <div id="collapseTwo" class="accordion-body collapse">
                                    <div class="accordion-inner">
                                        Donec sed odio dui. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. 
                                        Sed posuere consectetur est at lobortis. Nulla vitae elit libero, a pharetra augue. Donec ullamcorper nulla non metus auctor fringilla. 
                                        Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet. Donec sed odio dui. 
                                        Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Sed posuere consectetur est at lobortis. Nulla vitae elit libero, a pharetra augue. 
                                        Donec ullamcorper nulla non metus auctor fringilla. Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet.
                                    </div>
                                </div>
                            </div>

                            <div class="accordion-group">
                                <div class="accordion-heading togglize">
                                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#" href="#collapseThird">
                                        Logros
                                        <span class="font-icon-plus"></span>
                                        <span class="font-icon-minus"></span>
                                    </a>
                                </div>
                                
                                <div id="collapseThird" class="accordion-body collapse">
                                    <div class="accordion-inner">
                                        Logro 1
                                        <div class="progress">
                                            <div class="progress-bar progress-bar-azulito progress-bar-striped active" role="progressbar" style="width:10%; min-width: 5%;">
                                                10%
                                            </div>
                                        </div>  
                                    </div>
                                </div>
                            </div>

                        </div>
                        <!-- /Toggle -->

                    </div>

                    
                    <div class="span6">
                        <h3 class="spec">Tabs</h3>
                        
                        <div class="tabbable">
                        
                            <ul class="nav nav-tabs" id="myTab">
                                <li class="active"><a href="#tab1" data-toggle="tab">Tab</a></li>
                                <li><a href="#tab2" data-toggle="tab">Tab</a></li>
                                <li><a href="#tab3" data-toggle="tab">Tab</a></li>
                            </ul>
                         
                            <div class="tab-content">
                                <div class="tab-pane fade in active" id="tab1">
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas neque diam, luctus at laoreet in, auctor ut tellus. Etiam enim lacus, ornare et tempor, rhoncus rhoncus sem.
                                    Aliquam volutpat arcu et nibh mollis eleifend pharetra lorem scelerisque. Donec vel enim purus, id viverra neque. Cras in velit ante, eget pellentesque sem. Duis tincidunt erat quam. Etiam placerat sapien elit.    
                                </div>
                                <div class="tab-pane fade in" id="tab2">
                                    Aliquam volutpat arcu et nibh mollis eleifend pharetra lorem scelerisque. Donec vel enim purus, id viverra neque. Cras in velit ante, eget pellentesque sem. Duis tincidunt erat quam. Etiam placerat sapien elit.                            
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas neque diam, luctus at laoreet in, auctor ut tellus. Etiam enim lacus, ornare et tempor, rhoncus rhoncus sem.
                                </div>
                                <div class="tab-pane fade in" id="tab3">
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas neque diam, luctus at laoreet in, auctor ut tellus. Etiam enim lacus, ornare et tempor, rhoncus rhoncus sem.
                                    Aliquam volutpat arcu et nibh mollis eleifend pharetra lorem scelerisque. Donec vel enim purus, id viverra neque. Cras in velit ante, eget pellentesque sem. Duis tincidunt erat quam. Etiam placerat sapien elit.    
                                </div>
                            </div>
                                    
                                        </div>
                    </div>
                    <!-- End Tabs -->

                </div>
                <!-- End Accordion/Toggle Section -->



            </div>
            <!-- End Accordion/Toggle Section -->
            <%--         
            <%="Creacion: " + sesion.getCreationTime()%><%
            Date momento=new Date(sesion.getCreationTime()); %>
            <%="Creacion: " +momento%>--%>

        </div>
        <!-- Footer -->
        <footer>
            <p class="credits">&copy;2016  <a title="The Real Technology">The Real Technology</a> 
            </p>
        </footer>
        <!-- End Footer -->



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

    </body>
</html>
