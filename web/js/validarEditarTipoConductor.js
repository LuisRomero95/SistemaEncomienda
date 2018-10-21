
$(document).ready(function (){
    
    $('#nom_id').keypress(function (e) {
       key = e.keyCode || e.which;
       tecla = String.fromCharCode(key).toLowerCase();
       letras = "áéíóúabcdefghijklmnñopqrstuvwxyz123456789";
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
            $nombre = $('#nom_id').val(); 
            $.post("SERVTipoConductor", {
                nnombre: $nombre
            }, function(data) {               
                    $("#ReportarNombre").html(data);
            });
    });    
    
    $('#editar').click(function (){
        var nombre = $('#nom_id').val();    
        var respuestaNombre = $('#ReportarNombre').text().trim();
        var contenedorNombre = $('#contenedorNombre').val();
        var condicion = 'Libre';
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
        else if((nombre !== contenedorNombre) && (respuestaNombre !== condicion)){            
            alert('[ERROR] El nuevo nombre a registrar ya lo tiene otro tipo de conductor');
            return false;
        }        
   
        
          // Si el script ha llegado a este punto, todas las condiciones
          // se han cumplido, por lo que se devuelve el valor true
          return true;     
          
    });    
});
    