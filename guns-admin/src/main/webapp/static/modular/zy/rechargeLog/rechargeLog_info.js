/**
 * 初始化详情对话框
 */
var RechargeLogInfoDlg = {
    rechargeLogInfoData : {}
};

/**
 * 清除数据
 */
RechargeLogInfoDlg.clearData = function() {
    this.rechargeLogInfoData = {};
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
RechargeLogInfoDlg.set = function(key, val) {
    this.rechargeLogInfoData[key] = (typeof val == "undefined") ? $("#" + key).val() : val;
    return this;
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
RechargeLogInfoDlg.get = function(key) {
    return $("#" + key).val();
}

/**
 * 关闭此对话框
 */
RechargeLogInfoDlg.close = function() {
    parent.layer.close(window.parent.RechargeLog.layerIndex);
}

/**
 * 收集数据
 */
RechargeLogInfoDlg.collectData = function() {
    this
    .set('id')
    .set('operatorId')
    .set('userId')
    .set('type')
    .set('points')
    ;
}

/**
 * 提交添加
 */
RechargeLogInfoDlg.addSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/rechargeLog/add", function(data){
        Feng.success("添加成功!");
        window.parent.RechargeLog.table.refresh();
        RechargeLogInfoDlg.close();
    },function(data){
        Feng.error("添加失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.rechargeLogInfoData);
    ajax.start();
}

/**
 * 提交修改
 */
RechargeLogInfoDlg.editSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/rechargeLog/update", function(data){
        Feng.success("修改成功!");
        window.parent.RechargeLog.table.refresh();
        RechargeLogInfoDlg.close();
    },function(data){
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.rechargeLogInfoData);
    ajax.start();
}

$(function() {

});
