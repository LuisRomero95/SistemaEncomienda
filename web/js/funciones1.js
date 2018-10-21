
function cargaDocumento1() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {

      obtenerValores1(this);

  };
  xhttp.open("GET", "https://vpic.nhtsa.dot.gov/api/vehicles/getallmakes?format=XML", true);
  xhttp.send();
}   
function obtenerValores1(xml) {
  var i;
  var xmlDoc = xml.responseXML;
  var table="<tr><th>Código</th><th>Alumnos</th></tr>";
  var x = xmlDoc.getElementsByTagName("AllVehicleMakes");
  for (i = 0; i <x.length; i++) { 
    table += "<tr><td>" +
    x[i].getElementsByTagName("Make_ID")[0].childNodes[0].nodeValue +
    "</td><td>" +
    x[i].getElementsByTagName("Make_Name")[0].childNodes[0].nodeValue +
    "</td><td>"
    ;
  }
  document.getElementById("info").innerHTML = table;
}
