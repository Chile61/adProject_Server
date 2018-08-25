/**
 * productImage管理初始化
 */
var ProductImage = {
    id: "ProductImageTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
ProductImage.initColumn = function () {
    return [
        {field: 'selectItem', radio: true},
            {title: '主键id', field: 'id', visible: true, align: 'center', valign: 'middle'},
            {title: '描述', field: 'description', visible: true, align: 'center', valign: 'middle'},
            {title: '图片', field: 'image', visible: true, align: 'center', valign: 'middle'},
            {title: '对应商品', field: 'productId', visible: true, align: 'center', valign: 'middle'}
    ];
};

/**
 * 检查是否选中
 */
ProductImage.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        ProductImage.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加productImage
 */
ProductImage.openAddProductImage = function () {
    var index = layer.open({
        type: 2,
        title: '添加productImage',
        area: ['800px', '420px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/productImage/productImage_add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看productImage详情
 */
ProductImage.openProductImageDetail = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: 'productImage详情',
            area: ['800px', '420px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/productImage/productImage_update/' + ProductImage.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除productImage
 */
ProductImage.delete = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/productImage/delete", function (data) {
            Feng.success("删除成功!");
            ProductImage.table.refresh();
        }, function (data) {
            Feng.error("删除失败!" + data.responseJSON.message + "!");
        });
        ajax.set("productImageId",this.seItem.id);
        ajax.start();
    }
};

/**
 * 查询productImage列表
 */
ProductImage.search = function () {
    var queryData = {};
    queryData['condition'] = $("#condition").val();
    ProductImage.table.refresh({query: queryData});
};

$(function () {
    var defaultColunms = ProductImage.initColumn();
    var table = new BSTable(ProductImage.id, "/productImage/list", defaultColunms);
    table.setPaginationType("client");
    ProductImage.table = table.init();
});
