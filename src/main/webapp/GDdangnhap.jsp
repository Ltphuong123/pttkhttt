<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="dao.ThanhvienDAO600" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Đăng Nhập</h2>
	<form method="get" action="GDdangnhap.jsp">
        <label>Tên đăng nhập:</label>
        <input type="text" name="username" id="username" required><br><br>
        <label>Mật khẩu:</label>
        <input type="password" name="password" id="password" required><br><br>
        <button type="submit" value="Đăng nhập">Đăng nhập</button>
    </form>
  
<%
  String username = request.getParameter("username");
      String password = request.getParameter("password");
      
    
      if (username != null && password != null) {
  	    ThanhvienDAO600 thanhvienDAO = new ThanhvienDAO600();
  	    String vaitro = thanhvienDAO.kiemTraDangNhap(username, password);
  	    	if(vaitro.equalsIgnoreCase("quanli")){
  	    		response.sendRedirect("GDChinhQL.jsp");
  	    	}
  	    	if(vaitro.equalsIgnoreCase("khachhang")){
  	    		response.sendRedirect("GDChinhKH.jsp");
  	    	}
  	    
      }
  %>
</body>
</html>