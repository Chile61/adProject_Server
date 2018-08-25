/**
 * shop管理初始化
 */
var Shop = {
    id: "ShopTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
Shop.initColumn = function () {
    return [
        {field: 'selectItem', radio: true},
            {title: '序号', field: 'id', visible: true, align: 'center', valign: 'middle'},
            {title: '店铺名称', field: 'name', visible: true, align: 'center', valign: 'middle'},
            {title: '店铺类型', field: 'typeName', visible: true, align: 'center', valign: 'middle'},
            {title: '店铺描述', field: 'description', visible: true, align: 'center', valign: 'middle'},
            {title: '店铺所属用户', field: 'userName', visible: true, align: 'center', valign: 'middle'},
            // {title: '店铺二维码', field: 'QRcode', visible: true, align: 'center', valign: 'middle'},
            // {title: '经营类别', field: 'category', visible: true, align: 'center', valign: 'middle'},
            {title: '主营品牌', field: 'brand', visible: true, align: 'center', valign: 'middle'},
            {title: '店铺LOGO', field: 'logo', visible: true, align: 'center', valign: 'middle'},
            {title: '经营执照', field: 'license', visible: true, align: 'center', valign: 'middle'},
            {title: '店铺状态', field: 'stateName', visible: true, align: 'center', valign: 'middle'}
    ];
};

/**
 * 检查是否选中
 */
Shop.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        Shop.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加shop
 */
Shop.openAddShop = function () {
    var index = layer.open({
        type: 2,
        title: '添加店铺',
        area: ['900px', '520px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/shop/shop_add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看shop详情
 */
Shop.openShopDetail = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: '店铺详情',
            area: ['900px', '520px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/shop/shop_update/' + Shop.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除shop
 */
Shop.delete = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/shop/delete", function (data) {
            Feng.success("删除成功!");
            Shop.table.refresh();
        }, function (data) {
            Feng.error("删除失败!" + data.responseJSON.message + "!");
        });
        ajax.set("shopId",this.seItem.id);
        ajax.start();
    }
};

/**
 * 查询shop列表
 */
Shop.search = function () {
    var queryData = {};
    queryData['condition'] = $("#condition").val();
    Shop.table.refresh({query: queryData});
};

$(function () {
    var defaultColunms = Shop.initColumn();
    var table = new BSTable(Shop.id, "/shop/list", defaultColunms);
    table.setPaginationType("client");
    Shop.table = table.init();
});
