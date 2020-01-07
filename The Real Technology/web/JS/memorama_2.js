var count = 0;
function instrucciones(){
    window.setTimeout(dilas,1000);
}
function dilas(){
    document.getElementById('instrucciones').className = 'instrucciones';
    document.getElementById('dialogo').className = 'dialogo';
    document.getElementById('dialogo').innerHTML = '<br/>Hola, bienvenido a mi juego de memoria, estoy ansioso de poder contigo<br/><input type="button" value="siguiente" onclick="habla();"/>'
    document.getElementById('globo').className = 'globo';
    document.getElementById('globo').style.height = (document.getElementById('dialogo').offsetHeight+10)+"px";
    document.getElementById('globo').style.width = (document.getElementById('dialogo').offsetWidth+80)+"px";
}
function habla(){
    var mistring;
    switch(count)
    {
        case 0:
            mistring = '<br/>Pero primero lo primero, te enseñaré a jugar<br/><input type="button" value="siguiente" onclick="habla();"/>';
            count++;
        break;
        case 1:
            mistring = '<br/>El objetivo del juego es encontrar la bandera y su nombre correspondiente<br/><input type="button" value="siguiente" onclick="habla();"/>';
            count++;
        break;
        case 2:
            mistring = '<br/>Para esto deberás hacer clic sobre 2 de las "fichas" que se te presentan<br/><center><img height="200px" title="ficha" src="IMG/MEMORAMA/Memorama.png"></center><br/><input type="button" value="siguiente" onclick="habla();"/>';
            count++;
        break;
        case 3:
            mistring = '<br/>Suena sencillo ¿cierto? pero ojo, tienes límite de tiempo, si el tiempo se acaba, pierdes,<br/>pero no te preocupes, si consigues encontrar un par tu tiempo se incrementara<br/><input type="button" value="siguiente" onclick="habla();"/>';
            count++;
        break;
        case 4:
            mistring = '<br/>Bien, ahora que ya sabes todo esto ya deberías poder jugar, SUERTE y divierte<br/><input type="button" value="siguiente" onclick="termina();"/>';
        break;
    }
    document.getElementById('dialogo').innerHTML = mistring;
    document.getElementById('globo').style.height = (document.getElementById('dialogo').offsetHeight+10)+"px";
    document.getElementById('globo').style.width = (document.getElementById('dialogo').offsetWidth+85)+"px";
}
function termina(){
    document.getElementById('globo').style.opacity = 0;
    document.getElementById('dialogo').className = 'dialogo2';
    document.getElementById('instrucciones').className = 'instrucciones2';
    window.setTimeout(borra,2000);
}
function borra(){
    document.getElementById('inicio').innerHTML = "";
}
var img1 = "";
var img2 = "";
var num1;
var num2;
function oculta(laimg,num){
    if(num != num1)
    {
        document.getElementById(num).classList.add('oculta');
        if(img1 == "")
        {
            num1 = num;
            img1 = laimg;
            window.setTimeout(function(){document.getElementById(num1).classList.add('espera');
            document.getElementById(num1).classList.remove('oculta');},500);
        }
        else
        {
            num2 = num;
            img2 = laimg;
            window.setTimeout(function(){document.getElementById(num2).classList.add('espera');
            document.getElementById(num2).classList.remove('oculta');},500);
            if(img1 == img2)
            {
                img1 = "";
                img2 = "";
            }
            else
            {
                img1 = "";
                img2 = "";
                window.setTimeout(function(){document.getElementById(num1).classList.add('esconde');
                document.getElementById(num1).classList.remove('espera'); document.getElementById(num2).classList.add('esconde');
                document.getElementById(num2).classList.remove('espera');},500);
            }
        }
    }
    else
    {
        
    }
}
