<%
long aw=System.currentTimeMillis();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Medicare Website</title>
		<link href="css/style.css" rel="stylesheet" type="text/css"  media="all" />
		<link href='http://fonts.googleapis.com/css?family=Ropa+Sans' rel='stylesheet' type='text/css'>
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
						<li><a href="about.jsp">About</a></li>
						<li class="active"><a href="services.jsp">layanan</a></li>
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
		   
		   <div class="wrap">
		   	<div class="services">
		   		<h4>Our services</h4>
		   <div class="section group">
				<div class="col_1_of_5 span_1_of_5">
					<h3>UGD</h3>
					<img src="images/1.png" title="UGD" />
                                        <p>Pelayanan Gawat Darurat<br/>
                                            - Perawatan Medis dan Operasi Minor<br/>
                                            - Observasi<br/>
                                            - Test Laboratorium<br/>
                                            - Pemeriksaan Radiologi<br/>
                                            - Unit Farmasi<br/><br/>

                                            Pelayanan Ambulance<br/>
                                            - Transportasi antar jemput ambulance<br/>
                                            - Perawat pendamping selama transit<br/>
                                            - Penyediaan pelayanan medis untuk acara-acara tertentu<br/>
                                            - Evakuasi Medis<br/>
                                            - Pelayanan P3K
                                        </p>
				</div>
				<div class="col_1_of_5 span_1_of_5">
					<h3>FISIOTERAPHY</h3>
					<img src="images/3.png" title="FISIOTERAPHY" />
					<p>Fisioterapi adalah bentuk pelayanan kesehatan professional yang ditujukan kepada individu dan kelompok untuk mengembangkan, memelihara dan memulihkan gerak serta fungsi tubuh sepanjang daur kehidupan dengan menggunakan penanganan secara manual, peralatan ( fisik, elektroterapeutik dan mekanik) dan komunikasi.</p>
				</div>
				<div class="col_1_of_5 span_1_of_5">
					<h3>HEMODIALISA</h3>
					<img src="images/2.png" title="HEMODIALISA" />
					<p>Haemodialysis adalah pengeluaran zat sisa metabolisme seperti ureum dan zat beracun lainnya, dengan mengalirkan darah lewat alat dializer yang berisi membrane yang selektif-permeabel dimana melalui membrane tersebut fusi zat-zat yang tidak dikehendaki terjadi. Haemodialysa dilakukan pada keadaan gagal ginjal dan beberapa bentuk keracunan </p>
				</div>
				<div class="col_1_of_5 span_1_of_5">
					<h3>HYPERBARIC</h3>
					<img src="images/4.png" title="HYPERBARIC" />
					<p>Terapi oksigen hiperbarik merupakan bentuk pengobatan, penderita harus berada dalam ruangan bertekanan  dan bernafas dengan oksigen murni 100% pada tekanan udara lebih besar dari pada udara atmosfer normal. Terapi hiperbarik untuk pertama kalinya digunakan pada penyakit dekompresi (DeCompression Ilness), yaitu suatu penyakit yang dialami oleh penyelam dan pekerja tambang bawah tanah akibat penurunan tekanan saat naik ke permukaan secara mendadak.</p>
				</div>
				<div class="col_1_of_5 span_1_of_5">
					<h3>LABORATORIUM</h3>
					<img src="images/5.png" title="LABORATORIUM" />
					<p>Laboratorium di RS ini siap melayani anda dengan alat-alat canggih dan modern. Jenis Pemeriksaan yang tersedia antara lain : <br/>
                                            - Elektrolit & Gas darah<br/>	                     
                                            - Faal<br/>
                                            - Liquor / Transudat / Eksudat<br/>
                                            - Microbiologi<br/>
                                            - Prostat <br/>
                                            - Secret<br/>
                                            - Faeces<br/>	                     
                                            - Glukosa <br/>	                     
                                            - Hematologi<br/>
                                            - Jantung<br/>
                                            - Tumor Marker
                                        </p>
				</div>
			</div>
			 <div class="section group">
				<div class="col_1_of_5 span_1_of_5">
					<h3>MRI</h3>
					<img src="images/6.png" title="MRI" />
					<p>MRI adalah salah satu modalitas pencitraan dari Unit Imaging Diagnostic untuk membantu menegakkan diagnosa suatu kelainan dengan menggunakan prinsip magnetic dan gelombang radio frekuensi tanpa menggunakan sinar X atau sinar laser sehingga tidak menimbulkan radiasi.</p>
				</div>
				<div class="col_1_of_5 span_1_of_5">
					<h3>FLUOROSCOPY</h3>
					<img src="images/7.png" title="FLUOROSCOPY" />
					<p>Flouoroscopy adalah cara pemeriksaan yang menggunakan sifat tembus sinar rontgen dan suatu tabir yang bersifat luminisensi bila terkena sinar tersebut.

Fluoroskopi terutama diperlukan untuk menyelidiki fungsi serta pergerakan suatu organ atau sistem tubuh seperti dinamika alat peredaran darah, misalnya jantung, dan pembuluh darah besar, serta pernafasan berupa pergerakan diafragma dan aerasi paru-paru.</p>
				</div>
				<div class="col_1_of_5 span_1_of_5">
					<h3>USG ABDOMEN</h3>
					<img src="images/8.png" title="USG ABDOMEN" />
					<p>USG abdomen (abdominal Ultrasound) adalah prosedur yang digunakan untuk memeriksa organ-organ dalam perut menggunakan sebuah transduser USG (probe) yang ditempelkan erat pada kulit perut. Gelombang suara energi tinggi dari transduser memantul pada jaringan dan membuat gema. Gema ini dikirim ke komputer, yang membuat citra / gambar yang disebut sonogram. Juga disebut USG transabdominal.</p>
				</div>
				<div class="col_1_of_5 span_1_of_5">
					<h3>RAWAT INAP</h3>
					<img src="images/9.png" title="RAWAT INAP" />
					<p>RS ini menerapkan kebijakan Satu-Pasien-Satu-Kamar, kecuali untuk Charity Basic Room yang diprogramkan oleh Departemen Kesehatan Republik Indonesia. Kebijakan Satu Pasien-Satu-Kamar memungkinkan setiap pasien menempati satu  kamar pribadi yang eksklusif untuk mengurangi kontak pasien ke pasien. Setiap kamar dilengkapi dengan bel panggilan perawat,  tempat tidur elektronik dan furnitur modern untuk memastikan ‘keamanan dan kenyamanan pasien.</p>
				</div>
				<div class="col_1_of_5 span_1_of_5">
					<h3>RAWAT JALAN</h3>
					<img src="images/4.png" title="RAWAT JALAN" />
					<p>RS ini melayani pasien 7 hari dalam seminggu (Senin s/d Minggu) dari pukul  07-00 s/d 21.00. Ditangani oleh dokter umum, dokter gigi dan dokter spesialis yang handal dengan dibantu oleh tenaga paramedic profesional dan terlatih di bidangnya.  Poli Klinik rawat jalan terletak dilantai I gedung utama, dilengkapi dengan sarana ruang tunggu yang nyaman dan luas.</p>
				</div>
			</div><br />
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
