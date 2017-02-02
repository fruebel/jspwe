<!--TEXTO-->
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>J&F - Software Engineers</title>
        <!-- CORE CSS--> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.1/css/materialize.min.css">

        <style type="text/css">
            html,
            body {
                height: 100%;
            }
            html {
                display: table;
                margin: auto;
            }
            body {
                display: table-cell;
                vertical-align: middle;
            }
            .margin {
                margin: 0 !important;
            }
        </style>

    </head>

    <body class="blue">

        <div class="container">
            <div id="login-page" class="row">
                <div class="col s12 z-depth-6 card-panel">
                    <form class="login-form" id="frmData" action="login" method="post">
                        <div class="row">
                            
                            <div class="input-field col s12 center">
                                <img src="images/logo.png" alt="" class="responsive-img valign profile-image-login " style="margin-left:-0px;width:50%;height: 50% ">
                                <p class="center login-form-text">J&F - Software Engineers</p>
                            </div>
                            
                        </div>
                        <div class="row margin">
                            
                            <div class="input-field col s12">
                                <i class="mdi-social-person-outline prefix"></i>
                                <input class="validate" id="usuario" name="usuario"  type="text" value="jbarrientos" required aria-required="true">
                                <label for="usuario" data-error="" data-success="" class="center-align">Usuario</label>
                            </div>
                            
                        </div>
                        <div class="row margin">
                            <div class="input-field col s12">
                                <i class="mdi-action-lock-outline prefix"></i>
                                <input id="password"  name="password" type="password" required aria-required="true" value="1234">
                                <label for="password">Contrase&ntilde;a</label>
                            </div>
                        </div>
                        <div class="row">          
                            <div class="input-field col s12 m12 l12  login-text">
                                <input type="checkbox" id="remember-me" />
                                <label for="remember-me">Recuerdame</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                                <!--a href="login.html" class="btn waves-effect waves-light col s12">Iniciar Sesi&oacute;n</a--> 
                                <button class="btn waves-effect waves-light col s6 offset-s3" type="submit" id="action">iniciar Sesion
                                    <!--i class="material-icons right">send</i-->
                                </button>
                                
                                
                            </div>
                        </div>
                        <!--div class="row">
                          <div class="input-field col s6 m6 l6">
                            <p class="margin medium-small"><a href="register.html">Register Now!</a></p>
                          </div>
                          <div class="input-field col s6 m6 l6">
                              <p class="margin right-align medium-small"><a href="forgot-password.html">Forgot password?</a></p>
                          </div>          
                        </div-->

                    </form>
                </div>
            </div>
        </div>  






        <!-- ================================================
          Scripts
          ================================================ -->

        <!-- jQuery Library -->
        <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
        <!--materialize js-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.1/js/materialize.min.js"></script>



        <script type="text/javascript">

        
            $('#frmData').submit(function (e) {

                e.preventDefault();

                var pet = $('#frmData').attr('action');
                var met = $('#frmData').attr('method');

                //alert(pet + " " + met + " " + $('#frmData').serialize());

                $.ajax({
                    beforeSend: function () {
                        // body...
                        //$('#notificacion').html("Cargando Info...");
                    },
                    url: pet,
                    type: met,
                    data: $('#frmData').serialize(),
                    async: false,
                    //dataType :'json',
                    error: function (jqXHR, estado, error) {
                        // body...
                        //alert('Se produjo un error : ' + error + " su estado " + estado);
                        alert('El registro no pudo realizarse, intente nuevamente.');
                        return;
                    },
                    success: function (respuesta) {
                        // body...
                        if (respuesta != "")
                            alert(respuesta);
                        else{
                            //alert(respuesta);
                            window.location.href = 'inicio.jsp';
                        }     
                    },
                    complete: function (xhr, status) {

                    }
                });


            })
        </script>

    </body>

</html>
