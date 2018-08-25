/**
 * 初始化申请冲值现金账户详情对话框
 */
var RechargeApplyCashInfoDlg = {
    rechargeApplyCashInfoData : {}
};

/**
 * 清除数据
 */
RechargeApplyCashInfoDlg.clearData = function() {
    this.rechargeApplyCashInfoData = {};
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
RechargeApplyCashInfoDlg.set = function(key, val) {
    this.rechargeApplyCashInfoData[key] = (typeof val == "undefined") ? $("#" + key).val() : val;
    return this;
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
RechargeApplyCashInfoDlg.get = function(key) {
    return $("#" + key).val();
}

/**
 * 关闭此对话框
 */
RechargeApplyCashInfoDlg.close = function() {
    parent.layer.close(window.parent.RechargeApplyCash.layerIndex);
}

/**
 * 收集数据
 */
RechargeApplyCashInfoDlg.collectData = function() {
    this
    .set('id')
    .set('userId')
    .set('cash')
    .set('state')
    ;
}

/**
 * 提交添加
 */
RechargeApplyCashInfoDlg.addSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/rechargeApplyCash/add", function(data){
        Feng.success("添加成功!");
        window.parent.RechargeApplyCash.table.refresh();
        RechargeApplyCashInfoDlg.close();
    },function(data){
        Feng.error("添加失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.rechargeApplyCashInfoData);
    ajax.start();
}

/**
 * 提交修改
 */
RechargeApplyCashInfoDlg.editSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/rechargeApplyCash/update", function(data){
        Feng.success("修改成功!");
        window.parent.RechargeApplyCash.table.refresh();
        RechargeApplyCashInfoDlg.close();
    },function(data){
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.rechargeApplyCashInfoData);
    ajax.start();
}

$(function() {

});
