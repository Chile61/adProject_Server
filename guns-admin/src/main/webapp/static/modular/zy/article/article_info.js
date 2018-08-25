/**
 * 初始化article详情对话框
 */
var ArticleInfoDlg = {
    articleInfoData : {}
};

/**
 * 清除数据
 */
ArticleInfoDlg.clearData = function() {
    this.articleInfoData = {};
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
ArticleInfoDlg.set = function(key, val) {
    this.articleInfoData[key] = (typeof val == "undefined") ? $("#" + key).val() : val;
    return this;
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
ArticleInfoDlg.get = function(key) {
    return $("#" + key).val();
}

/**
 * 关闭此对话框
 */
ArticleInfoDlg.close = function() {
    parent.layer.close(window.parent.Article.layerIndex);
}

/**
 * 收集数据
 */
ArticleInfoDlg.collectData = function() {
    this
    .set('id')
    .set('typeId')
    .set('userId')
    .set('title')
    .set('createTime')
    .set('startTtime')
    .set('endTime')
    .set('image')
    .set('content')
    .set('auditorId')
    .set('auditorTime')
    .set('publish')
    ;
}

/**
 * 提交添加
 */
ArticleInfoDlg.addSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/article/add", function(data){
        Feng.success("添加成功!");
        window.parent.Article.table.refresh();
        ArticleInfoDlg.close();
    },function(data){
        Feng.error("添加失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.articleInfoData);
    ajax.start();
}

/**
 * 提交修改
 */
ArticleInfoDlg.editSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/article/update", function(data){
        Feng.success("修改成功!");
        window.parent.Article.table.refresh();
        ArticleInfoDlg.close();
    },function(data){
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.articleInfoData);
    ajax.start();
}

$(function() {

});
