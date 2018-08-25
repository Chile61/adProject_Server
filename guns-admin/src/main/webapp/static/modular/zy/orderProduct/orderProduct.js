/**
 * 订单商品列表管理初始化
 */
var OrderProduct = {
    id: "OrderProductTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
OrderProduct.initColumn = function () {
    return [
        {field: 'selectItem', radio: true},
            {title: '主键id', field: 'id', visible: true, align: 'center', valign: 'middle'},
            {title: '订单id', field: 'orderId', visible: true, align: 'center', valign: 'middle'},
            {title: '商品id', field: 'productId', visible: true, align: 'center', valign: 'middle'},
            {title: '数量', field: 'num', visible: true, align: 'center', valign: 'middle'},
            {title: '单价', field: 'price', visible: true, align: 'center', valign: 'middle'},
            {title: '积分', field: 'point', visible: true, align: 'center', valign: 'middle'}
    ];
};

/**
 * 检查是否选中
 */
OrderProduct.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        OrderProduct.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加订单商品列表
 */
OrderProduct.openAddOrderProduct = function () {
    var index = layer.open({
        type: 2,
        title: '添加订单商品列表',
        area: ['800px', '420px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/orderProduct/orderProduct_add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看订单商品列表详情
 */
OrderProduct.openOrderProductDetail = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: '订单商品列表详情',
            area: ['800px', '420px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/orderProduct/orderProduct_update/' + OrderProduct.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除订单商品列表
 */
OrderProduct.delete = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/orderProduct/delete", function (data) {
            Feng.success("删除成功!");
            OrderProduct.table.refresh();
        }, function (data) {
            Feng.error("删除失败!" + data.responseJSON.message + "!");
        });
        ajax.set("orderProductId",this.seItem.id);
        ajax.start();
    }
};

/**
 * 查询订单商品列表列表
 */
OrderProduct.search = function () {
    var queryData = {};
    queryData['condition'] = $("#condition").val();
    OrderProduct.table.refresh({query: queryData});
};

$(function () {
    var defaultColunms = OrderProduct.initColumn();
    var table = new BSTable(OrderProduct.id, "/orderProduct/list", defaultColunms);
    table.setPaginationType("client");
    OrderProduct.table = table.init();
});
