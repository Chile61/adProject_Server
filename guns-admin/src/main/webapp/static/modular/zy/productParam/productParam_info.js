/**
 * 初始化productParam详情对话框
 */
var ProductParamInfoDlg = {
    productParamInfoData : {}
};

/**
 * 清除数据
 */
ProductParamInfoDlg.clearData = function() {
    this.productParamInfoData = {};
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
ProductParamInfoDlg.set = function(key, val) {
    this.productParamInfoData[key] = (typeof val == "undefined") ? $("#" + key).val() : val;
    return this;
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
ProductParamInfoDlg.get = function(key) {
    return $("#" + key).val();
}

/**
 * 关闭此对话框
 */
ProductParamInfoDlg.close = function() {
    parent.layer.close(window.parent.ProductParam.layerIndex);
}

/**
 * 收集数据
 */
ProductParamInfoDlg.collectData = function() {
    this
    .set('id')
    .set('param')
    .set('description')
    ;
}

/**
 * 提交添加
 */
ProductParamInfoDlg.addSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/productParam/add", function(data){
        Feng.success("添加成功!");
        window.parent.ProductParam.table.refresh();
        ProductParamInfoDlg.close();
    },function(data){
        Feng.error("添加失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.productParamInfoData);
    ajax.start();
}

/**
 * 提交修改
 */
ProductParamInfoDlg.editSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/productParam/update", function(data){
        Feng.success("修改成功!");
        window.parent.ProductParam.table.refresh();
        ProductParamInfoDlg.close();
    },function(data){
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.productParamInfoData);
    ajax.start();
}

$(function() {

});
