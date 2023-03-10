<%@ include file="./init.jsp" %><%@ page contentType="text/html; charset=utf-8" %><%

    activeLanguages.first();
    while (activeLanguages.next()){
        f.addElement("cat_name_" + activeLanguages.s("id"), null, siteinfo.getString("locale").equals(activeLanguages.s("id")) ? "required:'Y'" : null);
    }
    f.addElement("module_name", null, null);
    if(m.isPost() && f.validate()){
        categoryDao.item("site_id", 1);
        categoryDao.item("module", f.get("module_name"));
        categoryDao.item("category_nm", f.get("cat_name_" + siteinfo.s("locale")));
        categoryDao.item("parent_id", m.ri("cid") != 0 ? m.ri("cid") : null);
        int newId = categoryDao.insert(true);
        if(newId != 0){
            m.jsAlert("Burtgel amjilttai!");
        }
        activeLanguages.first();
        while(activeLanguages.next()){
                siteMapLocale.item("sitemap_id", newId);
                siteMapLocale.item("locale_cd", "course-" + activeLanguages.s("id"));
                siteMapLocale.item("sitemap_locale_nm", f.get("cat_name_" + activeLanguages.s("id")));
                if(!siteMapLocale.insert()){
                    m.jsError("Olon hel deerx burtgel amjiltgui bolloo!.");
                    return;
                }
        }
        m.jsReplace("index.jsp?" + "cid=" + newId);
    }

    p.setLayout(ch);
    p.setBody("category.category_insert");
    p.display();
%>