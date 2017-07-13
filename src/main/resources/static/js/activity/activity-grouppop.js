    function isFocus(e){
	    alert(UE.getEditor('editor').isFocus());
	    UE.dom.domUtils.preventDefault(e)
	}
	function setblur(e){
	    UE.getEditor('editor').blur();
	    UE.dom.domUtils.preventDefault(e)
	}
	function insertHtml() {
	    var value = prompt('插入html代码', '');
	    UE.getEditor('editor').execCommand('insertHtml', value)
	}
	function createEditor() {
	    enableBtn();
	    UE.getEditor('editor');
	}
	function getAllHtml() {
	    alert(UE.getEditor('editor').getAllHtml())
	}
	function getContent() {
	    var arr = [];
	    arr.push("使用editor.getContent()方法可以获得编辑器的内容");
	    arr.push("内容为：");
	    arr.push(UE.getEditor('editor').getContent());
	    alert(arr.join("\n"));
	}
	function getPlainTxt() {
	    var arr = [];
	    arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
	    arr.push("内容为：");
	    arr.push(UE.getEditor('editor').getPlainTxt());
	    alert(arr.join('\n'))
	}
	function setContent(isAppendTo) {
	    var arr = [];
	    arr.push("使用editor.setContent('欢迎使用ueditor')方法可以设置编辑器的内容");
	    UE.getEditor('editor').setContent('欢迎使用ueditor', isAppendTo);
	    alert(arr.join("\n"));
	}
	function setDisabled() {
	    UE.getEditor('editor').setDisabled('fullscreen');
	    disableBtn("enable");
	}
	
	function setEnabled() {
	    UE.getEditor('editor').setEnabled();
	    enableBtn();
	}
	
	function getText() {
	    //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
	    var range = UE.getEditor('editor').selection.getRange();
	    range.select();
	    var txt = UE.getEditor('editor').selection.getText();
	    alert(txt)
	}
	
	function getContentTxt() {
	    var arr = [];
	    arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
	    arr.push("编辑器的纯文本内容为：");
	    arr.push(UE.getEditor('editor').getContentTxt());
	    alert(arr.join("\n"));
	}
	function hasContent() {
	    var arr = [];
	    arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
	    arr.push("判断结果为：");
	    arr.push(UE.getEditor('editor').hasContents());
	    alert(arr.join("\n"));
	}
	function setFocus() {
	    UE.getEditor('editor').focus();
	}
	function deleteEditor() {
	    disableBtn();
	    UE.getEditor('editor').destroy();
	}
	function disableBtn(str) {
	    var div = document.getElementById('btns');
	    var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
	    for (var i = 0, btn; btn = btns[i++];) {
	        if (btn.id == str) {
	            UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
	        } else {
	            btn.setAttribute("disabled", "true");
	        }
	    }
	}
	function enableBtn() {
	    var div = document.getElementById('btns');
	    var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
	    for (var i = 0, btn; btn = btns[i++];) {
	        UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
	    }
	}
	
	function getLocalData () {
	    alert(UE.getEditor('editor').execCommand( "getlocaldata" ));
	}
	
	function clearLocalData () {
	    UE.getEditor('editor').execCommand( "clearlocaldata" );
	    alert("已清空草稿箱")
	}
	
	$(function(){
        //等编辑器成功加载后设置内容
       var content=[];
       //var content = $("#content1").val();
        //var content2 = $("#content2").val();
        //判断ueditor 编辑器是否创建成功
        for(var i=0;i<ue.length;i++){
           content[i] = $("#tcContent"+i).val();
           ue[i].addListener("ready", function () {
                for(var i=0;i<ue.length;i++){
			       ue[i].setContent(content[i]);
			    }
           });
        }
        $("input[name$='validate']").each(function(){
        	$(this).on('ifChecked', function(event){
             	$(this).attr("value","1");
             	$(this).val("1");  
             }).on('ifUnchecked', function(event){
            	$(this).attr("value","0");
              	$(this).val("0");
             });
        });
        $("input[name$='validate']").each(function(){
        	if($(this).attr("checked")!=undefined){
        		$(this).attr("value","1");
             	$(this).val("1");
        	}
        });
 	});
	
	function addVarInit1(p,obj,i) {
		ue[i].execCommand('inserthtml', p);
	}
    //UEditor配置结束
	
	/**
	 * 本地弹窗预览
	 */
	function channelBusinessPreview(){
		var channel = $.ligerDialog.open({
			url:"channelBussinessPreview",
			title:"本地弹窗预览",
			height: 500,
			width: 700,
			isResize: true,
			isDrag:true,
			buttons : [ {
				text : '关闭',
				onclick: function (item, dialog) { dialog.close(); } 
			}]
		});
	}
	
	//本地弹窗
	function checkGroupPopup(){
		if(!checkPopAll()){
			return;
		}
		channelnum = channelnum + 1;
		isEnd=1;
	}
	
	function checkPopEmpty(ptable){
		if(ptable.find("[check_epmty]").length>0){
			if(!cpe(ptable)){
				return false;
			}else{
				return true;
			}
		}
	}
	
	function cpe(ptable){
		var o1=0;
		var flag = false;
		ptable.find("[check_epmty]").each(function(){
			o1++;
			var checkName = $(this).attr("check_name");
			if(($(this).val()==""||$(this).val()=="")&&$(this).attr("ue")==undefined){
				$.ligerDialog.warn("请填写"+checkName);
				isEnd=0;
				flag=false;
				return false;
			}
			if(o1==ptable.find("[check_epmty]").length){
				flag=true;
				return true;
			}
	    });
		return flag;
	}
	
	function checkPopUE(ptable){
		if(ptable.find("[ue]").length>0){
			var ms=ptable.find("[ue]").attr("ue");
			var content = ue[ms].getContent();
			var checkMax = ptable.find("[ue]").attr("check_max").split(",");
			var checkName = ptable.find("[ue]").attr("check_name");
			if(content == null || content ==""){
				$.ligerDialog.warn("请填写"+checkName);
				isEnd=0;
				return false;
			}else if(content.length>parseInt(checkMax[1])){
				$.ligerDialog.warn(checkName+"的大小/长度不能超过"+checkMax[1]);
				isEnd=0;
				return false;						
			}else{
				return true;
			}
		}
	}
	
	function checkPopMax(ptable){
		if(ptable.find("[check_max]").length>0){
			if(!cpm(ptable)){
				return false;
			}else{
				return true;
			}
		}
	}
	
	function cpm(ptable){
		var o2=0;
		var flag = false;
		ptable.find("[check_max]").each(function(){
			o2++;
			var checkName = $(this).attr("check_name");
			if($(this).val().length>parseInt(checkMax[1])&&$(this).attr("ue")==undefined){
				$.ligerDialog.warn(checkName+"的大小/长度不能超过"+checkMax[1]);
				isEnd=0;
				flag = false;
				return false;
			}
			if($(this).val().length<parseInt(checkMax[0])&&$(this).attr("ue")==undefined){
				$.ligerDialog.warn(checkName+"的大小/长度不能小于"+checkMax[0]);
				isEnd=0;
				flag = false;
				return false;
			}
			if(o2==ptable.find("[check_max]").length){
				flag = true;
				return true;
			}
		});
		return flag;
	}
	
	function checkPopAll(){
		var p=0;
		var fla = true;
		$("[id^='isCheckedPop']").each(function(){
			if($(this).prop("checked")){
				var ptable=$(this).parent().parent().parent().parent();
				if(!checkPopUE(ptable)){
					fla = false;
					return false;
				}
				if(!checkPopEmpty(ptable)){
					fla = false;
					return false;
				}
				if(!checkPopMax(ptable)){
					fla = false;
					return false;
				}
			}else{
				p++;
			}
			if(p==$("[id^='isCheckedPop']").length){
				$.ligerDialog.warn("请勾选任意一个弹窗渠道生效");
				isEnd=0;
				fla = false;
				return false;
			}			
		});
		return fla;
	}