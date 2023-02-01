<%@ page contentType="text/html; charset=utf-8" %><%@ include file="./init.jsp" %><%

    if(userId == 0) {
        m.jsAlert("id, password is not correct.");
        m.jsReplace("login.jsp", "parent");
        return;
    };

    f.addElement("course_name", null, "course name");
    f.addElement("course_desc", null, "course description");

    CourseDao courseDao = new CourseDao();

    DataSet clist = courseDao.find("user_id = " + userId);
//    while (clist.next()){
//        clist.put("course_desc", clist.s("course_desc"));
//    }

    if(m.isPost() && f.validate()){
        courseDao.item("course_name", f.get("course_name"));
        courseDao.item("course_desc", f.get("course_desc"));
        if(!courseDao.update("id = " + userId)){
            m.jsAlert("Өөрчлөлт амжилтгүй!!!!!");
        }
        else
        {
            m.jsAlert("Өөрчлөлт амжилттай");
        }
        m.redirect("../main/index.jsp");
        return;
    }

    p.setLayout(ch);
    p.setBody("course.index");
    p.setLoop("clist", clist);
    p.setVar("form_script", f.getScript());
    p.display();
%>