/**
 * zyAdminUsers管理初始化
 */
var TUser = {
    id: "TUserTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
TUser.initColumn = function () {
    return [
        {field: 'selectItem', radio: true},
            // {title: '主键id', field: 'id', visible: false, align: 'center', valign: 'middle'},
            // {title: '头像', field: 'avatar', visible: false, align: 'center', valign: 'middle'},
            {title: '验证状态', field: 'verificationName', visible: true, align: 'center', valign: 'middle'},
            {title: '账号', field: 'account', visible: true, align: 'center', valign: 'middle'},
            // {title: '密码', field: 'password', visible: false, align: 'center', valign: 'middle'},
            // {title: 'md5密码盐', field: 'salt', visible: false, align: 'center', valign: 'middle'},
            {title: '名字', field: 'name', visible: true, align: 'center', valign: 'middle'},
            // {title: '角色id', field: 'roleid', visible: false, align: 'center', valign: 'middle'},
            {title: '用户类型', field: 'typeName', visible: true, align: 'center', valign: 'middle'},
            {title: '用户级别', field: 'levelName', visible: true, align: 'center', valign: 'middle'},
            {title: '微信号', field: 'weiXin', visible: true, align: 'center', valign: 'middle'},
            {title: '现金账户', field: 'cash', visible: true, align: 'center', valign: 'middle'},
            {title: '积分', field: 'points', visible: true, align: 'center', valign: 'middle'},
            {title: '云积分', field: 'cloudPoints', visible: true, align: 'center', valign: 'middle'},
            {title: '消费积分', field: 'onlyPayPoints', visible: true, align: 'center', valign: 'middle'},
            {title: '上级', field: 'superior', visible: true, align: 'center', valign: 'middle'},
            {title: '所有上级', field: 'superiors', visible: true, align: 'center', valign: 'middle'},
            {title: '二维码', field: 'QRcode', visible: true, align: 'center', valign: 'middle'},
            {title: '状态', field: 'statusName', visible: true, align: 'center', valign: 'middle'},
            // {title: '状态(1：启用  2：冻结  3：删除）', field: 'status', visible: false, align: 'center', valign: 'middle'},
            {title: '生日', field: 'birthday', visible: true, align: 'center', valign: 'middle'},
            // {title: '性别（1：男 2：女）', field: 'sex', visible: false, align: 'center', valign: 'middle'},
            {title: '性别', field: 'sexName', visible: true, align: 'center', valign: 'middle'},
            {title: '电子邮件', field: 'email', visible: true, align: 'center', valign: 'middle'},
            {title: '电话', field: 'phone', visible: true, align: 'center', valign: 'middle'},
            // {title: '用户等级', field: 'level', visible: true, align: 'center', valign: 'middle'},
            {title: '创建时间', field: 'createtime', visible: false, align: 'center', valign: 'middle'},
            {title: '充值管理员', field: 'managerApplyShow', visible: true, align: 'center', valign: 'middle'}
    ];
};

/**
 * 检查是否选中
 */
TUser.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        TUser.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加zyAdminUsers
 */
TUser.openAddTUser = function () {
    var index = layer.open({
        type: 2,
        title: '添加中盈创世用户',
        area: ['800px', '420px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/tUser/tUser_add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看zyAdminUsers详情
 */
TUser.openTUserDetail = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: '中盈创世用户详情',
            area: ['800px', '520px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/tUser/tUser_update/' + TUser.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 打开充值积分页面
 */
TUser.openDeposit = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: '中盈创世用户充值积分',
            area: ['800px', '420px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/tUser/tUser_deposit/' + TUser.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 打开充值现金账户页面
 */
TUser.openDepositCash = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: '中盈创世用户充值现金账户',
            area: ['800px', '420px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/tUser/tUser_deposit_cash/' + TUser.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 打开提现页面
 */
TUser.openWithdraw = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: '中盈创世用户提现',
            area: ['800px', '420px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/tUser/tUser_withdraw/' + TUser.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 打开粉丝页面
 */
TUser.readSupbordinates = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: '粉丝情况',
            area: ['800px', '420px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/tUser/supbordinates/' + TUser.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除zyAdminUsers
 */
TUser.delete = function () {
    if (this.check()) {

        var operation = function(){
            var ajax = new $ax(Feng.ctxPath + "/tUser/delete", function (data) {
                Feng.success("删除成功!");
                TUser.table.refresh();
            }, function (data) {
                Feng.error("删除失败!" + data.responseJSON.message + "!");
            });
            ajax.set("tUserId",TUser.seItem.id);
            ajax.start();
        };

        Feng.confirm("是否刪除用户 " + TUser.seItem.name + "?", operation);
    }
};

/**
 * 查询zyAdminUsers列表
 */
TUser.search = function () {
    var queryData = {};
    queryData['condition'] = $("#condition").val();
    TUser.table.refresh({query: queryData});
};

$(function () {
    var defaultColunms = TUser.initColumn();
    var table = new BSTable(TUser.id, "/tUser/list", defaultColunms);
    table.setPaginationType("client");
    TUser.table = table.init();
});

function del() {
    var msg = "确认删除该用户？\n\n请确认！";
    if (confirm(msg)==true){
        return true;
    }else{
        return false;
    }
}