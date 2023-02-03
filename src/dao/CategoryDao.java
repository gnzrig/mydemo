package dao;

import malgnsoft.db.DataObject;

public class CategoryDao extends DataObject {
    public CategoryDao(){
        this.table = "tb_category";
        this.PK = "id";
    }
}
