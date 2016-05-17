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
    
        <script language="javascript">
function validate(resume_medis)
{
if(resume_medis.id_resume_medis.value.length==0)
{
alert("Anda belum mengisi ID Resume Medis!");
resume_medis.id_resume_medis.focus();
return false;
}
if(resume_medis.id_mr.value.length==0)
{
alert("Anda belum mengisi No Rekam Medis!");
resume_medis.id_mr.focus();
return false;
}

if(resume_medis.nama.value.length==0)
{
alert("Anda belum mengisi Nama Pasien!");
resume_medis.nama.focus();
return false;
}

if(resume_medis.umur.value.length==0)
{
alert("Anda belum mengisi Umur!");
resume_medis.umur.focus();
return false;
}
if(resume_medis.alamat.value.length==0)
{
alert("Anda belum mengisi Alamat!");
resume_medis.alamat.focus();
return false;
}

return true;
}
</script>

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
                          <h1>Form Input Surat Rujukan </h1>
                         <div style="color:red"> NOTE : harus input resume medis terlebih dahulu </div>

        <form name="resume_medis" action="insert_surat_pros.jsp" method="post" onSubmit="return validate(this)">
          <table border="0" cellpadding="2" cellspacing="2" width="80%">
            <tr>

            </tr>
            <tr>
              <td>ID Resume Medis</td>
              <td><input name="id_resume_medis" type="text" class="text" value="" /></td>
            </tr>
            <tr>
              <td>No. Medical Record </td>
              <td><input name="id_mr" type="text" class="text" value="" /></td>
            </tr>
             <tr>
              <td> Nama</td>
              <td><input name="nama" type="text" class="text" value="" /></td>
            </tr>
            <tr>
              <td> Umur</td>
              <td><input name="umur" type="text" class="text" value="" /></td>
            </tr>
            <tr>
              <td> Alamat</td>
              <td><textarea cols="75" rows="10" name="alamat" value=""></textarea></td>
            </tr>
            <tr>
              <td> Jenis Kelamin </td>
              <td> <select name="jenis_kelamin">
                    <option value="L">Laki-laki</option>
                    <option value="P">Perempuan</option>
                    </select>
              </td>
            </tr>
            <tr>
              <td>Diagnosa Awal</td>
              <td><textarea cols="75" rows="10" name="diagnosa_awal" value=""></textarea></td>
            </tr>
               <tr>
              <td>Pemeriksaan fisik</td>
              <td><textarea cols="75" rows="10" name="pemeriksaan_fisik" value=""></textarea></td>
            </tr>
            <tr>
              <td>Keadaan Pasien saat dirujuk</td>
              <td><textarea cols="75" rows="10" name="keadaan" value=""></textarea></td>
            </tr>
            <tr>
              <td>RS Asal :</td>
              <td><select name="rs_asal">
                  <%
                            rs=stmt.executeQuery("select * from rs_tipe");
                      try
                            {
                          String rs_a="";
                            while(rs.next()){
                                %><option value="<%=rs.getString("nama_rs")%>"><%=rs.getString("nama_rs")%></option><%
                            }

                      }catch(Exception e){
                                e.printStackTrace();
                                }
%>
                </select></td>
            </tr>
             <tr>
              <td>RS Akhir</td>
              <td><select name="rs_tujuan">
                                  <%
                            rs=stmt.executeQuery("select * from rs_tipe");
                      try
                            {
                          String rs_a="";
                            while(rs.next()){
                                %><option value="<%=rs.getString("nama_rs")%>"><%=rs.getString("nama_rs")%></option><%
                            }
                      }catch(Exception e){
                                e.printStackTrace();
                                }
%>
                  </select></td>
            </tr>
            <tr>
              <td>Dokter Pemeriksa</td>
              <td><select name="dokter">
                                  <%
                            Object dr=session.getAttribute("userid");
                            rs=stmt.executeQuery("select * from rs_dokter where username_dr='"+dr+"'");
                      try
                            {
                          String rs_a="";
                            while(rs.next()){
                                %><option value="<%=rs.getString("nama_dokter")%>"><%=rs.getString("nama_dokter")%></option><%
                            }
                                rs.close();
                                stmt.close();
                                conn.close();
                      }catch(Exception e){
                                e.printStackTrace();
                                }
%>
                  </select></td>
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

