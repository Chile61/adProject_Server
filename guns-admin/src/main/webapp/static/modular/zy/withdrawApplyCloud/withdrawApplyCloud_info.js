/**
 * 初始化申请提现云积分详情对话框
 */
var WithdrawApplyCloudInfoDlg = {
    withdrawApplyCloudInfoData : {}
};

/**
 * 清除数据
 */
WithdrawApplyCloudInfoDlg.clearData = function() {
    this.withdrawApplyCloudInfoData = {};
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
WithdrawApplyCloudInfoDlg.set = function(key, val) {
    this.withdrawApplyCloudInfoData[key] = (typeof val == "undefined") ? $("#" + key).val() : val;
    return this;
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
WithdrawApplyCloudInfoDlg.get = function(key) {
    return $("#" + key).val();
}

/**
 * 关闭此对话框
 */
WithdrawApplyCloudInfoDlg.close = function() {
    parent.layer.close(window.parent.WithdrawApplyCloud.layerIndex);
}

/**
 * 收集数据
 */
WithdrawApplyCloudInfoDlg.collectData = function() {
    this
    .set('id')
    .set('userId')
    .set('points')
    .set('state')
    ;
}

/**
 * 提交添加
 */
WithdrawApplyCloudInfoDlg.addSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/withdrawApplyCloud/add", function(data){
        Feng.success("添加成功!");
        window.parent.WithdrawApplyCloud.table.refresh();
        WithdrawApplyCloudInfoDlg.close();
    },function(data){
        Feng.error("添加失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.withdrawApplyCloudInfoData);
    ajax.start();
}

/**
 * 提交修改
 */
WithdrawApplyCloudInfoDlg.editSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/withdrawApplyCloud/update", function(data){
        Feng.success("修改成功!");
        window.parent.WithdrawApplyCloud.table.refresh();
        WithdrawApplyCloudInfoDlg.close();
    },function(data){
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.withdrawApplyCloudInfoData);
    ajax.start();
}

$(function() {

});
