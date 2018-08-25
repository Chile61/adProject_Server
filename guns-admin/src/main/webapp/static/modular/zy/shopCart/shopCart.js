/**
 * shopCart管理初始化
 */
var ShopCart = {
    id: "ShopCartTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
ShopCart.initColumn = function () {
    return [
        {field: 'selectItem', radio: true},
            {title: '主键id', field: 'id', visible: true, align: 'center', valign: 'middle'},
            {title: '用户id', field: 'userId', visible: true, align: 'center', valign: 'middle'},
            {title: '商品id', field: 'productId', visible: true, align: 'center', valign: 'middle'},
            {title: '数量', field: 'num', visible: true, align: 'center', valign: 'middle'}
    ];
};

/**
 * 检查是否选中
 */
ShopCart.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        ShopCart.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加shopCart
 */
ShopCart.openAddShopCart = function () {
    var index = layer.open({
        type: 2,
        title: '添加shopCart',
        area: ['800px', '420px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/shopCart/shopCart_add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看shopCart详情
 */
ShopCart.openShopCartDetail = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: 'shopCart详情',
            area: ['800px', '420px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/shopCart/shopCart_update/' + ShopCart.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除shopCart
 */
ShopCart.delete = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/shopCart/delete", function (data) {
            Feng.success("删除成功!");
            ShopCart.table.refresh();
        }, function (data) {
            Feng.error("删除失败!" + data.responseJSON.message + "!");
        });
        ajax.set("shopCartId",this.seItem.id);
        ajax.start();
    }
};

/**
 * 查询shopCart列表
 */
ShopCart.search = function () {
    var queryData = {};
    queryData['condition'] = $("#condition").val();
    ShopCart.table.refresh({query: queryData});
};

$(function () {
    var defaultColunms = ShopCart.initColumn();
    var table = new BSTable(ShopCart.id, "/shopCart/list", defaultColunms);
    table.setPaginationType("client");
    ShopCart.table = table.init();
});
