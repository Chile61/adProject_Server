/**
 * 订单信息管理初始化
 */
var Order = {
    id: "OrderTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
Order.initColumn = function () {
    return [
        {field: 'selectItem', radio: true},
            {title: '序号', field: 'id', visible: true, align: 'center', valign: 'middle'},
            {title: '订单号', field: 'sn', visible: true, align: 'center', valign: 'middle'},
            {title: '下单人', field: 'userName', visible: true, align: 'center', valign: 'middle'},
            // {title: '店铺', field: 'shopId', visible: true, align: 'center', valign: 'middle'},
            {title: '合计金额', field: 'money', visible: true, align: 'center', valign: 'middle'},
            {title: '合计积分', field: 'points', visible: true, align: 'center', valign: 'middle'},
            {title: '下单时间', field: 'createTime', visible: true, align: 'center', valign: 'middle'},
            // {title: '收货地址', field: 'shipAddress', visible: true, align: 'center', valign: 'middle'},
            {title: '收货人', field: 'shipName', visible: true, align: 'center', valign: 'middle'},
            {title: '收货人联系电话', field: 'shipMobile', visible: true, align: 'center', valign: 'middle'},
            {title: '备注', field: 'remark', visible: true, align: 'center', valign: 'middle'},
            {title: '订单', field: 'stateName', visible: true, align: 'center', valign: 'middle'}
    ];
};

/**
 * 检查是否选中
 */
Order.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length === 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        Order.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加订单信息
 */
Order.openAddOrder = function () {
    var index = layer.open({
        type: 2,
        title: '添加订单信息',
        area: ['800px', '420px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/order/order_add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看订单信息详情
 */
Order.openOrderDetail = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: '订单信息详情',
            area: ['800px', '520px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/order/order_update/' + Order.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除订单信息
 */
Order.delete = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/order/delete", function (data) {
            Feng.success("删除成功!");
            Order.table.refresh();
        }, function (data) {
            Feng.error("删除失败!" + data.responseJSON.message + "!");
        });
        ajax.set("orderId",this.seItem.id);
        ajax.start();
    }
};

/**
 * 订单商品信息
 */
Order.openOrderProduct = function () {
    if (this.check()) {
            var index = layer.open({
                type: 2,
                title: '订单信息详情',
                area: ['900px', '820px'], //宽高
                fix: false, //不固定
                maxmin: true,
                content: Feng.ctxPath + '/order/order_product/' + Order.seItem.id
            });
            this.layerIndex = index;
    }
};

/**
 * 确认完成订单信息
 */
Order.okOrder = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/order/okOrder", function (data) {
            Feng.success("确认完成订单成功!");
            Order.table.refresh();
        }, function (data) {
            Feng.error("确认完成订单失败!" + data.responseJSON.message + "!");
        });
        ajax.set("orderId",this.seItem.id);
        ajax.start();
    }
};

/**
 * 查询订单信息列表
 */
Order.search = function () {
    var queryData = {};
    queryData['condition'] = $("#condition").val();
    Order.table.refresh({query: queryData});
};

$(function () {
    var defaultColunms = Order.initColumn();
    var table = new BSTable(Order.id, "/order/list", defaultColunms);
    table.setPaginationType("client");
    Order.table = table.init();
});

