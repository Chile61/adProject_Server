/**
 * 初始化brand详情对话框
 */
var BrandInfoDlg = {
    brandInfoData : {}
};

/**
 * 清除数据
 */
BrandInfoDlg.clearData = function() {
    this.brandInfoData = {};
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
BrandInfoDlg.set = function(key, val) {
    this.brandInfoData[key] = (typeof val == "undefined") ? $("#" + key).val() : val;
    return this;
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
BrandInfoDlg.get = function(key) {
    return $("#" + key).val();
}

/**
 * 关闭此对话框
 */
BrandInfoDlg.close = function() {
    parent.layer.close(window.parent.Brand.layerIndex);
}

/**
 * 收集数据
 */
BrandInfoDlg.collectData = function() {
    this
    .set('id')
    .set('brand')
    .set('description')
    ;
}

/**
 * 提交添加
 */
BrandInfoDlg.addSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/brand/add", function(data){
        Feng.success("添加成功!");
        window.parent.Brand.table.refresh();
        BrandInfoDlg.close();
    },function(data){
        Feng.error("添加失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.brandInfoData);
    ajax.start();
}

/**
 * 提交修改
 */
BrandInfoDlg.editSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/brand/update", function(data){
        Feng.success("修改成功!");
        window.parent.Brand.table.refresh();
        BrandInfoDlg.close();
    },function(data){
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.brandInfoData);
    ajax.start();
}

$(function() {

});
