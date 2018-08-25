/**
 * pointsJournal管理初始化
 */
var PointsAccountJournal = {
    id: "PointsAccountJournalTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
PointsAccountJournal.initColumn = function () {
    return [
        {field: 'selectItem', radio: true},
            {title: '主键id', field: 'id', visible: false, align: 'center', valign: 'middle'},
            {title: '用户id', field: 'userId', visible: false, align: 'center', valign: 'middle'},
            {title: '描述', field: 'description', visible: true, align: 'center', valign: 'middle'},
            {title: '分值', field: 'points', visible: true, align: 'center', valign: 'middle'},
            {title: '时间', field: 'dateTime', visible: true, align: 'center', valign: 'middle'}
    ];
};

/**
 * 检查是否选中
 */
PointsAccountJournal.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        PointsAccountJournal.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加pointsJournal
 */
PointsAccountJournal.openAddPointsAccountJournal = function () {
    var index = layer.open({
        type: 2,
        title: '添加pointsJournal',
        area: ['800px', '420px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/pointsAccountJournal/pointsAccountJournal_add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看pointsJournal详情
 */
PointsAccountJournal.openPointsAccountJournalDetail = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: 'pointsJournal详情',
            area: ['800px', '420px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/pointsAccountJournal/pointsAccountJournal_update/' + PointsAccountJournal.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除pointsJournal
 */
PointsAccountJournal.delete = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/pointsAccountJournal/delete", function (data) {
            Feng.success("删除成功!");
            PointsAccountJournal.table.refresh();
        }, function (data) {
            Feng.error("删除失败!" + data.responseJSON.message + "!");
        });
        ajax.set("pointsAccountJournalId",this.seItem.id);
        ajax.start();
    }
};

/**
 * 查询pointsJournal列表
 */
PointsAccountJournal.search = function () {
    var queryData = {};
    queryData['condition'] = $("#condition").val();
    PointsAccountJournal.table.refresh({query: queryData});
};

$(function () {
    var defaultColunms = PointsAccountJournal.initColumn();
    var table = new BSTable(PointsAccountJournal.id, "/pointsAccountJournal/list", defaultColunms);
    table.setPaginationType("client");
    PointsAccountJournal.table = table.init();
});
