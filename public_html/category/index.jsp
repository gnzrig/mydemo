<%@ include file="./init.jsp" %><%@ page contentType="text/html; charset=utf-8" %><%

    DataSet info = categoryDao.find("id = 1");
    while (info.next()){

    }
    String que = "SELECT sitemap_locale_nm FROM " + siteMapLocale.table + " WHERE sitemap_locale_nm LIKE '" +
            info.s("category_nm") + "%'";
    DataSet clist = siteMapLocale.query(que);
    activeLanguages.first();
    while (activeLanguages.next()){
        f.addElement("cat_name_" + activeLanguages.s("id"), info.s("cat_name_") + activeLanguages.s("id"), null);
    }

    p.setLayout(ch);
    p.setBody("category.index");
    p.display();
%>