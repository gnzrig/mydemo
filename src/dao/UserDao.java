package dao;

import malgnsoft.db.DataObject;

public class UserDao extends DataObject {

    public UserDao(){
        this.table = "tb_user";
        this.PK = "id";
    }

}
