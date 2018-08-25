/**
 * ad管理初始化
 */
var Ad = {
    id: "AdTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
Ad.initColumn = function () {
    return [
        {field: 'selectItem', radio: true},
            {title: '主键id', field: 'id', visible: true, align: 'center', valign: 'middle'},
            {title: '标题', field: 'title', visible: true, align: 'center', valign: 'middle'},
            {title: '广告类别', field: 'typeId', visible: true, align: 'center', valign: 'middle'},
            {title: '广告位置', field: 'positionId', visible: true, align: 'center', valign: 'middle'},
            {title: '发布人', field: 'userId', visible: true, align: 'center', valign: 'middle'},
            {title: '发布店铺', field: 'shopId', visible: true, align: 'center', valign: 'middle'},
            {title: '对应品牌', field: 'brandId', visible: true, align: 'center', valign: 'middle'},
            {title: '对应商品', field: 'productId', visible: true, align: 'center', valign: 'middle'},
            {title: '对应文章', field: 'articleId', visible: true, align: 'center', valign: 'middle'},
            {title: '开始时间', field: 'startTime', visible: true, align: 'center', valign: 'middle'},
            {title: '截止时间', field: 'endTime', visible: true, align: 'center', valign: 'middle'},
            {title: '图片', field: 'image', visible: true, align: 'center', valign: 'middle'},
            {title: '折后价', field: 'lowPrice', visible: true, align: 'center', valign: 'middle'},
            {title: '价格', field: 'highPrice', visible: true, align: 'center', valign: 'middle'},
            {title: '排序', field: 'sortNum', visible: true, align: 'center', valign: 'middle'},
            {title: '列宽(1-12)', field: 'col', visible: true, align: 'center', valign: 'middle'}
    ];
};

/**
 * 检查是否选中
 */
Ad.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        Ad.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加ad
 */
Ad.openAddAd = function () {
    var index = layer.open({
        type: 2,
        title: '添加ad',
        area: ['800px', '420px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/ad/ad_add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看ad详情
 */
Ad.openAdDetail = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: 'ad详情',
            area: ['800px', '420px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/ad/ad_update/' + Ad.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除ad
 */
Ad.delete = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/ad/delete", function (data) {
            Feng.success("删除成功!");
            Ad.table.refresh();
        }, function (data) {
            Feng.error("删除失败!" + data.responseJSON.message + "!");
        });
        ajax.set("adId",this.seItem.id);
        ajax.start();
    }
};

/**
 * 查询ad列表
 */
Ad.search = function () {
    var queryData = {};
    queryData['condition'] = $("#condition").val();
    Ad.table.refresh({query: queryData});
};

$(function () {
    var defaultColunms = Ad.initColumn();
    var table = new BSTable(Ad.id, "/ad/list", defaultColunms);
    table.setPaginationType("client");
    Ad.table = table.init();
});
