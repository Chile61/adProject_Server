/**
 * productParam管理初始化
 */
var ProductParam = {
    id: "ProductParamTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
ProductParam.initColumn = function () {
    return [
        {field: 'selectItem', radio: true},
            {title: '主键id', field: 'id', visible: true, align: 'center', valign: 'middle'},
            {title: '参数', field: 'param', visible: true, align: 'center', valign: 'middle'},
            {title: '描述', field: 'description', visible: true, align: 'center', valign: 'middle'},
            {title: '对应商品', field: 'productId', visible: true, align: 'center', valign: 'middle'}
    ];
};

/**
 * 检查是否选中
 */
ProductParam.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        ProductParam.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加productParam
 */
ProductParam.openAddProductParam = function () {
    var index = layer.open({
        type: 2,
        title: '添加productParam',
        area: ['800px', '420px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/productParam/productParam_add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看productParam详情
 */
ProductParam.openProductParamDetail = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: 'productParam详情',
            area: ['800px', '420px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/productParam/productParam_update/' + ProductParam.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除productParam
 */
ProductParam.delete = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/productParam/delete", function (data) {
            Feng.success("删除成功!");
            ProductParam.table.refresh();
        }, function (data) {
            Feng.error("删除失败!" + data.responseJSON.message + "!");
        });
        ajax.set("productParamId",this.seItem.id);
        ajax.start();
    }
};

/**
 * 查询productParam列表
 */
ProductParam.search = function () {
    var queryData = {};
    queryData['condition'] = $("#condition").val();
    ProductParam.table.refresh({query: queryData});
};

$(function () {
    var defaultColunms = ProductParam.initColumn();
    var table = new BSTable(ProductParam.id, "/productParam/list", defaultColunms);
    table.setPaginationType("client");
    ProductParam.table = table.init();
});
