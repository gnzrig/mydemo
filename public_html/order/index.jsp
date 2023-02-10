<%@ page contentType="text/html; charset=utf-8" %><%@ include file="./init.jsp" %><%

f.addElement("file", null, null);
    OrderDao orderDao = new OrderDao();
    CourseDao courseDao = new CourseDao();
    DataSet clist = courseDao.find("");

    if(m.isPost() && f.validate()){
        orderDao.item("user_id", userId);
        orderDao.item("course_id", 4);
        orderDao.item("date", m.time());
        orderDao.item("image_file", f.get("file"));
        if(orderDao.insert()){
            m.jsAlert("Amjilttai");
            m.jsReplace("/main/index.jsp");
            return;
        }
    }

p.setLayout(ch);
p.setBody("order.index");
p.setLoop("clist", clist);
p.display();

%>