<%@page import="soft.jf.seguridad.modelos.Segmodulos"%>
<%@page import="java.util.ArrayList"%>
<%@page import="soft.jf.seguridad.dao.SegmodulosDAO" %>

<jsp:include page="vistas/encabezadopaginas.jsp" />

<%
    SegmodulosDAO modulos = new SegmodulosDAO();
    ArrayList<Segmodulos> listaModulos = new ArrayList<>();

%>

<nav>
    <div class="nav-wrapper">
      <a href="#!" class="brand-logo">Logo</a>
      <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
      <ul class="right hide-on-med-and-down">
      <%
        listaModulos = modulos.listarMenuPrincipal();
        for (Segmodulos m : listaModulos) {
            out.println("<li><a href='"+ m.getUrl() + "' >" + m.getTitulo() + "</a></li>");
      
        }
      %>
      </ul>
      <ul class="side-nav" id="mobile-demo">
        <%
        listaModulos = modulos.listarMenuPrincipal();
        for (Segmodulos m : listaModulos) {
            out.println("<li><a  href='"+ m.getUrl() + "' >" + m.getTitulo() + "</a></li>");
        
        }
        %>
      </ul>
      
      
    </div>
  </nav>  
      
     
        
<jsp:include page="vistas/piepaginas.jsp" />
   