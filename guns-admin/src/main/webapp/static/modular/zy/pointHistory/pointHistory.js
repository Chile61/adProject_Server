/**
 * 管理初始化
 */
var PointHistory = {
    id: "pointHistoryTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
PointHistory.initColumn = function () {
    return [
        {field: 'selectItem', radio: true},
        {title: '账号', field: 'account', visible: true, align: 'center', valign: 'middle'},
        {title: '姓名', field: 'name', visible: true, align: 'center', valign: 'middle'},
        {title: '加入时间', field: 'createtime', visible: true, align: 'center', valign: 'middle'},
        {title: '用户类型', field: 'typeName', visible: true, align: 'center', valign: 'middle'},
        {title: '用户级别', field: 'levelName', visible: true, align: 'center', valign: 'middle'},
        {title: '直推人', field: 'superiorAccount', visible: true, align: 'center', valign: 'middle'},
        {title: '奖励合计', field: 'rewardPointsSum', visible: true, align: 'center', valign: 'middle'},
        {title: '1级销售额', field: 'firstCommissionPoints', visible: true, align: 'center', valign: 'middle'},
        {title: '1级奖励', field: 'firstClientReward', visible: true, align: 'center', valign: 'middle'},
        {title: '2级销售额', field: 'secondCommissionPoints', visible: true, align: 'center', valign: 'middle'},
        {title: '2级奖励', field: 'secondClientReward', visible: true, align: 'center', valign: 'middle'},
        {title: '3级销售额', field: 'thirdCommissionPoints', visible: true, align: 'center', valign: 'middle'},
        {title: '3级奖励', field: 'thirdClientReward', visible: true, align: 'center', valign: 'middle'},
        {title: '分享奖励总额', field: 'clientReward', visible: true, align: 'center', valign: 'middle'},
        {title: '伞体总额', field: 'allClientRechargePoints', visible: true, align: 'center', valign: 'middle'},
        {title: '统一管理奖', field: 'sumManageReward', visible: true, align: 'center', valign: 'middle'},
        {title: '提现', field: 'sumWithdraw', visible: true, align: 'center', valign: 'middle'},
        {title: '消费额', field: 'sumRecharge', visible: true, align: 'center', valign: 'middle'},
        {title: '积分', field: 'points', visible: true, align: 'center', valign: 'middle'},
        {title: '云积分', field: 'cloudPoints', visible: true, align: 'center', valign: 'middle'},
        {title: '消费积分', field: 'onlyPayPoints', visible: true, align: 'center', valign: 'middle'},
        {title: '现金账户', field: 'cash', visible: true, align: 'center', valign: 'middle'}
    ];
};

/**
 * 检查是否选中
 */
PointHistory.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        PointHistory.seItem = selected[0];
        return true;
    }
};

/**
 * 查询列表
 */
PointHistory.search = function () {
    var queryData = {};
    queryData['userRole'] = $("#userRole").val();
    queryData['userLevel'] = $("#userLevel").val();
    queryData['beginTime'] = $("#beginTime").val();
    queryData['endTime'] = $("#endTime").val();
    PointHistory.table.refresh({query: queryData});
};

$(function () {
    var defaultColunms = PointHistory.initColumn();
    var table = new BSTable(PointHistory.id, "/pointHistory/list", defaultColunms);
    table.setPaginationType("client");
    PointHistory.table = table.init();
});
