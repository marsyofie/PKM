<%
long aw=System.currentTimeMillis();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Medicare Website</title>
		<link href="css/style.css" rel="stylesheet" type="text/css"  media="all" />
		<link href='http://fonts.googleapis.com/css?family=Ropa+Sans' rel='stylesheet' type='text/css'>
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>

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
						<li><a href="index.jsp">Home</a></li>
						<li class="active"><a href="about.jsp">About</a></li>
						<li><a href="services.jsp">layanan</a></li>
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
		    <div class="content-grids">
		    	<div class="wrap">
		    	<div class="section group">
				<div class="listview_1_of_32 images_1_of_32">
                                    <center><img src="images/staff1.jpg"/></center>
					<div class="text list_1_of_2">
						  <h3> Tagline</h3>
                                                  The Ultimate Values Health Care
						  <br/><br/>
						  <h3> Visi & Misi</h3>
                                                  <p>VISI</p>        
                                                    Terwujudnya Rumah Sakit sebagai rumah sakit rahmatan lil alamin melalui komitmen pada layanan kesehatan bertaraf internasional berdasar ketentuan rumah sakit syariah.
                                                  <p>MISI</p> 
                                                    1. Membangun institusi syariah di bidang pelayanan kesehatan untuk mengabdi dan mencari ridha Allah SWT.
                                                   <br/> 2. Mengembangkan layanan prima yang fokus pada kebutuhan pasien didukung dengan teknologi tepat guna sesuai standar internasional.
                                                    <br/>3. Membangun human capital yang terampil, profesional dan kompeten berdasar nilai budaya Islami.
                                                  <br/><br/><h3> Slogan</h3>              
                                                    AMANAH dalam MELAYANI pasien secara PROFESIONAL dengan keahlian dan peralatan yang UNGGUL dibidang medis dalam suasana kerja yang HARMONIS
					</div>
				</div>				
			</div>
		    </div>
		   </div>

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

