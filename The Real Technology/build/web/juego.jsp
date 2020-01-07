<%-- 
    Document   : juego
    Created on : 14-abr-2016, 23:28:36
    Author     : Alan_Towers1
--%>
<%@page import="proceso.cPais"%>
<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session = "true" %>
<%@page import="java.sql.ResultSet"%>


<%
    
    HttpSession sesion = request.getSession();
    String usuario;
    String nivel;
    String liga = "";
    
    if((sesion.getAttribute("user")!=null && session.getAttribute("nivel")!=null) &&
            (session.getAttribute("nivel") == "2")){
        usuario=session.getAttribute("user").toString();
        nivel=session.getAttribute("nivel").toString();
        liga = "<li><a href='login.jsp?cerrar=true' class=external>Cerrar sesión "+usuario+" </a></li>";
    } else {
        out.print("<script>location.replace('login.jsp');</script>");
        
    }

%>
<%
    int cuantos;
    int[] lugar ;
    String[] idi;
    String[] url = new String[8];
    String[] nom = new String[8];
    int[] yo ;
    cPais[] pais = new cPais[8];
    proceso.cInfo info = new proceso.cInfo();
    proceso.cAleatorio random = new proceso.cAleatorio();
    cuantos = info.consultaint("select count(id_pais) as cuenta from pais","cuenta");
    lugar = random.aleatorio(cuantos);
    yo = random.aleatoriozero(8);
    for(int x = 0; x < 4; x++){ 
        pais[x] = new cPais(lugar[x]);
    }
    for(int x = 0; x < 8; x++)
    {
        if(yo[x] < 4)
        {
            url[x] = pais[yo[x]].getBandera();
            nom[x] = pais[yo[x]].getId_pais()+"";
        }
        else
        {
            url[x] = "IMG/MEMORAMA/id"+pais[(yo[x])-4].getId_pais()+".jpg";
            nom[x] = pais[yo[x]-4].getId_pais()+"";
        }
    }
    idi = pais[0].getIdioma();
%>
<!DOCTYPE html>
<!--[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if (IE 7)&!(IEMobile)]><html class="no-js lt-ie9 lt-ie8" lang="en"><![endif]-->
<!--[if (IE 8)&!(IEMobile)]><html class="no-js lt-ie9" lang="en"><![endif]-->
<!--[if (IE 9)]><html class="no-js ie9" lang="en"><![endif]-->
<!--[if gt IE 8]><!--> <html lang="en-US"> <!--<![endif]-->
<head>
    <link href="CSS/memorama.css" rel="stylesheet" type="text/css"/>
    <style>
        
        input[type='button'] {
 border: none;
 background: #3a7999;
 color: #f2f2f2;
 padding: 10px;
 font-size: 18px;
 border-radius: 5px;
 position: relative;
 box-sizing: border-box;
 transition: all 500ms ease;
}

    
 input[type='button']:hover {
 background: rgba(255,255,255,1);
 color: #3a7999;
 box-shadow: inset 0 0 0 3px #3a7999;
}</style>
    <script src="JS/memorama.js" type="text/javascript"></script>
<link rel="icon" type="image/png" href="IMG/logo.png" />
<!-- Meta Tags -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<title>.:Memorama:.</title>   

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

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
<!-- End Analytics -->
</head>


<body onload="instrucciones();">

<!-- This section is for Splash Screen
<section id="jSplash">
	<div id="circle"></div>
</section>
 End of Splash Screen -->



<!-- Header -->
<header>
    <div class="sticky-nav">
    	<a id="mobile-nav" class="menu-nav" href="#menu-nav"></a>
        
        <div id="logo">
        	<a id="goUp" href="index.jsp#home-slider" title="Brushed | Responsive One Page Template">The Real Technology</a>
        </div>
        
        <nav id="menu">
        	<ul id="menu-nav">
            	<li><a href="ahorcadomt.jsp" class="external">Ahorcado</a></li>
               
                
                <li class="current"><a href="juego.jsp">Memorama</a></li>
               
             
        
                <li><a href="mapa_1.jsp" class="external">Mapa</a></li>
                <li><a href="perfil.jsp" class="external">Perfil</a></li>
                <%out.print(liga);%>                
            </ul>
        </nav>
        
    </div>
</header>
<!-- End Header -->

<div id="inicio">
            <img width="50%"src="IMG/MEMORAMA/tipo.png" id="instrucciones" class="espera"/>
            <img src="IMG/MEMORAMA/dialogo.png" id="globo" class="espera"/>
            <div id="dialogo" class="espera" style="z-index: 5;"></div>
        </div>
        <br/>
        <img id="1" class="uno" name="<%=nom[0]%>" src="<%=url[0]%>"/>
        <img id="2" class="dos" name="<%=nom[1]%>" src="<%=url[1]%>"/>
        <img id="3" class="tres" name="<%=nom[2]%>" src="<%=url[2]%>"/>
        <img id="4" class="cuatro" name="<%=nom[3]%>" src="<%=url[3]%>"/>
        <img id="5" class="duno" name="<%=nom[4]%>" src="<%=url[4]%>"/>
        <img id="6" class="ddos" name="<%=nom[5]%>" src="<%=url[5]%>"/>
        <img id="7" class="dtres" name="<%=nom[6]%>" src="<%=url[6]%>"/>
        <img id="8" class="dcuatro" name="<%=nom[7]%>" src="<%=url[7]%>"/>
        
       <a onclick="oculta(<%=nom[0]%>,'uno');"><img id="uno" class="couno" src="IMG/MEMORAMA/Memorama.png"/></a>
       <a onclick="oculta(<%=nom[1]%>,'dos');"><img id="dos" class="codos" src="IMG/MEMORAMA/Memorama.png"/></a>
        <a onclick="oculta(<%=nom[2]%>,'tres');"><img id="tres" class="cotres" src="IMG/MEMORAMA/Memorama.png"/></a>
        <a onclick="oculta(<%=nom[3]%>,'cuatro');"><img id="cuatro" class="cocuatro" src="IMG/MEMORAMA/Memorama.png"/></a>
        <a onclick="oculta(<%=nom[4]%>,'cinco');"><img id="cinco" class="coduno" src="IMG/MEMORAMA/Memorama.png"/></a>
        <a onclick="oculta(<%=nom[5]%>,'seis');"><img id="seis" class="coddos" src="IMG/MEMORAMA/Memorama.png"/></a>
        <a onclick="oculta(<%=nom[6]%>,'siete');"><img id="siete" class="codtres" src="IMG/MEMORAMA/Memorama.png"/></a>
        <a onclick="oculta(<%=nom[7]%>,'ocho');"><img id="ocho" class="codcuatro" src="IMG/MEMORAMA/Memorama.png" /> </a>
        

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
