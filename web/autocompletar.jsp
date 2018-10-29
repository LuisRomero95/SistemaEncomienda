<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Autocomplete - Default functionality</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  <script>
  $(document).ready( function (){
    var availableTags = [];
    
    $("#tags").bind("keydown", function(event) {
       var data = { nombre:$("#tags").val()} ;
       $.getJSON("SERVCliente?action=buscar", data, function (res, est, jqXHR){
          availableTags.length = 0;
          $.each(res, function (i, item){
              availableTags[i] = item;
          });
       });
    });
    
    $( "#tags" ).autocomplete({
      source: availableTags,
      minLength : 1
    });
  } );

  </script>
</head>
<body>
 
<div class="ui-widget">
  <label for="tags">Tags: </label>
  <input id="tags">
  <input type="button" id="btn_buscar" value="Buscar">
</div>
 
 
</body>
</html>