<%
long aw=System.currentTimeMillis();
%>
<%@include file="../include/koneksi.jsp"%>
<%
String id_d="",nama="",alamat="",spesialis="",no_tlp="",id_mr="";

id_d=request.getParameter("id_d");
id_mr=request.getParameter("id_mr");
nama=request.getParameter("nama");
alamat=request.getParameter("alamat");


no_tlp=request.getParameter("no_tlp");

 
try{

            pstmt=conn.prepareStatement("update rs_pasien set id_pasien=?,id_mr=?,nama=?,alamat=?,no_tlp=? where id_pasien='"+id_d+"'");
            pstmt.setString(1,id_d);
            pstmt.setString(2,id_mr);
            pstmt.setString(3,nama);
            pstmt.setString(4,alamat);
            pstmt.setString(5,no_tlp);
            
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
            