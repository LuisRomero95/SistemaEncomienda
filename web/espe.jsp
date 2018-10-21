<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <!-- Charset -->
    <meta charset="utf-8">
    <!-- Stylesheets -->
    <link rel="stylesheet" href="https://www.olvacourier.com/nuevcalc/assets/css/stylecalc.css">
    <!-- Scripts -->
    <script src="https://www.olvacourier.com/nuevcalc/vendor/jquery/jquery.min.js"></script>
</head>

<body>
    <div class="cajacalc">
        <form id="frm_contactenos">
    <h2>1. ¿A dónde lo llevamos?</h2>
    <select id="departments" name="departments">
        <option value="">SELECCIONE UN DEPARTAMENTO</option>
            </select>
    <select id="provinces" name="provinces">
        <option value="">NO HA SELECCIONADO UN DEPARTAMENTO</option>
    </select>
    <select id="districts" name="districts">
        <option value="">NO HA SELECCIONADO UNA PROVINCIA</option>
    </select>
    <h2>2. ¿Lo recogemos?</h2>
    <select id="recojo" name="recojo">
        <option value="sin">SIN RECOJO</option>
        <option value="con">CON RECOJO</option>
    </select>

    <h2>3. ¿Qué envías?</h2><div id="radios">
        <div class="cajandaud">
            <input name="type" id="sobres" value="SOBRE" checked="" type="radio">
            <label for="sobres" class="material-icons">
                <p class="qoutnua">Sobres</p>
                <span><img src="https://www.olvacourier.com/wp-content/uploads/2017/08/asdasd.png" alt="box" style="width: 50px;height: 50px;"></span>
            </label>
        </div>
        <div class="cajandaud">
            <input name="type" id="paquetes" value="PAQUETE" type="radio"><label for="paquetes" class="material-icons">
                <p class="qoutnua">Paquetes</p>
                <span><img src="https://www.olvacourier.com/wp-content/uploads/2017/08/cajadea.png" alt="box" style="width: 50px;height: 50px;"></span>
            </label>
        </div>
    </div>
    <h2>4. ¿Cuánto Pesa?</h2>
    <input id="weight" name="weight" step="any" min="1" value="1" placeholder="Ingrese el Peso" type="number">
    <span id="gr-type" style="display: inline-block;" hidden="">GRAMOS (GR)</span>
    <select id="unit" name="unit" style="display: none;">
        <option value="KG">KILOGRAMOS (KG)</option>
        <option value="GR">GRAMOS (GR)</option>
    </select>
    <div id="alert"></div>
    <div id="measures" style="display: none;">
        <div class="separnta"></div>
        <h2 class="titut">5. ¿Y cuánto mide?</h2>
        <span class="mimimi" data-tooltip="El costo de un envío puede ser afectado si la cantidad de espacio que éste ocupa es mayor que su peso real. A esto se le llama Peso Volumen. PV=(Largo * Ancho * Alto ) / 6000" data-tooltip-position="right"></span>
        <span class="mimimi2" data-tooltip="El costo de un envío puede ser afectado si la cantidad de espacio que éste ocupa es mayor que su peso real. A esto se le llama Peso Volumen. PV=(Largo * Ancho * Alto ) / 6000" data-tooltip-position="bottom"></span>
        <div class="separnta"></div>
        <div class="divmed" align="center">
            <img class="imgbox" src="https://www.olvacourier.com/nuevcalc/assets/images/misc/ancho.png" alt="ancho-caja">
            <input class="medan" id="width" name="width" step="0.01" min="1" value="" placeholder="Ingrese el Ancho (cm)" type="number">
        </div>
        <div class="divmed" align="center">
            <img class="imgbox" src="https://www.olvacourier.com/nuevcalc/assets/images/misc/largo.png" alt="largo-caja">
            <input class="medla" id="large" name="large" step="0.01" min="1" value="" placeholder="Ingrese el Largo (cm)" type="number">
        </div>
        <div class="divmed" align="center">
            <img class="imgbox" src="https://www.olvacourier.com/nuevcalc/assets/images/misc/alto.png" alt="alto-caja">
            <input class="medal" id="height" name="height" step="0.01" min="1" value="" placeholder="Ingrese el Alto (cm)" type="number">
        </div>
        <div id="alert2"></div>
    </div>
    <div class="separnta"></div>
    <div class="col-md-6">
        <span id="price-label" class="font-size-20 grey-800">5. PRECIO ESTIMADO: </span>  <span id="result" class="font-weight-600 grey-800 font-size-30">S/.0.00</span>
    </div>
    <div align="center"><button id="doAction" class="button" disabled="">Estimar</button></div>

