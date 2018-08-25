@/*
    商品图片参数的说明:
    id : 商品的id
@*/
<div class="form-group">
    <label class="col-sm-2 control-label head-scu-label">${name}</label>
    <div class="col-sm-4">
        <div id="${id}PreId">
            <div><img width="60px" height="60px"
                @if(isEmpty(productImgs)){
                      src=""></div>
                      <div>请上传图片</div>
                @}else{
                      src="${ctxPath}/kaptcha/${productImgs[0].image}"></div>
                @}
            </div>
    </div>
    <div class="col-sm-1">
        <div class="head-scu-btn upload-btn" id="${id}BtnId">
            <i class="fa fa-upload"></i>&nbsp;上传
        </div>
    </div>
    <input type="hidden" id="${id}" value="${productImgs!}"/>
</div>
@if(isNotEmpty(underline) && underline == 'true'){
<div class="hr-line-dashed"></div>
@}
