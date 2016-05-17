package org.apache.jsp.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.io.*;

public final class reg_005fpasien_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.Vector _jspx_dependants;

  static {
    _jspx_dependants = new java.util.Vector(1);
    _jspx_dependants.add("/admin/../include/koneksi.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");


long aw=System.currentTimeMillis();

      out.write('\n');
      out.write('\n');
      out.write("\n");
      out.write("\n");
      out.write("\n");

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

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("\t<head>\n");
      out.write("\t\t<title>Medicare Website</title>\n");
      out.write("\t\t<link href=\"../css/style.css\" rel=\"stylesheet\" type=\"text/css\"  media=\"all\" />\n");
      out.write("\t\t<link href='http://fonts.googleapis.com/css?family=Ropa+Sans' rel='stylesheet' type='text/css'>\n");
      out.write("                    <script type=\"text/javascript\" src=\"../scripts/jquery-1.8.2.min.js\"></script>\n");
      out.write("\t<script type=\"text/javascript\" src=\"../src/jquery.autocomplete.js\"></script>\n");
      out.write("\t\n");
      out.write(" <script type=\"text/javascript\">\n");
      out.write("    \n");
      out.write("    $(document).ready(function(){\n");
      out.write("    \t \n");
      out.write("    \t$(\"#autocomplete\").autocomplete({\n");
      out.write("    \t\t//lookup: countries,\n");
      out.write("    \t\tserviceUrl:'Auto1', //tell the script where to send requests\n");
      out.write("    \t  \n");
      out.write("    \t    width: 350, //set width\n");
      out.write("    \t    \n");
      out.write("    \t    //callback just to show it's working\n");
      out.write("    \t    onSelect: function (suggestion) {\n");
      out.write("       \t\t\t\t$('#selection').html('You selected: <br>' + suggestion.value + ' <br>' + suggestion.data);\n");
      out.write("    \t\t\t\t},\n");
      out.write("    \tshowNoSuggestionNotice: true,\n");
      out.write("        noSuggestionNotice: 'Sorry, no matching results',\n");
      out.write("    \t\n");
      out.write("    \t\n");
      out.write("    \t});\n");
      out.write("    });\n");
      out.write("    </script> \n");
      out.write("\t</head>\n");
      out.write("        \n");
      out.write("\t<body>\n");
      out.write("            \t   \n");
      out.write("\t\t<!--start-wrap-->\n");
      out.write("\t\t\n");
      out.write("\t\t\t<!--start-header-->\n");
      out.write("\t\t\t<div class=\"header\">\n");
      out.write("\t\t\t\t<div class=\"wrap\">\n");
      out.write("\t\t\t\t<!--start-logo-->\n");
      out.write("\t\t\t\t<div class=\"logo\">\n");
      out.write("\t\t\t\t\t<a href=\"index.jsp\"><img src=\"../images/logo.png\" title=\"logo\" /></a>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t<!--end-logo-->\n");
      out.write("\t\t\t\t<!--start-top-nav-->\n");
      out.write("\t\t\t\t<div class=\"top-nav\">\n");
      out.write("\t\t\t\t\t<ul>\n");
      out.write("\t\t\t\t\t\t<li class=\"active\"><a href=\"../index.jsp\">Home</a></li>\n");
      out.write("\t\t\t\t\t\t<li><a href=\"../about.jsp\">About</a></li>\n");
      out.write("\t\t\t\t\t\t<li><a href=\"../services.jsp\">Layanan</a></li>\n");
      out.write("                                                ");

                                                    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
                                                    
      out.write("\n");
      out.write("                                                    <li><a href=\"log.jsp\">login</a></li>\n");
      out.write("                                                    ");

                                                    } else {
                                                         
      out.write(" \n");
      out.write("                                                         <li><a href=\"index_admin.jsp\">Action</a></li>\n");
      out.write("                                                ");

                                                        }

                                                        
      out.write("\n");
      out.write("\t\t\t\t\t</ul>\t\t\t\t\t\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t<div class=\"clear\"> </div>\n");
      out.write("\t\t\t\t<!--end-top-nav-->\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t<!--end-header-->\n");
      out.write("\t\t</div>\n");
      out.write("\t\t<div class=\"clear\"> </div>\n");
      out.write("\n");
      out.write("\t\t    <div class=\"clear\"> </div>\n");
      out.write("\t\t    <div class=\"content-grids2\">\n");
      out.write("\t\t    </div>\n");
      out.write("\t\t   </div>\n");
      out.write("\t\t   <div class=\"wrap\">\n");
      out.write("\t\t   <div class=\"content-box\">\n");
      out.write("\t\t   <div class=\"section group\">\n");
      out.write("                       ");

    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {

      out.write("\n");
      out.write("You are not logged in<br/>\n");
      out.write("<a href=\"log.jsp\">Please Login</a>\n");
} else if((session.getAttribute("priv").equals("1"))){

      out.write("\n");
      out.write("                       <div class=\"left\">\n");
      out.write("    Welcome <b>");
      out.print(session.getAttribute("userid"));
      out.write("</b><br><br>\n");
      out.write("                           <ul>\n");
      out.write("                               <li class=\"btn\"><a href=\"insert_dokter.jsp\"/>Input Data Dokter</a></li>\n");
      out.write("                               <li class=\"btn\"><a href=\"reg_pasien.jsp\"/>Registrasi Pasien</a></li>\n");
      out.write("                               <li class=\"btn\"><a href=\"view_pasien.jsp\"/>Lihat Data Pasien</a></li>\n");
      out.write("                               <li class=\"btn\"><a href=\"search.jsp\"/>Search </a></li>\n");
      out.write("                               <li class=\"btn\"><a href=\"../logout.jsp\"/>Logout</a></li>\n");
      out.write("                          </ul>\n");
      out.write("\t\t\t</div>\n");
      out.write("                       <div class=\"right\" align=\"center\">\n");
      out.write("                           <span style=\"font-size: 25px;\">FORM REGISTRASI PASIEN </h6>\n");
      out.write("\n");
      out.write("        <form action=\"registration.jsp\" method=\"post\" >\n");
      out.write("          <table border=\"0\" cellpadding=\"2\" cellspacing=\"2\" width=\"80%\">\n");
      out.write("                    <tr>\n");
      out.write("                        <td>Nama</td>\n");
      out.write("                        <td><input type=\"text\" name=\"nama\" value=\"\" /></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>Tempat Lahir</td>\n");
      out.write("                        <td><input type=\"text\" name=\"tempatlahir\" value=\"\" /></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>Tanggal Lahir</td>\n");
      out.write("                        <td><input type=\"text\" name=\"tgllahir\" value=\"\" /></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>Jenis Kelamin</td>\n");
      out.write("                        <td><select name=\"jenis_kelamin\">\n");
      out.write("                                <option value=\"L\">Laki-laki</option>\n");
      out.write("                                <option value=\"P\">Perempuan</option>\n");
      out.write("                            </select></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>Gol. Darah</td>\n");
      out.write("                        <td><input type=\"text\" name=\"goldar\" value=\"\" /></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>Alamat</td>\n");
      out.write("                        <td><textarea cols=\"50\" rows=\"3\" name=\"alamat\" value=\"\"></textarea></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>Agama</td>\n");
      out.write("                        <td><input type=\"text\" name=\"agama\" value=\"\" /></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>Status Perkawinan</td>\n");
      out.write("                        <td><select name=\"status\">\n");
      out.write("                                <option value=\"Kawin\">Kawin</option>\n");
      out.write("                                <option value=\"Belum Kawin\">Belum Kawin</option>\n");
      out.write("                            </select></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>Pekerjaan</td>\n");
      out.write("                        <td><input type=\"text\" name=\"country\" id=\"autocomplete\"\tclass=\"form-control\" placeholder=\"Masukkan ID Pasien\" /><input type=\"text\" name=\"pekerjaan\" value=\"\" /></td>\n");
      out.write("                    </tr>\n");
      out.write("\n");
      out.write("           \n");
      out.write("                    <tr>\n");
      out.write("                        <td>Kewarganegaraan</td>\n");
      out.write("                        <td><select name=\"warganegara\">\n");
      out.write("                                <option value=\"WNI\">WNI</option>\n");
      out.write("                                <option value=\"WNA\">WNA</option>\n");
      out.write("                            </select></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>No. Tlp</td>\n");
      out.write("                        <td><input type=\"text\" name=\"no_tlp\" value=\"\" maxlength=\"13\" /></td>\n");
      out.write("                    </tr>\n");
      out.write("                   \n");
      out.write("            \n");
      out.write("            <tr>\n");
      out.write("              <td class=\"submission\" colspan=\"2\"><div align=\"center\">\n");
      out.write("                <input name=\"s\" type=\"submit\" class=\"button\" value=\"ADD\" />\n");
      out.write("                <input name=\"Reset\" type=\"reset\" class=\"button\" value=\"RESET\" />\n");
      out.write("              </div></td>\n");
      out.write("            </tr>\n");
      out.write("           \n");
      out.write("          </table>\n");
      out.write("         \n");
      out.write("        </form>\n");
      out.write("                       </div>\n");
      out.write("                  ");
 }else {
                         response.sendRedirect("../index_action.jsp");                               
                  }
                  
                                  
      out.write("\n");
      out.write("                   </div>\n");
      out.write("\t\t   </div>\n");
      out.write("\t\t   </div>\n");
      out.write("\t\t   <div class=\"clear\"> </div>\n");
      out.write("\t\t   <div class=\"footer\">\n");
      out.write("\t\t   \t <div class=\"wrap\">\n");
      out.write("\t\t   \t<div class=\"footer-left\">\n");
      out.write("\t\t   \t\t\t<ul>\n");
      out.write("\t\t\t\t\t\t<li><a href=\"../index.jsp\">Home</a></li>\n");
      out.write("\t\t\t\t\t\t<li><a href=\"../about.jsp\">About</a></li>\n");
      out.write("\t\t\t\t\t\t<li><a href=\"../services.jsp\">Layanan</a></li>\n");
      out.write("\t\t\t\t\t\t ");

                                                    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
                                                    
      out.write("\n");
      out.write("                                                    <li><a href=\"log.jsp\">login</a></li>\n");
      out.write("                                                    ");

                                                    } else {
                                                         
      out.write(" \n");
      out.write("                                                         <li><a href=\"index_action.jsp\">Action</a></li>\n");
      out.write("                                                ");

                                                        }

                                                        
      out.write("\n");
      out.write("\t\t\t\t\t</ul>\n");
      out.write("\t\t   \t</div>\n");
      out.write("\t\t   \t<div class=\"footer-right\">\n");
      out.write("\t\t   \t</div>\n");
      out.write("\t\t   \t<div class=\"clear\"> </div>\n");
      out.write("\t\t   </div>\n");
      out.write("\t\t   </div>\n");
      out.write("\t\t<!--end-wrap-->\n");
      out.write("\t</body>\n");
      out.write("</html>\n");
      out.write("\n");

long ak=System.currentTimeMillis();
System.out.println((ak-aw)+" ms");

      out.write('\n');
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
