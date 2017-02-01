<%
    session.setAttribute("sessionUsuaurio", "");
    RequestDispatcher view;
    view = request.getRequestDispatcher("index.jsp");
    view.forward(request, response);

   
%>
