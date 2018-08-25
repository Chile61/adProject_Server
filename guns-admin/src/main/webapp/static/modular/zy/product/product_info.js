/**
 * 初始化product详情对话框
 */
var ProductInfoDlg = {
    productInfoData : {},
    shopZtree: null,
    productCategoryZtree:null
};

/**
 * 清除数据
 */
ProductInfoDlg.clearData = function() {
    this.productInfoData = {};
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
ProductInfoDlg.set = function(key, val) {
    this.productInfoData[key] = (typeof val == "undefined") ? $("#" + key).val() : val;
    return this;
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
ProductInfoDlg.get = function(key) {
    return $("#" + key).val();
}

/**
 * 关闭此对话框
 */
ProductInfoDlg.close = function() {
    parent.layer.close(window.parent.Product.layerIndex);
}

/**
 * 收集数据
 */
ProductInfoDlg.collectData = function() {
    this
    .set('id')
    .set('name')
    .set('description')
    .set('lowPice')
    .set('highPice')
    .set('shopId')
    .set('categoryId')
    .set('points')
    ;
}

/**
 * 提交添加
 */
ProductInfoDlg.addSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/product/add", function(data){
        Feng.success("添加成功!");
        window.parent.Product.table.refresh();
        ProductInfoDlg.close();
    },function(data){
        Feng.error("添加失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.productInfoData);
    ajax.start();
}

/**
 * 提交修改
 */
ProductInfoDlg.editSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/product/update", function(data){
        Feng.success("修改成功!");
        window.parent.Product.table.refresh();
        ProductInfoDlg.close();
    },function(data){
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.productInfoData);
    ajax.start();
}

/**
 * 显示店铺选择的树
 *
 * @returns
 */
ProductInfoDlg.showShopSelectTree = function () {
    Feng.showInputTree("shopName", "shopContent");
};
/**
 * 点击店铺input框时
 *
 * @param e
 * @param treeId
 * @param treeNode
 * @returns
 */
ProductInfoDlg.onClickShop = function (e, treeId, treeNode) {
    $("#shopName").attr("value", ProductInfoDlg.shopZtree.getSelectedVal());
    $("#shopId").attr("value", treeNode.id);
    //初始化商品分类下拉列表
    var productCategoryTree = new $ZTree("productCategoryTree", "/productCategory/productCategoryTree/"+treeNode.id);
    productCategoryTree.bindOnClick(ProductInfoDlg.onClickProductCategory);
    productCategoryTree.bindOnDblClick(ProductInfoDlg.onDblClickProductCategory);
    productCategoryTree.init();
    ProductInfoDlg.productCategoryZtree = productCategoryTree;
};
ProductInfoDlg.onDblClickShop = function (e, treeId, treeNode) {
    $("#shopName").attr("value", ProductInfoDlg.shopZtree.getSelectedVal());
    $("#shopId").attr("value", treeNode.id);
    $("#shopContent").fadeOut("fast");
    //初始化商品分类下拉列表
    var productCategoryTree = new $ZTree("productCategoryTree", "/productCategory/productCategoryTree/"+treeNode.id);
    productCategoryTree.bindOnClick(ProductInfoDlg.onClickProductCategory);
    productCategoryTree.bindOnDblClick(ProductInfoDlg.onDblClickProductCategory);
    productCategoryTree.init();
    ProductInfoDlg.productCategoryZtree = productCategoryTree;
};

/**
 * 显示产品分类选择的树
 *
 * @returns
 */
ProductInfoDlg.showProductCategorySelectTree = function () {
    //Product.productCategoryZtree.url
    Feng.showInputTree("productCategoryName", "productCategoryContent");
};
/**
 * 点击产品分类input框时
 *
 * @param e
 * @param treeId
 * @param treeNode
 * @returns
 */
ProductInfoDlg.onClickProductCategory = function (e, treeId, treeNode) {
    $("#productCategoryName").attr("value", ProductInfoDlg.productCategoryZtree.getSelectedVal());
    $("#categoryId").attr("value", treeNode.id);
};
ProductInfoDlg.onDblClickProductCategory = function (e, treeId, treeNode) {
    $("#productCategoryName").attr("value", ProductInfoDlg.productCategoryZtree.getSelectedVal());
    $("#categoryId").attr("value", treeNode.id);
    $("#productCategoryContent").fadeOut("fast");
};

$(function() {
    //初始化店铺下拉列表
    var shopTree = new $ZTree("shopTree", "/shop/shopTree");
    shopTree.bindOnClick(ProductInfoDlg.onClickShop);
    shopTree.bindOnDblClick(ProductInfoDlg.onDblClickShop);
    shopTree.init();
    ProductInfoDlg.shopZtree = shopTree;

    shopId = $("#shopIdValue").val();
    if (shopId!==""){
        //初始化商品分类下拉列表
        var productCategoryTree = new $ZTree("productCategoryTree", "/productCategory/productCategoryTree/"+shopId);
        productCategoryTree.bindOnClick(ProductInfoDlg.onClickProductCategory);
        productCategoryTree.bindOnDblClick(ProductInfoDlg.onDblClickProductCategory);
        productCategoryTree.init();
        ProductInfoDlg.productCategoryZtree = productCategoryTree;
    }


    // // 初始化商品图片上传
    // var productImgUp = new $WebUploadMutiple("productImg");
    // productImgUp.setUploadBarId("progressBar");
    // productImgUp.init();
});