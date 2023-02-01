package dao;

import malgnsoft.db.DataObject;

public class CourseDao extends DataObject {

    public CourseDao(){
        this.table = "tb_course";
        this.PK = "id";
    }
}
