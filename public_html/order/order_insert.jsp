<%@ page contentType="text/html; charset=utf-8" %><%@ include file="./init.jsp" %><%

    String ids = m.rs("ids");
    if(ids.length() == 0){
        m.jsReplace("index.jsp");
        return;
    }

    String[] idxs = ids.split(",");
    OrderDao orderDao = new OrderDao();

    for(String i : idxs){
        orderDao.item("user_id", userId);
        orderDao.item("course_id", i);
        orderDao.item("date", m.time("yyyyMMddhhmmss"));
        if(!orderDao.insert()){
            m.jsAlert("Amjiltgui");
        }
    }
    m.jsAlert("Amjilttai zahiallaa");
    m.jsReplace("/order/order_list.jsp");
%>