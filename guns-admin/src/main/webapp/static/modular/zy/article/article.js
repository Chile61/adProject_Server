/**
 * article管理初始化
 */
var Article = {
    id: "ArticleTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
Article.initColumn = function () {
    return [
        {field: 'selectItem', radio: true},
            {title: '主键id', field: 'id', visible: true, align: 'center', valign: 'middle'},
            {title: '文章类别', field: 'typeId', visible: true, align: 'center', valign: 'middle'},
            {title: '发布人', field: 'userId', visible: true, align: 'center', valign: 'middle'},
            {title: '标题', field: 'title', visible: true, align: 'center', valign: 'middle'},
            {title: '创建时间', field: 'createTime', visible: true, align: 'center', valign: 'middle'},
            {title: '开始时间', field: 'startTtime', visible: true, align: 'center', valign: 'middle'},
            {title: '截止时间', field: 'endTime', visible: true, align: 'center', valign: 'middle'},
            {title: '图片', field: 'image', visible: true, align: 'center', valign: 'middle'},
            {title: '内容', field: 'content', visible: true, align: 'center', valign: 'middle'},
            {title: '审核人', field: 'auditorId', visible: true, align: 'center', valign: 'middle'},
            {title: '审核时间', field: 'auditorTime', visible: true, align: 'center', valign: 'middle'},
            {title: '发布', field: 'publish', visible: true, align: 'center', valign: 'middle'},
            {title: '排序', field: 'sort', visible: true, align: 'center', valign: 'middle'}
    ];
};

/**
 * 检查是否选中
 */
Article.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        Article.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加article
 */
Article.openAddArticle = function () {
    var index = layer.open({
        type: 2,
        title: '添加article',
        area: ['800px', '420px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/article/article_add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看article详情
 */
Article.openArticleDetail = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: 'article详情',
            area: ['800px', '420px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/article/article_update/' + Article.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除article
 */
Article.delete = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/article/delete", function (data) {
            Feng.success("删除成功!");
            Article.table.refresh();
        }, function (data) {
            Feng.error("删除失败!" + data.responseJSON.message + "!");
        });
        ajax.set("articleId",this.seItem.id);
        ajax.start();
    }
};

/**
 * 查询article列表
 */
Article.search = function () {
    var queryData = {};
    queryData['condition'] = $("#condition").val();
    Article.table.refresh({query: queryData});
};

$(function () {
    var defaultColunms = Article.initColumn();
    var table = new BSTable(Article.id, "/article/list", defaultColunms);
    table.setPaginationType("client");
    Article.table = table.init();
});
