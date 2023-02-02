package dao;

import malgnsoft.db.DataObject;

public class OrderDao extends DataObject {
    OrderDao(){
        this.table = "tb_order";
        this.PK = "id";
    }
}
