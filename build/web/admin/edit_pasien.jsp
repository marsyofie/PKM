<%
long aw=System.currentTimeMillis();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../include/koneksi.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Medicare Website</title>
		<link href="../css/style.css" rel="stylesheet" type="text/css"  media="all" />
		<link href='http://fonts.googleapis.com/css?family=Ropa+Sans' rel='stylesheet' type='text/css'>
	</head>
	<body>
		<!--start-wrap-->
		
			<!--start-header-->
			<div class="header">
				<div class="wrap">
				<!--start-logo-->
				<div class="logo">
					<a href="index.jsp"><img src="../images/logo.png" title="logo" /></a>
				</div>
				<!--end-logo-->
				<!--start-top-nav-->
				<div class="top-nav">
					<ul>
						<li class="active"><a href="../index.jsp">Home</a></li>
						<li><a href="../about.jsp">About</a></li>
						<li><a href="../services.jsp">Layanan</a></li>

                                               <%
                                                    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
                                                    %>
                                                    <li><a href="log.jsp">login</a></li>
                                                    <%
                                                    } else {
                                                         %> 
                                                         <li><a href="index_admin.jsp">Action</a></li>
                                                <%
                                                        }

                                                        %>
					</ul>					
				</div>
				<div class="clear"> </div>
				<!--end-top-nav-->
			</div>
			<!--end-header-->
		</div>
		<div class="clear"> </div>

		    <div class="clear"> </div>
		    <div class="content-grids2">
		    </div>
		   </div>
		   <div class="wrap">
                        
		   <div class="content-box">
		   <div class="section group">
                       <%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
%>
You are not logged in<br/>
<a href="log.jsp">Please Login</a>
<%} 
     else if((session.getAttribute("priv").equals("1"))){
%>

<div class="left">
    Welcome <b><%=session.getAttribute("userid")%></b><br><br>
                           <ul>
                               <li class="btn"><a href="insert_dokter.jsp"/>Input Data Dokter</a></li>
                               <li class="btn"><a href="reg_pasien.jsp"/>Registrasi Pasien</a></li>
                               <li class="btn"><a href="view_pasien.jsp"/>Lihat Data Pasien</a></li>
                               <li class="btn"><a href="search.jsp"/>Search </a></li>
                               <li class="btn"><a href="../logout.jsp"/>Logout</a></li>
                          </ul>
			</div>
                       <div class="right">
<%
String id_d="",id_mr="",nama="",alamat="",spesialis="",no_tlp="",uname="",pass="",email="",ID="";
//out.print(id_dok);
id_dok1=request.getParameter("id_dok");
if(id_dok1!=null)
ID=id_dok1;  

rs=stmt.executeQuery("select * from rs_pasien where id_mr='"+ID+"'");
if(rs.next())
{
id_mr=rs.getString("id_mr");
nama=rs.getString("nama");
alamat=rs.getString("alamat");
no_tlp=rs.getString("no_tlp");
//uname=rs.getString("username_dr");
//pass=rs.getString("password");
//email=rs.getString("email");


%>
<form action="update_pasien.jsp" method="post">
    <div align="center"><table>
        <tr>
            <td>ID MR</td>
            <td><input type="text" name="id_mr" value="<%=id_mr%>" readonly></td>
        </tr>
        <tr>
            <td>Nama</td>
            <td><input type="text" name="nama" value="<%=nama%>"></td>
        </tr>
        
        <tr>
            <td>Alamat</td>
            <td><input type="text" name="alamat" value="<%=alamat%>"></td>
        </tr>
        <tr>
            <td>No Tlp</td>
            <td><input type="text" name="no_tlp" value="<%=no_tlp%>"></td>
        </tr>
        
        <tr>
            <td colspan="2" align="center"><input value="Submit" type="submit"> &nbsp; <input value="Reset" type="reset"></td>
        </tr>
        </table></div>
</form>
<%

}else{
    out.print("Data yang dicari tidak ada");
}
%>
            
<%
    }
 else {
    response.sendRedirect("../index_action.jsp");
       }
%>
                       
                   </div>
		   </div>
		   </div>
		   <div class="clear"> </div>
		   <div class="footer">
		   	 <div class="wrap">
		   	<div class="footer-left">
		   			<ul>
						<li><a href="../index.jsp">Home</a></li>
						<li><a href="../about.jsp">About</a></li>
						<li><a href="../services.jsp">Layanan</a></li>
						 <%
                                                    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
                                                    %>
                                                    <li><a href="log.jsp">login</a></li>
                                                    <%
                                                    } else {
                                                         %> 
                                                         <li><a href="index_admin.jsp">Action</a></li>
                                                <%
                                                        }

                                                        %>
					</ul>
		   	</div>
		   	<div class="footer-right">

		   	</div>
		   	<div class="clear"> </div>
		   </div>
		   </div>
		<!--end-wrap-->
	</body>
</html>
<%
long ak=System.currentTimeMillis();
System.out.println((ak-aw)+" ms");
%>