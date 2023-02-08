<%@ include file="./init.jsp" %><%@ page contentType="text/html; charset=utf-8" %><%

    int i = m.ri("cid");
    DataSet info = categoryDao.find("id = " + i);
    while (info.next()){

    }

//    m.log(String.valueOf(info.i("id")) + "<==== ID");
    String que = "SELECT sitemap_locale_nm, locale_cd FROM " + siteMapLocale.table + " WHERE sitemap_id = " +
            info.i("id") + " ORDER BY locale_cd ASC";
    DataSet clist = siteMapLocale.query(que);
    activeLanguages.first();
    DataSet rowCatInfo;
    while (activeLanguages.next()){
        rowCatInfo = clist.search("locale_cd", "course-" + activeLanguages.s("id"));
        rowCatInfo.next();
        f.addElement("cat_name_" + activeLanguages.s("id"), rowCatInfo.s("sitemap_locale_nm"), null);
    }

if(m.isPost() && f.validate()) {
    siteMapLocale.delete("sitemap_id  = " + info.getInt("id") + " AND locale_cd LIKE 'course-%' ");
    activeLanguages.first();
    while (activeLanguages.next()) {
            siteMapLocale.item("sitemap_id", info.i("id"));
            siteMapLocale.item("locale_cd", "course-" + activeLanguages.s("id"));
            siteMapLocale.item("sitemap_locale_nm", f.get("cat_name_" + activeLanguages.s("id")));
            if (!siteMapLocale.insert()) {
                m.jsError("Insert Error!!!");
                return;
            }
    }
}

    p.setLayout(ch);
    p.setVar("s", siteinfo.s("locale"));
    p.setVar("form_script", f.getScript());
    p.setBody("category.index");
    p.display();
%>