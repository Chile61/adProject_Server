/**
 * productCategory管理初始化
 */
var ProductCategory = {
    id: "ProductCategoryTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
ProductCategory.initColumn = function () {
    return [
        {field: 'selectItem', radio: true},
            {title: '序号', field: 'id', visible: true, align: 'center', valign: 'middle'},
            {title: '类别名称', field: 'name', visible: true, align: 'center', valign: 'middle'},
            {title: '所属店铺', field: 'shopName', visible: true, align: 'center', valign: 'middle'}
    ];
};

/**
 * 检查是否选中
 */
ProductCategory.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        ProductCategory.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加productCategory
 */
ProductCategory.openAddProductCategory = function () {
    var index = layer.open({
        type: 2,
        title: '添加商品分类',
        area: ['800px', '420px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/productCategory/productCategory_add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看productCategory详情
 */
ProductCategory.openProductCategoryDetail = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: '商品分类详情',
            area: ['800px', '420px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/productCategory/productCategory_update/' + ProductCategory.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除productCategory
 */
ProductCategory.delete = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/productCategory/delete", function (data) {
            Feng.success("删除成功!");
            ProductCategory.table.refresh();
        }, function (data) {
            Feng.error("删除失败!" + data.responseJSON.message + "!");
        });
        ajax.set("productCategoryId",this.seItem.id);
        ajax.start();
    }
};

/**
 * 查询productCategory列表
 */
ProductCategory.search = function () {
    var queryData = {};
    queryData['condition'] = $("#condition").val();
    ProductCategory.table.refresh({query: queryData});
};

$(function () {
    var defaultColunms = ProductCategory.initColumn();
    var table = new BSTable(ProductCategory.id, "/productCategory/list", defaultColunms);
    table.setPaginationType("client");
    ProductCategory.table = table.init();
});
