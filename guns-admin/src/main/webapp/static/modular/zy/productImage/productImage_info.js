/**
 * 初始化productImage详情对话框
 */
var ProductImageInfoDlg = {
    productImageInfoData : {}
};

/**
 * 清除数据
 */
ProductImageInfoDlg.clearData = function() {
    this.productImageInfoData = {};
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
ProductImageInfoDlg.set = function(key, val) {
    this.productImageInfoData[key] = (typeof val == "undefined") ? $("#" + key).val() : val;
    return this;
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
ProductImageInfoDlg.get = function(key) {
    return $("#" + key).val();
}

/**
 * 关闭此对话框
 */
ProductImageInfoDlg.close = function() {
    parent.layer.close(window.parent.ProductImage.layerIndex);
}

/**
 * 收集数据
 */
ProductImageInfoDlg.collectData = function() {
    this
    .set('id')
    .set('description')
    .set('image')
    ;
}

/**
 * 提交添加
 */
ProductImageInfoDlg.addSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/productImage/add", function(data){
        Feng.success("添加成功!");
        window.parent.ProductImage.table.refresh();
        ProductImageInfoDlg.close();
    },function(data){
        Feng.error("添加失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.productImageInfoData);
    ajax.start();
}

/**
 * 提交修改
 */
ProductImageInfoDlg.editSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/productImage/update", function(data){
        Feng.success("修改成功!");
        window.parent.ProductImage.table.refresh();
        ProductImageInfoDlg.close();
    },function(data){
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.productImageInfoData);
    ajax.start();
}

$(function() {

});
