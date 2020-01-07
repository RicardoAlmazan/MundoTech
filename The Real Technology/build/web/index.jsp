<%-- 
    Document   : index
    Created on : 14-abr-2016, 17:16:57
    Author     : The Real Technology
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if (IE 7)&!(IEMobile)]><html class="no-js lt-ie9 lt-ie8" lang="en"><![endif]-->
<!--[if (IE 8)&!(IEMobile)]><html class="no-js lt-ie9" lang="en"><![endif]-->
<!--[if (IE 9)]><html class="no-js ie9" lang="en"><![endif]-->
<!--[if gt IE 8]><!--> <html lang=""> <!--<![endif]-->
    <head>
        <link rel="icon" type="image/png" href="IMG/logo.png" />
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
        <!-- This section is for Splash Screen -->
        <div class="ole">
            <section id="jSplash">
                <div id="circle"></div>
            </section>
        </div>
        <!-- End of Splash Screen -->
        <!-- Carrusel -->
        <div id="home-slider">	
            <div class="overlay">
            </div>
            <div class="slider-text">
                <div id="slidecaption">
                </div>
            </div>   
            <div class="control-nav">
                <ul id="slide-list"></ul>       
                <a id="nextsection" href="#work"><i class="font-icon-arrow-simple-down"></i></a>
            </div>
        </div>
        <!-- Carrusel -->
        <!-- Menu -->
        <header>
            <div class="sticky-nav">
                <a id="mobile-nav" class="menu-nav" href="#menu-nav"></a>
                <div id="logo">
                    <a id="goUp" href="#home-slider" title="The Real Technology">The Real Technology</a>
                </div>
                <nav id="menu">
                    <ul id="menu-nav">
                        <li class="current"><a href="#home-slider">Inicio</a></li>
                        <li><a href="#work">Nuestro Trabajo</a></li>
                        <li><a href="#about">Sobre Nosotros</a></li>
                        <li><a href="#contact">Contáctanos</a></li>
                        <li><a href="mapa.jsp" class="external">MundoTech</a></li>
                    </ul>
                </nav>
            </div>
        </header>
        <!-- Menu -->
        <!-- Nuestro Trabajo -->
        <div id="work" class="page">
            <div class="container">
                <!-- Titulo -->
                <div class="row">
                    <div class="span12">
                        <div class="title-page">
                            <h2 class="title">Nuestro Trabajo</h2>
                        </div>
                    </div>
                </div>
                <!-- Titulo -->
                <!-- Nuestra Empresa -->
                <div class="row">
                    <div class="span3">
                        <!-- Empresa -->
                        <nav id="options" class="work-nav">
                            <ul id="filters" class="option-set" data-option-key="filter">
                                <li class="type-work"></li>
                                <li><a href="#filter" data-option-value="*" class="selected">Empresa</a></li>
                            </ul>
                        </nav>
                        <!-- Empresa -->
                    </div>
                    <div class="span9">
                        <div class="row">
                            <section id="projects">
                                <ul id="thumbs">
                                    <!-- Mision -->
                                    <li class="item-thumbs span3 design">
                                        <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Misión" href="_include/img/work/full/business_2.jpg">
                                            <span class="overlay-img"></span>
                                            <span class="overlay-img-thumb font-icon-plus"></span>
                                        </a>
                                        <img src="_include/img/work/thumbs/mision.png" alt="Brindar a la sociedad un desarrollo integro, mediante el uso de nuestro software, el cual debera cumplir con los más grandes estandares de calidad para satisfacer las necesidades del cliente.">
                                    </li>
                                    <!-- Mision -->
                                    <!-- Vision -->
                                    <li class="item-thumbs span3 design">
                                        <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Visión" href="_include/img/work/full/business_8.jpg">
                                            <span class="overlay-img"></span>
                                            <span class="overlay-img-thumb font-icon-plus"></span>
                                        </a>
                                        <img src="_include/img/work/thumbs/vision.png" alt="Ser una empresa lider en el desarrollo de tecnologias computacionales para el año 2025.">
                                    </li>
                                    <!-- Vision -->
                                    <!-- Metas -->
                                    <li class="item-thumbs span3 design">
                                        <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Metas" href="_include/img/work/full/Business_1.jpg">
                                            <span class="overlay-img"></span>
                                            <span class="overlay-img-thumb font-icon-plus"></span>
                                        </a>
                                        <img src="_include/img/work/thumbs/metas.png" alt="Ser una empresa lider en el desarrollo de software.<br>
                                             Lograr un mayor alcance de nuestros productos.<br>
                                             Ser reconocidos a nivel mundial por nuestros productos amigables para el planeta.">
                                    </li>
                                    <!-- Metas -->
                                    <!-- Estrategias -->
                                    <li class="item-thumbs span3 photography">
                                        <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Estrategias" href="_include/img/work/full/business4.jpg">
                                            <span class="overlay-img"></span>
                                            <span class="overlay-img-thumb font-icon-plus"></span>
                                        </a>
                                        <img src="_include/img/work/thumbs/estrategias.png" alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
                                    </li>
                                    <!-- Estrategias -->
                                    <!-- Politicas -->
                                    <li class="item-thumbs span3 photography">
                                        <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Políticas" href="_include/img/work/full/business8.jpg">
                                            <span class="overlay-img"></span>
                                            <span class="overlay-img-thumb font-icon-plus"></span>
                                        </a>
                                        <img src="_include/img/work/thumbs/politicas.png" alt="En The Real damos un paso mas asumiendo nuestra responsabilidad global y local en congruencia con los principios de conducta. Como parte del Grupo, contribuimos con nuestros productos a que su desarrollo sea eficiente y practico. Nuestro objetivo es ser el número uno entre los desarrolladores mundiales de software.">
                                    </li>
                                    <!-- Politicas -->
                                    <!-- Valores -->
                                    <li class="item-thumbs span3 design">
                                        <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Valores" href="_include/img/work/full/business_9.jpg">
                                            <span class="overlay-img"></span>
                                            <span class="overlay-img-thumb font-icon-plus"></span>
                                        </a>
                                        <img src="_include/img/work/thumbs/valores.png" alt="Liderazgo.                      Pasión.<br>Responsabilidad.                      Trabajo en equipo.<br>Perseverancia.">
                                    </li>
                                    <!-- Valores -->
                                </ul>
                            </section>

                        </div>
                    </div>
                </div>
                <!-- Nuestra Empresa -->
            </div>
        </div>
        <!-- Nuestro Trabajo -->
        <!-- Sobre Nosotros -->
        <div id="about" class="page-alternate">
            <div class="container">
                <!-- Titulo -->
                <div class="row">
                    <div class="span12">
                        <div class="title-page">
                            <h2 class="title">Sobre Nosotros</h2>
                            <h3 class="title-description">Conoce más sobre el equipo </h3>
                        </div>
                    </div>
                </div>
                <!-- Titulo -->
                <!-- Personas -->
                <div class="row">
                    <!-- Zuñiga-->
                    <div class="span4 profile">
                        <div class="image-wrap">
                            <div class="hover-wrap">
                                <span class="overlay-img"></span>
                                <span class="overlay-text-thumb">Director General</span>
                            </div>
                            <img src="_include/img/profile/Alvaro-j.jpg" alt="Alvaro Zuñiga" alt="Zuñiga Pineda Alvaro">
                        </div>
                        <h3 class="profile-name">Zuñiga Pineda Alvaro</h3>
                        <p class="profile-description">Alvaro Zúñiga Pineda se unió a The Real Technology desde sus inicios. Colaboró con el desarrollo de "DibuTech" en la parte de la programación. Empezó como programador y su esfuerzo lo ha llevado a posicionarse como director de la empresa. </p>
                        <div class="social">
                            <ul class="social-icons">
                                <li><a href="#"><i class="font-icon-social-twitter"></i></a></li>
                                <li><a href="#"><i class="font-icon-social-facebook"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- Zuñiga -->
                    <!-- Almazan -->
                    <div class="span4 profile">
                        <div class="image-wrap">
                            <div class="hover-wrap">
                                <span class="overlay-img"></span>
                                <span class="overlay-text-thumb">Programador</span>
                            </div>
                            <img src="_include/img/profile/Richie-j.png" alt="Ricardo Almazan" alt="Almazan Trejo Ricardo">
                        </div>
                        <h3 class="profile-name">Almazan Trejo Ricardo</h3>
                        <p class="profile-description">Ricardo Alejandro Almazán Trejo se unió a The Real Technology días después de su fundación. Ha colaborado en la realización de proyectos como "DibuTech" en donde fungió como programador y además de todo, diseñador.</p>

                        <div class="social">
                            <ul class="social-icons">
                                <li><a href="#"><i class="font-icon-social-twitter"></i></a></li>
                                <li><a href="#"><i class="font-icon-social-facebook"></i></a></li>
                                <li><a href="#"><i class="font-icon-social-email"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- Almazan -->
                    <!-- Torres -->
                    <div class="span4 profile">
                        <div class="image-wrap">
                            <div class="hover-wrap">
                                <span class="overlay-img"></span>
                                <span class="overlay-text-thumb">Programador</span>
                            </div>
                            <img src="_include/img/profile/Alan-j.jpg" alt="Torres Farias Alan">
                        </div>
                        <h3 class="profile-name">Torres Farias Alan</h3>
                        <p class="profile-description">Alan Torres Farias se unió a The Real Technology en Febrero de 2016 actualmente se desempeña como programador y diseñador. Antes de unirse a nuestro equipo, en 2015 trabajó como programador en el desarrollo de Sophy para Proyecto Devol.</p>

                        <div class="social">
                            <ul class="social-icons">
                                <li><a href="#"><i class="font-icon-social-twitter"></i></a></li>
                                <li><a href="#"><i class="font-icon-social-facebook"></i></a></li>
                                <li><a href="#"><i class="font-icon-social-google-plus"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- Torres -->
                    <br/><br/><br/>
                    <!-- Loth -->
                    <div class="span4 profile">
                        <div class="image-wrap">
                            <div class="hover-wrap">
                                <span class="overlay-img"></span>
                                <span class="overlay-text-thumb">Analista</span>
                            </div>
                            <img src="_include/img/profile/Taf-j.png" alt="Alan Loth Perez Tafoya">
                        </div>
                        <h3 class="profile-name">Alan Loth Perez Tafoya</h3>
                        <p class="profile-description">Alan Loth Perez Tafoya es uno de los fundadores de The Real Technology. Desde los inicios de esta empresa, ha desarrollado es papel de analista y tester. Su papel ha sido fundamental en desarrollo de softwares como lo es "DibuTech"</p>
                        <div class="social">
                            <ul class="social-icons">
                                <li><a href="#"><i class="font-icon-social-twitter"></i></a></li>
                                <li><a href="#"><i class="font-icon-social-facebook"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- Loth -->
                </div>
                <!-- Personas -->
            </div>
        </div>
        <!-- Sobre Nosotros -->
        <!-- Contactanos -->
        <div id="contact" class="page">
            <div class="container">
                <!-- Titulo -->
                <div class="row">
                    <div class="span12">
                        <div class="title-page">
                            <h2 class="title">Contáctanos</h2>
                            <h3 class="title-description">Tu opinión es importante.</h3>
                        </div>
                    </div>
                </div>
                <!-- Titulo -->
                <!-- Contact Form -->
                <div class="row">
                    <div class="span9">
                        <form id="contact-form" class="contact-form" action="#">
                            <p class="contact-name">
                                <input id="contact_name" type="text" placeholder="Nombre Completo" value="" name="name" />
                            </p>
                            <p class="contact-email">
                                <input id="contact_email" type="text" placeholder="Dirección de Correo Electronico" value="" name="email" />
                            </p>
                            <p class="contact-message">
                                <textarea id="contact_message" placeholder="Mensaje" name="message" rows="15" cols="40"></textarea>
                            </p>
                            <p class="contact-submit">
                                <a id="contact-submit" class="submit" href="#">Enviar</a>
                            </p>
                            <div id="response">
                            </div>
                        </form>
                    </div>
                    <div class="span3">
                        <div class="contact-details">
                            <h3>Contacto Directo</h3>
                            <ul>
                                <li><a href="#">TheRealTechnology2016@gmail.com</a></li>
                                <li><a href="#">TheRealTechnology2016@hotmail.com</a></li>
                                <li>(55) 45 66 77 65</li>
                                <li>
                                    The Real Technology
                                    <br>
                                    Mar Mediterraneo , 227
                                    <br>

                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- Contactanos -->
            </div>
        </div>
        <!-- End Contact Section -->
        <!-- Socialize -->
        <div id="social-area" class="page">
            <div class="container">
                <div class="row">
                    <div class="span12">
                        <nav id="social">
                            <ul>
                                <li><a href="https://twitter.com/The_Real_Techno" title="Síguenos en Twitter" target="_blank"><span class="font-icon-social-twitter"></span></a></li>
                                <li><a href="https://www.facebook.com/The-Real-Technology-1137866912900563/?__mref=message_bubble" title="Síguenos en Facebook" target="_blank"><span class="font-icon-social-facebook"></span></a></li>
                                <li><a href="https://plus.google.com/u/0/113400054013171870295?hl=es" title="Síguenos en Google Plus" target="_blank"><span class="font-icon-social-google-plus"></span></a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Socialize -->
        <!-- Footer -->
        <footer>
            <p class="credits">&copy;2016  <a title="The Real Technology">The Real Technology</a> 
            </p>
        </footer>
        <!-- End Footer -->
        <!-- Back To Top -->
        <a id="back-to-top" href="#">
            <i class="font-icon-arrow-simple-up"></i>
        </a>
        <!-- End Back to Top -->
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