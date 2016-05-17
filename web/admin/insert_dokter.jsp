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
<script src="jquery.js" type="text/javascript"></script>
	<script type="text/javascript">
          $(document).ready(function(){
              $(".uname").change(function(){
                  var uname = $(this).val();
                  if(uname.length >= 4){
                      $(".status").html("<img src='images/loading.gif'><font color=gray> Checking availability...</font>");
                       $.ajax({
                          type: "POST",
                          url: "../CheckAvailability",
                          data: "uname="+ uname,
                          success: function(msg){

                              $(".status").ajaxComplete(function(event, request, settings){
                                   
                                  $(".status").html(msg);

                              });
                          }
                      }); 
                  }
                  else{
                       
                      $(".status").html("<font color=red>Username harus lebih dari 3 karakter.</font>");
                  }
                  
              });
          });
        </script>
       

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
                          <h1>Form Input Data Dokter </h1>

        <form name="resume_medis" action="insert_dokter_pros.jsp" method="post" onSubmit="return validate(this)">
          <table border="0" cellpadding="2" cellspacing="2" width="80%">
            <tr>

            </tr>
            <tr>
              <td>Nama </td>
              <td><input name="nama" type="text" class="text" value="" />
              </td>
            </tr>
            <tr>
              <td>Spesialis</td>
              <td><input name="spesialis" type="text" class="text" value="" />
              </td>
            </tr>
            <tr>
              <td> Alamat</td>
              <td><textarea cols="75" rows="7" name="alamat" value=""></textarea></td>
            </tr>
             <tr>
              <td>Nomor Telepon</td>
              <td><input name="no_tlp" type="number" class="text" value="" maxlength="12"/>
              </td>
            </tr>
            <tr>
              <td>Username</td>
              <td><input name="user_dok" type="text" class="uname" value="" />&nbsp;<span class="status"></span>
              </td>
            </tr>
            <tr>
              <td>Password</td>
              <td><input name="password1" type="password" class="text" value="" />
              </td>
            </tr>
            <tr>
              <td>Ulangi Password</td>
              <td><input name="password2" type="password" class="text" value="" />
              </td>
            </tr>
            <tr>
              <td>Email</td>
              <td><input name="email" type="text" class="text" value="" />
              </td>
            </tr>
            <tr>
              <td>Privileges</td>
              <td><select name="akses">
                    <option value="1">Receptionist</option>
                    <option value="2">Dokter</option>
                    </select>
              </td>
            </tr>
            
            
            <tr>
              <td class="submission" colspan="2"><div align="center">
                <input name="s" type="submit" class="button" value="ADD" />
                <input name="Reset" type="reset" class="button" value="RESET" />
              </div></td>
            </tr>
           
          </table>
         
        </form>
                       </div>
                  <% }else {
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


<%
long ak=System.currentTimeMillis();
System.out.println((ak-aw)+" ms");
%>