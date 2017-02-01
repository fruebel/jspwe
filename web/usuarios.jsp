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
        <div class="col s12" ><h5>Usuarios </h5></div>  
    </div>
    <div class="row">
        <div class="col s12">
            <table id="tablainfo" class="display responsive no-wrap" width="100%" cellspacing="0">
            </table>
        </div>
    </div>   

</div>

<!-- Modal -->
<form name="frmData" id="frmData" action="usuarios" method="post">
    <input type="hidden" id="action" name="action" value="action" /> 
    <input type="hidden" id="idRow" name="idRow" value="idRow" /> 

    <div id="modal1" class="modal modal-fixed-footer">

        <div class="modal-content">


            <ul class="collapsible popout" data-collapsible="accordion">

                <li>
                    <div class="collapsible-header active"><i class="material-icons">assignment_ind</i>Datos Principales Usuarios</div>
                    <div class="collapsible-body">
                        <div class="row" style="margin-top: 10px;">
                            <div class="col s2">
                                Id Usuario
                            </div>       
                            <div class="col s4">
                                <input placeholder="Id usuario" type="text" name="idusuario" id="idusuario" required="">
                            </div>

                            <div class="col s2">
                                Contrase&ntilde;a
                            </div>               
                            <div class="col s4">
                                <input placeholder="Contrase&ntilde;a" type="text" name="contrasenia" id="contrasenia" required="">
                            </div>    

                        </div>

                        <div class="row">
                            <div class="col s2">
                                Nombre
                            </div>       
                            <div class="col s4">
                                <input placeholder="Nombre" type="text" name="nombre" id="nombre" required="">
                            </div>

                            <div class="col s2">
                                Apellido Paterno
                            </div>  

                            <div class="col s4">
                                <input placeholder="Apellido Paterno" type="text" name="apellidopaterno" id="apellidopaterno" required="">
                            </div>          
                        </div>    

                        <div class="row">
                            <div class="col s2">
                                Apellido Materno
                            </div>       
                            <div class="col s4">
                                <input placeholder="Apellido Materno" type="text" name="apellidomaterno" id="apellidomaterno" required="">
                            </div>

                            <div class="col s2">
                                Perfil
                            </div>  

                            <div class="col s4">
                                <!--input placeholder="id Perfil" type="text" name="idperfil" id="idperfil" required=""-->

                                <select name="idperfil" id="idperfil" required="true">

                                </select>

                            </div>          
                        </div>     

                        <div class="row">


                            <div class="col s2">
                                Telefono
                            </div>  

                            <div class="col s4">
                                <input placeholder="Telefono" type="text" name="telefono" id="telefono" required="false">
                            </div>  

                            <div class="col s4">
                                <!--input placeholder="Estatus" type="text" name="idestado" id="idestado" required=""-->
                                <div class="switch"><label>Inactivo<input type="checkbox" id="idestado" name="idestado" checked><span class="lever"></span>Activo</label></div> 
                            </div> 

                        </div>   
                    </div>    
                </li>

                <li>
                    <div class="collapsible-header"><i class="material-icons">info_outline</i>Adicionales</div>
                    <div class="collapsible-body">

                        <div class="row">
                            <div class="col s2">
                                Email
                            </div>       
                            <div class="col s4">
                                <input placeholder="Email" type="text" name="email" id="email" required="false">
                            </div>

                            <div class="col s2">
                                Tema
                            </div>  

                            <div class="col s4">
                                <input placeholder="Tema" type="text" name="tema" id="tema" required="false">
                            </div>          
                        </div>   

                        <div class="row">
                            <div class="col s2">
                                Lenguaje
                            </div>       
                            <div class="col s4">
                                <input placeholder="Lenguaje" type="text" name="lenguaje" id="lenguaje" required="false">
                            </div>

                            <div class="col s2">
                                Fotografia
                            </div>       
                            <div class="col s4">
                                <input placeholder="Fotografia" type="text" name="fotografia" id="fotografia" required="false">
                            </div>               


                        </div>

                    </div>
                </li>

            </ul>    




        </div>
        <div class="modal-footer">

            <!--a href="#!" id="btnEviar"  class="modal-action modal-close waves-effect waves-green btn-flat">Registrar</a-->
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

    llenaLista("seg_perfiles", "idperfil", "nombre", "1", "idperfil");
    pinta_contenido('listar');
    function pinta_contenido(valor) {

//        console.log(valor);
//        if (typeof (valor) == "undefined")
//            valor = '';

        $.ajax({
            beforeSend: function () {
                // body...
            },
            url: 'usuarios',
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

    function editar(data) {

        var idRrow = data.id;
        //alert(id_row);
        $('#frmData').attr('action', 'usuarios');
        $('#btnEviar').html('Editar<i class="material-icons right">send</i>');
        $('#action').val('editar');
        $('#idRow').val(idRrow);
        $('#idusuario').attr("readonly", true);

        $.ajax({
            beforeSend: function () {
                // body...
                //alert('id_row->' + id_row);
            },
            url: 'usuarios',
            type: 'POST',
            async: false,
            dataType: 'json',
            /*headers:{Accept:"application:json;charset=utf-8","Content-Type":"application:json;charset=utf-8"},*/
            data: "idRow=" + idRrow + "&action=consulta",
            error: function (jqXHR, textStatus, errorThrown) {
                // body...
                alert('Se produjo un error : ' + errorThrown + ' ' + textStatus);
            },
            success: function (data) {
                // body...
                //alert(data.);
                var usuarios = data[0];

                //alert(usuarios.idEstado.idestado);
                $('#idusuario').val(usuarios.idUsuario);
                $("#nombre").val(usuarios.nombre);
                $("#idperfil option[value=" + usuarios.idperfil.idperfil + "]").attr("selected", true);
                $('#idperfil').material_select();
                $('#apellidopaterno').val(usuarios.apellidoPaterno);
                $('#apellidomaterno').val(usuarios.apellidoMaterno);
                $('#contrasenia').val(usuarios.contrasenia);
                $('#fotografia').val(usuarios.fotografia);
                $('#telefono').val(usuarios.telefono);
                $('#email').val(usuarios.email);
                $('#tema').val(usuarios.tema);
                $('#lenguaje').val(usuarios.lenguaje);
                if (usuarios.idEstado.idestado == 1)
                    $("#idestado").prop("checked", true);
                else
                    $("#idestado").prop("checked", false);


            }, complete: function (xhr, status) {

            }

        });
    }

    $('#frmData').submit(function (e) {

        e.preventDefault();

        var pet = $('#frmData').attr('action');
        var met = $('#frmData').attr('method');

        //alert(pet + " " + met + " " + $('#frmData').serialize());

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

    function limpiaModal() {

        $('#idusuario').val('');
        $("#nombre").val('');
        $("#idperfil option[value=''").attr("selected", true);
        $('#idperfil').material_select();
        $('#apellidopaterno').val('');
        $('#apellidomaterno').val('');
        $('#contrasenia').val('');
        $('#fotografia').val('');
        $('#telefono').val('');
        $('#email').val('');
        $('#tema').val('');
        $('#lenguaje').val('');

    }

    function abrirModal() {
        limpiaModal();
        $('#frmData').attr('action', 'usuarios');
        $('#btnEviar').html('Nuevo<i class="material-icons right">send</i>');
        $('#action').val('nuevo');
        $('#idRow').val(0);
        $('#idusuario').attr("readonly", false);

    }

    $(document).ready(function () {
        // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
        $('.modal').modal({
            opacity: .5 // Opacity of modal background
                    /*ready: function(modal, trigger) { // Callback for Modal open. Modal and trigger parameters available.
                     alert("Ready");
                     console.log(modal, trigger);
                     },
                     complete: function() { alert('Closed'); } // Callback for Modal close
                     */
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