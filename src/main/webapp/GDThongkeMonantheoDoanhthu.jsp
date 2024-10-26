<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.TKMonanTheoDoanhthuDao600" %>
<%@ page import="model.TKMonAnTheoDoanhThu600" %>
<%@ page import="java.util.List" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.nio.charset.StandardCharsets" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thống kê món ăn theo doanh thu</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }

        h1, h2 {
            text-align: center;
            color: #333;
        }

        form {
            background-color: #fff;
            padding: 20px;
            margin: 0 auto;
            width: 400px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            font-weight: bold;
            display: block;
            margin-top: 10px;
        }

        input[type="date"],
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        table {
            margin: 20px auto;
            width: 80%;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        table th, table td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }

        table th {
            background-color: #4CAF50;
            color: white;
        }

        table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        a {
            text-decoration: none;
            color: #4CAF50;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>

</head>
<body>
    <h1>Thống kê món ăn theo doanh thu</h1>
    
    <form action="GDThongkeMonantheoDoanhthu.jsp" method="get">
        <label for="startDate">Ngày bắt đầu:</label>
        <input type="date" id="startDate" name="startDate" required>
        <br>
        <label for="endDate">Ngày kết thúc:</label>
        <input type="date" id="endDate" name="endDate" required>
        <br>
        <input type="submit" value="Xem thống kê">
    </form>
    
    <%
        
                 
                        String startDate = request.getParameter("startDate");
                        String endDate = request.getParameter("endDate");

                        if (startDate != null && endDate != null) {
                        	TKMonanTheoDoanhthuDao600 tkMonanTheoDoanhthuDao = new TKMonanTheoDoanhthuDao600();
                            List<TKMonAnTheoDoanhThu600> monanList = tkMonanTheoDoanhthuDao.getMonAnTheoDoanhThu(startDate, endDate);
        %>
    
    <h2>Thống kê từ <%=startDate%> đến <%=endDate%></h2>
    <table>
        <tr>
        	<th>STT</th>
        	<th>ID Món ăn</th>
            <th>Tên món ăn</th>
            <th>Tổng số lần gọi</th>
            <th>Tổng doanh thu</th>
        </tr>
        <%
        int stt=0;
                    for (TKMonAnTheoDoanhThu600 monan : monanList) {
                    session.setAttribute("monan_" + monan.getId(), monan);
        %>
        <tr>
        	<td><%= ++stt %></td>
        	<td><%= monan.getId() %></td>
            <td>
	            <a href="GDLichSuDatMon.jsp?id=<%= monan.getId() %>">
	            	<%= monan.getTen() %>
	            </a>
            </td>
            <td><%= monan.getSoLuong() %></td>
            <td><%= monan.getTongTien() %> VND</td>
        </tr>
        <%
            }
        %>
    </table>
    
    <% 
        } 
    %>
    
</body>
</html>
