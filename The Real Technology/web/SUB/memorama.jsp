<%-- 
    Document   : memorama
    Created on : 09-abr-2016, 23:20:56
    Author     : AZEre
--%>

<%@page import="proceso.cPais"%>
<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            url[x] = "../"+pais[yo[x]].getBandera();
            nom[x] = pais[yo[x]].getId_pais()+"";
        }
        else
        {
            url[x] = "../IMG/MEMORAMA/id"+pais[(yo[x])-4].getId_pais()+".jpg";
            nom[x] = pais[yo[x]-4].getId_pais()+"";
        }
    }
    idi = pais[0].getIdioma();
%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Bootstrap -->
<link href="../CSS/bootstrap.min.css" rel="stylesheet">

<!-- Main Style -->
<link href="../CSS/main.css" rel="stylesheet">

<!-- Supersized -->
<link href="../CSS/supersized.css" rel="stylesheet">
<link href="../CSS/supersized.shutter.css" rel="stylesheet">

<!-- FancyBox -->
<link href="../CSS/fancybox/jquery.fancybox.css" rel="stylesheet">

<!-- Font Icons -->
<link href="../CSS/fonts.css" rel="stylesheet">

<!-- Shortcodes -->
<link href="../CSS/shortcodes.css" rel="stylesheet">

<!-- Responsive -->
<link href="../CSS/bootstrap-responsive.min.css" rel="stylesheet">
<link href="../CSS/responsive.css" rel="stylesheet">

<!-- Supersized -->
<link href="../CSS/supersized.css" rel="stylesheet">
<link href="../CSS/supersized.shutter.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../CSS/memorama.css" rel="stylesheet" />
        <script src="../JS/memorama.js"></script>
        <title>Memorama</title>
    </head>
    <body onload="instrucciones();">
        <header>
    <div class="sticky-nav">
    	<a id="mobile-nav" class="menu-nav" href="#menu-nav"></a>
        
        <div id="logo">
        	<a id="goUp" href="#home-slider" title="hola | Responsive One Page Template">Brushed Template</a>
        </div>
        
        <nav id="menu">
        	<ul id="menu-nav">
            	<li class="current"><a href="#home-slider">Inicio</a></li>
                <li><a href="#work">Nuestro Trabajo</a></li>
                <li><a href="#about">Sobre Nosotros</a></li>
                <li><a href="#contact">Contáctanos</a></li>
				<li><a href="shortcodes.html" class="external">Iniciar Sesión</a></li>
            </ul>
        </nav>
        
    </div>
</header>
        <div id="inicio">
            <img src="../IMG/MEMORAMA/tipo.png" id="instrucciones" class="espera"/>
            <img src="../IMG/MEMORAMA/dialogo.png" id="globo" class="espera"/>
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
        
       <a onclick="oculta(<%=nom[0]%>,'uno');"><img id="uno" class="couno" src="../IMG/MEMORAMA/Memorama.png"/></a>
       <a onclick="oculta(<%=nom[1]%>,'dos');"><img id="dos" class="codos" src="../IMG/MEMORAMA/Memorama.png"/></a>
        <a onclick="oculta(<%=nom[2]%>,'tres');"><img id="tres" class="cotres" src="../IMG/MEMORAMA/Memorama.png"/></a>
        <a onclick="oculta(<%=nom[3]%>,'cuatro');"><img id="cuatro" class="cocuatro" src="../IMG/MEMORAMA/Memorama.png"/></a>
        <a onclick="oculta(<%=nom[4]%>,'cinco');"><img id="cinco" class="coduno" src="../IMG/MEMORAMA/Memorama.png"/></a>
        <a onclick="oculta(<%=nom[5]%>,'seis');"><img id="seis" class="coddos" src="../IMG/MEMORAMA/Memorama.png"/></a>
        <a onclick="oculta(<%=nom[6]%>,'siete');"><img id="siete" class="codtres" src="../IMG/MEMORAMA/Memorama.png"/></a>
        <a onclick="oculta(<%=nom[7]%>,'ocho');"><img id="ocho" class="codcuatro" src="../IMG/MEMORAMA/Memorama.png" /> </a>
    </body>
</html>
