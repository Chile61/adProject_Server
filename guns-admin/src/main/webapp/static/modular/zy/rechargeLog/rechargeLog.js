/**
 * 管理初始化
 */
var RechargeLog = {
    id: "RechargeLogTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
RechargeLog.initColumn = function () {
    return [
        {field: 'selectItem', radio: true},
            {title: '主键id', field: 'id', visible: true, align: 'center', valign: 'middle'},
            {title: '操作员id', field: 'operatorId', visible: true, align: 'center', valign: 'middle'},
            {title: '用户id', field: 'userId', visible: true, align: 'center', valign: 'middle'},
            {title: '1积分,2库存', field: 'type', visible: true, align: 'center', valign: 'middle'},
            {title: '充值积分', field: 'points', visible: true, align: 'center', valign: 'middle'},
            {title: '充值时间', field: 'dateTime', visible: true, align: 'center', valign: 'middle'}
    ];
};

/**
 * 检查是否选中
 */
RechargeLog.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        RechargeLog.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加
 */
RechargeLog.openAddRechargeLog = function () {
    var index = layer.open({
        type: 2,
        title: '添加',
        area: ['800px', '420px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/rechargeLog/rechargeLog_add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看详情
 */
RechargeLog.openRechargeLogDetail = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: '详情',
            area: ['800px', '420px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/rechargeLog/rechargeLog_update/' + RechargeLog.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除
 */
RechargeLog.delete = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/rechargeLog/delete", function (data) {
            Feng.success("删除成功!");
            RechargeLog.table.refresh();
        }, function (data) {
            Feng.error("删除失败!" + data.responseJSON.message + "!");
        });
        ajax.set("rechargeLogId",this.seItem.id);
        ajax.start();
    }
};

/**
 * 查询列表
 */
RechargeLog.search = function () {
    var queryData = {};
    queryData['condition'] = $("#condition").val();
    RechargeLog.table.refresh({query: queryData});
};

$(function () {
    var defaultColunms = RechargeLog.initColumn();
    var table = new BSTable(RechargeLog.id, "/rechargeLog/list", defaultColunms);
    table.setPaginationType("client");
    RechargeLog.table = table.init();
});
