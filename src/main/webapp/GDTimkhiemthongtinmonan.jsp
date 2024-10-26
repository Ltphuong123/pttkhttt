<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.MonanDAO600" %>
<%@ page import="model.Monan600" %>
<%@ page import="java.util.List" %>

<html>
<head>
    <title>Tìm kiếm món ăn</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }

        h1 {
            color: #333;
            text-align: center;
        }

        form {
            text-align: center;
            margin-bottom: 20px;
        }

        label {
            font-size: 1.2em;
        }

        input[type="text"] {
            padding: 10px;
            font-size: 1em;
            width: 200px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"] {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: center;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        a {
            color: #4CAF50;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
        }

        .back-link a {
            color: #333;
            text-decoration: none;
            font-weight: bold;
        }

        .back-link a:hover {
            color: #4CAF50;
        }
    </style>
</head>

<body>
    <h1>Tìm kiếm món ăn</h1>
    <form method="get" action="GDTimkhiemthongtinmonan.jsp">
        <label for="keyword">Nhập tên món ăn:</label>
        <input type="text" name="keyword" id="keyword" required />
        <input type="submit" value="Tìm kiếm" />
    </form>

    <%
   				String keyword = request.getParameter("keyword");
                if (keyword != null && !keyword.isEmpty()) {
                    MonanDAO600 monanDAO = new MonanDAO600();
                    List<Monan600> monanList = monanDAO.getDanhSachMonAn(keyword);
    %>
            <h2>Kết quả tìm kiếm cho: <%=keyword%></h2>
            <table border="1">
                <tr>
                	<th>STT</th>
                	<th>ID Món ăn</th>
                    <th>Tên món ăn</th>
                    <th>Giá</th>
                </tr>
                <%
                int stt = 1;
                                    for (Monan600 monan : monanList) {
                %>
                <tr>
                	<td><%= stt++ %></td>
                    <td><%= monan.getId() %></td>
                    <td><a href="GDThongTinChiTietMonAn.jsp?id=<%= monan.getId() %>"><%= monan.getTen() %></a></td>
                    <td><%= monan.getGia() %></td>
                </tr>
                <%
                    }
                %>
            </table>
    <%
        } else {
    %>
        <p>Vui lòng nhập tên món ăn để tìm kiếm.</p>
    <%
        }
    %>
    <a href="GDChinhKH.jsp">Quay lại danh sách món ăn</a>
</body>
</html>
