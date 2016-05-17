<%@page import="java.sql.*"%>
 <%@page import="java.io.*" %>
<%
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/kuliner";
String username="root";
String password="123456";

int idd=0, x=0;

//String idd1="", id="", nama="", jk="", spesialis="", alamat="", delete="", a="";
String idd1="", id="",  delete="", a="";
//String select="select * from rs_dokter";

Connection conn=DriverManager.getConnection(url,username,password);
Statement stmt=conn.createStatement();
Statement stmt1=conn.createStatement();
ResultSet rs;
PreparedStatement pstmt;
String u="tes", v="bisa";



try {

    stmt = conn.createStatement();


    stmt.executeUpdate("INSERT INTO mydata (name,value) values ('"+u+"','"+v+"')", Statement.RETURN_GENERATED_KEYS);

    //
    // Example of using Statement.getGeneratedKeys()
    // to retrieve the value of an auto-increment
    // value
    //

    int autoIncKeyFromApi = -1;
    String value="";

    rs = stmt.getGeneratedKeys();

    if (rs.next()) {
        autoIncKeyFromApi = rs.getInt(1);
        value=rs.getString("name");
    } else {

        // throw an exception from here
    }

   out.println("Key returned from getGeneratedKeys():"
        + autoIncKeyFromApi);
} catch(Exception e) {
    out.print("error gan");
    out.print(e.getMessage());
    e.getMessage();
}
//ResultSet rs=stmt.executeQuery(select);
%>