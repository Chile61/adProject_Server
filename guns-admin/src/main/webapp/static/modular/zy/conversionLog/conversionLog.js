/**
 * 管理初始化
 */
var ConversionLog = {
    id: "ConversionLogTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
ConversionLog.initColumn = function () {
    return [
        {field: 'selectItem', radio: true},
            {title: '主键', field: 'id', visible: false, align: 'center', valign: 'middle'},
            {title: '用户id', field: 'userId', visible: false, align: 'center', valign: 'middle'},
            {title: '用户名', field: 'account', visible: true, align: 'center', valign: 'middle'},
            {title: '用户当前积分', field: 'points', visible: true, align: 'center', valign: 'middle'},
            {title: '用户当前云积分', field: 'cloudPoints', visible: true, align: 'center', valign: 'middle'},
            {title: '用户当前消费积分', field: 'onlyPayPoints', visible: true, align: 'center', valign: 'middle'},
            {title: '每日云积分转换率', field: 'dailyCloudConversionRate', visible: true, align: 'center', valign: 'middle'},
            {title: '每日获得云积分', field: 'dailyCloudConverPoints', visible: true, align: 'center', valign: 'middle'},
            {title: '每日消费积分转换率', field: 'dailyConsumptionConversionRate', visible: true, align: 'center', valign: 'middle'},
            {title: '每日获得消费积分', field: 'dailyConsumptionConverPoints', visible: true, align: 'center', valign: 'middle'},
            {title: '每日结算后用户积分', field: 'newPoints', visible: true, align: 'center', valign: 'middle'},
            {title: '每日结算后用户云积分', field: 'newCloudPoints', visible: true, align: 'center', valign: 'middle'},
            {title: '每日结算后用户消费积分', field: 'newOnlyPayPoints', visible: true, align: 'center', valign: 'middle'},
            {title: '当日充值积分', field: 'dailyRechargeSum', visible: true, align: 'center', valign: 'middle'},
            {title: '当日提现总数', field: 'dailyWithdrawSum', visible: true, align: 'center', valign: 'middle'},
            {title: '手续费率', field: 'formalityRate', visible: true, align: 'center', valign: 'middle'},
            {title: '当日购物消费', field: 'dailyConsumptionSum', visible: true, align: 'center', valign: 'middle'},
            {title: '转换时间', field: 'createTime', visible: true, align: 'center', valign: 'middle'},
            {title: '是否成功', field: 'succeed', visible: true, align: 'center', valign: 'middle'},
            {title: '备注', field: 'message', visible: true, align: 'center', valign: 'middle'}
    ];
};

/**
 * 检查是否选中
 */
ConversionLog.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        ConversionLog.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加
 */
ConversionLog.openAddConversionLog = function () {
    var index = layer.open({
        type: 2,
        title: '添加',
        area: ['800px', '420px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/conversionLog/conversionLog_add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看详情
 */
ConversionLog.openConversionLogDetail = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: '详情',
            area: ['800px', '420px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/conversionLog/conversionLog_update/' + ConversionLog.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除
 */
ConversionLog.delete = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/conversionLog/delete", function (data) {
            Feng.success("删除成功!");
            ConversionLog.table.refresh();
        }, function (data) {
            Feng.error("删除失败!" + data.responseJSON.message + "!");
        });
        ajax.set("conversionLogId",this.seItem.id);
        ajax.start();
    }
};

/**
 * 查询列表
 */
ConversionLog.search = function () {
    var queryData = {};
    queryData['condition'] = $("#condition").val();
    ConversionLog.table.refresh({query: queryData});
};

$(function () {
    var defaultColunms = ConversionLog.initColumn();
    var table = new BSTable(ConversionLog.id, "/conversionLog/list", defaultColunms);
    table.setPaginationType("client");
    ConversionLog.table = table.init();
});
