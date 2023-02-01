<%@ page contentType="text/html; charset=utf-8" %><%@ include file="./init.jsp" %><%

    if(userId != 0){
        m.redirect("/course/index.jsp");
    }

//User information
    String email = m.rs("email");

//Form
    f.addElement("email", null, "hname:'user email', required:'Y'");
    f.addElement("passwd", null, "hname:'user password', required:'Y'");

//User search
    UserDao userDao = new UserDao();

    if(m.isPost() && f.validate()){
        DataSet list = userDao.find("email = '" + email + "'");
        if(!list.next()){
            m.jsAlert("user not fount or, password is not correct.");
            m.jsReplace("login.jsp", "parent");
        }else{
            String sessionId = m.getUniqId();
            if(list.s("email").equals(f.get("email")) && list.s("password").equals(f.get("passwd"))) {
                m.setSession("SITE_ID", 1);
                auth.put("ID", list.s("id"));
                auth.put("USERNAME", list.s("username"));
                auth.put("SESSIONID", sessionId);
                //auth.put("ALOGIN_YN", "N");
                auth.setAuthInfo();


                m.jsAlert("Login success");
                m.jsReplace("/course/index.jsp");

            } else {
                m.jsAlert("id, password is not correct.");
                m.jsReplace("login.jsp", "parent");
            }
        }
        return;
    }

    p.setLayout(ch);
    p.setBody("course.login");
    p.display();
%>