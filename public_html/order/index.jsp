<%@ page contentType="text/html; charset=utf-8" %><%@ include file="./init.jsp" %><%

f.addElement("file", null, null);

    CourseDao courseDao = new CourseDao();
    DataSet clist = courseDao.find();

p.setLayout(ch);
p.setBody("order.index");
p.setLoop("clist", clist);
p.display();

%>