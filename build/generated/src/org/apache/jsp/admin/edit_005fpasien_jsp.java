package org.apache.jsp.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.io.*;

public final class edit_005fpasien_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\t</head>\n");
      out.write("\t<body>\n");
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
      out.write("\n");
      out.write("                                               ");

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
      out.write("                        \n");
      out.write("\t\t   <div class=\"content-box\">\n");
      out.write("\t\t   <div class=\"section group\">\n");
      out.write("                       ");

    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {

      out.write("\n");
      out.write("You are not logged in<br/>\n");
      out.write("<a href=\"log.jsp\">Please Login</a>\n");
} 
     else if((session.getAttribute("priv").equals("1"))){

      out.write("\n");
      out.write("\n");
      out.write("<div class=\"left\">\n");
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
      out.write("                       <div class=\"right\">\n");

String id_d="",id_mr="",nama="",alamat="",spesialis="",no_tlp="",uname="",pass="",email="";
//out.print(id_dok);
id_dok1=request.getParameter("id_pas");
if(id_dok1!=null)
id_dok=Integer.parseInt(id_dok1);  

rs=stmt.executeQuery("select * from rs_pasien where id_pasien='"+id_dok+"'");
if(rs.next())
{
id_d=rs.getString("id_pasien");
id_mr=rs.getString("id_mr");
nama=rs.getString("nama");
alamat=rs.getString("alamat");
no_tlp=rs.getString("no_tlp");
//uname=rs.getString("username_dr");
//pass=rs.getString("password");
//email=rs.getString("email");



      out.write("\n");
      out.write("<form action=\"update_pasien.jsp\" method=\"post\">\n");
      out.write("    <div align=\"center\"><table>\n");
      out.write("        <tr>\n");
      out.write("            <td>ID</td>\n");
      out.write("            <td><input type=\"text\" name=\"id_d\" value=\"");
      out.print(id_d);
      out.write("\" readonly></td>\n");
      out.write("        </tr>\n");
      out.write("        <tr>\n");
      out.write("            <td>ID MR</td>\n");
      out.write("            <td><input type=\"text\" name=\"id_mr\" value=\"");
      out.print(id_mr);
      out.write("\" readonly></td>\n");
      out.write("        </tr>\n");
      out.write("        <tr>\n");
      out.write("            <td>Nama</td>\n");
      out.write("            <td><input type=\"text\" name=\"nama\" value=\"");
      out.print(nama);
      out.write("\"></td>\n");
      out.write("        </tr>\n");
      out.write("        \n");
      out.write("        <tr>\n");
      out.write("            <td>Alamat</td>\n");
      out.write("            <td><input type=\"text\" name=\"alamat\" value=\"");
      out.print(alamat);
      out.write("\"></td>\n");
      out.write("        </tr>\n");
      out.write("        <tr>\n");
      out.write("            <td>No Tlp</td>\n");
      out.write("            <td><input type=\"text\" name=\"no_tlp\" value=\"");
      out.print(no_tlp);
      out.write("\"></td>\n");
      out.write("        </tr>\n");
      out.write("        \n");
      out.write("        <tr>\n");
      out.write("            <td colspan=\"2\" align=\"center\"><input value=\"Submit\" type=\"submit\"> &nbsp; <input value=\"Reset\" type=\"reset\"></td>\n");
      out.write("        </tr>\n");
      out.write("        </table></div>\n");
      out.write("</form>\n");


}else{
    out.print("Data yang dicari tidak ada");
}

      out.write("\n");
      out.write("            \n");

    }
 else {
    response.sendRedirect("../index_action.jsp");
       }

      out.write("\n");
      out.write("                       \n");
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
      out.write("                                                         <li><a href=\"index_admin.jsp\">Action</a></li>\n");
      out.write("                                                ");

                                                        }

                                                        
      out.write("\n");
      out.write("\t\t\t\t\t</ul>\n");
      out.write("\t\t   \t</div>\n");
      out.write("\t\t   \t<div class=\"footer-right\">\n");
      out.write("\n");
      out.write("\t\t   \t</div>\n");
      out.write("\t\t   \t<div class=\"clear\"> </div>\n");
      out.write("\t\t   </div>\n");
      out.write("\t\t   </div>\n");
      out.write("\t\t<!--end-wrap-->\n");
      out.write("\t</body>\n");
      out.write("</html>\n");

long ak=System.currentTimeMillis();
System.out.println((ak-aw)+" ms");

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
