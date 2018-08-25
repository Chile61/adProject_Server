/**
 * 初始化详情对话框
 */
var WithdrawLogInfoDlg = {
    withdrawLogInfoData : {}
};

/**
 * 清除数据
 */
WithdrawLogInfoDlg.clearData = function() {
    this.withdrawLogInfoData = {};
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
WithdrawLogInfoDlg.set = function(key, val) {
    this.withdrawLogInfoData[key] = (typeof val == "undefined") ? $("#" + key).val() : val;
    return this;
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
WithdrawLogInfoDlg.get = function(key) {
    return $("#" + key).val();
}

/**
 * 关闭此对话框
 */
WithdrawLogInfoDlg.close = function() {
    parent.layer.close(window.parent.WithdrawLog.layerIndex);
}

/**
 * 收集数据
 */
WithdrawLogInfoDlg.collectData = function() {
    this
    .set('id')
    .set('operatorId')
    .set('userId')
    .set('points')
    .set('formalityRate')
    .set('dateTime')
    ;
}

/**
 * 提交添加
 */
WithdrawLogInfoDlg.addSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/withdrawLog/add", function(data){
        Feng.success("添加成功!");
        window.parent.WithdrawLog.table.refresh();
        WithdrawLogInfoDlg.close();
    },function(data){
        Feng.error("添加失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.withdrawLogInfoData);
    ajax.start();
}

/**
 * 提交修改
 */
WithdrawLogInfoDlg.editSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/withdrawLog/update", function(data){
        Feng.success("修改成功!");
        window.parent.WithdrawLog.table.refresh();
        WithdrawLogInfoDlg.close();
    },function(data){
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.withdrawLogInfoData);
    ajax.start();
}

$(function() {

});
