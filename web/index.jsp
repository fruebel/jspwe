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

        <!--script>
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
      
        ga('create', 'UA-27820211-3', 'auto');
        ga('send', 'pageview');
      
      </script--><!--script src="//load.sumome.com/" data-sumo-site-id="1cf2c3d548b156a57050bff06ee37284c67d0884b086bebd8e957ca1c34e99a1" async="async"></script-->


        <!--footer class="page-footer">
               <div class="footer-copyright">
                 <div class="container">
                 © 2015 W3lessons.info
                 <a class="grey-text text-lighten-4 right" href="http://w3lessons.info">Karthikeyan K</a>
                 </div>
               </div>
       </footer-->

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
