/**
 * conversionSumLog管理初始化
 */
var ConversionSumLog = {
    id: "ConversionSumLogTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
ConversionSumLog.initColumn = function () {
    return [
        {field: 'selectItem', radio: true},
            {title: '主键', field: 'id', visible: false, align: 'center', valign: 'middle'},
            {title: '当前总积分', field: 'points', visible: true, align: 'center', valign: 'middle'},
            {title: '当前总云积分', field: 'cloudPoints', visible: true, align: 'center', valign: 'middle'},
            {title: '用户总消费积分', field: 'onlyPayPoints', visible: true, align: 'center', valign: 'middle'},
            {title: '每日云积分转换率', field: 'dailyCloudConversionRate', visible: true, align: 'center', valign: 'middle'},
            {title: '每日云积分', field: 'dailyCloudConverPoints', visible: true, align: 'center', valign: 'middle'},
            {title: '每日消费积分转换率', field: 'dailyConsumptionConversionRate', visible: true, align: 'center', valign: 'middle'},
            {title: '每日消费积分分', field: 'dailyConsumptionConverPoints', visible: true, align: 'center', valign: 'middle'},
            {title: '转换后总积分', field: 'newPoints', visible: true, align: 'center', valign: 'middle'},
            {title: '转换后总云积分', field: 'newCloudPoints', visible: true, align: 'center', valign: 'middle'},
            {title: '转换后总消费积分', field: 'newOnlyPayPoints', visible: true, align: 'center', valign: 'middle'},
            {title: '记录每天系统充值总额', field: 'dailyRechargeSum', visible: true, align: 'center', valign: 'middle'},
            {title: '记录每天系统提现总额', field: 'dailyWithdrawSum', visible: true, align: 'center', valign: 'middle'},
            {title: '记录每天系统消费总额', field: 'dailyConsumptionSum', visible: true, align: 'center', valign: 'middle'},
            {title: '手续费率', field: 'formalityRate', visible: true, align: 'center', valign: 'middle'},
            {title: '转换时间', field: 'createTime', visible: true, align: 'center', valign: 'middle'},
            {title: '是否成功', field: 'succeed', visible: true, align: 'center', valign: 'middle'},
            {title: '备注', field: 'message', visible: true, align: 'center', valign: 'middle'}
    ];
};

/**
 * 检查是否选中
 */
ConversionSumLog.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        ConversionSumLog.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加conversionSumLog
 */
ConversionSumLog.openAddConversionSumLog = function () {
    var index = layer.open({
        type: 2,
        title: '添加conversionSumLog',
        area: ['800px', '420px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/conversionSumLog/conversionSumLog_add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看conversionSumLog详情
 */
ConversionSumLog.openConversionSumLogDetail = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: 'conversionSumLog详情',
            area: ['800px', '420px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/conversionSumLog/conversionSumLog_update/' + ConversionSumLog.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除conversionSumLog
 */
ConversionSumLog.delete = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/conversionSumLog/delete", function (data) {
            Feng.success("删除成功!");
            ConversionSumLog.table.refresh();
        }, function (data) {
            Feng.error("删除失败!" + data.responseJSON.message + "!");
        });
        ajax.set("conversionSumLogId",this.seItem.id);
        ajax.start();
    }
};

/**
 * 查询conversionSumLog列表
 */
ConversionSumLog.search = function () {
    var queryData = {};
    queryData['condition'] = $("#condition").val();
    ConversionSumLog.table.refresh({query: queryData});
};

$(function () {
    var defaultColunms = ConversionSumLog.initColumn();
    var table = new BSTable(ConversionSumLog.id, "/conversionSumLog/list", defaultColunms);
    table.setPaginationType("client");
    ConversionSumLog.table = table.init();
});
