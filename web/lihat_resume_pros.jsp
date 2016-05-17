<%
long aw=System.currentTimeMillis();
%>
<%@include file="include/path.jsp" %>
<%@page import="hb.*"%>
<%@page import="serv.*"%>
<%@page import="sun.misc.BASE64Decoder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="include/koneksi.jsp"%>

<!DOCTYPE html>
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
<%} else if((session.getAttribute("priv").equals("1"))){
    response.sendRedirect("admin/index_admin.jsp");
       }else {
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
        String keyword=request.getParameter("resume");
        System.out.print(keyword);
//initialize param
//String fullpath=path_resume+"/home_resum_"; 
String id_resume_medis="", id_mr="", nama="", umur="", alamat="" , jenis_kelamin="", diagnosa_awal="",
       diagnosa_akhir="", operasi="",riwayat_penyakit="", pemeriksaan_fisik="", hasil_lab="", 
       perkembangan="", kesimpulan="", tgl_masuk="", tgl_keluar="",dokter="",as="",id_rm="", at="",date_db="";
	//out.print(path_hibe);
	try {
            //String path_hibe="D:/home.dat";
		String sql = "SELECT * FROM  rs_resume_medis WHERE id_resume_medis='" +  keyword + "' ";
		
		//System.out.println(sql);
		
		rs = stmt.executeQuery(sql);
		while((rs!=null) && (rs.next())) { 
                   id_resume_medis=rs.getString("id_resume_medis");
                    id_mr=rs.getString("id_mr");
                    nama=rs.getString("nama_pasien");
                    umur=rs.getString("umur");
                    alamat=rs.getString("alamat_pasien");
                    jenis_kelamin=rs.getString("jenis_kelamin");
                    diagnosa_awal=rs.getString("diagnosa_awal");
                    diagnosa_akhir=rs.getString("diagnosa_akhir");
                    operasi=rs.getString("operasi");
                    riwayat_penyakit=rs.getString("riwayat_penyakit");
                    pemeriksaan_fisik=rs.getString("pemeriksaan_fisik");
                    hasil_lab=rs.getString("hasil_lab");
                    perkembangan=rs.getString("perkembangan");
                    kesimpulan=rs.getString("kesimpulan");
                    tgl_masuk=rs.getString("tgl_masuk");
                    tgl_keluar=rs.getString("tgl_keluar");
                    dokter=rs.getString("nama_dokter");
                    date_db=rs.getString("created"); 
                
                //String nmf=id_resume_medis+"_"+date_db+".txt";
                    long z=System.currentTimeMillis();
            HIBE hibe = new HIBE(path_hibe);
            //out.println("HIBE system read : " + hibe);
            Entity root = hibe.getEntity(new String[0]);
            //out.println("read root : " + root);
            
%>

<form method="post" action="update_resume.jsp">
            <table border="0" cellpadding="2" cellspacing="2" width="80%">
            <tr>

            </tr>
            <tr>
              <td>ID Resume Medis </td>
              <td><input name="id_resume_medis" type="text" class="text" value="<%=id_resume_medis%>" readonly/></td>
            </tr>
            <tr>
              <td>No. Medical Record </td>
              <td><input name="id_mr" type="text" class="text" value="<%=id_mr%>" readonly/></td>
            </tr>
             <tr>
              <td> Nama</td>
              <td><input name="nama" type="text" class="text" value="<%=new String(root.decrypt(new BASE64Decoder().decodeBuffer(nama)))%>" readonly/></td>
            </tr>
            <tr>
              <td> Umur</td>
              <td><input name="umur" type="text" class="text" value="<%=new String(root.decrypt(new BASE64Decoder().decodeBuffer(umur)))%>" readonly/></td>
            </tr>
            <tr>
              <td> Alamat</td>
              <td><textarea cols="75" rows="10" name="alamat" value="" readonly><%=new String(root.decrypt(new BASE64Decoder().decodeBuffer(alamat)))%></textarea></td>
            </tr>
            <tr>
              <td> Jenis Kelamin </td>
              <td><input type=text name="jenis_kelamin" value="<%=new String(root.decrypt(new BASE64Decoder().decodeBuffer(jenis_kelamin)))%>" readonly> </td>
            </tr>
            <tr>
              <td>Diagnosa Awal</td>
              <td><textarea cols="75" rows="10" name="diagnosa_awal" value=""><%=new String(root.decrypt(new BASE64Decoder().decodeBuffer(diagnosa_awal)))%></textarea></td>
            </tr>
               <tr>
              <td>Diagnosa Akhir</td>
              <td><textarea cols="75" rows="10" name="diagnosa_akhir" value=""><%=new String(root.decrypt(new BASE64Decoder().decodeBuffer(diagnosa_akhir)))%></textarea></td>
            </tr>
            <tr>
              <td>Operasi</td>
              <td><textarea cols="75" rows="10" name="operasi" value=""><%=new String(root.decrypt(new BASE64Decoder().decodeBuffer(operasi)))%></textarea></td>
            </tr>
               <tr>
              <td>Riwayat Penyakit</td>
              <td><textarea cols="75" rows="10" name="riwayat_penyakit" value=""><%=new String(root.decrypt(new BASE64Decoder().decodeBuffer(riwayat_penyakit)))%></textarea></td>
            </tr>
            <tr>
              <td>Pemeriksaan Fisik</td>
              <td><textarea cols="75" rows="10" name="pemeriksaan_fisik" value=""><%=new String(root.decrypt(new BASE64Decoder().decodeBuffer(pemeriksaan_fisik)))%></textarea></td>
            </tr>
               <tr>
              <td>Hasil Laboratorium</td>
              <td><textarea cols="75" rows="10" name="hasil_lab" value=""><%=new String(root.decrypt(new BASE64Decoder().decodeBuffer(hasil_lab)))%></textarea></td>
            </tr>
              <tr>
              <td>Perkembangan Pasien Selama Perawatan</td>
              <td><textarea cols="75" rows="10" name="perkembangan" value=""><%=new String(root.decrypt(new BASE64Decoder().decodeBuffer(perkembangan)))%></textarea></td>
            </tr>
              <tr>
              <td>Keadaan Pasien, Kesimpulan</td>
              <td><textarea cols="75" rows="10" name="kesimpulan" value=""><%=new String(root.decrypt(new BASE64Decoder().decodeBuffer(kesimpulan)))%></textarea></td>
            </tr>
              <tr>
              <td>Tanggal Masuk</td>
              <td><input type=text name="tanggal1" id="tanggal1" value="<%=tgl_masuk%>" readonly></td>
            </tr>
              <tr>
              <td>Tanggal Keluar</td>
              <td><input type=text name="tanggal2" id="tanggal2" value="<%=tgl_keluar%>" readonly></td>
            </tr>
            <tr>
              <td>Dokter Pemeriksa</td>
              <td><input type=text name="dokter" value="<%=new String(root.decrypt(new BASE64Decoder().decodeBuffer(dokter)))%>" readonly></td>
            </tr>
            <tr>
              <td>Created</td>
              <td><input type=text name="tglbuat" value="<%=date_db%>" readonly></td>
            </tr>
            <tr>
              <td class="submission" colspan="2"><div align="center">
                <input name="s" type="submit" class="button" value="UPDATE" />
                <input name="Reset" type="reset" class="button" value="RESET" />
              </div></td>
            </tr>
            <tr>
              
            </tr>
          </table>
</form>
            
 <%
 long y=System.currentTimeMillis();
    System.out.println((y-z));
 }//end while
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
<%
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