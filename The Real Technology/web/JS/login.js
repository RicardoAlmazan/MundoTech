var nivel = document.getElementById('nivel');
var paterno = document.getElementById('paterno');
var gametag = document.getElementById('gametag');
var nombre = document.getElementById('nombre');
var mail = document.getElementById('email');

var contra = document.getElementById('contra');
var ncontra = document.getElementById('ncontra');
var imagen = document.getElementById('imagen');
function validarFormulario() {
    var valido = true;
    //Validando que ningún campo quede vacío

    if (ncontra.value == "") {
        document.getElementById("nContraDiv").className = "form-group has-error has-feedback";
        document.getElementById("errornContra").className = "form-control-static glyphicon glyphicon-remove form-control-feedback";
        ncontra.focus();
        valido = false;

    } else {
        document.getElementById("nContraDiv").className = "form-group has-success has-feedback";
        document.getElementById("errornContra").className = "glyphicon glyphicon-ok form-control-feedback";
        valido = validarContra();
    }
    if (contra.value == "") {
        document.getElementById("contraDiv").className = "form-group has-error has-feedback";
        document.getElementById("errorContra").className = "glyphicon glyphicon-remove form-control-feedback";
        contra.focus();
        valido = false;
    } else {
        document.getElementById("contraDiv").className = "form-group has-success has-feedback";
        document.getElementById("errorContra").className = "glyphicon glyphicon-ok form-control-feedback";
        valido = validarContra();
    }
    
    if (mail.value == "") {
        document.getElementById("emailDiv").className = "form-group has-error has-feedback";
        document.getElementById("errorEmail").className = "glyphicon glyphicon-remove form-control-feedback";
        mail.focus();
        valido = false;
    } else {
        document.getElementById("emailDiv").className = "form-group has-success has-feedback";
        document.getElementById("errorEmail").className = "glyphicon glyphicon-ok form-control-feedback";
    }

    if (gametag.value == "") {
        document.getElementById("gametagDiv").className = "form-group has-error has-feedback";
        document.getElementById("errorGametag").className = "glyphicon glyphicon-remove form-control-feedback";
        gametag.focus();
        valido = false;
    } else {
        document.getElementById("gametagDiv").className = "form-group has-success has-feedback";
        document.getElementById("errorGametag").className = "glyphicon glyphicon-ok form-control-feedback"
    }
    if (paterno.value == "") {
        document.getElementById("paternoDiv").className = "form-group has-error has-feedback";
        document.getElementById("errorPaterno").className = "form-control-static glyphicon glyphicon-remove form-control-feedback";
        paterno.focus();
        valido = false;
    } else {
        document.getElementById("paternoDiv").className = "form-group has-success has-feedback";
        document.getElementById("errorPaterno").className = "glyphicon glyphicon-ok form-control-feedback";
    }

    if (nombre.value == "") {
        document.getElementById("nombreDiv").className = "form-group has-error has-feedback";
        document.getElementById("errorNombre").className = "glyphicon glyphicon-remove form-control-feedback";
        nombre.focus();
        valido = false;
    } else {
        document.getElementById("nombreDiv").className = "form-group has-success has-feedback";
        document.getElementById("errorNombre").className = "glyphicon glyphicon-ok form-control-feedback";
    }

    var nivelSelect = "";
    if (nivel.value == 0) {
        alert('Seleccione una opción.');
        nivel.focus();
        valido = false;
    } else {
        nivelSelect = nivel.value;
        /*document.getElementById("niv").value= nivelSelect;*/
    }
    
    if(nombre.indexOf("\'") != -1)
        valido = false;
    
    if(paterno.indexOf("\'") != -1)
        valido = false;
    if(paterno.indexOf("\'") != -1)
        valido = false;

    if (valido)
    {
        alert('Enviando datos...');
        detector();
        document.formulario1.submit();
        
    }




}

function validarContra() {
    if (contra.value != ncontra.value) {
        document.getElementById("errorContraN").innerHTML = "<label class='control-label'>Las contraseñas no coinciden</label>";
        document.getElementById("errorContraN").className = "form-group has-error";
        document.getElementById("nContraDiv").className = "form-group has-error has-feedback";
        document.getElementById("contraDiv").className = "form-group has-error has-feedback";
        document.getElementById("errorContra").className = "glyphicon glyphicon-remove form-control-feedback";
        document.getElementById("errornContra").className = "form-control-static glyphicon glyphicon-remove form-control-feedback"
        ncontra.focus();
        return false;
    } else {
        document.getElementById("contraDiv").className = "form-group has-success has-feedback";
        document.getElementById("errorContra").className = "glyphicon glyphicon-ok form-control-feedback";
        document.getElementById("nContraDiv").className = "form-group has-success has-feedback";
        document.getElementById("errornContra").className = "glyphicon glyphicon-ok form-control-feedback";

        return true;

    }

}



function presionaLetras(e)
{
    key = e.keyCode || e.which;
    tecla = String.fromCharCode(key).toLowerCase();
    letras = " áéíóúabcdefghijklmnñopqrstuvwxyz";
    especiales = "8-37-39-46";
    tecla_especial = false
    for (var i in especiales) {
        if (key == especiales[i]) {
            tecla_especial = true;
            break;
        }
    }

    if (letras.indexOf(tecla) == -1 && !tecla_especial) {
        alert('Escribe solo letras.');
        return false;
    }
}

function sinEspeciales(e)
{
    key = e.keyCode || e.which;
    tecla = String.fromCharCode(key).toLowerCase();
    letras = "áéíóúabcdefghijklmnñopqrstuvwxyz0123456789";
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

function soloNumeros(e) {
    key = e.keyCode || e.which;
    tecla = String.fromCharCode(key).toLowerCase();
    letras = "0123456789";
    especiales = [8, 37, 39, 46];
    tecla_especial = false
    for (var i in especiales) {
        if (key == especiales[i]) {
            tecla_especial = true;
            break;
        }
    }

    if (letras.indexOf(tecla) == -1 && !tecla_especial) {
        alert('Escribe solo números.');
        return false;
    }


}

function html_encode(string) {
    var ret_val = '';
    for (var i = 0; i < string.length; i++) { 
        if (string.codePointAt(i) > 127) {
            ret_val += '&#' + string.codePointAt(i) + ';';
        } else {
            ret_val += string.charAt(i);
        }
    }
    return ret_val;
}


function validarEmail(email) {
    expr = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if (!expr.test(email)) {
        alert("Error: La dirección de correo " + email + " es incorrecta.");
        mail.focus();
    }
}

function validaImagen(tField, iType) {
    file = tField.value;
    if (iType == 1) {
        extArray = new Array(".jpg", ".png", ".gif");
    }
    
    allowSubmit = false;
    if (!file)
        return;
    while (file.indexOf("\\") != - 1)
        file = file.slice(file.indexOf("\\") + 1);
    ext = file.slice(file.indexOf(".")).toLowerCase();
    for (var i = 0; i < extArray.length; i++) {
        if (extArray[i] == ext) {
            allowSubmit = true;
            break;
        }
    }
    if (allowSubmit) {
    } else {
        tField.value = "";
        alert("Usted sólo puede subir archivos con extensiones " + (extArray.join(" ")) + "\nPor favor seleccione un nuevo archivo");
    }
}  

function detector() {
var formulario = document.forms[0];
for (var i = 0; i < formulario.radio.length; i++) {
if (formulario.radio[i].checked) {
break;
}
}
/*alert('el marcado es: ' + formulario.radio[i].value + '.')*/
document.getElementById("sex").value = formulario.radio[i].value;
}
