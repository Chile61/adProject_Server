/**
 * 申请提现云积分管理初始化
 */
var WithdrawApplyCloud = {
    id: "WithdrawApplyCloudTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
WithdrawApplyCloud.initColumn = function () {
    return [
        {field: 'selectItem', radio: true},
            {title: '序号', field: 'id', visible: true, align: 'center', valign: 'middle'},
            {title: '用户', field: 'userName', visible: true, align: 'center', valign: 'middle'},
            {title: '申请提现云积分', field: 'points', visible: true, align: 'center', valign: 'middle'},
            {title: '申请状态', field: 'stateName', visible: true, align: 'center', valign: 'middle'},
            {title: '申请时间', field: 'createTime', visible: true, align: 'center', valign: 'middle'}
    ];
};

/**
 * 检查是否选中
 */
WithdrawApplyCloud.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        WithdrawApplyCloud.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加申请提现云积分
 */
WithdrawApplyCloud.openAddWithdrawApplyCloud = function () {
    var index = layer.open({
        type: 2,
        title: '添加申请提现云积分',
        area: ['800px', '420px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/withdrawApplyCloud/withdrawApplyCloud_add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看申请提现云积分详情
 */
WithdrawApplyCloud.openWithdrawApplyCloudDetail = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: '申请提现云积分详情',
            area: ['800px', '420px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/withdrawApplyCloud/withdrawApplyCloud_update/' + WithdrawApplyCloud.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除申请提现云积分
 */
WithdrawApplyCloud.delete = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/withdrawApplyCloud/delete", function (data) {
            Feng.success("删除成功!");
            WithdrawApplyCloud.table.refresh();
        }, function (data) {
            Feng.error("删除失败!" + data.responseJSON.message + "!");
        });
        ajax.set("withdrawApplyCloudId",this.seItem.id);
        ajax.start();
    }
};

/**
 * 确认申请提现云积分
 */
WithdrawApplyCloud.ok = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/withdrawApplyCloud/ok", function (data) {
            Feng.success("操作成功!");
            WithdrawApplyCloud.table.refresh();
        }, function (data) {
            Feng.error("操作失败!" + data.responseJSON.message + "!");
        });
        ajax.set("withdrawApplyCloudId",this.seItem.id);
        ajax.start();
    }
};

/**
 * 撤销申请提现云积分
 */
WithdrawApplyCloud.delete = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/withdrawApplyCloud/cancel", function (data) {
            Feng.success("操作成功!");
            WithdrawApplyCloud.table.refresh();
        }, function (data) {
            Feng.error("操作失败!" + data.responseJSON.message + "!");
        });
        ajax.set("withdrawApplyCloudId",this.seItem.id);
        ajax.start();
    }
};

/**
 * 查询申请提现云积分列表
 */
WithdrawApplyCloud.search = function () {
    var queryData = {};
    queryData['condition'] = $("#condition").val();
    WithdrawApplyCloud.table.refresh({query: queryData});
};

$(function () {
    var defaultColunms = WithdrawApplyCloud.initColumn();
    var table = new BSTable(WithdrawApplyCloud.id, "/withdrawApplyCloud/list", defaultColunms);
    table.setPaginationType("client");
    WithdrawApplyCloud.table = table.init();
});
