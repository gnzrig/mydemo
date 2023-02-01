<%@ page contentType="text/html; charset=utf-8" %><%@ include file="./init.jsp" %><%

    if(userId != 0){
        m.redirect("/main/index.jsp");
    }

//User information
    String email = m.rs("email");
    String passwd = m.rs("passwd");

//Form
    f.addElement("email", null, "hname:'user email', required:'Y'");
    f.addElement("passwd", null, "hname:'user password', required:'Y'");

//User search
    UserDao userDao = new UserDao();

    if(m.isPost() && f.validate()){
        DataSet list = userDao.find("email = '" + email + "'");

        while (list.next()){
            if(list.s("email").equals(f.get("email")) && list.s("password").equals(f.get("passwd"))) {

                auth.put("ID", list.s("id"));
                auth.put("PASSWORD", list.s("password"));
                auth.put("EMAIL", list.s("email"));
                auth.save();
                auth.setAuthInfo();


                m.jsAlert("Login success");
                m.jsReplace("/main/index.jsp");

            } else {
                m.jsAlert("id, password is not correct.");
                m.jsReplace("login.jsp");
            }
        }

        return;


//        username = f.get("email");
//        password = f.get("passwd");
//
//
//        m.log(username  + " " + password + " : " + email + " passwd : " + passwd);
//        m.redirect("/main/index.jsp");
//        return;
    }


    p.setLayout(ch);
    p.setBody("member.login");
    p.setVar("form_script", f.getScript());
    p.display();
%>