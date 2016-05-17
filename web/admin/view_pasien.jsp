<%
long aw=System.currentTimeMillis();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../include/koneksi.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Medicare Website</title>
		<link href="../css/style.css" rel="stylesheet" type="text/css"  media="all" />
		<link href='http://fonts.googleapis.com/css?family=Ropa+Sans' rel='stylesheet' type='text/css'>
	</head>
	<body>
		<!--start-wrap-->
		
			<!--start-header-->
			<div class="header">
				<div class="wrap">
				<!--start-logo-->
				<div class="logo">
					<a href="index.jsp"><img src="../images/logo.png" title="logo" /></a>
				</div>
				<!--end-logo-->
				<!--start-top-nav-->
				<div class="top-nav">
					<ul>
						<li class="active"><a href="../index.jsp">Home</a></li>
						<li><a href="../about.jsp">About</a></li>
						<li><a href="../services.jsp">Layanan</a></li>

                                               <%
                                                    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
                                                    %>
                                                    <li><a href="admin/log.jsp">login</a></li>
                                                    <%
                                                    } else {
                                                         %> 
                                                         <li><a href="index_admin.jsp">Action</a></li>
                                                <%
                                                        }

                                                        %>
					</ul>					
				</div>
				<div class="clear"> </div>
				<!--end-top-nav-->
			</div>
			<!--end-header-->
		</div>
		<div class="clear"> </div>

		    <div class="clear"> </div>
		    <div class="content-grids2">
		    </div>
		   </div>
		   <div class="wrap">
                        
		   <div class="content-box">
		   <div class="section group">
                       <%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
