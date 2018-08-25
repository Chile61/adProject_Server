/**
 * 初始化jobconfig详情对话框
 */
var QuartzjobConfigInfoDlg = {
    quartzjobConfigInfoData : {}
};

/**
 * 清除数据
 */
QuartzjobConfigInfoDlg.clearData = function() {
    this.quartzjobConfigInfoData = {};
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
QuartzjobConfigInfoDlg.set = function(key, val) {
    this.quartzjobConfigInfoData[key] = (typeof val == "undefined") ? $("#" + key).val() : val;
    return this;
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
QuartzjobConfigInfoDlg.get = function(key) {
    return $("#" + key).val();
}

/**
 * 关闭此对话框
 */
QuartzjobConfigInfoDlg.close = function() {
    parent.layer.close(window.parent.QuartzjobConfig.layerIndex);
}

/**
 * 收集数据
 */
QuartzjobConfigInfoDlg.collectData = function() {
    this
    .set('id')
    .set('createAt')
    .set('cronExpression')
    .set('jobDesc')
    .set('groupName')
    .set('jobName')
    .set('jobStatus')
    .set('updateAt')
    ;
}

/**
 * 提交添加
 */
QuartzjobConfigInfoDlg.addSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/quartzjobConfig/add", function(data){
        Feng.success("添加成功!");
        window.parent.QuartzjobConfig.table.refresh();
        QuartzjobConfigInfoDlg.close();
    },function(data){
        Feng.error("添加失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.quartzjobConfigInfoData);
    ajax.start();
}

/**
 * 提交修改
 */
QuartzjobConfigInfoDlg.editSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/quartzjobConfig/update", function(data){
        Feng.success("修改成功!");
        window.parent.QuartzjobConfig.table.refresh();
        QuartzjobConfigInfoDlg.close();
    },function(data){
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.quartzjobConfigInfoData);
    ajax.start();
}

$(function() {

});
