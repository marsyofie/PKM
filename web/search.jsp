<%
long aw=System.currentTimeMillis();
%>

<%@page import="hb.HIBE"%>
<%@page import="sun.misc.BASE64Decoder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="include/koneksi.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Medicare Website</title>
		<link href="css/style.css" rel="stylesheet" type="text/css"  media="all" />
		<link href='http://fonts.googleapis.com/css?family=Ropa+Sans' rel='stylesheet' type='text/css'>

        <!-- date picker jquery -->
<link rel="stylesheet" href="css/ui.all.css" type="text/css">
    
        </head>
	<body>
		<!--start-wrap-->
		
			<!--start-header-->
			<div class="header">
				<div class="wrap">
				<!--start-logo-->
				<div class="logo">
					<a href="index.jsp"><img src="images/logo.png" title="logo" /></a>
				</div>
				<!--end-logo-->
				<!--start-top-nav-->
				<div class="top-nav">
					<ul>
						<li class="active"><a href="index.jsp">Home</a></li>
						<li><a href="about.jsp">About</a></li>
						<li><a href="services.jsp">Layanan</a></li>

                                                <%
                                                    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
                                                    %>
                                                    <li><a href="admin/log.jsp">login</a></li>
                                                    <%
                                                    } else {
                                                         %> 
                                                         <li><a href="index_action.jsp">Action</a></li>
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
<a href="admin/log.jsp">Please Login</a>
<%}else if((session.getAttribute("priv").equals("1"))){
    response.sendRedirect("admin/index_admin.jsp");
       } else {
%>
                       <div class="left">
    Welcome <b><%=session.getAttribute("userid")%></b><br><br>
                           <ul>
                               <li class="btn"><a href="insert_resume.jsp"/>Input Resume Medis</a></li>
                               <li  class="btn"><a href="insert_surat.jsp"/>Input Surat Rujukan </a></li>
                               <li  class="btn"><a href="lihat_resume.jsp"/>Lihat Resume Medis </a></li>
                               <li  class="btn"><a href="lihat_surat.jsp"/>Lihat Surat Rujukan</a></li>
                               <li  class="btn"><a href="search.jsp"/>Search</a></li>
                               <li  class="btn"><a href="logout.jsp">Log out</a></li>
                          </ul>
			</div>
                       <div class="right" align="center">
                           <%
	String keyword = "", pilih="";
	if(request.getParameter("txtKeyword") != null && request.getParameter("pilih") != null) {
		keyword = request.getParameter("txtKeyword");
                pilih=request.getParameter("pilih");
	}
%>

	<form name="frmSearch" method="post" action="search.jsp">
	  <table width="599" border="1">
	    <tr>
	      <th>Masukkan ID MR
	      <input name="txtKeyword" type="text" value="<%=keyword%>">
              <select name="pilih">
                  <option value="surat"> Surat Rujukan</option>
                  <option value="resume">Resume Medis</option>
              </select>
	      <input type="submit" value="Search"></th>
	    </tr>
            
	  </table>
	</form>
              <br>
	<%
	//Connection connect = null;
	//Statement s = null;
	
	try {
		String sql = "SELECT * FROM  rs_resume_medis WHERE id_mr='" +  keyword + "' order by id_resume_medis DESC"; //resume
                String sql2 = "SELECT * FROM  rs_surat_rjk WHERE id_mr='" +  keyword + "' order by id_rujukan DESC"; //surat
		//out.print(pilih);
                if(pilih.equals("surat")){
        %>      <p>List surat rujukan dengan ID MR = <%=keyword%> </p>
                    <table border="2" cellpadding="2" cellspacing="2">
                        <th>ID Rujukan</th>
                        <th>ID Resume Medis</th>
                        <th>ID Medical Record</th>
                        <th>RS Asal</th>
                        <th>Rs Tujuan</th>
                        <th>Created</th>
     		
		<%
                rs = stmt.executeQuery(sql2);
                while((rs!=null) && (rs.next())) { %>

                        <tr>
                            <td><%=rs.getString("id_rujukan")%></td>
                            <td><%=rs.getString("id_resume_medis")%></td>
                            <td style="color:red;font-weight:bold"><%=rs.getString("id_mr")%></td>
                           
                            <td><%=rs.getString("rs_asal")%></td>
                            <td><%=rs.getString("rs_tujuan")%></td>
                            <td><%=rs.getString("created")%></td>
                        </tr>
                        
				  
	       	<%}%>
 </table>
 <%
                }else if(pilih.equals("resume")){
                    %>
                    <p>List Resume Medis dengan ID MR = <%=keyword%> </p>
                    <table border="2" cellpadding="2" cellspacing="2">
                        <th>ID Resume Medis</th>
                        <th>ID Medical Record</th>
                        <th>Tanggal Masuk</th>
                        <th>Tanggal Keluar</th>
                        <th>Created</th>
     		
		<%
                rs = stmt.executeQuery(sql);
                while((rs!=null) && (rs.next())) { %>

                        <tr>
                            <td><%=rs.getString("id_resume_medis")%></td>
                            <td style="color:red;font-weight:bold"><%=rs.getString("id_mr")%></td>
                           
                            <td><%=rs.getString("tgl_masuk")%></td>
                            <td><%=rs.getString("tgl_keluar")%></td>
                            <td><%=rs.getString("created")%></td>
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
                  <% } %>
                   </div>
		   </div>
		   </div>
		   <div class="clear"> </div>
		   <div class="footer">
		   	 <div class="wrap">
		   	<div class="footer-left">
		   			<ul>
						<li><a href="index.jsp">Home</a></li>
						<li><a href="about.jsp">About</a></li>
						<li><a href="services.jsp">Layanan</a></li>
						 <%
                                                    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
                                                    %>
                                                    <li><a href="admin/log.jsp">login</a></li>
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
<%
long ak=System.currentTimeMillis();
System.out.println((ak-aw)+" ms");
%>
