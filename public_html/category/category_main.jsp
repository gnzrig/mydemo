<%@ page import="com.google.gson.Gson" %><%@ include file="./init.jsp" %><%@ page contentType="text/html; charset=utf-8" %><%


    p.setLayout(ch);
    p.setBody("category.category_main");
    p.setVar("cid", m.qs("cid"));
    m.log(m.qs("cid"));
    p.display();
%>