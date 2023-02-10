<%@ page import="com.google.gson.Gson" %><%@ include file="./init.jsp" %><%@ page contentType="text/html; charset=utf-8" %><%

    int cid = m.ri("cid");
    DataSet clist = categoryDao.find();

    f.addElement("module", null, null);
    f.addElement("category_nm", null, null);
    f.addElement("depth", null, null);
    f.addElement("parent_id", null, null);

    Gson gson = new Gson();
    while (clist.next()){
        if(clist.i("parent_id") > 0){
            clist.put("parent", true);
            clist.put("space", "&nbsp;&nbsp;&nbsp;");
        }else {
            clist.put("parent", false);
            clist.put("space", "");
        }
    }
    m.jsReplace("");
    p.setLayout(ch);
    p.setBody("category.category_list");
    p.setLoop("clist", clist);
    p.setVar("json", gson.toJson(clist));
    p.display();
%>