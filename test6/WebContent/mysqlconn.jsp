<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
	Connection con=null;
    Connection con1=null;
    PreparedStatement stmt=null;
    Statement stmt1=null;
    ResultSet rs=null;
    ResultSet rs1=null;
	Class.forName("com.mysql.jdbc.Driver");
	
	try{
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	}
	catch(Exception ex){
		
		out.print("<br/> Driver not load properly, please check your Driver <br/>");
	}
	try{
		
		 con1=DriverManager.getConnection("jdbc:odbc:db");
	}
	catch(Exception ex1){
			
			out.print("<br/> Driver load successfuly but something problem in connection string <br/>");
		}
	
	con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test", "root", "");
	out.print("connect database successfully<br/>");
	
	
	stmt1=con1.createStatement();
	
	
	
	
	
	String str="";
	rs1=stmt1.executeQuery("select * from Auto_EOD_Config");
	
	 while(rs1.next()){
		//out.print("<br/>");
		//out.print(rs1.getString("AUTOEOD")+" "+rs1.getString("HOURS")+" "+rs1.getString("MINUTES")+" "+rs1.getString("INTERVAL"));
		
		str=rs1.getString("HOURS")+""+rs1.getString("MINUTES");
		
	}
	 stmt=con.prepareStatement("update demo set pass='"+str+"'");
	stmt.executeUpdate();
	out.print("Update success fully");
	/*while(rs.next()){
		
		out.print("username "+rs.getString("name")+" password "+rs.getString("pass"));
	}*/
	//rs.close();
	stmt.close();
	con.close();
	
	rs1.close();
	stmt1.close();
	con1.close();
	
%>
</body>
</html>