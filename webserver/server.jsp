<%-- EECS 341 Spring 2017 Final Project--%>
<%-- Daniel Grigsby, Dominique Owens, Lee Kelvin, Dina Benayad-Cherif --%> 
<%-- Basic format taken from professor's sample server.jsp pdf, modified to fit needs --%>
<%@page language="java" import="java.sql.*"%>
<% 
final String driver = "com.mysql.jdbc.Driver";
Driver DriverRecordset1 = (Driver)Class.forName(driver).newInstance();
final String server
            = "jdbc:mysql://localhost:3306/mss?" +
            "user=root&password=UnforgettablePassword" +
            "&useSSL=false";
//Connection Conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mss","root","UnforgettablePassword");
Connection Conn = DriverManager.getConnection(server);
Statement StatementRecordset1 = Conn.createStatement();
String tablename=request.getParameter("text");
ResultSet Recordset1 = StatementRecordset1.executeQuery(tablename);
ResultSetMetaData metadata = Recordset1.getMetaData();
int columnCount = metadata.getColumnCount();
boolean Recordset1_isEmpty = !Recordset1.next();
boolean Recordset1_hasData = !Recordset1_isEmpty;
int Recordset1_numRows = 0;
%>
<% int Repeat1__numRows = 1000 ;
int Repeat1__index = 0 ;
Recordset1_numRows += Repeat1__numRows;
%>
<h1>EECS 341: Final Project - Server Output</h1>
<table frame="box">
<% while ((Recordset1_hasData)&&(Repeat1__numRows-- != 0))
{
%>
<tr> 
<% for(int i = 1; i <= columnCount; i+=1) { %>
     
            <td><%=Recordset1.getObject(i)%></td>

    <% } %>
</tr>
<%Repeat1__index++;
Recordset1_hasData = Recordset1.next();
}
%>
</table>
<%
Recordset1.close();
Conn.close();
%>