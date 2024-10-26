<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.MonAnDonHangDAO600" %>
<%@ page import="model.MonAnDonHang600" %>
<%@ page import="model.TKMonAnTheoDoanhThu600" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.Date" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lịch sử đặt món</title>
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
    </style>
</head>
<body>
    <h1>Lịch sử đặt món</h1>

    <%
                    String id = request.getParameter("id");
                    TKMonAnTheoDoanhThu600 monan = (TKMonAnTheoDoanhThu600) session.getAttribute("monan_" + id);
                    
                    String startDate = monan.getStartDate();
                    String endDate = monan.getEndDate();
                    
                    int tongsl=0;
                    float tongtien=0;

                    if (id != null && startDate != null && endDate != null) {
                        MonAnDonHangDAO600 monAnDonHangDAO = new MonAnDonHangDAO600();
                        List<MonAnDonHang600> lichSuDatMon = monAnDonHangDAO.getLichSuDatMon(startDate, endDate, Integer.parseInt(id));
    %>
    
    <h2>Lịch sử đặt món cho món ăn: <%=lichSuDatMon.getFirst().getMonan().getTen()%> - ID: <%=id%> - Giá: <%=lichSuDatMon.getFirst().getMonan().getGia()%></h2>
	<h2>Từ <%=startDate%> đến <%=endDate%> </h2>

    <table>
        <tr>
        	<th>STT</th>
        	<th>Thời Gian Đặt</th>
            <th>Số Lượng</th>
            <th>Số tiền</th>
        </tr>
        <%
        int stt=0;
                    for (MonAnDonHang600 item : lichSuDatMon) {
                    	tongsl+=item.getSoluong();
        %>
        <tr>
            <td><a href="GDXemHoaDon.jsp?id=<%= item.getId() %>"><%= ++stt %> </a></td>
            <td><%= item.getThoiGianDat() %></td>
            <td><%= item.getSoluong() %></td>
            <td><%= item.getTongtien() %></td>
        </tr>
        <%
            }
        %>
        <tr>
        	<th>Tổng cộng</th>
        	<td></td>
            <td><%= tongsl %></td>
            <td><%= tongsl * lichSuDatMon.get(0).getMonan().getGia() %></td>
        </tr>
    </table>
    
    <% 
        } else {
    %>
        <p style="text-align:center;">Không có dữ liệu để hiển thị. Vui lòng chọn món ăn và khoảng thời gian.</p>
    <%
        }
    %>
</body>
</html>
