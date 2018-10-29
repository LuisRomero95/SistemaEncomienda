$(document).ready(function (){      
    
    $('#listarEmisor').change(function (){
        var nivel = $('#listarEmisor option:selected').val();
        $('#contenedor_emisor_id').val(nivel);
    });  
    
    
    $('#listarReceptor').change(function (){
        var nivel = $('#listarReceptor option:selected').text().trim();
        $('#contenedor_receptor_id').val(nivel);
    });  
    
    $('#calcular_precio').click(function (){
       window.open("SERVPrecio?action=insert", "InsertarPrecio", "width=400, height=200");
    });          
    
   
    
    var dateToday = new Date();
    var dates = $("#from").datepicker({
        defaultDate: "+1w",
        changeMonth: true,
        dateFormat: 'yy-mm-dd',
        numberOfMonths: 3,
        minDate: dateToday,
        onSelect: function(selectedDate) {
            var option = this.id === "from" ? "minDate" : "maxDate",
                instance = $(this).data("datepicker"),
                date = $.datepicker.parseDate(instance.settings.dateFormat || $.datepicker._defaults.dateFormat, selectedDate, instance.settings);
            dates.not(this).datepicker("option", option, date);
        }
    });    
    
    $('#insertar').click(function (){      
        
        var emisor = $('#listarEmisor').val().trim();
        var receptor = $('#listarReceptor').val().trim();
        var usuario = $('#listarUsuario').val().trim();
        var vehiculo = $('#listarVehiculo').val().trim();
        var precio = $('#precio_id').val().trim();
        var descipcion = $('#des_id').val();
        var estado = $('#listarEncomienda').val();  
          
        if ( emisor === '' ){
          alert('[ERROR] Seleccione un emisor');
          return false;
        }     
        else if ( receptor === '' ){
          alert('[ERROR] Seleccione un receptor');
          return false;
        }             
        else if ( usuario === '' ){
          alert('[ERROR] Seleccione un usuario');
          return false;
        }        
        else if ( vehiculo === '' ){
          alert('[ERROR] Seleccione un vehiculo');
          return false;
        }    
        else if ( precio === '' ){
            alert('[ERROR] Calcule el precio');
            return false;
        }            
        else if ( descipcion === null || descipcion.length === 0 || /^\s+$/.test(descipcion)){
            alert('[ERROR] La descripción no puede quedar vacio');
            return false;
        } 
        else if ( estado === '' ){
            alert('[ERROR] Seleccione el estado');
            return false;
        }                      
          return true;
     });
});      