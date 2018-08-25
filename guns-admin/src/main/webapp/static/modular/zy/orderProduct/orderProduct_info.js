/**
 * 初始化订单商品列表详情对话框
 */
var OrderProductInfoDlg = {
    orderProductInfoData : {}
};

/**
 * 清除数据
 */
OrderProductInfoDlg.clearData = function() {
    this.orderProductInfoData = {};
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
OrderProductInfoDlg.set = function(key, val) {
    this.orderProductInfoData[key] = (typeof val == "undefined") ? $("#" + key).val() : val;
    return this;
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
OrderProductInfoDlg.get = function(key) {
    return $("#" + key).val();
}

/**
 * 关闭此对话框
 */
OrderProductInfoDlg.close = function() {
    parent.layer.close(window.parent.OrderProduct.layerIndex);
}

/**
 * 收集数据
 */
OrderProductInfoDlg.collectData = function() {
    this
    .set('id')
    .set('orderId')
    .set('productId')
    .set('num')
    .set('price')
    ;
}

/**
 * 提交添加
 */
OrderProductInfoDlg.addSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/orderProduct/add", function(data){
        Feng.success("添加成功!");
        window.parent.OrderProduct.table.refresh();
        OrderProductInfoDlg.close();
    },function(data){
        Feng.error("添加失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.orderProductInfoData);
    ajax.start();
}

/**
 * 提交修改
 */
OrderProductInfoDlg.editSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/orderProduct/update", function(data){
        Feng.success("修改成功!");
        window.parent.OrderProduct.table.refresh();
        OrderProductInfoDlg.close();
    },function(data){
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.orderProductInfoData);
    ajax.start();
}

$(function() {

});
