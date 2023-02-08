<%@ include file="init.jsp" %><%@ page import="java.util.*,java.io.*,dao.*,malgnsoft.db.*,malgnsoft.util.*" %><%

    if(m.rs("lang") != ""){
        m.setCookie("SITE_LANG", m.rs("lang"));
        _message.reloadAll();
        m.jsReplace("./index.jsp");
    }

    UserDao userDao = new UserDao();
    DataSet user = userDao.find("id = " +userId);
    while(user.next()){
        user.put("username", user.s("username"));
    }
//    userId = auth.getInt("ID");

//    while (users.next()){
//        users.put("username", users.s("username"));
//    }
//    users.put("username", users.s("username"));

//    String username = " ";
//
//    for(String key : users.get(0).keySet()){
//        username += key;
//    }
//
//    username = (String) users.get(0).get("username");


p.setLayout(ch);
p.setBody("main.index");
p.setVar("username", user.s("username"));
p.setVar("user", user);
p.setVar("userID", userId);
p.setVar("asdf", siteinfo.s("locale"));
p.display();
%>