<%
long aw=System.currentTimeMillis();
%>
<%@page import="sun.misc.BASE64Encoder"%>
<%@include file="include/koneksi.jsp" %>
<%@include file="include/path.jsp" %>
<%@page import="hb.*"%>

<%@page import="com.itextpdf.text.Rectangle"%>
<%@page import="com.itextpdf.text.pdf.ColumnText"%>
<%@page import="java.io.*"%>
<%@page import="java.util.Date"%>

<%@page import="com.itextpdf.text.Document"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.Chunk"%>
<%@page import="com.itextpdf.text.PageSize"%>
<%@page import="com.itextpdf.text.Phrase"%>
<%@page import="com.itextpdf.text.Font"%>
<%@page import="serv.head"%>

<%
//initialize param
int id_rujukan=1;
String id_resume_medis="",id_mr="", nama="", umur="", alamat="" , jenis_kelamin="", diagnosa_awal="",
       pemeriksaan_fisik="", keadaan="",dokter="",rs_asal="",rs_tujuan="",as="", aa="";
String date=HIBE.date();

//String fullpath=path_surat+"/home_surat_"; 

    //initialize get param from input
    id_resume_medis=request.getParameter("id_resume_medis");
    id_mr=request.getParameter("id_mr");
    nama=request.getParameter("nama");
    umur=request.getParameter("umur");
    alamat=request.getParameter("alamat");
    jenis_kelamin=request.getParameter("jenis_kelamin");
    diagnosa_awal=request.getParameter("diagnosa_awal");
    pemeriksaan_fisik=request.getParameter("pemeriksaan_fisik");
    keadaan=request.getParameter("keadaan");
    rs_asal=request.getParameter("rs_asal");
    rs_tujuan=request.getParameter("rs_tujuan");
    dokter=request.getParameter("dokter");

String sql="SELECT * FROM  rs_tipe WHERE nama_rs='" +  rs_tujuan + "' ";
//out.println(sql+"</br>");
rs=stmt.executeQuery(sql);//select tipe rs

