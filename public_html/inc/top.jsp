<%@ page contentType="text/html; charset=utf-8" %><%@ include file="./init.jsp" %><%

    boolean admin = false;
    boolean order = false;
    if(userId == 1){
        admin = true;
    } else if(userId != 0) {
        order = true;
    }

    //출력
    p.setLayout(null);
    p.setBody("layout.top");
    p.setVar("admin", admin);
    p.setVar("order", order);
    p.display();

%>