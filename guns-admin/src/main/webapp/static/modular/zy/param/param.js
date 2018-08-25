/**
 * 管理初始化
 */
var Param = {
    id: "ParamTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
Param.initColumn = function () {
    return [
        {field: 'selectItem', radio: true},
            {title: '序号', field: 'id', visible: false, align: 'center', valign: 'middle'},
            {title: '每日云积分转换率', field: 'dailyCloudConversionRate', visible: true, align: 'center', valign: 'middle'},
            {title: '每日消费积分转换率', field: 'dailyConsumptionConversionRate', visible: true, align: 'center', valign: 'middle'},
            {title: '手续费率', field: 'formalityRate', visible: true, align: 'center', valign: 'middle'}
    ];
};

/**
 * 检查是否选中
 */
Param.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        Param.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加
 */
Param.openAddParam = function () {
    var index = layer.open({
        type: 2,
        title: '添加',
        area: ['800px', '420px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/param/param_add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看详情
 */
Param.openParamDetail = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: '详情',
            area: ['800px', '420px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/param/param_update/' + Param.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除
 */
Param.delete = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/param/delete", function (data) {
            Feng.success("删除成功!");
            Param.table.refresh();
        }, function (data) {
            Feng.error("删除失败!" + data.responseJSON.message + "!");
        });
        ajax.set("paramId",this.seItem.id);
        ajax.start();
    }
};

/**
 * 查询列表
 */
Param.search = function () {
    var queryData = {};
    queryData['condition'] = $("#condition").val();
    Param.table.refresh({query: queryData});
};

Param.createConversionJob = function () {
    var ajax = new $ax(Feng.ctxPath + "/dailyConversion/createConversionJob", function (data) {
        Feng.success(data+"!");
    }, function (data) {
        Feng.error("创建失败!" + data.responseJSON.message + "!");
    });
    ajax.start();
}

Param.pauseConversionJob = function () {
    var ajax = new $ax(Feng.ctxPath + "/dailyConversion/pauseConversionJob", function (data) {
        Feng.success("暂停成功!");
    }, function (data) {
        Feng.error("暂停失败!" + data.responseJSON.message + "!");
    });
    ajax.start();
}

Param.resumeConversionJob = function () {
    var ajax = new $ax(Feng.ctxPath + "/dailyConversion/resumeConversionJob", function (data) {
        Feng.success("恢复成功!");
    }, function (data) {
        Feng.error("恢复失败!" + data.responseJSON.message + "!");
    });
    ajax.start();
}

$(function () {
    var defaultColunms = Param.initColumn();
    var table = new BSTable(Param.id, "/param/list", defaultColunms);
    table.setPaginationType("client");
    Param.table = table.init();
    Param.table.height = 200;
});
