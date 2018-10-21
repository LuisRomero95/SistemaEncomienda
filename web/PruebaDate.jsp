<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>        
        <title>JSP Page</title>
    </head>

    <body>
        <h1>Hello World!</h1>
        
        
<label for="from">hi</label>
<input type="text" id="from" name="from">
<label for="to">to</label>
<input type="text" id="to" name="to" ><br>


Contenedor envio;
<input type="text" id="envio">

    </body>
    
    <script >
$(document).ready(function (){
    
    
    $('#from').keypress(function (){
        var nivel = $('#from').text().trim();
        $('#envio').val(nivel);
    });       
    
    
    var dateToday = new Date();
    var dates = $("#from, #to").datepicker({
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
    
    
});


    </script>    
</html>
