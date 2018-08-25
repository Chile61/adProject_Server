/**
 * 管理初始化
 */
var WithdrawLog = {
    id: "WithdrawLogTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
WithdrawLog.initColumn = function () {
    return [
        {field: 'selectItem', radio: true},
            {title: '主键id', field: 'id', visible: true, align: 'center', valign: 'middle'},
            {title: '操作员id', field: 'operatorId', visible: true, align: 'center', valign: 'middle'},
            {title: '用户id', field: 'userId', visible: true, align: 'center', valign: 'middle'},
            {title: '提现积分', field: 'points', visible: true, align: 'center', valign: 'middle'},
            {title: '手续费率', field: 'formalityRate', visible: true, align: 'center', valign: 'middle'},
            {title: '提现时间', field: 'dateTime', visible: true, align: 'center', valign: 'middle'},
            {title: '审核时间', field: 'auditDateTime', visible: true, align: 'center', valign: 'middle'}
    ];
};

/**
 * 检查是否选中
 */
WithdrawLog.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        WithdrawLog.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加
 */
WithdrawLog.openAddWithdrawLog = function () {
    var index = layer.open({
        type: 2,
        title: '添加',
        area: ['800px', '420px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/withdrawLog/withdrawLog_add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看详情
 */
WithdrawLog.openWithdrawLogDetail = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: '详情',
            area: ['800px', '420px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/withdrawLog/withdrawLog_update/' + WithdrawLog.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除
 */
WithdrawLog.delete = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/withdrawLog/delete", function (data) {
            Feng.success("删除成功!");
            WithdrawLog.table.refresh();
        }, function (data) {
            Feng.error("删除失败!" + data.responseJSON.message + "!");
        });
        ajax.set("withdrawLogId",this.seItem.id);
        ajax.start();
    }
};

/**
 * 查询列表
 */
WithdrawLog.search = function () {
    var queryData = {};
    queryData['condition'] = $("#condition").val();
    WithdrawLog.table.refresh({query: queryData});
};

$(function () {
    var defaultColunms = WithdrawLog.initColumn();
    var table = new BSTable(WithdrawLog.id, "/withdrawLog/list", defaultColunms);
    table.setPaginationType("client");
    WithdrawLog.table = table.init();
});
