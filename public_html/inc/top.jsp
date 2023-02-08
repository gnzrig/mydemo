<%@ page contentType="text/html; charset=utf-8" %><%@ include file="./init.jsp" %><%

    if(userId == 1){
        admin = true;
    } else if(userId != 0) {
        order = true;
    } else {
        login = true;
    }

    DataSet languages = m.arr2loop(siteDao.siteLanguage);
    DataSet activeLanguages = new DataSet();
    while (languages.next()){
        if(siteinfo.s("lang").contains(languages.s("id"))){
            activeLanguages.addRow();
            activeLanguages.put("id", languages.get("id"));
            activeLanguages.put("value", languages.get("name"));
            activeLanguages.put("sel", sysLocale.equals(languages.get("id")) ? "selected":"");
        }
    }

    //출력
    p.setLayout(null);
    p.setBody("layout.top");
    p.setLoop("languages", activeLanguages);
    p.setVar("admin", admin);
    p.setVar("order", order);
    p.setVar("login", login);
    p.display();

%>