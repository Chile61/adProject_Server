/**
 * jobconfig管理初始化
 */
var QuartzjobConfig = {
    id: "QuartzjobConfigTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
QuartzjobConfig.initColumn = function () {
    return [
        {field: 'selectItem', radio: true},
            {title: '主键id', field: 'id', visible: true, align: 'center', valign: 'middle'},
            {title: '创建时间', field: 'createAt', visible: true, align: 'center', valign: 'middle'},
            {title: '任务运行时间表达式', field: 'cronExpression', visible: true, align: 'center', valign: 'middle'},
            {title: '任务描述', field: 'jobDesc', visible: true, align: 'center', valign: 'middle'},
            {title: '任务组名', field: 'groupName', visible: true, align: 'center', valign: 'middle'},
            {title: '任务名称', field: 'jobName', visible: true, align: 'center', valign: 'middle'},
            {title: '任务状态 0禁用 1启用 2删除', field: 'jobStatus', visible: true, align: 'center', valign: 'middle'},
            {title: '更新时间', field: 'updateAt', visible: true, align: 'center', valign: 'middle'},
            {title: '任务sql', field: 'jobSql', visible: true, align: 'center', valign: 'middle'}
    ];
};

/**
 * 检查是否选中
 */
QuartzjobConfig.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        QuartzjobConfig.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加jobconfig
 */
QuartzjobConfig.openAddQuartzjobConfig = function () {
    var index = layer.open({
        type: 2,
        title: '添加jobconfig',
        area: ['800px', '420px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/quartzjobConfig/quartzjobConfig_add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看jobconfig详情
 */
QuartzjobConfig.openQuartzjobConfigDetail = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: 'jobconfig详情',
            area: ['800px', '420px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/quartzjobConfig/quartzjobConfig_update/' + QuartzjobConfig.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除jobconfig
 */
QuartzjobConfig.delete = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/quartzjobConfig/delete", function (data) {
            Feng.success("删除成功!");
            QuartzjobConfig.table.refresh();
        }, function (data) {
            Feng.error("删除失败!" + data.responseJSON.message + "!");
        });
        ajax.set("quartzjobConfigId",this.seItem.id);
        ajax.start();
    }
};

/**
 * 查询jobconfig列表
 */
QuartzjobConfig.search = function () {
    var queryData = {};
    queryData['condition'] = $("#condition").val();
    QuartzjobConfig.table.refresh({query: queryData});
};

$(function () {
    var defaultColunms = QuartzjobConfig.initColumn();
    var table = new BSTable(QuartzjobConfig.id, "/quartzjobConfig/list", defaultColunms);
    table.setPaginationType("client");
    QuartzjobConfig.table = table.init();
});
