function createTreeList(data, parentId) {
    let html = '';
    for (let i = 0; i < data.length; i++) {
        if (data[i].parent_id == parentId) {
            html += '<a href="/category/category_insert.jsp?cid='+ data[i].id + '">' + '<li>' + data[i].category_nm;
            html += '<ul>' + createTreeList(data, data[i].id) + '</ul>';
            html += '</li></a>';
        }
    }
    return html;
}