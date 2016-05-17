<%@page import="java.sql.*"%>
<%@page import="java.io.*" %>

<%
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/db_rs";
String username="root";
String password="123456";

int idd=0, x=0,id_dok=0;

//String idd1="", id="", nama="", jk="", spesialis="", alamat="", delete="", a="";
String id_dok1="", idd1="",id="",  delete="", a="";
//String select="select * from rs_dokter";

//get session id
Object user=session.getAttribute("userid");
///path
//String path_resume="G:/Kuliah/Tugas Akhir/source code/jsp/web/param/"+user+"/resume";//edit your path for resume medis
String path_surat="G:/Kuliah/Tugas Akhir/source code/jsp/web/param/"+user+"/surat";//edit your path for surat rujukan
//String path_upload="G:/Kuliah/Tugas Akhir/source code/jsp/web/param/"+user+"/resume/";//edit your path for upload file
//String path_hibe=readFD.readFD()+":/pk.dat";



Connection conn=DriverManager.getConnection(url,username,password);
Statement stmt=conn.createStatement();
Statement stmt1=conn.createStatement();
ResultSet rs;
PreparedStatement pstmt;
//ResultSet rs=stmt.executeQuery(select);
%>