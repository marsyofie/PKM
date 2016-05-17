<%
long aw=System.currentTimeMillis();
%>
<%@page import="sun.misc.BASE64Encoder"%>
<%@include file="include/koneksi.jsp" %>
<%@include file="include/path.jsp" %>
<%@page import="hb.*"%>

<%
//initialize param

String id_resume_medis="", diagnosa_awal="", diagnosa_akhir="", operasi="",riwayat_penyakit="", pemeriksaan_fisik="", 
        hasil_lab="", perkembangan="", kesimpulan="",date_db="";

try{

    
    //initialize get param from input
        id_resume_medis=request.getParameter("id_resume_medis");
        diagnosa_awal=request.getParameter("diagnosa_awal");
        diagnosa_akhir=request.getParameter("diagnosa_akhir");
        operasi=request.getParameter("operasi");
        riwayat_penyakit=request.getParameter("riwayat_penyakit");
        pemeriksaan_fisik=request.getParameter("pemeriksaan_fisik");
        hasil_lab=request.getParameter("hasil_lab");
        perkembangan=request.getParameter("perkembangan");
        kesimpulan=request.getParameter("kesimpulan");
        date_db=request.getParameter("tglbuat");
        //out.print(date_db);
        //out.print(kesimpulan);
 
        /*
            out.println("diagnosa awal = "+diagnosa_awal+"</br></br>");
    out.println("diagnosa akhir = "+diagnosa_akhir+"</br></br>");
    out.println("operasi = "+operasi+"</br></br>");
    out.println("riwayat penyakit = "+riwayat_penyakit+"</br></br>");
    out.println("pemeriksaan fisik = "+pemeriksaan_fisik+"</br></br>");
    out.println("hasil lab = "+hasil_lab+"</br></br>");
    out.println("perkembangan pasien = "+perkembangan+"</br></br>");
    out.println("kesimpulan = "+kesimpulan+"</br></br>");
*/
        String date=HIBE.date();

        //start HIBE
    HIBE hibe_root = new HIBE(path_hibe);
    //String nmf=id_resume_medis+"_"+date+".txt";
    //hibe_root.save(fullpath+nmf); //edit your path
    Entity root = hibe_root.getEntity(new String[0]);

        //start encrpt with HIBE
        byte[] ct_diagnosa_awal = root.encrypt(diagnosa_awal.getBytes(), new String[0]);
        byte[] ct_diagnosa_akhir = root.encrypt(diagnosa_akhir.getBytes(), new String[0]);
        byte[] ct_operasi = root.encrypt(operasi.getBytes(), new String[0]);
        byte[] ct_riwayat_penyakit = root.encrypt(riwayat_penyakit.getBytes(), new String[0]);
        byte[] ct_pemeriksaan_fisik = root.encrypt(pemeriksaan_fisik.getBytes(), new String[0]);
        byte[] ct_hasil_lab = root.encrypt(hasil_lab.getBytes(), new String[0]);
        byte[] ct_perkembangan = root.encrypt(perkembangan.getBytes(), new String[0]);
        byte[] ct_kesimpulan = root.encrypt(kesimpulan.getBytes(), new String[0]);

        
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
        pstmt=conn.prepareStatement("update rs_resume_medis set diagnosa_awal=?,diagnosa_akhir=?,operasi=?,riwayat_penyakit=?,pemeriksaan_fisik=?,hasil_lab=?,perkembangan=?,kesimpulan=?,updated=? where id_resume_medis='"+id_resume_medis+"'");
        pstmt.setString(1,new BASE64Encoder().encode(ct_diagnosa_awal));
        pstmt.setString(2,new BASE64Encoder().encode(ct_diagnosa_akhir));
        pstmt.setString(3,new BASE64Encoder().encode(ct_operasi));
        pstmt.setString(4,new BASE64Encoder().encode(ct_riwayat_penyakit));
        pstmt.setString(5,new BASE64Encoder().encode(ct_pemeriksaan_fisik));
        pstmt.setString(6,new BASE64Encoder().encode(ct_hasil_lab));
        pstmt.setString(7,new BASE64Encoder().encode(ct_perkembangan));
        pstmt.setString(8,new BASE64Encoder().encode(ct_kesimpulan));
        pstmt.setString(9,date);
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