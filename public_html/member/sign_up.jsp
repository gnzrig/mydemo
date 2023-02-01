<%@ page contentType="text/html; charset=utf-8" %><%@ include file="./init.jsp" %><%

    if(userId != 0) {
        m.jsAlert("Your already logged in.");
        m.redirect("/main/index.jsp");
    }
//Form
    f.addElement("username", null, "hname:'username', required:'Y'");
    f.addElement("email", null, "hname:'user email', required:'Y'");
    f.addElement("passwd", null, "hname:'user password', required:'Y'");
    f.addElement("passwd1", null, "hname:'confirm password', required:'Y'");
    f.addElement("content", null, "hname:'User's content'");

//User search
    UserDao userDao = new UserDao();

    if(m.isPost() && f.validate()){
        userDao.item("username", f.get("username"));
        userDao.item("email", f.get("email"));
        userDao.item("password", f.get("passwd"));
        userDao.item("content", f.get("content"));

        if(!userDao.insert()){
            m.jsAlert("Amjiltgui bolloo!!");
            return;
        }
        m.jsAlert("Amjilttai!!");
        m.jsReplace("login.jsp", "parent");
        return;
    }


    p.setLayout(ch);
    p.setBody("member.sign_up");
    p.setVar("form_script", f.getScript());
    p.display();
%>