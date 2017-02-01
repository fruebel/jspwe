<%@page import="soft.jf.seguridad.modelos.Segfunciones"%>
<%@page import="soft.jf.seguridad.modelos.Segmodulos"%>
<%@page import="java.util.ArrayList"%>
<%@page import="soft.jf.seguridad.dao.SegmodulosDAO" %>
<%
    SegmodulosDAO modulos;
    modulos = new SegmodulosDAO();
    ArrayList<Segmodulos> listaModulos = new ArrayList<>();
    ArrayList<Segfunciones> listaFuncionesxModulo = new ArrayList<>();
    String sessionUsuario = (String) session.getAttribute("sessionUsuaurio");
    //out.print(f1);
%>


<nav>
  <div class="nav-wrapper blue lighten-1">
    <a href="#!" class="brand-logo" style="background-color: white;width: 15%;height: 111%;border-radius: 1%;"><img class="responsive-img" src="images/logo_proyectos.png" alt="" title="Inicio" style="width: 92%;"></a>
    <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a> 
    <ul class="right hide-on-med-and-down">
     <%
        listaModulos = modulos.listarMenuPrincipal();
        int contador;
        
        for (Segmodulos m : listaModulos) {
            contador = 0;
            //<!-- Crea Submenus x Modulos -->
            listaFuncionesxModulo = modulos.listarFuncionesXSubmenu(m.getIdmodulo(),sessionUsuario);
            if(listaFuncionesxModulo.size() > 0){
            contador++;    
            for (Segfunciones f : listaFuncionesxModulo) {
                if (contador == 1){
                    out.println("<ul id='sub_"+m.getIdmodulo()+"' class='dropdown-content'>");
                    contador++;
                }    
                out.println("<li><a href='"+f.getUrl()+"'>"+f.getTitulo()+"</a></li>");  
            }
            out.println("</ul>");   
            out.println("<li><a class='dropdown-button'  href='"+ m.getUrl() + "'  data-activates='sub_"+m.getIdmodulo() +"' >" + m.getTitulo() + "<i class='material-icons right'>arrow_drop_down</i></a></li>");
            }
            else
                out.println("<li><a class='dropdown-button'  href='"+ m.getUrl() + "'   >" + m.getTitulo() + "</a></li>");
            
        }
      %>
    </ul>
    <ul class="side-nav" id="mobile-demo">
        <%
        //listaModulos = modulos.listarMenuPrincipal();
        //contador;
        
        for (Segmodulos m : listaModulos) {
            contador = 0;
            //<!-- Crea Submenus x Modulos -->
            listaFuncionesxModulo = modulos.listarFuncionesXSubmenu(m.getIdmodulo(),sessionUsuario);
            if(listaFuncionesxModulo.size() > 0){
            contador++;    
            for (Segfunciones f : listaFuncionesxModulo) {
                if (contador == 1){
                    out.println("<ul id='mov_"+m.getIdmodulo()+"' class='dropdown-content'>");
                    contador++;
                }    
                out.println("<li><a href='"+f.getUrl()+"'>"+f.getTitulo()+"</a></li>");  
            }
            out.println("</ul>");   
            out.println("<li><a class='dropdown-button'  href='"+ m.getUrl() + "'  data-activates='mov_"+m.getIdmodulo() +"' >" + m.getTitulo() + "<i class='material-icons right'>arrow_drop_down</i></a></li>");
            }
            else
                out.println("<li><a class='dropdown-button'  href='"+ m.getUrl() + "'   >" + m.getTitulo() + "</a></li>");
            
        }
      %>
    </ul>
  </div>
</nav>
        
