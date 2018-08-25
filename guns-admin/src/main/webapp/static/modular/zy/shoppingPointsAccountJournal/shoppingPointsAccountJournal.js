/**
 * shoppingPointsJournal管理初始化
 */
var ShoppingPointsAccountJournal = {
    id: "ShoppingPointsAccountJournalTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
ShoppingPointsAccountJournal.initColumn = function () {
    return [
        {field: 'selectItem', radio: true},
            {title: '主键id', field: 'id', visible: false, align: 'center', valign: 'middle'},
            {title: '用户id', field: 'userId', visible: true, align: 'center', valign: 'middle'},
            {title: '描述', field: 'description', visible: true, align: 'center', valign: 'middle'},
            {title: '分值', field: 'points', visible: true, align: 'center', valign: 'middle'},
            {title: '时间', field: 'dateTime', visible: true, align: 'center', valign: 'middle'}
    ];
};

/**
 * 检查是否选中
 */
ShoppingPointsAccountJournal.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        ShoppingPointsAccountJournal.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加shoppingPointsJournal
 */
ShoppingPointsAccountJournal.openAddShoppingPointsAccountJournal = function () {
    var index = layer.open({
        type: 2,
        title: '添加shoppingPointsJournal',
        area: ['800px', '420px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/shoppingPointsAccountJournal/shoppingPointsAccountJournal_add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看shoppingPointsJournal详情
 */
ShoppingPointsAccountJournal.openShoppingPointsAccountJournalDetail = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: 'shoppingPointsJournal详情',
            area: ['800px', '420px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/shoppingPointsAccountJournal/shoppingPointsAccountJournal_update/' + ShoppingPointsAccountJournal.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除shoppingPointsJournal
 */
ShoppingPointsAccountJournal.delete = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/shoppingPointsAccountJournal/delete", function (data) {
            Feng.success("删除成功!");
            ShoppingPointsAccountJournal.table.refresh();
        }, function (data) {
            Feng.error("删除失败!" + data.responseJSON.message + "!");
        });
        ajax.set("shoppingPointsAccountJournalId",this.seItem.id);
        ajax.start();
    }
};

/**
 * 查询shoppingPointsJournal列表
 */
ShoppingPointsAccountJournal.search = function () {
    var queryData = {};
    queryData['condition'] = $("#condition").val();
    ShoppingPointsAccountJournal.table.refresh({query: queryData});
};

$(function () {
    var defaultColunms = ShoppingPointsAccountJournal.initColumn();
    var table = new BSTable(ShoppingPointsAccountJournal.id, "/shoppingPointsAccountJournal/list", defaultColunms);
    table.setPaginationType("client");
    ShoppingPointsAccountJournal.table = table.init();
});
