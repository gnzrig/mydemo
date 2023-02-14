<%@ page contentType="text/html; charset=utf-8" %><%@ include file="./init.jsp" %><%

    CourseDao courseDao = new CourseDao();
    OrderDao orderDao = new OrderDao();

    ListManager lm = new ListManager();
    lm.setRequest(request);
    lm.setTable(courseDao.table + " a " + " JOIN " + orderDao.table + " b ON a.id = b.course_id");
    lm.setFields(" a.*, b.id AS order_id , b.date AS order_date ");
    lm.addWhere(" b.user_id = " + userId);

    DataSet olist = lm.getDataSet();
    while (olist.next()){
        olist.put("order_date", m.time("yyyy-MM-dd hh:mm", olist.s("order_date")));
    }

    p.setLayout(ch);
    p.setBody("order.order_list");
    p.setLoop("olist", olist);
    p.display();
%>