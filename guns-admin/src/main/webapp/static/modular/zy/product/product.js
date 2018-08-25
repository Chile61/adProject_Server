/**
 * product管理初始化
 */
var Product = {
    id: "ProductTable",	//表格id
    shopId:null,
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
Product.initColumn = function () {
    return [
            {title: '序号', field: 'id', visible: false, align: 'center', valign: 'middle'},
            {title: '商品名称', field: 'name', visible: true, align: 'center', valign: 'middle'},
            {title: '描述', field: 'description', visible: true, align: 'center', valign: 'middle'},
            {title: '折后价', field: 'lowPice', visible: true, align: 'center', valign: 'middle'},
            {title: '售价', field: 'highPice', visible: true, align: 'center', valign: 'middle'},
            {title: '所属店铺', field: 'shopName', visible: true, align: 'center', valign: 'middle'},
            {title: '获得积分', field: 'points', visible: true, align: 'center', valign: 'middle'},
            {title: '操作', field: 'operate', align: 'center', valign:'middle', formatter: operateFormatter}
    ];
};

/**
 * 检查是否选中
 */
Product.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        Product.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加product
 */
Product.openAddProduct = function () {
    var index = layer.open({
        type: 2,
        title: '添加商品',
        area: ['800px', '420px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/product/product_add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看product详情
 */
Product.openProductDetail = function (id) {
        var index = layer.open({
            type: 2,
            title: '商品详情',
            area: ['800px', '420px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/product/product_update/' + id
        });
        this.layerIndex = index;
};

/**
 * 打开查看product图片
 */
Product.openProductImages = function (id) {
    var index = layer.open({
        type: 2,
        title: '商品图片',
        area: ['800px', '420px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/product/product_images/' + id
    });
    this.layerIndex = index;
}

/**
 * 打开查看商品参数
 */
Product.openProductParam = function (id) {
    var index = layer.open({
        type: 2,
        title: '商品参数',
        area: ['800px', '420px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/product/product_param/' + id
    });
    this.layerIndex = index;
}

/**
 * 删除product
 */
Product.delete = function (id) {
        var operation = function() {
            var ajax = new $ax(Feng.ctxPath + "/product/delete", function (data) {
                Feng.success("删除成功!");
                Product.table.refresh();
            }, function (data) {
                Feng.error("删除失败!" + data.responseJSON.message + "!");
            });
            ajax.set("productId", id);
            ajax.start();
        };
        Feng.confirm("确定删除该商品？",operation);
};

/**
 * 查询product列表
 */
Product.search = function () {
    var queryData = {};
    queryData['condition'] = $("#condition").val();
    queryData['shopId'] = Product.shopId;
    Product.table.refresh({query: queryData});
};

Product.onClickProduct = function (e, treeId, treeNode) {
    Product.shopId = treeNode.id;
    Product.search();
};

$(function () {

    var defaultColunms = Product.initColumn();
    var table = new BSTable(Product.id, "/product/list", defaultColunms);
    table.setPaginationType("client");
    Product.table = table.init();

    var ztree = new $ZTree("shopTree", "/shop/shopTree");
    ztree.bindOnClick(Product.onClickProduct);
    ztree.init();
});

function operateFormatter(value, row, index) {
    return [
        '<button type="button" class="btn btn-danger" onclick="Product.openProductDetail('+ row.id +')" >\n' +
        '    详情\n' +
        '</button>',
        '<button type="button" class="btn btn-success" onclick="Product.openProductImages('+ row.id +')" >\n' +
        '    图片\n' +
        '</button>',
        '<button type="button" class="btn btn-danger" onclick="Product.openProductParam('+ row.id +')" >\n' +
        '    规格\n' +
        '</button>',
        '<button type="button" class="btn btn-success" onclick="Product.delete('+ row.id +')" >\n' +
        '    删除\n' +
        '</button>'
    ].join('');
}