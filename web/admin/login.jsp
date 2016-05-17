<%
long aw=System.currentTimeMillis();
%>
<%@ page import ="java.sql.*" %>
<%
    String userid = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/db_rs","root", "123456");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from rs_dokter where username_dr='" + userid + "' and password=md5('" + pwd + "')");
    if (rs.next()) {
        String usr=rs.getString("username_dr");
        String priv=rs.getString("priv");
        session.setAttribute("userid", usr); //set session
        session.setAttribute("priv", priv);
        //out.println("welcome " + userid);
        Object o=session.getAttribute("priv");
        //out.println("ini o =" + o);
        if (o.equals("1")){
            //out.print("admin");
            response.sendRedirect("../admin/index_admin.jsp");
        }else{
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
            //out.print("dokter");
        response.sendRedirect("../index_action.jsp");
               }
    } else {
        %>
        <script language="javascript">
        alert("invalid username or password."); 
document.location="log.jsp";
</script>
        <%
    }
%>
<%
long ak=System.currentTimeMillis();
System.out.println((ak-aw)+" ms");
%>