try{

    //try mkdir
    File entityPath = new File(path_surat);
    if(! entityPath.exists())
    entityPath.mkdirs();


    //read tipe rs from sql 
    while(rs.next()){
        as=rs.getString("tipe_rs");
       aa=rs.getString("alamat_rs");
    }
   /* out.println("id_mr = "+id_mr +"</br></br>");
    out.println ("nama = "+nama+"</br></br>");
    out.println ("alamat = "+alamat+"</br></br>");
    out.println ("umur = "+umur+"</br></br>");
    out.println("jenis kelamin = "+jenis_kelamin+"</br></br>");
    out.println("diagnosa awal = "+diagnosa_awal+"</br></br>");
    out.println("diagnosa akhir = "+diagnosa_akhir+"</br></br>");
    out.println("operasi = "+operasi+"</br></br>");
    out.println("riwayat penyakit = "+riwayat_penyakit+"</br></br>");
    out.println("pemeriksaan fisik = "+pemeriksaan_fisik+"</br></br>");
    out.println("hasil lab = "+hasil_lab+"</br></br>");
    out.println("perkembangan pasien = "+perkembangan+"</br></br>");
    out.println("kesimpulan = "+kesimpulan+"</br></br>");
    out.println("dokter = "+dokter+"</br></br>");
    out.println(tgl_masuk);
    out.println(tgl_keluar);
    out.println(date);*/


        //insert null
        Statement st = conn.createStatement();

        // note that i'm leaving "date_created" out of this insert statement
        st.executeUpdate("insert into rs_surat_rjk(id_resume_medis,id_mr,nama_pasien,umur,alamat_pasien,jenis_kelamin,diagnosa_awal,pemeriksaan_fisik,"
                + " keadaan,rs_asal,rs_tujuan,nama_dokter,created) "
                            + "values(NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)",Statement.RETURN_GENERATED_KEYS);


        //ResultSet keyResultSet = stmt.getGeneratedKeys();
        rs = st.getGeneratedKeys();    
        if (rs.next()) {
            id_rujukan = rs.getInt(1);
        }

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
        byte[] ct_pemeriksaan_fisik = root.encrypt(pemeriksaan_fisik.getBytes(), new String[0]);
        byte[] ct_keadaan = root.encrypt(keadaan.getBytes(), new String[0]);
        byte[] ct_dokter = root.encrypt(dokter.getBytes(), new String [0]);

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

        pstmt=conn.prepareStatement("update rs_surat_rjk set id_resume_medis=?,id_mr=?,nama_pasien=?,umur=?,alamat_pasien=?,jenis_kelamin=?,diagnosa_awal=?,pemeriksaan_fisik=?,"
                + " keadaan=?,rs_asal=?,rs_tujuan=?,nama_dokter=?,created=? where id_rujukan='"+id_rujukan+"'");
        pstmt.setString(1,id_resume_medis);
        pstmt.setString(2,id_mr);
        pstmt.setString(3,new BASE64Encoder().encode(ct_nama));
        pstmt.setString(4,new BASE64Encoder().encode(ct_umur));
        pstmt.setString(5,new BASE64Encoder().encode(ct_alamat));
        pstmt.setString(6,new BASE64Encoder().encode(ct_jenis_kelamin));
        pstmt.setString(7,new BASE64Encoder().encode(ct_diagnosa_awal));
        pstmt.setString(8,new BASE64Encoder().encode(ct_pemeriksaan_fisik));
        pstmt.setString(9,new BASE64Encoder().encode(ct_keadaan));
        pstmt.setString(10,rs_asal);
        pstmt.setString(11,rs_tujuan);
        pstmt.setString(12,new BASE64Encoder().encode(ct_dokter));
        pstmt.setString(13,date);
        pstmt.executeUpdate();

        /*out.print("Please download this keys and send to dokter </br>");
        //out.println("sd");
        out.println("<a href='param/"+user+"/home_resume_"+nmf+"'target='_blank'>home_resume_"+nmf+" </a> </br> " ); 
        out.println("<a href='param/"+user+"/entity_resume_"+nmf+"'target='_blank'>entity_resume_"+nmf+"</a>  </br>" );
        out.print("</br>copy this to your email </br>====================================================</br>");
        out.print("tolong segera diperiksa pasien dengan id mr = <b>"+id_rujukan+"</b></br>");
        out.print("upload file : </br>");
        out.print("1. home_resume_"+nmf+" to direktori <b>/upload</b></br>");
        out.print("2. entity_resume_"+nmf+" to direktori <b>/upload</b></br>");
        out.print("</br></br>thanks </br></br></br></br>");
        out.print(dokter);*/

            Document document = new Document(PageSize.A4, 40, 40, 70, 20);
	PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(path_surat+"/"+id_mr+"_"+rs_asal+"_"+rs_tujuan+"_"+date+".pdf"));
        Rectangle rect = new Rectangle(550, 780);
        writer.setBoxSize("art", rect);
        head event = new head();
        writer.setPageEvent(event);
        document.open();
        //String d=date.substring(0,9);
        document.add(new Paragraph("Surabaya, "+date.substring(0,10) ));
            document.add(Chunk.NEWLINE);
            document.add(new Paragraph("Yth. Dokter ... "));
            document.add(new Paragraph(rs_tujuan));
            document.add(new Paragraph(aa));
            document.add(Chunk.NEWLINE);
            document.add(new Paragraph("Assalamualaikum Wr. Wb."));
            document.add(Chunk.NEWLINE);
            document.add(new Paragraph("Mohon Pemeriksaan dan tindakan selanjutnya untuk pasien"));
            document.add(new Paragraph("ID Resume Medis : "+id_resume_medis));
            document.add(new Paragraph("Nama : "+ nama));
            document.add(new Paragraph("Umur : "+ umur));
            document.add(new Paragraph("Alamat : "+ alamat));
            document.add(new Paragraph("Diagnosa : "+ diagnosa_awal));
            document.add(new Paragraph("Pemeriksaan Fisik : "+ pemeriksaan_fisik));
            document.add(new Paragraph("Keadaan Pasien Saat Dirujuk : "+ keadaan));
            document.add(new Paragraph("Atas kerja samanya kami ucapkan terima kasih"));
            document.add(Chunk.NEWLINE);
            document.add(new Paragraph("Wassalamualaikum Wr. Wb."));
            document.add(Chunk.NEWLINE);
            document.add(Chunk.NEWLINE);
            document.add(Chunk.NEWLINE);
            document.add(new Paragraph(dokter));
        //document.close();
	out.println("klik di <a href='param/"+user+"/surat/"+id_mr+"_"+rs_asal+"_"+rs_tujuan+"_"+date+".pdf'<b>sini</b></a> untuk mendownload file surat rujukan");    
        
        /*OutputStream file = new FileOutputStream(new File(path_surat+"/"+id_mr+"_"+rs_asal+"_"+rs_tujuan+"_"+date+".pdf"));

            Document document = new Document();
            PdfWriter.getInstance(document, file);

            document.open();
            document.add(new Paragraph("Surabaya, "+date ));
            document.add(Chunk.NEWLINE);
            document.add(new Paragraph("Yth. dokter di rumah sakit "+rs_tujuan));
           // document.add(Chunk.NEWLINE);
            document.add(new Paragraph("Assalamualaikum Wr. Wb."));
            document.add(new Paragraph("Mohon Pemeriksaan dan tindakan selanjutnya untuk pasien"));
            document.add(new Paragraph("Nama : "+ nama));
            document.add(new Paragraph("Umur : "+ umur));
            document.add(new Paragraph("Alamat : "+ alamat));
            document.add(new Paragraph("Diagnosa : "+ diagnosa_awal));
            document.add(new Paragraph("Pemeriksaan Fisik : "+ pemeriksaan_fisik));
            document.add(new Paragraph("Keadaan Pasien Saat Dirujuk : "+ keadaan));
            document.add(new Paragraph("Atas kerja samanya kami ucapkan terima kasih"));
            document.add(new Paragraph("Wassalamualaikum Wr. Wb."));
            //document.add(Chunk.NEWLINE);
            //document.add(Chunk.NEWLINE);
            //document.add(Chunk.NEWLINE);
            document.add(new Paragraph(dokter));*/

            document.close();
           // file.close();
%>
<br><a href="index_action.jsp">back</a>
<%}catch (Exception e)
    {
      out.println("ERROR! ");
      out.println(e.getMessage());
    }

    

//rs.close();
stmt.close();
conn.close();


%>
<%
long ak=System.currentTimeMillis();
System.out.println((ak-aw)+" ms");
%>