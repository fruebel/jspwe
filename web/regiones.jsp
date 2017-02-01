<jsp:include page="encabezadopaginas.jsp" />
<jsp:include page="menuPrincipal.jsp" />
<jsp:include page="verificasession.jsp" />
<jsp:include page="verificaaccesoxpagina.jsp" />
<!-- Inicio Cuerpo pagina JSP's -->

<div class="container">

    <div id="divNuevo" style="position: relative;top:140px;left:10px;">
        <a class="btn-floating  waves-effect waves-light red" href='#modal1' onclick="abrirModal()"><i class="material-icons">add</i></a>  
    </div>

    <div class="row">
        <div class="col s12" ><h5>Regiones </h5></div>  
    </div>
    <div class="row">
        <div class="col s12">
            <table id="tablainfo" class="display responsive no-wrap" width="100%" cellspacing="0">
            </table>
        </div>
    </div>   

</div>
<!-- Modal -->
<form name="frmData" id="frmData" action="regiones" method="post">
    <input type="hidden" id="action" name="action" value="action" /> 
    <input type="hidden" id="idRow" name="idRow" value="idRow" /> 

    <div id="modal1" class="modal modal-fixed-footer">

        <div class="modal-content">
           
            <ul class="collapsible" data-collapsible="accordion">

                <li>
                    <div class="collapsible-header active"><i class="material-icons">toc</i>Regiones</div>
                    <div class="collapsible-body">
                        <div class="row" style="margin-top: 10px;">
                            <div class="col s2">
                                Nombre
                            </div>       
                            <div class="col s4">
                                <input placeholder="Nombre" type="text" name="nombre" id="nombre" required="">
                            </div>
                        </div>

                    </div>    
                </li>

            </ul>    

        </div>
        <div class="modal-footer">
            <button id="btnEviar" class=" btn waves-effect blue lighten-1" type="submit">Registrar<i class="material-icons right">send</i></button>

            <div class="progress" style="display: none;" id="loading">
                <div class="indeterminate"></div>
            </div>
        </div>



    </div>
</form>


<!-- Fin Cuerpo pagina JSP's    -->

<jsp:include page="piepaginas.jsp" />

<script type="text/javascript">

    llenaLista("regiones", "idregion", "nombre", "1", "idregion");
    pinta_contenido('listar');
    function pinta_contenido(valor) {

        $.ajax({
            beforeSend: function () {
                // body...
            },
            url: 'regiones',
            type: 'POST',
            async: false,
            data: "action=" + valor,
            error: function (jqXHR, textStatus, errorThrown) {
                // body...
                alert('Se produjo un error : ' + errorThrown + ' ' + textStatus);
            },
            success: function (data) {
                // body...
                //$('#tablainfo').children('tbody').html('');                                                        
                $('#tablainfo').html(data);
                //alert(data);
            },
            complete: function (xhr, status) {

                $('#tablainfo').dataTable().fnDestroy();
                $('#tablainfo').DataTable({
                    scrollY: 300,
                    responsive: true,
                    searching: true,
                    lengthChange: false,
                    pageLength: 10,
                    language: {
                        "url": "json/Spanish.json"
                    }

                });

            }
        });
    }
    
    function limpiaModal() {
        $("#nombre").val('');
    }
    
    function abrirModal() {
        limpiaModal();
        $('#frmData').attr('action', 'regiones');
        $('#btnEviar').html('Nuevo<i class="material-icons right">send</i>');
        $('#action').val('nuevo');
        $('#idRow').val(0);


    }
    
    function editar(data) {

        var idRrow = data.id;
        $('#frmData').attr('action', 'regiones');
        $('#btnEviar').html('Editar<i class="material-icons right">send</i>');
        $('#action').val('editar');
        $('#idRow').val(idRrow);
        $.ajax({
            beforeSend: function () {
                // body...
                //alert('id_row->' + id_row);
            },
            url: 'regiones',
            type: 'POST',
            async: false,
            dataType: 'json',
            data: "idRow=" + idRrow + "&action=consulta",
            error: function (jqXHR, textStatus, errorThrown) {
                // body...
                alert('Se produjo un error : ' + errorThrown + ' ' + textStatus);
            },
            success: function (data) {
                // body...
                var obJSON = data[0];
                $('#nombre').val(obJSON.nombre);
            
            }, complete: function (xhr, status) {
                
            }

        });
    }
    
    $('#frmData').submit(function (e) {

        e.preventDefault();
        
        var pet = $('#frmData').attr('action');
        var met = $('#frmData').attr('method');

        $.ajax({
            beforeSend: function () {
                // body...
                $('#loading').show();
                $('#btnEviar').attr('disabled', true);

            },
            url: pet,
            type: met,
            data: $('#frmData').serialize(),
            async: false,
            dataType: 'json',
            error: function (jqXHR, estado, error) {
                // body...
                //alert('Se produjo un error : ' + error + " su estado " + estado);
                alert('El registro no pudo realizarse, intente nuevamente.');
                $('#btnEviar').attr('disabled', false);
                $('#loading').hide();
                return;
            },
            success: function (respuesta) {
                // body...
                if (respuesta.respuesta == true) {
                    $('#btnEviar').attr('disabled', true);
                    Materialize.toast(respuesta.mensaje, 3000, 'rounded');
                    $('#modal1').modal('close');
                    pinta_contenido('listar');
                } else {
                    alert(respuesta.mensaje);
                    $('#btnEviar').attr('disabled', false);
                    $('#loading').hide();
                }
            },
            complete: function (xhr, status) {

            }
        });
        

    })
    
    
    $(document).ready(function () {
        // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
        $('.modal').modal({
            opacity: .5 // Opacity of modal background
            , complete: function () {
                limpiaModal();
            } // Callback for Modal close    
            , ready: function (modal, trigger) { // Callback for Modal open. Modal and trigger parameters available.
                $('#loading').hide();
                $('#btnEviar').attr('disabled', false);
            }
        });
        $('select').material_select();
        $('.collapsible').collapsible();
        
    });
    
</script>

