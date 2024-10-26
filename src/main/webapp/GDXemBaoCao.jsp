<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Xem thống kê món ăn theo doanh thu</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            text-align: center;
            background-color: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }
        h1 {
            font-size: 30px;
            color: #34495e;
            margin-bottom: 30px;
        }
        a {
            display: inline-block;
            padding: 14px 28px;
            font-size: 18px;
            color: white;
            background-color: #28a745;
            text-decoration: none;
            border-radius: 6px;
            transition: background-color 0.3s ease;
        }
        a:hover {
            background-color: #218838;
        }
        a:active {
            transform: scale(0.97);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Xem báo cáo</h1>
        <a href="GDThongkeMonantheoDoanhthu.jsp">Xem thống kê món ăn theo doanh thu</a>
    </div>
</body>
</html>
