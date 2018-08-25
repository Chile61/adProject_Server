/**
 * 初始化详情对话框
 */
var ParamInfoDlg = {
    paramInfoData : {}
};

/**
 * 清除数据
 */
ParamInfoDlg.clearData = function() {
    this.paramInfoData = {};
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
ParamInfoDlg.set = function(key, val) {
    this.paramInfoData[key] = (typeof val == "undefined") ? $("#" + key).val() : val;
    return this;
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
ParamInfoDlg.get = function(key) {
    return $("#" + key).val();
}

/**
 * 关闭此对话框
 */
ParamInfoDlg.close = function() {
    parent.layer.close(window.parent.Param.layerIndex);
}

/**
 * 收集数据
 */
ParamInfoDlg.collectData = function() {
    this
    .set('id')
    .set('firstcommission')
    .set('secondcommission')
    .set('dailyCloudConversionRate')
    .set('dailyConsumptionConversionRate')
    .set('formalityRate')
    ;
}

/**
 * 提交添加
 */
ParamInfoDlg.addSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/param/add", function(data){
        Feng.success("添加成功!");
        window.parent.Param.table.refresh();
        ParamInfoDlg.close();
    },function(data){
        Feng.error("添加失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.paramInfoData);
    ajax.start();
}

/**
 * 提交修改
 */
ParamInfoDlg.editSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/param/update", function(data){
        Feng.success("修改成功!");
        window.parent.Param.table.refresh();
        ParamInfoDlg.close();
    },function(data){
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.paramInfoData);
    ajax.start();
}

$(function() {

});
