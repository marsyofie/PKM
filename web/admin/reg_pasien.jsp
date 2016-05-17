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
                    <script type="text/javascript" src="../scripts/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="../src/jquery.autocomplete.js"></script>
	
 <script type="text/javascript">
    
    $(document).ready(function(){
    	 
    	$("#autocomplete").autocomplete({
    		//lookup: countries,
    		serviceUrl:'../Auto1', //tell the script where to send requests
    	  
    	    width: 350, //set width
    	    
    	    //callback just to show it's working
    	    onSelect: function (suggestion) {
       				$('#selection').html('You selected: <br>' + suggestion.value + ' <br>' + suggestion.data);
    				},
    	showNoSuggestionNotice: true,
        noSuggestionNotice: 'Sorry, no matching results',
    	
    	
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
                           <span style="font-size: 25px;">FORM REGISTRASI PASIEN </h6>

        <form action="registration.jsp" method="post" >
          <table border="0" cellpadding="2" cellspacing="2" width="80%">
                    <tr>
                        <td>Nama</td>
                        <td><input type="text" name="nama" value="" /></td>
                    </tr>
                    <tr>
                        <td>Tempat Lahir</td>
                        <td><input type="text" name="tempatlahir" value="" /></td>
                    </tr>
                    <tr>
                        <td>Tanggal Lahir</td>
                        <td><input type="text" name="tgllahir" value="" /></td>
                    </tr>
                    <tr>
                        <td>Jenis Kelamin</td>
                        <td><select name="jenis_kelamin">
                                <option value="L">Laki-laki</option>
                                <option value="P">Perempuan</option>
                            </select></td>
                    </tr>
                    <tr>
                        <td>Gol. Darah</td>
                        <td><input type="text" name="goldar" value="" /></td>
                    </tr>
                    <tr>
                        <td>Alamat</td>
                        <td><textarea cols="50" rows="3" name="alamat" value=""></textarea></td>
                    </tr>
                    <tr>
                        <td>Agama</td>
                        <td><input type="text" name="agama" value="" /></td>
                    </tr>
                    <tr>
                        <td>Status Perkawinan</td>
                        <td><select name="status">
                                <option value="Kawin">Kawin</option>
                                <option value="Belum Kawin">Belum Kawin</option>
                            </select></td>
                    </tr>
                    <tr>
                        <td>Pekerjaan</td>
                        <td><input type="text" name="pekerjaan" id="autocomplete"/></td>
                    </tr>

           
                    <tr>
                        <td>Kewarganegaraan</td>
                        <td><select name="warganegara">
                                <option value="WNI">WNI</option>
                                <option value="WNA">WNA</option>
                            </select></td>
                    </tr>
                    <tr>
                        <td>No. Tlp</td>
                        <td><input type="text" name="no_tlp" value="" maxlength="13" /></td>
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
