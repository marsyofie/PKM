<%-- 
    Document   : logout
    Created on : Dec 18, 2015, 6:10:34 PM
    Author     : QQ
--%>

<%
session.setAttribute("userid", null);
session.invalidate();
response.sendRedirect("index.jsp");
%>
