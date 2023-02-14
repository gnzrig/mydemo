<%@ include file="init.jsp" %><%

    UserDao userDao = new UserDao();

    if (m.ri("did") != 0) {
        if(userDao.delete("id = " + m.ri("did"))) m.jsAlert("Amjilttai ustgagdlaa");
        else m.jsAlert("Ustgalt amjiltgui");
        m.jsReplace("/main/user_list.jsp");
    }

    if(userId == 0){
        m.jsAlert("Sign in first!!!!!");
        m.jsReplace("./index.jsp", "parent");
        return;
    }

    DataSet users = userDao.find("");

    while (users.next()){
        users.put("username", users.s("username"));
    }

    users.put("email", users.s("email"));

    p.setLayout(ch);
    p.setBody("main.user_list");
    p.setLoop("users", users);
    p.display();
%>