/**
 * 初始化商品图片详情对话框
 */
var ProductImageDlg = {
    count: $("#itemSize").val(),
    productId:  $("#productId").val(),			//对应的商品ID
    mutiString: '',		                        //拼接字符串内容(拼接字典条目)
    itemTemplate: $("#itemTemplate").html(),
    imageUp:null
};

/**
 * item获取新的id
 */
ProductImageDlg.newId = function () {
    if(this.count == undefined){
        this.count = 0;
    }
    this.count = parseInt(this.count) + 1;
    return this.count;
};


/**
 * 关闭此对话框
 */
ProductImageDlg.close = function () {
    parent.layer.close(window.parent.Product.layerIndex);
};

/**
 * 添加条目
 */
ProductImageDlg.addItem = function () {
    $("#itemsArea").append(this.itemTemplate);
    var ss = this.newId();
    //console.log("ss:==========",ss);
    $("#imageItem").attr("id", "imageItem"+ss);
    $("#imageUploadBtn").attr("id", "imageUploadBtn"+ss);
    $("#itemImage").attr("id", "itemImage"+ss);

};

/**
 * 删除item
 */
ProductImageDlg.deleteItem = function (event) {
    var obj = Feng.eventParseObject(event);
    obj.parent().parent().remove();
};

/**
 * 清除为空的item Dom
 */
ProductImageDlg.clearNullDom = function(){
    $("[name='imageItem']").each(function(){
        var param = $(this).find("[name='itemDesc']").val();
        var desc = $(this).find("[name='itemImage']").val();
        if(param === '' || desc === ''){
            $(this).remove();
        }
    });
};

/**
 * 收集添加商品参数的数据
 */
ProductImageDlg.collectData = function () {
    this.clearNullDom();
    var mutiString = "";
    $("[name='imageItem']").each(function(){
        var desc = $(this).find("[name='itemDesc']").val();
        var image = $(this).find("[name='itemImage']").val();
        mutiString = mutiString + (desc + "," + image + ";");
    });
    this.mutiString = mutiString;
};


/**
 * 提交添加商品参数
 */
ProductImageDlg.addSubmit = function () {
    this.collectData();
    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/product/addImage", function (data) {
        Feng.success("添加成功!");
        //window.parent.Product.table.refresh();
        ProductImageDlg.close();
    }, function (data) {
        Feng.error("添加失败!" + data.responseJSON.message + "!");
    });
    ajax.set('productId',this.productId);
    ajax.set('imageValues',this.mutiString);
    ajax.start();
};

/**
 * 提交修改
 */
ProductImageDlg.editSubmit = function () {
    this.collectData();
    var ajax = new $ax(Feng.ctxPath + "/product/updateImage", function (data) {
        Feng.success("修改成功!");
        //window.parent.Product.table.refresh();
        ProductImageDlg.close();
    }, function (data) {
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set('productId',this.productId);
    ajax.set('imageValues',this.mutiString);
    ajax.start();
};

/**
 * 提交修改
 */
ProductImageDlg.uploadImage = function (event) {
    //ProductImageDlg.imageUp.pictureId=event.srcElement.id;
    // ProductImageDlg.imageUp.init();
    //console.log("event:",event);
    // setTimeout(function(){
    //     document.getElementById("productImageTempBtn").click();
    //     },500
    // );
    var stmp =event.srcElement.id;
    var sub ="imageUploadBtn";
    var index = stmp.substring(sub.length,stmp.length);
    var strTmp = "[name='imageItem"+index+"']";

    // console.log("index=========:",index,sub.length,stmp.length);
    $(strTmp).each(function(){
        var desc = $(this).find("[name='itemDesc']").val();
        //var image1 = $(this).find("[name='itemImage']").val();
        var image1 = $(this).find("[name='itemImage']");
        //console.log("image=========:",image1)
    });
    ProductImageDlg.imageUp.pictureId="itemImage"+index;

    //console.log("上传？",ProductImageDlg.imageUp);
    $('.webuploader-element-invisible').trigger('click');
    //console.log("完成？");
};


$(function () {
    // 初始图片上传
    var initImageUp = new $WebUpload("productImageTemp");
    initImageUp.uploadPreId="";
    initImageUp.uploadBtnId="productImageTempBtn";
    initImageUp.uploadUrl=Feng.ctxPath + '/product/upload';
    initImageUp.setUploadBarId("progressBar");
    initImageUp.init();
    ProductImageDlg.imageUp=initImageUp;
    $('.webuploader-element-invisible').trigger('click');
});
