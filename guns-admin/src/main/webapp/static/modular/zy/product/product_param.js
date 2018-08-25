/**
 * 初始化商品参数详情对话框
 */
var ProductParamDlg = {
    count: $("#itemSize").val(),
    productId:  $("#productId").val(),			//对应的商品ID
    mutiString: '',		                        //拼接字符串内容(拼接字典条目)
    itemTemplate: $("#itemTemplate").html()
};

/**
 * item获取新的id
 */
ProductParamDlg.newId = function () {
    if(this.count == undefined){
        this.count = 0;
    }
    this.count = this.count + 1;
    return "paramItem" + this.count;
};

/**
 * 关闭此对话框
 */
ProductParamDlg.close = function () {
    parent.layer.close(window.parent.Product.layerIndex);
};

/**
 * 添加条目
 */
ProductParamDlg.addItem = function () {
    $("#itemsArea").append(this.itemTemplate);
    $("#paramItem").attr("id", this.newId());
};

/**
 * 删除item
 */
ProductParamDlg.deleteItem = function (event) {
    var obj = Feng.eventParseObject(event);
    obj.parent().parent().remove();
};

/**
 * 清除为空的item Dom
 */
ProductParamDlg.clearNullDom = function(){
    $("[name='paramItem']").each(function(){
        var param = $(this).find("[name='itemParam']").val();
        var desc = $(this).find("[name='itemDesc']").val();
        if(param === '' || desc === ''){
            $(this).remove();
        }
    });
};

/**
 * 收集添加商品参数的数据
 */
ProductParamDlg.collectData = function () {
    this.clearNullDom();
    var mutiString = "";
    $("[name='paramItem']").each(function(){
        var param = $(this).find("[name='itemParam']").val();
        var desc = $(this).find("[name='itemDesc']").val();
        mutiString = mutiString + (param + ":" + desc + ";");
    });
    this.mutiString = mutiString;
};


/**
 * 提交添加商品参数
 */
ProductParamDlg.addSubmit = function () {
    this.collectData();
    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/product/addParam", function (data) {
        Feng.success("添加成功!");
        //window.parent.Product.table.refresh();
        ProductParamDlg.close();
    }, function (data) {
        Feng.error("添加失败!" + data.responseJSON.message + "!");
    });
    ajax.set('productId',this.productId);
    ajax.set('paramValues',this.mutiString);
    ajax.start();
};

/**
 * 提交修改
 */
ProductParamDlg.editSubmit = function () {
    this.collectData();
    var ajax = new $ax(Feng.ctxPath + "/product/updateParam", function (data) {
        Feng.success("修改成功!");
        //window.parent.Product.table.refresh();
        ProductParamDlg.close();
    }, function (data) {
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set('productId',this.productId);
    ajax.set('paramValues',this.mutiString);
    ajax.start();
};
