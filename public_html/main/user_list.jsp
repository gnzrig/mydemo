<%@ include file="init.jsp" %><%
    if(userId == 0){
        m.jsAlert("Sign in first!!!!!");
        m.jsReplace("./index.jsp", "parent");
        return;
    }

    UserDao userDao = new UserDao();
    DataSet users = userDao.find("");

    while (users.next()){
        users.put("username", users.s("username"));
    }

    String a = " ";

    for (String key : users.get(0).keySet()){
        a +=  " key : " + key + ", " + users.get(0).get(key) + "] ";
    }

    users.put("email", users.s("email"));

    p.setLayout(ch);
    p.setBody("main.user_list");
    p.setLoop("users", users);
    p.display();
%>