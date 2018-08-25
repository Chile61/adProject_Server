/**
 * 初始化shop详情对话框
 */
var ShopInfoDlg = {
    shopInfoData : {},
    shopTypeZtree: null
};

/**
 * 清除数据
 */
ShopInfoDlg.clearData = function() {
    this.shopInfoData = {};
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
ShopInfoDlg.set = function(key, val) {
    this.shopInfoData[key] = (typeof val == "undefined") ? $("#" + key).val() : val;
    return this;
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
ShopInfoDlg.get = function(key) {
    return $("#" + key).val();
}

/**
 * 关闭此对话框
 */
ShopInfoDlg.close = function() {
    parent.layer.close(window.parent.Shop.layerIndex);
}

/**
 * 收集数据
 */
ShopInfoDlg.collectData = function() {
    this
    .set('id')
    .set('name')
    .set('typeId')
    .set('description')
    .set('category')
    .set('brand')
    .set('logo')
    .set('license')
    .set('state')
    ;
}

/**
 * 提交添加
 */
ShopInfoDlg.addSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/shop/add", function(data){
        Feng.success("添加成功!");
        window.parent.Shop.table.refresh();
        ShopInfoDlg.close();
    },function(data){
        Feng.error("添加失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.shopInfoData);
    ajax.start();
}

/**
 * 提交修改
 */
ShopInfoDlg.editSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/shop/update", function(data){
        Feng.success("修改成功!");
        window.parent.Shop.table.refresh();
        ShopInfoDlg.close();
    },function(data){
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.shopInfoData);
    ajax.start();
}

/**
 * 显示店铺类型选择的树
 *
 * @returns
 */
ShopInfoDlg.showShopTypeSelectTree = function () {
    Feng.showInputTree("shopTypeName", "shopTypeContent");
};
/**
 * 点击部门input框时
 *
 * @param e
 * @param treeId
 * @param treeNode
 * @returns
 */
ShopInfoDlg.onClickShopType = function (e, treeId, treeNode) {
    $("#shopTypeName").attr("value", ShopInfoDlg.shopTypeZtree.getSelectedVal());
    $("#typeId").attr("value", treeNode.id);
};
ShopInfoDlg.onDblClickShopType = function (e, treeId, treeNode) {
    $("#shopTypeName").attr("value", ShopInfoDlg.shopTypeZtree.getSelectedVal());
    $("#typeId").attr("value", treeNode.id);
    $("#shopTypeContent").fadeOut("fast");
};

$(function() {
    var shopTypeTree = new $ZTree("shopTypeTree", "/dict/shopTypeTree");
    shopTypeTree.bindOnClick(ShopInfoDlg.onClickShopType);
    shopTypeTree.bindOnDblClick(ShopInfoDlg.onDblClickShopType);
    shopTypeTree.init();
    ShopInfoDlg.shopTypeZtree = shopTypeTree;

    //初始化店铺状态
    $("#state").val(1);

    var initImageUp = new $WebUpload("logo");
    initImageUp.uploadPreId="";
    initImageUp.uploadBtnId="logoUploadBtn";
    initImageUp.uploadUrl=Feng.ctxPath + '/shop/upload';
    initImageUp.setUploadBarId("progressBar");
    initImageUp.init();
});
