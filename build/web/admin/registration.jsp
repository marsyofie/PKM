<%
long aw=System.currentTimeMillis();
%>
<%@page import="sun.misc.BASE64Encoder"%>
<%@include file="../include/koneksi.jsp" %>
<%@page import="hb.*"%>
<%@include file="../include/path.jsp" %>

<%

    String id_mr = "RS0001-"; 
    String id_db= "";      
    String nama = request.getParameter("nama");
    String jenis_kelamin = request.getParameter("jenis_kelamin");
    String alamat = request.getParameter("alamat");
    String no_tlp = request.getParameter("no_tlp");
    Statement st = conn.createStatement();
    ResultSet rsa=st.executeQuery("SELECT max(id_mr) as maxid FROM rs_pasien");
    while(rsa.next()){
      id_db=rsa.getString(1);      
     }
    //out.println(id_db);
    int max_id=Integer.parseInt(id_db.substring(7));
    //out.print("<br>");
    //out.println(max_id);
    //out.println(max_id+1);
    
    String ok=id_mr+(max_id+1);
    //out.print("<br>");
    //out.print(ok);
    
    
    int i = st.executeUpdate("insert into rs_pasien(id_mr,nama,jenis_kelamin,alamat,no_tlp) values ('" + ok + "','" + nama + "','" + jenis_kelamin + "','" + alamat + "','" + no_tlp + "')");
    //ResultSet rs;
   //int i = st.executeUpdate("insert into rs_pasien(id_mr,nama,jenis_kelamin,alamat,no_tlp) values ('" + id_mr + "','" + nama + "','" + jenis_kelamin + "','" + alamat + "','" + no_tlp + "')");
    if (i > 0) {
        try{
            //String path_hibe ="D:/home.dat";
        //start hibe
          long y=System.currentTimeMillis();
        HIBE hibe_root = new HIBE();
        //String nmf=id_resume_medis+"_"+date+".txt";
        hibe_root.save(path_hibe); //edit your path
        Entity root = hibe_root.getRootEntity();
        root.save();
        long z=System.currentTimeMillis();
        System.out.println(path_hibe);
       System.out.println((z-y));
        //session.setAttribute("userid", user);
        response.sendRedirect("index_admin.jsp");
       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
               }
        catch(Exception e){
            out.print("Eror ..."+e.getMessage());
        }
    } else {
        response.sendRedirect("regee.jsp");
    }
    stmt.close();
conn.close();

%>
<%
long ak=System.currentTimeMillis();
System.out.println((ak-aw)+" ms");
%>