<%
long aw=System.currentTimeMillis();
%>
<%@include file="../include/koneksi.jsp" %>


<%
//initialize param
int id_resume_medis=1;
String nama="", spesialis="", alamat="", no_tlp="", user_dok="", password1="", password2="", email="",akses="";

    nama=request.getParameter("nama");
    spesialis=request.getParameter("spesialis");
    alamat=request.getParameter("alamat");
    no_tlp=request.getParameter("no_tlp");
    user_dok=request.getParameter("user_dok");
    password1=request.getParameter("password1");
    password2=request.getParameter("password2");
    email=request.getParameter("email");
    akses=request.getParameter("akses");
    
    if(password1.equals(password2)){

        try{


            //initialize get param from input



            /*out.println ("nama = "+nama+"</br></br>");
            out.println ("spslis = "+spesialis+"</br></br>");
            out.println ("alamat = "+alamat+"</br></br>");
            out.println ("tlp = "+no_tlp+"</br></br>");
            out.println("user = "+user_dok+"</br></br>");
            out.println("pass1 = "+password1+"</br></br>");
            out.println("pass2 = "+password2+"</br></br>");
            out.println("email = "+email+"</br></br>");
*/


            pstmt=conn.prepareStatement("insert into rs_dokter(nama_dokter,spesialis,alamat_dr,no_tlp,username_dr,password,email,priv) values (?,?,?,?,?,md5(?),?,?)");
            pstmt.setString(1,nama);
            pstmt.setString(2,spesialis);
            pstmt.setString(3,alamat);
            pstmt.setString(4,no_tlp);
            pstmt.setString(5,user_dok);
            pstmt.setString(6,password1);
            pstmt.setString(7,email);
            pstmt.setString(8,akses);
            pstmt.executeUpdate();
%>
<script language="javascript">
        alert("Berhasil !!"); 
document.location="index_admin.jsp";
</script>
<%

         }catch (Exception e){
            out.println("ERROR! ");
            out.println(e.getMessage());
          }
    }else{
        out.print("password salah");
    }
//rs.close();
stmt.close();
conn.close();

//session.setAttribute("ingredient","ingredient ("+ingredient_code+") added successfully");
//response.sendRedirect("add_ingredient.jsp");

%>
<%
long ak=System.currentTimeMillis();
System.out.println((ak-aw)+" ms");
%>