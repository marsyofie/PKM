<%
long aw=System.currentTimeMillis();
%>
<%@page import="sun.misc.BASE64Encoder"%>
<%@include file="include/koneksi.jsp" %>
<%@include file="include/path.jsp" %>
<%@page import="hb.*"%>

<%
//initialize param
int id_resume_medis=1;
String id_mr="", nama="", umur="", alamat="" , jenis_kelamin="", diagnosa_awal="",
       diagnosa_akhir="", operasi="",riwayat_penyakit="", pemeriksaan_fisik="", hasil_lab="", 
       perkembangan="", kesimpulan="", tgl_masuk="", tgl_keluar="",dokter="",as="" ;
String date=HIBE.date();

try{

    /*//try mkdir
    File entityPath = new File(path_resume);
    if(! entityPath.exists())
    entityPath.mkdirs();*/

    //initialize get param from input
    id_mr=request.getParameter("id_mr");
    nama=request.getParameter("nama");
    umur=request.getParameter("umur");
    alamat=request.getParameter("alamat");
    jenis_kelamin=request.getParameter("jenis_kelamin");
    diagnosa_awal=request.getParameter("diagnosa_awal");
    diagnosa_akhir=request.getParameter("diagnosa_akhir");
    operasi=request.getParameter("operasi");
    riwayat_penyakit=request.getParameter("riwayat_penyakit");
    pemeriksaan_fisik=request.getParameter("pemeriksaan_fisik");
    hasil_lab=request.getParameter("hasil_lab");
    perkembangan=request.getParameter("perkembangan");
    kesimpulan=request.getParameter("kesimpulan");
    tgl_masuk=request.getParameter("tanggal1");
    tgl_keluar=request.getParameter("tanggal2");
    dokter=request.getParameter("dokter");



    //insert null
    Statement st = conn.createStatement();

    // note that i'm leaving "date_created" out of this insert statement
    st.executeUpdate("insert into rs_resume_medis(id_mr,nama_pasien,umur,alamat_pasien,jenis_kelamin,diagnosa_awal,diagnosa_akhir"
                        + ",operasi,riwayat_penyakit,pemeriksaan_fisik, hasil_lab,perkembangan,kesimpulan,tgl_masuk,tgl_keluar,nama_dokter,created) "
                        + "values('1','','','','','','','','','','','','','"+tgl_masuk+"','"+tgl_keluar+"','','')",Statement.RETURN_GENERATED_KEYS);


    //ResultSet keyResultSet = stmt.getGeneratedKeys();
    rs = st.getGeneratedKeys();    
    if (rs.next()) {
        id_resume_medis = rs.getInt(1);
    }

    long y=System.currentTimeMillis();
    //start HIBE
    HIBE hibe_root = new HIBE(path_hibe);
    //String nmf=id_resume_medis+"_"+date+".txt";
    //hibe_root.save(fullpath+nmf); //edit your path
    Entity root = hibe_root.getEntity(new String[0]);


    //start encrpt with HIBE
    byte[] ct_nama = root.encrypt(nama.getBytes(), new String[0]); 
    byte[] ct_umur = root.encrypt(umur.getBytes(), new String[0]);
    byte[] ct_alamat = root.encrypt(alamat.getBytes(), new String[0]);
    byte[] ct_jenis_kelamin = root.encrypt(jenis_kelamin.getBytes(), new String[0]);
    byte[] ct_diagnosa_awal = root.encrypt(diagnosa_awal.getBytes(), new String[0]);
    byte[] ct_diagnosa_akhir = root.encrypt(diagnosa_akhir.getBytes(), new String[0]);
    byte[] ct_operasi=root.encrypt(operasi.getBytes(), new String[0]);
    byte[] ct_riwayat_penyakit = root.encrypt(riwayat_penyakit.getBytes(), new String[0]);
    byte[] ct_pemeriksaan_fisik = root.encrypt(pemeriksaan_fisik.getBytes(), new String[0]);
    byte[] ct_hasil_lab = root.encrypt(hasil_lab.getBytes(), new String[0]);
    byte[] ct_perkembangan_px = root.encrypt(perkembangan.getBytes(), new String[0]);
    byte[] ct_kesimpulan = root.encrypt(kesimpulan.getBytes(), new String [0]);
    byte[] ct_dokter = root.encrypt(dokter.getBytes(), new String [0]);



    pstmt=conn.prepareStatement("update rs_resume_medis set id_mr=?,nama_pasien=?,umur=?,alamat_pasien=?,jenis_kelamin=?,diagnosa_awal=?,diagnosa_akhir=?"
            + ",operasi=?,riwayat_penyakit=?,pemeriksaan_fisik=?,hasil_lab=?,perkembangan=?,kesimpulan=?,tgl_masuk=?,tgl_keluar=?,nama_dokter=?,created=? where id_resume_medis='"+id_resume_medis+"'");
    pstmt.setString(1,id_mr);
    pstmt.setString(2,new BASE64Encoder().encode(ct_nama));
    pstmt.setString(3,new BASE64Encoder().encode(ct_umur));
    pstmt.setString(4,new BASE64Encoder().encode(ct_alamat));
    pstmt.setString(5,new BASE64Encoder().encode(ct_jenis_kelamin));
    pstmt.setString(6,new BASE64Encoder().encode(ct_diagnosa_awal));
    pstmt.setString(7,new BASE64Encoder().encode(ct_diagnosa_akhir));
    pstmt.setString(8,new BASE64Encoder().encode(ct_operasi));
    pstmt.setString(9,new BASE64Encoder().encode(ct_riwayat_penyakit));
    pstmt.setString(10,new BASE64Encoder().encode(ct_pemeriksaan_fisik));
    pstmt.setString(11,new BASE64Encoder().encode(ct_hasil_lab));
    pstmt.setString(12,new BASE64Encoder().encode(ct_perkembangan_px));
    pstmt.setString(13,new BASE64Encoder().encode(ct_kesimpulan));
    pstmt.setString(14,tgl_masuk);
    pstmt.setString(15,tgl_keluar);
    pstmt.setString(16,new BASE64Encoder().encode(ct_dokter));
    pstmt.setString(17,date);
    pstmt.executeUpdate();
long z=System.currentTimeMillis();
System.out.println((z-y));

%>
<script language="javascript">
        alert("Berhasil!!"); 
document.location="index_action.jsp";
</script>
<%}catch (Exception e)
    {
      out.println("ERROR! ");
      out.println(e.getMessage());
    }
//rs.close();
stmt.close();
conn.close();

//session.setAttribute("ingredient","ingredient ("+ingredient_code+") added successfully");
//response.sendRedirect("add_ingredient.jsp");

%>
<%
long ak=System.currentTimeMillis();
//System.out.println((ak-aw)+" ms");
%>