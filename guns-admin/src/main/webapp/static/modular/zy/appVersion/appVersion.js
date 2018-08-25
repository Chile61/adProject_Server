/**
 * 应用版本更新管理初始化
 */
var AppVersion = {
    id: "AppVersionTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
AppVersion.initColumn = function () {
    return [
        {field: 'selectItem', radio: true},
            {title: '序号', field: 'id', visible: true, align: 'center', valign: 'middle'},
            {title: '版本号', field: 'version', visible: true, align: 'center', valign: 'middle'},
            {title: '更新说明', field: 'description', visible: true, align: 'center', valign: 'middle'},
            {title: '下载地址', field: 'url', visible: true, align: 'center', valign: 'middle'}
    ];
};

/**
 * 检查是否选中
 */
AppVersion.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        AppVersion.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加应用版本更新
 */
AppVersion.openAddAppVersion = function () {
    var index = layer.open({
        type: 2,
        title: '添加应用版本更新',
        area: ['800px', '420px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/appVersion/appVersion_add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看应用版本更新详情
 */
AppVersion.openAppVersionDetail = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: '应用版本更新详情',
            area: ['800px', '420px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/appVersion/appVersion_update/' + AppVersion.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除应用版本更新
 */
AppVersion.delete = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/appVersion/delete", function (data) {
            Feng.success("删除成功!");
            AppVersion.table.refresh();
        }, function (data) {
            Feng.error("删除失败!" + data.responseJSON.message + "!");
        });
        ajax.set("appVersionId",this.seItem.id);
        ajax.start();
    }
};

/**
 * 查询应用版本更新列表
 */
AppVersion.search = function () {
    var queryData = {};
    queryData['condition'] = $("#condition").val();
    AppVersion.table.refresh({query: queryData});
};

$(function () {
    var defaultColunms = AppVersion.initColumn();
    var table = new BSTable(AppVersion.id, "/appVersion/list", defaultColunms);
    table.setPaginationType("client");
    AppVersion.table = table.init();
});
