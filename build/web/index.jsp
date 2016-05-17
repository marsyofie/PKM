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
		    <div class="content-grids">
		    	<div class="wrap">
		    	<div class="section group">
				<div class="listview_1_of_3 images_1_of_3">
					
						  <img src="images/mri.jpg">
					
					<div class="text list_1_of_2">
						  <h3> MRI</h3>
						  <p>Need More info?</p>
						  
                                                          MRI (Magnetic Resonance Imaging) dapat melihat kelainan pada organ sendi, deteksi kelainan jaringan lunak otak dan tulang belakang serta mendeteksi stroke dengan dipandu Dokter Spesialis yang handal.
Estimasi biaya pemeriksaan MRI mulai Rp.1.500.000,- s/d Rp.3.000.000,- Silahkan hubungi Bagian Radiologi
					</div>
				</div>				
				<div class="listview_1_of_3 images_1_of_3">
						  <img src="images/ct-scan.jpg">
					
					<div class="text list_1_of_2">
						  <h3> CT-Scan</h3>
						  <p>Need More info?</p>
						  CT-Scan (Compuerized Tomography Scanner) adalah untuk mendeteksi pendarahan otak, cidera otak, patah tulang, tumor, dan kanker serta penyakit lainnya. 
Estimasi biaya pemeriksaan CT-Scan mulai Rp.693.000,- s/d Rp.2.900.000,- Silahkan hubungi bagian Radiologi
				     </div>
				</div>				
				<div class="listview_1_of_3 images_1_of_3">

						  <img src="images/poli-ibu.jpg">

					<div class="text list_1_of_2">
						  <h3>Poliklinik Terpadu Ibu & Anak</h3>
						  <p>Need More info?</p>
						  Poliklinik Terpadu Ibu & Anak didedikasikan khusus untuk pelayanan kesehatan ibu dan anak dengan design yang nyaman. Didukung dengan 14 dokter Spesialis dan Sub Spesialis Anak, juga 10 Spesialis dan Sub Spesialis Kandungan dan Kebidanan. Silahkan hubungi bagian Poli Ibu dan Anak.
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

