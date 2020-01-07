<%-- 
    Document   : indexProfe
    Created on : 14/04/2016, 06:26:23 PM
    Author     : The Real Technology
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session = "true" %>
<%@page import="java.sql.ResultSet"%>


<%

    HttpSession sesion = request.getSession();
    String usuario;
    String nivel;
    String liga = "";

    if ((sesion.getAttribute("user") != null && session.getAttribute("nivel") != null)
            && (sesion.getAttribute("nivel") == "3")) {
        usuario = session.getAttribute("user").toString();
        nivel = session.getAttribute("nivel").toString();
        liga = "<li><a href='login.jsp?cerrar=true' class=external>Cerrar sesión " + usuario + " </a></li>";
    } else {
        out.print("<script>"
                + "var pagina = 'javascript:history.go(-1)'; "
                + "document.location.href=pagina;"
                + "</script>");
    }

%>

<%    //creamos un obj de la clase cAlumno
    ldn.cAlumno alums = new ldn.cAlumno();
    String tblAlumnos = alums.todosHtmlProfe();
    boolean prendeForm = false;

    String acc = "";
    String nombre = request.getParameter("nombre") == null ? "" : request.getParameter("nombre");
    String paterno = request.getParameter("paterno") == null ? "" : request.getParameter("paterno");

    String gametag = request.getParameter("gametag") == null ? "" : request.getParameter("gametag");
    String email = request.getParameter("email") == null ? "" : request.getParameter("email");
    String contra = request.getParameter("contra") == null ? "" : request.getParameter("contra");
    String ncontra = request.getParameter("ncontra") == null ? "" : request.getParameter("ncontra");

    if (request.getParameter("xAcc") != null) {
        acc = request.getParameter("xAcc");
        if (acc.equals("1")) {
            prendeForm = true;
        } else if (acc.equals("2")) {
            prendeForm = true;
            gametag = request.getParameter("iPx");
            alums.setGametag(gametag);
            nombre = alums.getNombre();
            paterno = alums.getPaterno();
            gametag = alums.getGametag();

            contra = alums.getContra();
            email = alums.getEmail();

        } else if (acc.equals("3")) {
            alums.ActualizaAlumno("1", nombre, paterno, gametag, contra, email, ncontra, 2);
            response.sendRedirect("indexProfe.jsp");
        } else if (acc.equals("4")) {
            alums.ActualizaAlumno("0", nombre, paterno, gametag, contra, email, ncontra, 2);
            response.sendRedirect("indexProfe.jsp");
        }
    }
    String Acc = "3";
    if (gametag.equals("")) {
        Acc = "4";
    }
%>

<head>
    <link rel="icon" type="image/png" href="IMG/logo.png" />
    <!DOCTYPE html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Base de Datos</title>
<link href="CSS/css-generales.css" rel="stylesheet" type="text/css"/>
<script>
    function cancelaReg()
    {
        parent.self.window.location = "indexProfe.jsp";
    }
</script>
</head>
<!--[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if (IE 7)&!(IEMobile)]><html class="no-js lt-ie9 lt-ie8" lang="en"><![endif]-->
<!--[if (IE 8)&!(IEMobile)]><html class="no-js lt-ie9" lang="en"><![endif]-->
<!--[if (IE 9)]><html class="no-js ie9" lang="en"><![endif]-->
<!--[if gt IE 8]><!--> <html lang=""> <!--<![endif]-->
    <head>

        <!-- Meta Tags -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

        <title>.:The Real Technology:.</title>   

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


        <!-- Menu -->
        <header>
            <div class="sticky-nav">
                <a id="mobile-nav" class="menu-nav" href="#menu-nav"></a>

                <div id="logo">
                    <a id="goUp" href="#home-slider" title="The Real Technology">The Real Technology</a>
                </div>

                <nav id="menu">
                    <ul id="menu-nav">
                        <li><a href='mapa_agregar.jsp' class=external>Agregar países.</a></li>

                        <%out.print(liga);%>
                    </ul>
                </nav>

            </div>
        </header>


    


    <hr />
    <%=tblAlumnos%>
    <hr />
    <%
        if (prendeForm) {
    %>
    <form action="indexMain.jsp" method="POST">

        <input type="text" id="gametag" name="gametag" placeholder="Teclea tu nombre de usuario" value="<%=gametag%>" required /><br />
        <input type="text" id="nombre" name="nombre" onkeypress="return presionaLetras(event)" placeholder="Teclea tu nombre" value="<%=nombre%>" required /><br />
        <input type="text" id="paterno" name="paterno" onkeypress="return presionaLetras(event)" placeholder="Teclea tu apellido paterno" value="<%=paterno%>" required /><br />


        <input type="email" id="email" name="email" onblur="validarEmail(this.value)" placeholder="Teclea tu email" value="<%=email%>" required /><br />
        <input type="text" id="contra" name="contra" placeholder="Teclea tu contraseña" value="<%=contra%>" required /><br />
        <input type="text" id="ncontra" name="ncontra" placeholder="Teclea nuevamente tu contraseña" value="<%=ncontra%>" required /><br />

        <input type="hidden" id="xAcc" name="xAcc" value="<%=Acc%>" />
        <input type="submit" value="guardar" onclick="return confirm('¿estás seguro?');" />
        <input type="button" value="cancelar" onclick="cancelaReg();" />
    </form>
    <%
        }
    %>

    <script src="JS/login.js" type="text/javascript"></script>
</body>
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
</html>
