<%
long aw=System.currentTimeMillis();
%>
<%@page import="hb.*"%>
<%@page import="sun.misc.BASE64Decoder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="include/koneksi.jsp"%>
<%@include file="include/path.jsp" %>
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
	String keyword = "";
	if(request.getParameter("txtKeyword") != null) {
		keyword = request.getParameter("txtKeyword");
	}
%>

	<form name="frmSearch" method="post" action="lihat_surat.jsp">
	  <table width="599" border="1">
	    <tr>
	      <th>Masukkan id surat rujukan
	      <input name="txtKeyword" type="text" value="<%=keyword%>">
	      <input type="submit" value="Lihat"></th>
	    </tr>
            
	  </table>

	</form>

	<%
//initialize param
String fullpath=path_surat+"/home_surat_"; 
String id_rujukan="", id_resume_medis="", id_mr="", nama="", umur="", alamat="" , jenis_kelamin="", diagnosa_awal="",
       pemeriksaan_fisik="", keadaan="", dokter="", rs_asal="", rs_tujuan="",
       as="",id_rm="", at="",date_db="";
	
	try {
	
		String sql = "SELECT * FROM  rs_surat_rjk WHERE id_rujukan='" +  keyword + "' ";
		
		System.out.println(sql);
		
		rs = stmt.executeQuery(sql);
		while((rs!=null) && (rs.next())) { 
                    id_rujukan=rs.getString("id_rujukan");
                   id_resume_medis=rs.getString("id_resume_medis");
                    id_mr=rs.getString("id_mr");
                    nama=rs.getString("nama_pasien");
                    umur=rs.getString("umur");
                    alamat=rs.getString("alamat_pasien");
                    jenis_kelamin=rs.getString("jenis_kelamin");
                    diagnosa_awal=rs.getString("diagnosa_awal");
                    pemeriksaan_fisik=rs.getString("pemeriksaan_fisik");
                    keadaan=rs.getString("keadaan");
                    rs_asal=rs.getString("rs_asal");
                    rs_tujuan=rs.getString("rs_tujuan");
                    dokter=rs.getString("nama_dokter");
                    date_db=rs.getString("created"); 
                
                    String s="SELECT tipe_rs FROM  rs_tipe WHERE nama_rs='" +  rs_tujuan + "' ";
                    rs=stmt.executeQuery(s);//select tipe rs
                            while(rs.next()){
                            as=rs.getString("tipe_rs");
                            //out.print(as);
                            }
                    

              //  String nmf=id_rujukan+"_"+date_db+".txt";
HIBE hibe_root = new HIBE(path_hibe);
    //String nmf=id_resume_medis+"_"+date+".txt";
    //hibe_root.save(fullpath+nmf); //edit your path
    Entity root = hibe_root.getEntity(new String[0]);
%>
<form method="post" action="update_surat.jsp">
            <table border="0" cellpadding="2" cellspacing="2" width="80%">
            <tr>

            </tr>
                        <tr>
              <td>ID Resume Medis </td>
              <td><input name="id_rujukan" type="text" class="text" value="<%=id_rujukan%>" readonly/></td>
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
              <td><input type=text name="jenis_kelamin" id="tanggal2" value="<%=new String(root.decrypt(new BASE64Decoder().decodeBuffer(jenis_kelamin)))%>" readonly> </td>
            </tr>
            <tr>
              <td>Diagnosa Awal</td>
              <td><textarea cols="75" rows="10" name="diagnosa_awal" value=""><%=new String(root.decrypt(new BASE64Decoder().decodeBuffer(diagnosa_awal)))%></textarea></td>
            </tr>
               <tr>
              <td>Pemeriksaan Fisik</td>
              <td><textarea cols="75" rows="10" name="pemeriksaan_fisik" value=""><%=new String(root.decrypt(new BASE64Decoder().decodeBuffer(pemeriksaan_fisik)))%></textarea></td>
            </tr>
              <tr>
              <td>Keadaan Pasien saat dirujuk</td>
              <td><textarea cols="75" rows="10" name="keadaan" value=""><%=new String(root.decrypt(new BASE64Decoder().decodeBuffer(keadaan)))%></textarea></td>
            </tr>
              <tr>
              <td>RS Asal</td>
              <td><input type=text name="rs_asal" id="tanggal1" value="<%=rs_asal%>" readonly></td>
            </tr>
              <tr>
              <td>RS Tujuan</td>
              <td><input type=text name="rs_tujuan" id="tanggal2" value="<%=rs_tujuan%>" readonly></td>
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