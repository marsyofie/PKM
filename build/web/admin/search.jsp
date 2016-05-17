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
<%} else if((session.getAttribute("priv").equals("1"))){
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
                       <div class="right" align="center">
                           <%
	String keyword = "";
	if(request.getParameter("txtKeyword") != null) {
		keyword = request.getParameter("txtKeyword");
               String pilih=request.getParameter("pilih");
	}
%>

	<form name="frmSearch" method="post" action="search.jsp">
	  <table width="599" border="1">
	    <tr>
	      <th>Masukkan Kata Kunci
	      <input name="txtKeyword" type="text" value="<%=keyword%>">
              <select name="pilih">
                  <option value="pasien">Pasien</option>
                  <option value="dokter">Dokter</option>
              </select>
	      <input type="submit" value="Search"></th>
	    </tr>
            
	  </table>
	</form>
              <br>
	<%

	try {
            //out.print(keyword);
		String sql = "SELECT * FROM  rs_dokter WHERE username_dr='" +  keyword+"'"; //dokter
                String sql2 = "SELECT * FROM  rs_pasien  WHERE id_mr like '%" +  keyword+"%'"; //pasien
                //out.print(sql2);
                if(request.getParameter("txtKeyword") != null && request.getParameter("pilih").equals("dokter")){
                    %>
                    <table border="2" cellpadding="2" cellspacing="2">
                        <th>ID</th>
                        <th>Nama Dokter</th>
                        <th>Spesialis</th>
                        <th>Username</th>
                        <th>Email</th>
                        <th>Action</th>
     		
		<%
                rs = stmt.executeQuery(sql);
                while((rs!=null) && (rs.next())) { %>

                        <tr>
                            <td><%=rs.getString("id_dokter")%></td>
                            <td><%=rs.getString("nama_dokter")%></td>
                            <td><%=rs.getString("spesialis")%></td>
                            <td><div style="font-style:bold;color:red;"><%=rs.getString("username_dr")%></div></td>
                            <td><%=rs.getString("email")%></td>
                            <td><a href="edit.jsp?id_dok=<%=rs.getString("id_dokter")%>">Edit</a></td>
                            <td><a href="index_admin.jsp?del=yes&id_dok=<%=rs.getString("id_dokter")%>" onclick="return del()">Delete</a></td>
                        </tr>
                        
				  
	       	<%}%>
 </table>
 <%
                }else if(request.getParameter("txtKeyword") != null && request.getParameter("pilih").equals("pasien")){
                 %>
                    <table border="2" cellpadding="2" cellspacing="2">
                        <th>ID MR</th>
                        <th>Nama</th>
                        <th>Alamat</th>
                        <th>No tlp</th>
                        <th colspan="2">Action</th>
     		
		<%
                rs = stmt.executeQuery(sql2);
                while((rs!=null) && (rs.next())) { %>

                        <tr>
                            <td><%=rs.getString("id_mr")%></td>
                            <td><div style="font-style:bold;color:red;"><%=rs.getString("nama")%></div></td>
                            <td><%=rs.getString("alamat")%></td>
                            <td><%=rs.getString("no_tlp")%></td>
                            <td><a href="edit_pasien.jsp?id_dok=<%=rs.getString("id_mr")%>">Edit</a></td>
                            </tr>
                        
				  
	       	<%}%>
 </table>
 <%   
                }else{
                    //gag ada apa2
                }
		
		


		} catch (Exception e) {
			// TODO Auto-generated catch block
			out.println(e.getMessage());
			e.printStackTrace();
		}
	
		try {
			if(stmt!=null){
				stmt.close();
				conn.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			out.println(e.getMessage());
			e.printStackTrace();
		}
	%>
                       </div>
                  <% } else {
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
                                                         <li><a href="index_action.jsp">Action</a></li>
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