</form>
<script>
    $(document).ready(function () {
        var ubigeo;

        var init_type = $('input[name=type]:checked').val();

        if (init_type === 'SOBRE') {
            $('#unit').hide();
            $('#measures').hide();
            $('#weight').val(1);
            $('#gr-type').show();
            $('#price-label').html('5. PRECIO ESTIMADO: ');
            $('#gr-type').css('display','inline-block');
        }

        $('#departments').change(function () {
            var value = $(this).val();

            $.ajax({
                data: {
                    value : value,
                    action : 'get-provinces',
                    controller : 'ubigeo'
                },
                url: 'https://www.olvacourier.com/nuevcalc/',
                type: 'POST',
                success: function (response) {
                    response = $.parseJSON(response);
                    $('#provinces').html('<option value="0">SELECCIONE UNA PROVINCIA</option>');
                    $('#select2-provinces-container').html('<option value="0">SELECCIONE UNA PROVINCIA</option>');
                    $('#districts').html('<option value="0">NO HA SELECCIONADO UNA PROVINCIA</option>');
                    $.each(response, function (i, item) {
                        $('#provinces').append('<option value="' + i + '">' + item + '</option>');
                    });

                    $('#doAction').prop('disabled', true);
                    $('#result').html('S/.0.00');
                }
            });
        });
                        $('#car-years').change(function (){
                            $('#añoSelecionado').val($('#car-years').val());
                        });
        $('#provinces').change(function () {
            var value = $(this).val();

            $.ajax({
                data: {
                    value : value,
                    action : 'get-districts',
                    controller : 'ubigeo'
                },
                url: 'https://www.olvacourier.com/nuevcalc/',
                type: 'POST',
                success: function (response) {
                    response = $.parseJSON(response);
                    $('#districts').html('<option value="0">SELECCIONE UN DISTRITO</option>');
                    $('#select2-districts-container').html('<option value="0">SELECCIONE UN DISTRITO</option>');
                    $.each(response, function (i, item) {
                        $('#districts').append('<option value="' + i + '">' + item + '</option>');
                    });

                    $('#doAction').prop('disabled', true);
                    $('#result').html('S/.0.00');
                }
            });
        });

        $('#districts').change(function () {
            var value = $(this).val();

            $.ajax({
                data: {
                    value : value,
                    action : 'get-ubigeo',
                    controller : 'ubigeo'
                },
                url: 'https://www.olvacourier.com/nuevcalc/',
                type: 'POST',
                success: function (response) {
                    response = $.parseJSON(response);
                    ubigeo = response;
                    $('#doAction').prop('disabled', false);
                    $('#result').html('S/.0.00');
                    $('#alert').html('');
                }
            });
        });

        $('#doAction').click(function (e) {
            e.preventDefault();

            var type = $('input[name=type]:checked').val();

            if ($('#height').val() && $('#width').val() && $('#large').val() || type === 'SOBRE') {
                $('#alert2').html('');
                var weightVol = Math.ceil(parseFloat((parseFloat($('#height').val()) * parseFloat($('#width').val()) * parseFloat($('#large').val()))/6000));
                var finalPrice = $('[name="recojo"]').val() == 'sin' ? parseFloat(ubigeo.base) : parseFloat(ubigeo.recojo);
                var over_limit = Math.trunc($('#weight').val()) + 1.3;
                var weight = parseFloat($('#weight').val()) <= over_limit ? parseFloat($('#weight').val()) : Math.ceil($('#weight').val());
                var unit = $('#unit').val();
                var aditional = 0;
                var mayorWeight;

                // Package type process
                if ((unit === 'KG' && weight && weight > 1.3 && type === 'PAQUETE') || unit === 'KG' &&  weightVol > weight && type === 'PAQUETE') {
                    mayorWeight = weight > weightVol ? weight : weightVol;
                    aditional = parseFloat(mayorWeight) - 1.3;
                    aditional = Math.ceil(aditional);
                    finalPrice = finalPrice + (parseFloat(ubigeo.exceso) * aditional);
                } else if ((unit === 'GR' && weight && weight > 1300 && type === 'PAQUETE') || unit === 'GR' && weightVol > (weight/1000) && type === 'PAQUETE') {
                    weight = weight / 1000;
                    over_limit = Math.trunc(weight) + 1.3;
                    weight = weight <= over_limit ? weight : Math.ceil(weight);
                    mayorWeight = weight > weightVol ? weight : weightVol;
                    aditional = parseFloat(mayorWeight) - 1.3;
                    aditional = Math.ceil(aditional);
                    finalPrice = finalPrice + (parseFloat(ubigeo.exceso) * aditional);
                }

                // Document Type process
                if (weight && type === 'SOBRE') {
                    finalPrice = $('[name="recojo"]').val() == 'sin' ? parseFloat(ubigeo.sobreBase) : parseFloat(ubigeo.recojo);
                }

                $('#result').html('S/.' + finalPrice.toFixed(2));
            } else {
                $('#alert2').html('Porfavor ingrese las medidas');
            }
        });

        $('#unit').change(function () {
            $('#alert').html('');
            $('#weight').val(1);
        });

        $('input[name=type]').change(function () {
            var type = $('input[name=type]:checked').val();
            if (type === 'PAQUETE') {
                $('#unit').show();
                $('#measures').show();
                $('#weight').val(1);
                $('#gr-type').hide();
                $('#price-label').html('6. PRECIO ESTIMADO: ');
                $('#alert').html('');
            } else if (type === 'SOBRE') {
                $('#unit').hide();
                $('#measures').hide();
                $('#weight').val(1);
                $('#gr-type').show();
                $('#gr-type').css('display','inline-block');
                $('#price-label').html('5. PRECIO ESTIMADO: ');
                $('#alert').html('');
            }
        });

        $('#weight').on('keyup', function(){
            var value = $(this).val();
            var unit = $('#unit').val();
            var type = $('input[name=type]:checked').val();

            if (unit === 'KG' && value && value > 25 && type === 'PAQUETE') {
                $('#alert').html('El peso a cotizar es de un máximo <b>25 kilogramos</b> porfavor ingrese un valor menor');
                $('#doAction').prop('disabled', true);
            } else if (unit === 'GR' && value && value > 25000 && type === 'PAQUETE') {
                $('#alert').html('El peso a cotizar es de un máximo <b>25 kilogramos</b> porfavor ingrese un valor menor');
                $('#doAction').prop('disabled', true);
            } else if (value && value > 500 && type === 'SOBRE') {
                $('#alert').html('Oh, oh, parece que tienes un paquete. El peso máximo para un sobre es de 500 gramos.');
                $('#doAction').prop('disabled', true);
            } else if (value) {
                $('#alert').html('');
                if ($('#districts').val()) {
                    $('#doAction').prop('disabled', false);
                } else{
                    $('#alert').html('Selecciona primero el destino de envío');
                }
            } else {
                $('#alert').html('El peso a cotizar no puede ser vacío');
                $('#doAction').prop('disabled', true);
            }
        }).keyup();

        $("#alert").empty();
    });
</script>
    </div>
    <div id="nundasjd">Las tarifas son referenciales. Las tarifas incluyen IGV. Precios válidos solo para el Servicio Regular de Lima a Provincias y de Lima a Lima. No incluye cargo adicional por el servicio de recojo. Los tiempos de entrega en condiciones regulares para ciudades principales son de 24 a 48 horas. Ciudades tránsito de 48 a 72 horas y lugares alejados de 72 horas a más. Se considera paquete desde 501 gramos.</div>


</body>