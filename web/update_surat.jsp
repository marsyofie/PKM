<%
long aw=System.currentTimeMillis();
%>
<%@page import="sun.misc.BASE64Encoder"%>
<%@include file="include/koneksi.jsp" %>
<%@page import="hb.*"%>


<%
//initialize param
String fullpath=path_surat+"/home_surat_"; 
String id_rujukan="",id_resume_medis="", diagnosa_awal="",  pemeriksaan_fisik="", keadaan="",rs_tujuan="",date_db="", as="";

    //initialize get param from input
        id_rujukan=request.getParameter("id_rujukan");

        diagnosa_awal=request.getParameter("diagnosa_awal");
        pemeriksaan_fisik=request.getParameter("pemeriksaan_fisik");
        keadaan=request.getParameter("keadaan");
        date_db=request.getParameter("tglbuat");
        rs_tujuan=request.getParameter("rs_tujuan");
        //out.print(date_db);
        //out.print(kesimpulan);
 
        
            /*out.println("diagnosa awal = "+diagnosa_awal+"</br></br>");
            out.println("diagnosa akhir = "+diagnosa_akhir+"</br></br>");
            out.println("operasi = "+operasi+"</br></br>");
            out.println("riwayat penyakit = "+riwayat_penyakit+"</br></br>");
            out.println("pemeriksaan fisik = "+pemeriksaan_fisik+"</br></br>");
            out.println("hasil lab = "+hasil_lab+"</br></br>");
            out.println("perkembangan pasien = "+perkembangan+"</br></br>");
            out.println("kesimpulan = "+kesimpulan+"</br></br>");*/
        
        String sql="SELECT tipe_rs FROM  rs_tipe WHERE nama_rs='" +  rs_tujuan + "' ";
        out.println(sql+"</br>");
        rs=stmt.executeQuery(sql);//select tipe rs
        
    try{

        while(rs.next()){
            as=rs.getString("tipe_rs");

        }
         String date=HIBE.date();

        //start HIBE
    HIBE hibe_root = new HIBE(path_hibe);
    //String nmf=id_resume_medis+"_"+date+".txt";
    //hibe_root.save(fullpath+nmf); //edit your path
    Entity root = hibe_root.getEntity(new String[0]);

        //start encrpt with HIBE
        byte[] ct_diagnosa_awal = root.encrypt(diagnosa_awal.getBytes(), new String[0]);
        byte[] ct_pemeriksaan_fisik = root.encrypt(pemeriksaan_fisik.getBytes(), new String[0]);
        byte[] ct_keadaan = root.encrypt(keadaan.getBytes(), new String[0]);

        
        /*out.println("id_mr = "+id_mr +"</br></br>");
        out.println ("nama = "+new BASE64Encoder().encode(ct_nama)+"</br></br>");
        out.println ("alamat = "+new BASE64Encoder().encode(ct_alamat)+"</br></br>");
        out.println ("umur = "+new BASE64Encoder().encode(ct_umur)+"</br></br>");
        out.println("jenis kelamin = "+new BASE64Encoder().encode(ct_jenis_kelamin)+"</br></br>");
        out.println("diagnosa awal = "+new BASE64Encoder().encode(ct_diagnosa_awal)+"</br></br>");
        out.println("diagnosa akhir = "+new BASE64Encoder().encode(ct_diagnosa_akhir)+"</br></br>");
        out.println("riwayat penyakit = "+new BASE64Encoder().encode(ct_riwayat_penyakit)+"</br></br>");
        out.println("hasil lab = "+new BASE64Encoder().encode(ct_hasil_lab)+"</br></br>");
        out.println("perkembangan pasien = "+new BASE64Encoder().encode(ct_perkembangan_px)+"</br></br>");
        out.println("kesimpulan = "+new BASE64Encoder().encode(ct_kesimpulan)+"</br></br>");
        out.println("dokter = "+new BASE64Encoder().encode(ct_dokter)+"</br></br>");
        out.println(tanggal_masuk);
        out.println(tanggal_keluar);
        out.println(rs_a);
        out.println(rs_ak);
        out.println(date);*/

        //insert to sql
        pstmt=conn.prepareStatement("update rs_surat_rjk set diagnosa_awal=?,pemeriksaan_fisik=?,keadaan=?,updated=? where id_rujukan='"+id_rujukan+"'");
        pstmt.setString(1,new BASE64Encoder().encode(ct_diagnosa_awal));
        pstmt.setString(2,new BASE64Encoder().encode(ct_pemeriksaan_fisik));
        pstmt.setString(3,new BASE64Encoder().encode(ct_keadaan));
        pstmt.setString(4,date);
        pstmt.executeUpdate();
     
        

%>
<script language="javascript">
        alert("Berhasil diupdate."); 
document.location="index_action.jsp";
</script>
<%}catch (Exception e)
    {
      out.println("ERROR! ");
      out.println(e.getMessage());
    }

stmt.close();
conn.close();

//session.setAttribute("ingredient","ingredient ("+ingredient_code+") added successfully");
//response.sendRedirect("add_ingredient.jsp");

%>
<%
long ak=System.currentTimeMillis();
System.out.println((ak-aw)+" ms");
%>
