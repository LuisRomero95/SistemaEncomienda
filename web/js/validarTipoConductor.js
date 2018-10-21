
$(document).ready(function (){
    
    $('#nom_id').keypress(function (e) {
       key = e.keyCode || e.which;
       tecla = String.fromCharCode(key).toLowerCase();
       letras = "abcdefghijklmnñopqrstuvwxyz123456789";
       especiales = "8-37-39-46";

       tecla_especial = false;
       for(var i in especiales){
            if(key === especiales[i]){
                tecla_especial = true;
                break;
            }
        }

        if(letras.indexOf(tecla)===-1 && !tecla_especial){
            return false;
        }
    });
        
    $("#nom_id").keyup(function() {
       $(this).val($(this).val().toLowerCase());
    });    
    
    $("#nom_id").keyup(function(){
            $nombre = document.getElementById("nom_id").value;
            $.post("SERVTipoConductor", {nnombre:$nombre}, function(data) {               
                    $("#ReportarNombre").html(data);
            });
    });      
    
    $('#insertar').click(function (){
        var nombre = $('#nom_id').val();
        var respuestaNombre = $('#ReportarNombre').text().trim();
        var condicion = 'Ya existe';             
        cadena = "^[a-z][0-9]"; 
        re = new RegExp(cadena);
        
        if( nombre === null || nombre.length === 0 || /^\s+$/.test(nombre) ) {
            alert('[ERROR] El tipo de conductor no puede quedar vacío');
            return false;              
        }else if(!(nombre.length <=2) || /^\s+$/.test(nombre)){
            alert('[ERROR] El tipo de conductor no puede exceder de los 2 caracteres');
            return false;
        }
        else if (!(nombre.match(re))){
            alert('[ERROR] Sólo se permite una letra seguido de un número');
            return false;
        } 
        else if(respuestaNombre === condicion){
            alert('[ERROR] Ingrese un nombre que no este registrado');
            return false;
        }            
        
          // Si el script ha llegado a este punto, todas las condiciones
          // se han cumplido, por lo que se devuelve el valor true
          return true;     
          
    });    
});
    