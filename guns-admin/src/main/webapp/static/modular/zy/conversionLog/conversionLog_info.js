/**
 * 初始化详情对话框
 */
var ConversionLogInfoDlg = {
    conversionLogInfoData : {}
};

/**
 * 清除数据
 */
ConversionLogInfoDlg.clearData = function() {
    this.conversionLogInfoData = {};
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
ConversionLogInfoDlg.set = function(key, val) {
    this.conversionLogInfoData[key] = (typeof val == "undefined") ? $("#" + key).val() : val;
    return this;
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
ConversionLogInfoDlg.get = function(key) {
    return $("#" + key).val();
}

/**
 * 关闭此对话框
 */
ConversionLogInfoDlg.close = function() {
    parent.layer.close(window.parent.ConversionLog.layerIndex);
}

/**
 * 收集数据
 */
ConversionLogInfoDlg.collectData = function() {
    this
    .set('id')
    .set('userId')
    .set('userName')
    .set('points')
    .set('cloudPoints')
    .set('onlyPayPoints')
    .set('dailyCloudConversionRate')
    .set('dailyCloudConverPoints')
    .set('dailyConsumptionConversionRate')
    .set('dailyConsumptionConverPoints')
    .set('newPoints')
    .set('newCloudPoints')
    .set('newOnlyPayPoints')
    .set('dailyRechargeSum')
    .set('dailyWithdrawSum')
    .set('formalityRate')
    .set('dailyConsumptionSum')
    .set('createTime')
    .set('succeed')
    ;
}

/**
 * 提交添加
 */
ConversionLogInfoDlg.addSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/conversionLog/add", function(data){
        Feng.success("添加成功!");
        window.parent.ConversionLog.table.refresh();
        ConversionLogInfoDlg.close();
    },function(data){
        Feng.error("添加失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.conversionLogInfoData);
    ajax.start();
}

/**
 * 提交修改
 */
ConversionLogInfoDlg.editSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/conversionLog/update", function(data){
        Feng.success("修改成功!");
        window.parent.ConversionLog.table.refresh();
        ConversionLogInfoDlg.close();
    },function(data){
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.conversionLogInfoData);
    ajax.start();
}

$(function() {

});
