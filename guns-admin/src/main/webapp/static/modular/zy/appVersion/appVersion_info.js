/**
 * 初始化应用版本更新详情对话框
 */
var AppVersionInfoDlg = {
    appVersionInfoData : {}
};

/**
 * 清除数据
 */
AppVersionInfoDlg.clearData = function() {
    this.appVersionInfoData = {};
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
AppVersionInfoDlg.set = function(key, val) {
    this.appVersionInfoData[key] = (typeof val == "undefined") ? $("#" + key).val() : val;
    return this;
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
AppVersionInfoDlg.get = function(key) {
    return $("#" + key).val();
}

/**
 * 关闭此对话框
 */
AppVersionInfoDlg.close = function() {
    parent.layer.close(window.parent.AppVersion.layerIndex);
}

/**
 * 收集数据
 */
AppVersionInfoDlg.collectData = function() {
    this
    .set('id')
    .set('version')
    .set('description').set('url')
    ;
}

/**
 * 提交添加
 */
AppVersionInfoDlg.addSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/appVersion/add", function(data){
        Feng.success("添加成功!");
        window.parent.AppVersion.table.refresh();
        AppVersionInfoDlg.close();
    },function(data){
        Feng.error("添加失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.appVersionInfoData);
    ajax.start();
}

/**
 * 提交修改
 */
AppVersionInfoDlg.editSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/appVersion/update", function(data){
        Feng.success("修改成功!");
        window.parent.AppVersion.table.refresh();
        AppVersionInfoDlg.close();
    },function(data){
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.appVersionInfoData);
    ajax.start();
}

$(function() {
    var initImageUp = new $WebUpload("url");
    initImageUp.uploadPreId="";
    initImageUp.mimeTypes="*/*";
    //initImageUp.fileSizeLimit=10000000000;
    initImageUp.extensions="apk";
    initImageUp.uploadBtnId="logoUploadBtn";
    initImageUp.uploadUrl=Feng.ctxPath + '/appVersion/uploadApk';
    initImageUp.setUploadBarId("progressBar");
    initImageUp.init();
});
