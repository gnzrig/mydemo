<%@ include file="../init.jsp" %><%

    CategoryDao categoryDao = new CategoryDao();
    SiteMapLocale siteMapLocale = new SiteMapLocale();
    DataSet activeLanguages = new DataSet();
    String selectedLang = m.rs("lang", sysLocale);
    DataSet languages = m.arr2loop(siteDao.siteLanguage);
    String ch = m.rs("ch", "category");
    while (languages.next()){
        activeLanguages.addRow();
        activeLanguages.put("id", languages.get("id"));
        activeLanguages.put("name", languages.get("name"));
        activeLanguages.put("value", languages.get("value"));
        activeLanguages.put("checked", selectedLang.equals(languages.get("id")) ? "style=display:inline-block" : "style=display:none");
        activeLanguages.put("selected", selectedLang.equals(languages.get("id")) ? "selected" : "");
    }

    p.setLoop("languages", activeLanguages);
    p.setVar("sel_lang", selectedLang);
%>