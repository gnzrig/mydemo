<%@ page contentType="text/html; charset=utf-8" %><%@ include file="./init.jsp" %><%

    OrderDao orderDao = new OrderDao();
    DataSet olist = orderDao.find("");

    p.setLayout(ch);
    p.setBody("order.order_list");
    p.setLoop("olist", olist);
    p.display();
%>