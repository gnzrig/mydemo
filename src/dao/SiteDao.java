package dao;

import malgnsoft.db.DataObject;

public class SiteDao extends DataObject {
    public SiteDao(){
        this.table = "tb_site";
        this.PK = "id";
    }
    public static String[] siteLanguage = { "en=>English", "mn=>Монгол хэл", "ko=>Korean" };
}
