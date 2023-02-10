package dao;

import malgnsoft.db.DataObject;

public class OrderDao extends DataObject {
    public OrderDao(){
        this.table = "tb_order";
        this.PK = "id";
    }
}
