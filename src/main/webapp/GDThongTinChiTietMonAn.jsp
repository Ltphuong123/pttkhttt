<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="dao.MonanDAO600" %>
<%@ page import="model.Monan600" %>

<html>
<head>
    <title>Thông tin chi tiết món ăn</title>
    
    <title>Thông tin chi tiết món ăn</title>
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

        table {
            width: 60%;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        th, td {
            padding: 15px;
            text-align: left;
        }

        th {
            background-color: #4CAF50;
            color: white;
            font-size: 1.2em;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }

        td {
            border-bottom: 1px solid #ddd;
            font-size: 1.1em;
        }

        td.info {
            font-weight: bold;
            background-color: #f9f9f9;
        }

        tr:last-child td {
            border-bottom: none;
        }

        a {
            display: block;
            text-align: center;
            margin-top: 20px;
            font-size: 1.1em;
            color: #333;
            text-decoration: none;
            font-weight: bold;
        }

        a:hover {
            color: #4CAF50;
            text-decoration: underline;
        }
    </style>

</head>
<body>
    <h1>Thông tin chi tiết món ăn</h1>


 		<table>
            <tr>
                <th>Thông tin</th>
                <th>Chi tiết</th>
            </tr>
            <%
            

                                        int idParam = Integer.parseInt(request.getParameter("id"));
                                        MonanDAO600 monanDAO = new MonanDAO600();
                                        Monan600 monan = monanDAO.getThongTinMonAn(idParam);
            %>
            <tr>
                <td class="info">ID:</td>
                <td><%= monan.getId() %></td>
            </tr>
            <tr>
                <td class="info">Tên:</td>
                <td><%= monan.getTen() %></td>
            </tr>
            <tr>
                <td class="info">Giá:</td>
                <td><%= monan.getGia() %></td>
            </tr>
            <tr>
                <td class="info">Mô tả:</td>
                <td><%= monan.getMota() %></td>
            </tr>
            <tr>
                <td class="info">Thành phần:</td>
                <td><%= monan.getThanhphan() %></td>
            </tr>
        </table>
    <a href="GDTimkhiemthongtinmonan.jsp">Quay lại danh sách món ăn</a>
</body>
</html>
