
$(document).ready(function (){
    
    $('#nom_id').keypress(function (e) {
       key = e.keyCode || e.which;
       tecla = String.fromCharCode(key).toLowerCase();
       letras = "áéíóúabcdefghijklmnñopqrstuvwxyz";
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
    
        //Limpia el input si ingresa digitos
    $( "#nom_id" ).blur(function() {
        var val = $('#nom_id').val();
        var tam = val.length;
        for(i = 0; i < tam; i++) {
            if(!isNaN(val[i]))
                document.getElementById("nom_id").value = '';
        }
    });
    
    $("#nom_id").keyup(function() {
       $(this).val($(this).val().toLowerCase());
    });
    
     $("#nom_id").keyup(function(){
            $nombre = $('#nom_id').val(); 
            $.post("SERVTipoUsuario", {
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
        
        if( nombre === null || nombre.length === 0 || /^\s+$/.test(nombre) ) {
              alert('[ERROR] El tipo de usuario no puede quedar vacío.');
              return false;
        }
        else if( !(nombre.length <=25) || /^\s+$/.test(nombre) ) {
              alert('[ERROR] El tipo de usuario debe tener máximo 25 dígitos.');
              return false;
        }
        else if((nombre !== contenedorNombre) && (respuestaNombre !== condicion)){            
            alert('[ERROR] El nuevo nombre a registrar ya lo tiene otro tipo de usuario');
            return false;
        }            
        else             
        
          // Si el script ha llegado a este punto, todas las condiciones
          // se han cumplido, por lo que se devuelve el valor true
          return true;
         
        
    });
    
});
