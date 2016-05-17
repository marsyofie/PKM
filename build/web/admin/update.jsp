<%
long aw=System.currentTimeMillis();
%>
<%@include file="../include/koneksi.jsp"%>
<%
String id_d="",nama="",alamat="",spesialis="",no_tlp="",uname="",pass="",email="";

id_d=request.getParameter("id_d");
nama=request.getParameter("nama");
alamat=request.getParameter("alamat");
spesialis=request.getParameter("spesialis");

no_tlp=request.getParameter("no_tlp");
uname=request.getParameter("uname");
pass=request.getParameter("pass");
email=request.getParameter("email");

 
try{

            pstmt=conn.prepareStatement("update rs_dokter set nama_dokter=?,spesialis=?,alamat_dr=?,no_tlp=?,username_dr=?,email=? where id_dokter='"+id_d+"'");
            pstmt.setString(1,nama);
            pstmt.setString(2,spesialis);
            pstmt.setString(3,alamat);
            pstmt.setString(4,no_tlp);
            pstmt.setString(5,uname);
            pstmt.setString(6,email);
            pstmt.executeUpdate();
%>
<script language="javascript">
        alert("Berhasil diupdate."); 
document.location="index_admin.jsp";
</script>
<%

         }catch (Exception e){
            out.println("ERROR! ");
            out.println(e.getMessage());
          }



/*
rs=stmt.executeQuery("select * from rs_dokter where id_dokter='"+id_dok+"'");
if(rs.next())
{
id_d=rs.getString("id_dokter");
nama=rs.getString("nama_dokter");
alamat=rs.getString("alamat_dr");
spesialis=rs.getString("spesialis");
no_tlp=rs.getString("no_tlp");
uname=rs.getString("username_dr");
pass=rs.getString("password");
email=rs.getString("email");


}else{
    out.print("Data yang dicari tidak ada");
}*/
%>
    <%
long ak=System.currentTimeMillis();
System.out.println((ak-aw)+" ms");
%>        