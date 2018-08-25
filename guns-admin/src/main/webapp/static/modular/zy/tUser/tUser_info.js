/**
 * 初始化zyAdminUsers详情对话框
 */
var TUserInfoDlg = {
    tUserInfoData : {}
};

/**
 * 清除数据
 */
TUserInfoDlg.clearData = function() {
    this.tUserInfoData = {};
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
TUserInfoDlg.set = function(key, val) {
    this.tUserInfoData[key] = (typeof val == "undefined") ? $("#" + key).val() : val;
    return this;
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
TUserInfoDlg.get = function(key) {
    return $("#" + key).val();
}

/**
 * 关闭此对话框
 */
TUserInfoDlg.close = function() {
    parent.layer.close(window.parent.TUser.layerIndex);
}

/**
 * 收集数据
 */
TUserInfoDlg.collectData = function() {
    this
    .set('id')
    .set('avatar')
    .set('account')
    .set('password')
    .set('salt')
    .set('name')
    .set('birthday')
    .set('sex')
    .set('email')
    .set('phone')
    .set('roleid')
    .set('superior')
    .set('superiors')
    .set('status')
    .set('createtime')
    .set('version')
    .set('level')
    .set('weiXin')
    .set('stockPoints')
    .set('cloudPoints')
    .set('onlyPayPoints')
    .set('cash')
    .set('verification')
    .set('managerApply')
    ;
}

/**
 * 提交添加
 */
TUserInfoDlg.addSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/tUser/add", function(data){
        Feng.success("添加成功!");
        window.parent.TUser.table.refresh();
        TUserInfoDlg.close();
    },function(data){
        Feng.error("添加失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.tUserInfoData);
    ajax.start();
}

/**
 * 提交修改
 */
TUserInfoDlg.editSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/tUser/update", function(data){
        Feng.success("修改成功!");
        window.parent.TUser.table.refresh();
        TUserInfoDlg.close();
    },function(data){
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.tUserInfoData);
    ajax.start();
}

/**
 * 收集填入的积分
 */
TUserInfoDlg.collectDepositData = function() {
    this
        .set("depositPoints");
}
/**
 * 积分充值
 */
TUserInfoDlg.deposit = function () {

    this.clearData();
    this.collectDepositData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/tUser/deposit", function(data){
        Feng.success(data);
        window.parent.TUser.table.refresh();
        TUserInfoDlg.close();
    },function(data){
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.tUserInfoData);
    ajax.start();
}

/**
 * 收集填入的现金
 */
TUserInfoDlg.collectDepositCashData = function() {
    this
        .set("depositCash");
}
/**
 * 现金账户充值
 */
TUserInfoDlg.cash = function () {

    this.clearData();
    this.collectDepositCashData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/tUser/deposit_cash", function(data){
        Feng.success(data);
        window.parent.TUser.table.refresh();
        TUserInfoDlg.close();
    },function(data){
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.tUserInfoData);
    ajax.start();
}

/**
 * 收集提现云积分
 */
TUserInfoDlg.collectWithdrawData = function() {
    this
        .set("withdrawCloudPoints");
}
/**
 * 云积分提现
 */
TUserInfoDlg.withdraw = function () {

    this.clearData();
    this.collectWithdrawData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/tUser/withdraw", function(data){
        Feng.success(data);
        window.parent.TUser.table.refresh();
        TUserInfoDlg.close();
    },function(data){
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.tUserInfoData);
    ajax.start();
}
$(function() {
    //初始化性别
    if($("#sexValue").val() == undefined){
        $("#sex").val(0);
    }else{
        $("#sex").val($("#sexValue").val());
    }
    //初始化状态
    if($("#statusValue").val() == undefined){
        $("#status").val(0);
    }else{
        $("#status").val($("#statusValue").val());
    }
    //初始化用户类型
    if($("#roleidValue").val() == undefined){
        $("#roleid").val(0);
    }else{
        $("#roleid").val($("#roleidValue").val());
    }
    //初始化用户级别
    if($("#levelValue").val() == undefined){
        $("#level").val(0);
    }else{
        $("#level").val($("#levelValue").val());
    }
    //初始化用户级别
    if($("#verificationValue").val() == undefined){
        $("#verification").val(0);
    }else{
        $("#verification").val($("#verificationValue").val());
    }
    //初始化充值管理员
    if($("#managerApplyValue").val() == undefined){
        $("#managerApply").val(0);
    }else{
        $("#managerApply").val($("#managerApplyValue").val());
    }
});
