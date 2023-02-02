<%@ page contentType="text/html; charset=utf-8" %><%@ include file="./init.jsp" %><%

    if(userId == 0){
        m.jsReplace("/main/index.jsp");
        return;
    }

    UserDao userDao = new UserDao();
    DataSet uinfo = userDao.find("id = " + userId);
    while (!uinfo.next()){
        m.jsAlert("User not found");
    }
    m.log(String.valueOf(uinfo.s("username")));
    f.addElement("username", uinfo.s("username"), null);
    f.addElement("email", uinfo.s("email"), null);
    f.addElement("content", uinfo.s("content"), null);
    f.addElement("items", uinfo.s("items"), null);

    if(m.isPost() && f.validate()){
        userDao.item("username", f.get("username"));
        userDao.item("email", f.get("email"));
        userDao.item("content", f.get("content"));
        userDao.item("items", f.get("items"));
        if(!userDao.update("id = " + userId)){
            m.jsAlert("Medeelel uurchlult amjiltgui!!!");
        }
        m.jsAlert("Amjilttai uurchilluu");
        m.jsReplace("/main/index.jsp");
        return;
    }

    p.setLayout(ch);
    p.setBody("member.info_update");
    p.setVar("form_script", f.getScript());
    p.display();
%>