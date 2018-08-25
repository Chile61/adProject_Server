/**
 * brand管理初始化
 */
var Brand = {
    id: "BrandTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
Brand.initColumn = function () {
    return [
        {field: 'selectItem', radio: true},
            {title: '主键id', field: 'id', visible: true, align: 'center', valign: 'middle'},
            {title: '品牌名称', field: 'brand', visible: true, align: 'center', valign: 'middle'},
            {title: '品牌描述', field: 'description', visible: true, align: 'center', valign: 'middle'},
            {title: '所属用户', field: 'userId', visible: true, align: 'center', valign: 'middle'}
    ];
};

/**
 * 检查是否选中
 */
Brand.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        Brand.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加brand
 */
Brand.openAddBrand = function () {
    var index = layer.open({
        type: 2,
        title: '添加brand',
        area: ['800px', '420px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/brand/brand_add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看brand详情
 */
Brand.openBrandDetail = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: 'brand详情',
            area: ['800px', '420px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/brand/brand_update/' + Brand.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除brand
 */
Brand.delete = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/brand/delete", function (data) {
            Feng.success("删除成功!");
            Brand.table.refresh();
        }, function (data) {
            Feng.error("删除失败!" + data.responseJSON.message + "!");
        });
        ajax.set("brandId",this.seItem.id);
        ajax.start();
    }
};

/**
 * 查询brand列表
 */
Brand.search = function () {
    var queryData = {};
    queryData['condition'] = $("#condition").val();
    Brand.table.refresh({query: queryData});
};

$(function () {
    var defaultColunms = Brand.initColumn();
    var table = new BSTable(Brand.id, "/brand/list", defaultColunms);
    table.setPaginationType("client");
    Brand.table = table.init();
});
