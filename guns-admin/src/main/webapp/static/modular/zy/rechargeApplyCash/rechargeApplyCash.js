/**
 * 申请冲值现金账户管理初始化
 */
var RechargeApplyCash = {
    id: "RechargeApplyCashTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
RechargeApplyCash.initColumn = function () {
    return [
        {field: 'selectItem', radio: true},
            {title: '序号', field: 'id', visible: true, align: 'center', valign: 'middle'},
            {title: '用户', field: 'userName', visible: true, align: 'center', valign: 'middle'},
            {title: '申请金额', field: 'cash', visible: true, align: 'center', valign: 'middle'},
            {title: '申请状态', field: 'stateName', visible: true, align: 'center', valign: 'middle'},
            {title: '申请时间', field: 'createTime', visible: true, align: 'center', valign: 'middle'}
    ];
};

/**
 * 检查是否选中
 */
RechargeApplyCash.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        RechargeApplyCash.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加申请冲值现金账户
 */
RechargeApplyCash.openAddRechargeApplyCash = function () {
    var index = layer.open({
        type: 2,
        title: '添加申请冲值现金账户',
        area: ['800px', '420px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/rechargeApplyCash/rechargeApplyCash_add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看申请冲值现金账户详情
 */
RechargeApplyCash.openRechargeApplyCashDetail = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: '申请冲值现金账户详情',
            area: ['800px', '420px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/rechargeApplyCash/rechargeApplyCash_update/' + RechargeApplyCash.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除申请冲值现金账户
 */
RechargeApplyCash.delete = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/rechargeApplyCash/delete", function (data) {
            Feng.success("删除成功!");
            RechargeApplyCash.table.refresh();
        }, function (data) {
            Feng.error("删除失败!" + data.responseJSON.message + "!");
        });
        ajax.set("rechargeApplyCashId",this.seItem.id);
        ajax.start();
    }
};

/**
 * 确认申请冲值现金账户
 */
RechargeApplyCash.ok = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/rechargeApplyCash/ok", function (data) {
            Feng.success("操作成功!");
            RechargeApplyCash.table.refresh();
        }, function (data) {
            Feng.error("操作失败!" + data.responseJSON.message + "!");
        });
        ajax.set("rechargeApplyCashId",this.seItem.id);
        ajax.start();
    }
};

/**
 * 撤销申请冲值现金账户
 */
RechargeApplyCash.cancel = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/rechargeApplyCash/cancel", function (data) {
            Feng.success("操作成功!");
            RechargeApplyCash.table.refresh();
        }, function (data) {
            Feng.error("操作失败!" + data.responseJSON.message + "!");
        });
        ajax.set("rechargeApplyCashId",this.seItem.id);
        ajax.start();
    }
};

/**
 * 查询申请冲值现金账户列表
 */
RechargeApplyCash.search = function () {
    var queryData = {};
    queryData['condition'] = $("#condition").val();
    RechargeApplyCash.table.refresh({query: queryData});
};

$(function () {
    var defaultColunms = RechargeApplyCash.initColumn();
    var table = new BSTable(RechargeApplyCash.id, "/rechargeApplyCash/list", defaultColunms);
    table.setPaginationType("client");
    RechargeApplyCash.table = table.init();
});
