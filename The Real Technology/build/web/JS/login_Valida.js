var nombre = document.getElementById('username');
var contra = document.getElementById('password');



function valida(){
    
    var valido = true;
    
    if (contra.value == "") {
        
        contra.focus();
        valido = false;
    }
    
    if (nombre.value == ""){
        
        nombre.focus();
        valido = false;
    }
    
    if(nombre.indexOf("\'") != -1)
        valido = false;
    if(contra.indexOf("\'") != -1)
        valido = false;
    
     if (valido)
    {
        nombre.value = escape(nombre.value);
        contra. value = escape(contra.value);
        
                
    }
    
    return valido;
}

function sinEspeciales(e)
{
    key = e.keyCode || e.which;
    tecla = String.fromCharCode(key).toLowerCase();
    letras = " áéíóúabcdefghijklmnñopqrstuvwxyz0123456789";
    especiales = "8-13-37-39-46";
    tecla_especial = false
    for (var i in especiales) {
        if (key == especiales[i]) {
            tecla_especial = true;
            break;
        }
    }

    if (letras.indexOf(tecla) == -1 && !tecla_especial) {
        alert('No escribas caracteres especiales');
        return false;
    }
}
