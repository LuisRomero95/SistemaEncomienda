
$(document).ready(function (){
            
    $('#nom_id, #ape_id').keypress(function (e) {
       key = e.keyCode || e.which;
       tecla = String.fromCharCode(key).toLowerCase();
       letras = " áéíóúabcdefghijklmnñopqrstuvwxyz";
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

    //Solo numeros
    $('#tel_id, #dni_id').keypress(function (a) {
        key = a.keyCode || a.which;
        tecla = String.fromCharCode(key).toLowerCase();
        letras = "0123456789";
        especiales = "8-37-39-46";

        tecla_especial = false;
        for(var i in especiales){
             if(key === especiales[i]){
                 tecla_especial = true;
                 break;
             }
         }
    });        

    //limpiar n
    $( "#tel_id, #dni_id" ).blur(function() {
        var val = $('#tel_fij_id').val();        
        var val2 = $('#ruc_dni_id').val();
        var tam = val.length;
        var tam2 = val2.length;
        for(i = 0; i < tam; i++) {
            if(isNaN(val[i]))
                document.getElementById("tel_id").value = '';                
        }
        for(i = 0; i < tam2; i++) {
            if(isNaN(val2[i]))
                document.getElementById("dni_id").value = '';                
        }        
    });


    $("#email_id").keyup(function() {
       $(this).val($(this).val().toLowerCase());
    });


    $("#dni_id").keyup(function(){
            $dni = document.getElementById("dni_id").value;
            $.post("SERVAyudante", {ddni:$dni}, function(data) {               
                    $("#ReportarDni").html(data);
            });
    }); 
    
    $("#email_id").keyup(function(){
            $email = document.getElementById("email_id").value;
            $.post("SERVAyudante", {eemail:$email}, function(data) {               
                    $("#ReportarEmail").html(data);
            });
    });      
    
    $('#editar').click(function (){                             
        var dni = $('#dni_id').val(); 
        var nombre = $('#nom_id').val(); 
        var ape = $('#ape_id').val();
        var email = $('#email_id').val();           
        var celular = $('#tel_id').val();                  
        var direcion = $('#direc_id').val();
        var respuestaDni = $('#ReportarDni').text().trim();
        var respuestaEmail = $('#ReportarEmail').text().trim();        
        var contenedorDni = $('#contenedorDni').val();
        var contenedorEmail = $('#contenedorEmail').val();
        var condicion = 'Libre';   
                    
       if (nombre === null || nombre.length === 0 || /^\s+$/.test(nombre) ) {
            alert('[ERROR] El nombre no puede quedar vacio');
            return false;
            }
        else if (!isNaN(nombre) || /^\s+$/.test(nombre) ) {
            alert('[ERROR] El nombre no puede tener números');
            return false;
            }        
        else if (ape === null || ape.length === 0 || /^\s+$/.test(ape) ) {
            alert('[ERROR] El apellido no puede quedar vacio');
            return false;
        }
        else if (!isNaN(ape) || /^\s+$/.test(ape) ) {
            alert('[ERROR] El apellido no puede tener números');
            return false;
        }                  
        else if( dni === null || dni.length === 0 || /^\s+$/.test(dni) ) {
            alert('[ERROR] El dni no puede quedar vacio.');
            return false;
        }          
        else if(  !(dni.length === 8) || /^\s+$/.test(dni) ) {
            alert('[ERROR] El dni debe tener un valor máximo de 8 dígitos.');
            return false;
        }
        else if((dni !== contenedorDni) && (respuestaDni !== condicion)){            
            alert('[ERROR] El nuevo dni a registrar ya lo tiene otro ayudante');
            return false;
        }           
        else if (email ===  null || email.length ===  0 || /^\s+$/.test(email) ) {
            alert('[ERROR] El email no puede quedar vacío');
            return false;
        }               
        else if (!(/^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i.test(email))) {
            alert('[ERROR] Ingrese un email con formato adecuado');
            return false;
        }
        else if((email !== contenedorEmail) && (respuestaEmail !== condicion)){            
            alert('[ERROR] El nuevo email a registrar ya lo tiene otro ayudante');
            return false;
        }         
        else if (!(/^\d{9}$/.test(celular)) ) {
            alert('[ERROR] El celular debe tener 9 digitos');
            return false;
        }      
        else if (direcion === null || direcion.length === 0 || /^\s+$/.test(direcion)) {
            alert('[ERROR] El campo direccion no puede quedar vacío');
            return false;
        }  
        else if (!(direcion.length <=50)|| /^\s+$/.test(direcion) ) {
            alert('[ERROR] La dirección no puede tener más de 50 dígitos');
            return false;
        }                

        return true;        
     });
});
