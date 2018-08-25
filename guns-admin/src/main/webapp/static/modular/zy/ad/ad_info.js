/**
 * 初始化ad详情对话框
 */
var AdInfoDlg = {
    adInfoData : {}
};

/**
 * 清除数据
 */
AdInfoDlg.clearData = function() {
    this.adInfoData = {};
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
AdInfoDlg.set = function(key, val) {
    this.adInfoData[key] = (typeof val == "undefined") ? $("#" + key).val() : val;
    return this;
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
AdInfoDlg.get = function(key) {
    return $("#" + key).val();
}

/**
 * 关闭此对话框
 */
AdInfoDlg.close = function() {
    parent.layer.close(window.parent.Ad.layerIndex);
}

/**
 * 收集数据
 */
AdInfoDlg.collectData = function() {
    this
    .set('id')
    .set('title')
    .set('typeId')
    .set('positionId')
    .set('userId')
    .set('shopId')
    .set('brandId')
    .set('productId')
    .set('articleId')
    .set('startTime')
    .set('endTime')
    .set('image')
    .set('lowPrice')
    .set('highPrice')
    .set('sortNum')
    ;
}

/**
 * 提交添加
 */
AdInfoDlg.addSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/ad/add", function(data){
        Feng.success("添加成功!");
        window.parent.Ad.table.refresh();
        AdInfoDlg.close();
    },function(data){
        Feng.error("添加失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.adInfoData);
    ajax.start();
}

/**
 * 提交修改
 */
AdInfoDlg.editSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/ad/update", function(data){
        Feng.success("修改成功!");
        window.parent.Ad.table.refresh();
        AdInfoDlg.close();
    },function(data){
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.adInfoData);
    ajax.start();
}

$(function() {

});
