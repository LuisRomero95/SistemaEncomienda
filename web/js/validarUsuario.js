
$(document).ready(function (){        
    //Pasa la texto de la opcion al input
    //Si no añado trim, mi nivel sale despues de espacios en blanco
    $('#listarNivel').change(function (){
        var nivel = $('#listarNivel option:selected').text().trim();
        $('#nivel_id').val(nivel);
    });       
    
    //Solo letras cuando se digita
    $('#nom_id').keypress(function (e) {
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
    
    //Limpia el input si ingresa digitos
    $( "#nom_id" ).blur(function() {
        var val = $('#nom_id').val();
        var tam = val.length;
        for(i = 0; i < tam; i++) {
            if(!isNaN(val[i]))
                document.getElementById("nom_id").value = '';
        }
    });
    
    //Convierte a minuscula lo que digitas digito por digito
    $("#nom_id, #email_id").keyup(function() {
       $(this).val($(this).val().toLowerCase());
    });
    
    $("#nom_id").keyup(function(){
            $nombre = document.getElementById("nom_id").value;
            $.post("SERVUsuario", {nnombre:$nombre}, function(data) {               
                    $("#ReportarNombre").html(data);
            });
    });    
    
    $("#email_id").keyup(function(){
            $email = document.getElementById("email_id").value;
            $.post("SERVUsuario", {eemail:$email}, function(data) {               
                    $("#ReportarEmail").html(data);
            });
    });      
    
    $('#insertar').click(function (){
        var nombre = $('#nom_id').val();
        var contra = $('#contra_id').val();
        var email = $('#email_id').val(); 
        var indice = $('#listarNivel').val().trim();
        var respuestaNombre = $('#ReportarNombre').text().trim();
        var respuestaEmail = $('#ReportarEmail').text().trim();
        var condicion = 'Ya existe';     
        
        
        if( nombre === null || nombre.length === 0 || /^\s+$/.test(nombre) ) {
              alert('[ERROR] El campo nombre no puede quedar vacío');
              return false;              
        }else if(!(nombre.length <=25) || /^\s+$/.test(nombre)){
            alert('[ERROR] El nombre no puede exceder los 25 dígitos');
            return false;
        }
        else if(respuestaNombre === condicion){
            alert('[ERROR] Ingrese un nombre que no este registrado');
            return false;
        }        
        else if (contra ===  null || contra.length ===  0 || /^\s+$/.test(contra) ) {
          alert('[ERROR] La contraseña no puede quedar vacío');
          return false;
        }
        else if ( !(contra.length <=20) || /^\s+$/.test(contra) ) {
          alert('[ERROR] La contraseña debe tener un valor máximo de 20 dígitos');
          return false;
        }
        else if (email ===  null || email.length ===  0 || /^\s+$/.test(email) ) {
          alert('[ERROR] El email no puede quedar vacío');
          return false;
        }        
        else if ( !(email.length <=50) || /^\s+$/.test(email) ) {
          alert('[ERROR] El email debe tener un valor máximo de 50 dígitos');
          return false;
        }        
        else if (!(/^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i.test(email))) {
          alert('[ERROR] Ingrese un email con formato adecuado');
          return false;
        }
        else if(respuestaEmail === condicion){
            alert('[ERROR] Ingrese un email que no este registrado');
            return false;
        }          
        else if ( indice === '' ){
          alert('[ERROR] Seleccione una opción');
          return false;
        }        

        return true;
                        
    });
});