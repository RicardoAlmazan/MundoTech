
function next() {
    var inputNombre = document.getElementById('direccion');
    var nombre = document.getElementById('nombreDiv');
    var lat = document.getElementById('lat');
    var lon = document.getElementById('lon');
    var mapa = document.getElementById('elMapa');
    var capital = document.getElementById('capitalDiv');
    var but = document.getElementById('boton');
    var enviar = document.getElementById('enviar');
    
    if(inputNombre != ""){
    if(nombre.isVisible = true){
    
    nombre.className = 'hide';
    lat.className = 'hide';
    lon.className = 'hide';
    mapa.className = 'hide';
    but.className ="hide";
    capital.className = "form-group show";
    enviar.className = "form-group show";
}
    } else {
        
    }
}