%>
You are not logged in<br/>
<a href="log.jsp">Please Login</a>
<%} 
     else if((session.getAttribute("priv").equals("1"))){
%>

<div class="left">
    Welcome <b><%=session.getAttribute("userid")%></b><br><br>
                           <ul>
                               <li class="btn"><a href="insert_dokter.jsp"/>Input Data Dokter</a></li>
                               <li class="btn"><a href="reg_pasien.jsp"/>Registrasi Pasien</a></li>
                               <li class="btn"><a href="view_pasien.jsp"/>Lihat Data Pasien</a></li>
                               <li class="btn"><a href="search.jsp"/>Search </a></li>
                               <li class="btn"><a href="../logout.jsp"/>Logout</a></li>
                          </ul>
			</div>
                       <div class="right">
<script type="text/javascript">
function del()
{
if(confirm("Do You Want to Delete?"))
{
}
else
{
return false;
}
}
</script>
<% 
idd1=request.getParameter("id_pas");
if(idd1!=null)
idd=Integer.parseInt(idd1);
delete=request.getParameter("del");

if("yes".equals(delete))
{
//ingredient_code=request.getParameter("ingredient_code");
x=stmt1.executeUpdate("Delete from rs_pasien where id_mr="+idd);
%>
<script language="javascript">
        alert("Berhasil !!"); 
document.location="view_pasien.jsp";
</script>
<%
}
%>

<%!
public int nullIntconv(String str)
{
int conv=0;
if(str==null)
{
str="0";
}
else if((str.trim()).equals("null"))
{
str="0";
}
else if(str.equals(""))
{
str="0";
}
try{
conv=Integer.parseInt(str);
}
catch(Exception e)
{
}
return conv;
}
%>
<%

//Connection conn = null;
//Class.forName("com.mysql.jdbc.Driver").newInstance();
//conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kuliner","root","123456");

ResultSet rsPagination = null;
ResultSet rsRowCnt = null;

PreparedStatement psPagination=null;
PreparedStatement psRowCnt=null;

int iShowRows=15; // Number of records show on per page
int iTotalSearchRecords=10; // Number of pages index shown

int iTotalRows=nullIntconv(request.getParameter("iTotalRows"));
int iTotalPages=nullIntconv(request.getParameter("iTotalPages"));
int iPageNo=nullIntconv(request.getParameter("iPageNo"));
int cPageNo=nullIntconv(request.getParameter("cPageNo"));

int iStartResultNo=0;
int iEndResultNo=0;

if(iPageNo==0)
{
iPageNo=0;
}
else{
iPageNo=Math.abs((iPageNo-1)*iShowRows);
}
String sqlPagination="SELECT SQL_CALC_FOUND_ROWS * FROM rs_pasien order by id_mr DESC limit "+iPageNo+","+iShowRows+"";

psPagination=conn.prepareStatement(sqlPagination);
rsPagination=psPagination.executeQuery();

//// this will count total number of rows
String sqlRowCnt="SELECT FOUND_ROWS() as cnt";
psRowCnt=conn.prepareStatement(sqlRowCnt);
rsRowCnt=psRowCnt.executeQuery();

if(rsRowCnt.next())
{
iTotalRows=rsRowCnt.getInt("cnt");
}
%>
<center>
<form name="frm">
<input type="hidden" name="iPageNo" value="<%=iPageNo%>">
<input type="hidden" name="cPageNo" value="<%=cPageNo%>">
<input type="hidden" name="iShowRows" value="<%=iShowRows%>">
<table cellpadding="0" cellspacing="0" border="1" >
<tr>
<th>ID Dokter</th>
<th>Nama Dokter</th>
<th>Spesialis</th>
<th>Alamat</th>
<th>Username</th>
<th colspan="2">Action</th>
</tr>
<%
while(rsPagination.next())
{
    id_dok=Integer.parseInt(rsPagination.getString("id_mr"));
%>
<tr>
<td><%=rsPagination.getString("id_mr")%></td>
<td><%=rsPagination.getString("nama")%></td>
<td><%=rsPagination.getString("alamat")%></td>
<td><%=rsPagination.getString("no_tlp")%></td>

<td><a href="edit_pasien.jsp?id_pas=<%=id_dok%>">Edit</a></td>
<td><a href="view_pasien.jsp?del=yes&id_pas=<%=id_dok%>" onclick="return del()">Delete</a></td>
</tr>
<%
}
%>
<%
//// calculate next record start record and end record
try{
if(iTotalRows<(iPageNo+iShowRows))
{
iEndResultNo=iTotalRows;
}
else
{
iEndResultNo=(iPageNo+iShowRows);
}

iStartResultNo=(iPageNo+1);
iTotalPages=((int)(Math.ceil((double)iTotalRows/iShowRows)));

}
catch(Exception e)
{
e.printStackTrace();
}

%>
<tr>
<td colspan="7">
<div>
<%
//// index of pages

int i=0;
int cPage=0;
if(iTotalRows!=0)
{
cPage=((int)(Math.ceil((double)iEndResultNo/(iTotalSearchRecords*iShowRows))));

int prePageNo=(cPage*iTotalSearchRecords)-((iTotalSearchRecords-1)+iTotalSearchRecords);
if((cPage*iTotalSearchRecords)-(iTotalSearchRecords)>0)
{
%>
<a href="index_admin.jsp?iPageNo=<%=prePageNo%>&cPageNo=<%=prePageNo%>"> << Previous</a>
<%
}

for(i=((cPage*iTotalSearchRecords)-(iTotalSearchRecords-1));i<=(cPage*iTotalSearchRecords);i++)
{
if(i==((iPageNo/iShowRows)+1))
{
%>
<a href="index_admin.jsp?iPageNo=<%=i%>" style="cursor:pointer;color: red"><b><%=i%></b></a>
<%
}
else if(i<=iTotalPages)
{
%>
<a href="index_admin.jsp?iPageNo=<%=i%>"><%=i%></a>
<%
}
}
if(iTotalPages>iTotalSearchRecords && i<iTotalPages)
{
%>
<a href="index_admin.jsp?iPageNo=<%=i%>&cPageNo=<%=i%>"> >> Next</a>
<%
}
}
%>
<b>Rows <%=iStartResultNo%> - <%=iEndResultNo%> Total Result <%=iTotalRows%> </b>
</div>
</td>
</tr>
</table>
</form>
</center>
<%
try{
if(psPagination!=null){
psPagination.close();
}
if(rsPagination!=null){
rsPagination.close();
}

if(psRowCnt!=null){
psRowCnt.close();
}
if(rsRowCnt!=null){
rsRowCnt.close();
}

if(conn!=null){
conn.close();
}
}
catch(Exception e)
{
e.printStackTrace();
}
%>

                       </div>
<%
    }
 else {
    response.sendRedirect("../index_action.jsp");
       }
%>
                       
                   </div>
		   </div>
		   </div>
		   <div class="clear"> </div>
		   <div class="footer">
		   	 <div class="wrap">
		   	<div class="footer-left">
		   			<ul>
						<li><a href="../index.jsp">Home</a></li>
						<li><a href="../about.jsp">About</a></li>
						<li><a href="../services.jsp">Layanan</a></li>
						 <%
                                                    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
                                                    %>
                                                    <li><a href="log.jsp">login</a></li>
                                                    <%
                                                    } else {
                                                         %> 
                                                         <li><a href="index_admin.jsp">Action</a></li>
                                                <%
                                                        }

                                                        %>
					</ul>
		   	</div>
		   	<div class="footer-right">

		   	</div>
		   	<div class="clear"> </div>
		   </div>
		   </div>
		<!--end-wrap-->
	</body>
</html>
<%
long ak=System.currentTimeMillis();
System.out.println((ak-aw)+" ms");
%>

