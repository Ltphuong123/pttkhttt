<%@page import="model.ComboDonHang600"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.HoaDon600" %>
<%@ page import="dao.HoaDonDao600" %>
<%@ page import="model.NhanVien600" %>
<%@ page import="java.util.List" %>
<%@ page import="model.MonAnDonHang600" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Xem Hóa Đơn</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
        .total {
            font-size: 1.5em;
            text-align: right;
            margin: 20px 0;
            color: #333;
        }
        .header-info {
            margin-bottom: 20px;
            padding: 10px;
            background-color: #e7f3fe;
            border: 1px solid #b3e0fe;
            border-radius: 5px;
        }
    </style>
</head>
<body>

<%
    // Lấy id của món ăn đơn hàng từ tham số
    String idParam = request.getParameter("id");
    int monAnDonHangId = Integer.parseInt(idParam);

    // Tạo đối tượng HoaDonDao và lấy hóa đơn
    HoaDonDao600 hoaDonDao = new HoaDonDao600();
    HoaDon600 hoaDon = hoaDonDao.getHoaDon(monAnDonHangId);
%>

<div class="header-info">
    <h2>Thông Tin Hóa Đơn</h2>
    <p>ID Hóa Đơn: <%=hoaDon.getId()%></p>
    <p>Thời Gian Thanh Toán: <%=hoaDon.getThoiGianThanhToan()%></p>
    
    <p>ID Nhân Viên: <%=hoaDon.getNhanVien().getId()%></p>
    <p>Tên Nhân Viên: <%=hoaDon.getNhanVien().getUsername()%></p>
    <p>ID Khách Hàng: <%=hoaDon.getDonHang().getKhachHang().getId()%></p>  
    <p>Tên Khách Hàng: <%=hoaDon.getDonHang().getKhachHang().getUsername()%></p>
</div>

<h1>Danh Sách Món Ăn</h1>
<table>
    <thead>
        <tr>
        	<th>STT</th>
            <th>ID Món Ăn</th>
            <th>Tên Món Ăn</th>
            <th>Giá (VND)</th>
            <th>Số Lượng</th>
            <th>Tổng  (VND)</th>
        </tr>
    </thead>
    <tbody>
        <%
        List<MonAnDonHang600> listMonAnDonHang = hoaDon.getDonHang().getListMonAn();
                        	int stt=0;
                            for (MonAnDonHang600 monAnDonHang : listMonAnDonHang) {
        %>
        <tr>
        	<td><%=++stt%></td>
            <td><%=monAnDonHang.getMonan().getId()%></td>
            <td><%=monAnDonHang.getMonan().getTen()%></td>
            <td><%=monAnDonHang.getMonan().getGia()%></td>
            <td><%=monAnDonHang.getSoluong()%></td>
            <td><%=monAnDonHang.getTongtien()%></td>
        </tr>
        <%
        }
        %>
    </tbody>
</table>

<h1>Danh Sách Combo</h1>
<table>
    <thead>
        <tr>
        	<th>STT</th>
            <th>ID Combo</th>
            <th>Tên Combo</th>
            <th>Giá (VND)</th>
            <th>Số Lượng</th>
            <th>Tổng  (VND)</th>
        </tr>
    </thead>
    <tbody>
        <%
        int stt2=0;
                    List<ComboDonHang600> listComboDonHang = hoaDon.getDonHang().getListCombo();
                    for (ComboDonHang600 comboDonHang : listComboDonHang) {
        %>
        <tr>
        	<td><%= ++stt2 %></td>
            <td><%= comboDonHang.getCombo().getId() %></td>
            <td><%= comboDonHang.getCombo().getTen() %></td>
            <td><%= comboDonHang.getCombo().getGia() %></td>
            <td><%= comboDonHang.getSoluong() %></td>
            <td><%= comboDonHang.getGia() %></td>
        </tr>
        <%
            }
        %>
    </tbody>
</table>

<div class="total">
    <strong>Tổng Tiền: <%= hoaDon.getDonHang().getTongtien() %> VND</strong>
</div>

</body>
</html>
