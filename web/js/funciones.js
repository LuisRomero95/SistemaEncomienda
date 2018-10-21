$.ajax({
        url: "https://vpic.nhtsa.dot.gov/api/vehicles/getallmakes?format=XML",
        type: "GET",
        dataType: "XML",
        success: function cargaDocumento() {
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
              if (this.readyState == 4 && this.status == 200) {
                obtenerValores(this);
              }
            };
            xhttp.open(type, url, true);
            xhttp.send();
        },  
        error: function()
        {

        }
});

function obtenerValores(xml) {
    var i;
    var xmlDoc = xml.responseXML;
    var table="<tr><th>Código</th><th>Nombre</th></tr>";
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