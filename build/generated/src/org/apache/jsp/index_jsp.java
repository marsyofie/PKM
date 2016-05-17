package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.Vector _jspx_dependants;

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

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("\t<head>\r\n");
      out.write("\t\t<title>Medicare Website</title>\r\n");
      out.write("\t\t<link href=\"css/style.css\" rel=\"stylesheet\" type=\"text/css\"  media=\"all\" />\r\n");
      out.write("\t\t<link href='http://fonts.googleapis.com/css?family=Ropa+Sans' rel='stylesheet' type='text/css'>\r\n");
      out.write("\t\t<script src=\"http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("\t</head>\r\n");
      out.write("\t<body>\r\n");
      out.write("\t\t<!--start-wrap-->\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\t<!--start-header-->\r\n");
      out.write("\t\t\t<div class=\"header\">\r\n");
      out.write("\t\t\t\t<div class=\"wrap\">\r\n");
      out.write("\t\t\t\t<!--start-logo-->\r\n");
      out.write("\t\t\t\t<div class=\"logo\">\r\n");
      out.write("\t\t\t\t\t<a href=\"index.jsp\"><img src=\"images/logo.png\" title=\"logo\" /></a>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<!--end-logo-->\r\n");
      out.write("\t\t\t\t<!--start-top-nav-->\r\n");
      out.write("\t\t\t\t<div class=\"top-nav\">\r\n");
      out.write("\t\t\t\t\t<ul>\r\n");
      out.write("\t\t\t\t\t\t<li class=\"active\"><a href=\"index.jsp\">Home</a></li>\r\n");
      out.write("                                                <li><a href=\"about.jsp\">About</a></li>\r\n");
      out.write("\t\t\t\t\t\t<li><a href=\"services.jsp\">Layanan</a></li>\r\n");
      out.write("                                                \r\n");
      out.write("                                                ");

                                                    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
                                                    
      out.write("\r\n");
      out.write("                                                    <li><a href=\"admin/log.jsp\">login</a></li>\r\n");
      out.write("                                                    ");

                                                    } else {
                                                         
      out.write(" \r\n");
      out.write("                                                         <li><a href=\"index_action.jsp\">Action</a></li>\r\n");
      out.write("                                                ");

                                                        }

                                                        
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t</ul>\t\t\t\t\t\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div class=\"clear\"> </div>\r\n");
      out.write("\t\t\t\t<!--end-top-nav-->\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<!--end-header-->\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"clear\"> </div>\r\n");
      out.write("\r\n");
      out.write("\t\t    <div class=\"clear\"> </div>\r\n");
      out.write("\t\t    <div class=\"content-grids\">\r\n");
      out.write("\t\t    \t<div class=\"wrap\">\r\n");
      out.write("\t\t    \t<div class=\"section group\">\r\n");
      out.write("\t\t\t\t<div class=\"listview_1_of_3 images_1_of_3\">\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t  <img src=\"images/mri.jpg\">\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<div class=\"text list_1_of_2\">\r\n");
      out.write("\t\t\t\t\t\t  <h3> MRI</h3>\r\n");
      out.write("\t\t\t\t\t\t  <p>Need More info?</p>\r\n");
      out.write("\t\t\t\t\t\t  \r\n");
      out.write("                                                          MRI (Magnetic Resonance Imaging) dapat melihat kelainan pada organ sendi, deteksi kelainan jaringan lunak otak dan tulang belakang serta mendeteksi stroke dengan dipandu Dokter Spesialis yang handal.\r\n");
      out.write("Estimasi biaya pemeriksaan MRI mulai Rp.1.500.000,- s/d Rp.3.000.000,- Silahkan hubungi Bagian Radiologi\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\t\t\t\t\r\n");
      out.write("\t\t\t\t<div class=\"listview_1_of_3 images_1_of_3\">\r\n");
      out.write("\t\t\t\t\t\t  <img src=\"images/ct-scan.jpg\">\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<div class=\"text list_1_of_2\">\r\n");
      out.write("\t\t\t\t\t\t  <h3> CT-Scan</h3>\r\n");
      out.write("\t\t\t\t\t\t  <p>Need More info?</p>\r\n");
      out.write("\t\t\t\t\t\t  CT-Scan (Compuerized Tomography Scanner) adalah untuk mendeteksi pendarahan otak, cidera otak, patah tulang, tumor, dan kanker serta penyakit lainnya. \r\n");
      out.write("Estimasi biaya pemeriksaan CT-Scan mulai Rp.693.000,- s/d Rp.2.900.000,- Silahkan hubungi bagian Radiologi\r\n");
      out.write("\t\t\t\t     </div>\r\n");
      out.write("\t\t\t\t</div>\t\t\t\t\r\n");
      out.write("\t\t\t\t<div class=\"listview_1_of_3 images_1_of_3\">\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t  <img src=\"images/poli-ibu.jpg\">\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t<div class=\"text list_1_of_2\">\r\n");
      out.write("\t\t\t\t\t\t  <h3>Poliklinik Terpadu Ibu & Anak</h3>\r\n");
      out.write("\t\t\t\t\t\t  <p>Need More info?</p>\r\n");
      out.write("\t\t\t\t\t\t  Poliklinik Terpadu Ibu & Anak didedikasikan khusus untuk pelayanan kesehatan ibu dan anak dengan design yang nyaman. Didukung dengan 14 dokter Spesialis dan Sub Spesialis Anak, juga 10 Spesialis dan Sub Spesialis Kandungan dan Kebidanan. Silahkan hubungi bagian Poli Ibu dan Anak.\r\n");
      out.write("\t\t\t\t    </div>\r\n");
      out.write("\t\t\t\t</div>\t\t\t\t\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t    </div>\r\n");
      out.write("\t\t   </div>\r\n");
      out.write("\r\n");
      out.write("\t\t   <div class=\"footer\">\r\n");
      out.write("\t\t   \t <div class=\"wrap\">\r\n");
      out.write("\t\t   \t<div class=\"footer-left\">\r\n");
      out.write("\t\t   \t\t\t<ul>\r\n");
      out.write("\t\t\t\t\t\t<li><a href=\"index.jsp\">Home</a></li>\r\n");
      out.write("\t\t\t\t\t\t<li><a href=\"about.jsp\">About</a></li>\r\n");
      out.write("\t\t\t\t\t\t<li><a href=\"services.jsp\">Layanan</a></li>\r\n");
      out.write("\t\t\t\t\t\t ");

                                                    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
                                                    
      out.write("\r\n");
      out.write("                                                    <li><a href=\"admin/log.jsp\">login</a></li>\r\n");
      out.write("                                                    ");

                                                    } else {
                                                         
      out.write(" \r\n");
      out.write("                                                         <li><a href=\"index_action.jsp\">Action</a></li>\r\n");
      out.write("                                                ");

                                                        }

                                                        
      out.write("\r\n");
      out.write("\t\t\t\t\t</ul>\r\n");
      out.write("\t\t   \t</div>\r\n");
      out.write("\t\t   \t<div class=\"footer-right\">\r\n");
      out.write("\t\t   \t\t\r\n");
      out.write("\t\t   \t</div>\r\n");
      out.write("\t\t   \t<div class=\"clear\"> </div>\r\n");
      out.write("\t\t   </div>\r\n");
      out.write("\t\t   </div>\r\n");
      out.write("\t\t<!--end-wrap-->\r\n");
      out.write("\t</body>\r\n");
      out.write("</html>\r\n");

long ak=System.currentTimeMillis();
System.out.println((ak-aw)+" ms");

      out.write("\r\n");
      out.write("\r\n");
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
