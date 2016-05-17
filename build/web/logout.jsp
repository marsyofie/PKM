<%
long aw=System.currentTimeMillis();
%>


<%
session.setAttribute("userid", null);
session.invalidate();
out.print("Anda telah logout <br>");
out.print("Jika tidak teredirect otomatis klik di <a href='index.jsp'>sini</a>");
response.setHeader("Refresh", "3; URL=index.jsp");
//response.sendRedirect("index.jsp");
%>
<%
long ak=System.currentTimeMillis();
System.out.println((ak-aw)+" ms");
%>