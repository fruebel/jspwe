<!--  Scripts-->


<!--Import jQuery before materialize.js-->
<!--script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/js/materialize.min.js"></script>

<!--Archivos para DataTable-->
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.13/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.13/js/jquery.dataTables.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/responsive/2.1.1/js/dataTables.responsive.min.js"></script>
<script type="text/javascript" charset="utf8" src="js/generales.js"></script>
<script>
    $(".dropdown-button").dropdown({
        hover: false, // Activate on hover
        gutter: 9 // Spacing from edge
    });
    $(".button-collapse").sideNav();

   

    $(document).ready(function () {
        //alert(screen.width);
        if (screen.width >= 500) {
            //alert('Resolucion: 1024x768 o mayor');
            //$("link[rel=stylesheet]:not(:first)").attr({href: "detect1024.css"});
        } else 
        {
            //alert('Resolucion: Menos de 1024x768, a lo mejor es 800x600');
            //$("link[rel=stylesheet]:not(:first)").attr({href: "detect800.css"});
        }
    });
</script>
</body>
</html>
