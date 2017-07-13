$(function(){
	/**
	 * 初始化方法中禁用select框
	 */
	if($('input[name="classLevel"]').val()==1){
		$('#tableCityPop select').attr("disabled","disabled");  
	}
	if($('input[name="classLevel"]').val()==2){
		$('#tablePop select').attr("disabled","disabled");
		$('input[name="popConfigInfo.cityThemeNum"]').attr("disabled","disabled");
	}
})

var provincenum;
function numvalue(){
	/**
	 * 获取省份主题数量初始值
	 */
	if($('input[name="popConfigInfo.provinceThemeNum"]').val()>=1 && $('input[name="popConfigInfo.provinceThemeNum"]').val()<=9){
		provincenum = $('input[name="popConfigInfo.provinceThemeNum"]').val();	
	}
}

function clonepop(){
	/**
	 * 复制省份tr元素
	 */
	var numnow = $('input[name="popConfigInfo.provinceThemeNum"]').val();
	if(numnow > 9 || numnow <1){
		$.ligerDialog.warn("展示主题数量必须大于1小于9");
		return;
	}
	var i = parseInt(numnow)-parseInt(provincenum); 
	if(i > 0){
		for(var j=1;j<=i;j++){
			var tr = $("#tablePop tr").eq(1).clone(true);
			tr.appendTo("#tablePop");
			$("#tablePop tr").eq(j+parseInt(provincenum)).find("td .em1").eq(0).html(j+parseInt(provincenum));
			$("#tablePop tr").eq(j+parseInt(provincenum)).find("td").eq(1).find('select').attr('name','popList['+(j+parseInt(provincenum)-1)+'].themeCode')
		}
		//$("#tableCityPop tr").eq(0).find("td").eq(0).html(parseInt(numnow)+1);
		//console.log($("#tableCityPop tr"));
		var citypoptr = $("#tableCityPop tr");
		for(var k=1;k<=citypoptr.length;k++){
			$("#tableCityPop tr").eq(k-1).find("td .em2").eq(0).html(parseInt(numnow)+k);
		}
	}else if(i < 0){
		for(var k=parseInt(provincenum);k>parseInt(numnow);k--){
			$("#tablePop tr").eq(k).remove();
		}
		var citypoptr = $("#tableCityPop tr");
		for(var k=1;k<=citypoptr.length;k++){
			$("#tableCityPop tr").eq(k-1).find("td .em2").eq(0).html(parseInt(numnow)+k);
		}
	}
	
}
var citynum;
function numcityvalue(){
	/**
	 * 获取地市主题数量改变前的值
	 */
	if($('input[name="popConfigInfo.cityThemeNum"]').val()>=1 && $('input[name="popConfigInfo.cityThemeNum"]').val() <= 9){
		citynum = $('input[name="popConfigInfo.cityThemeNum"]').val();	
	}
	//console.log(citynum);
}
function clonecitypop(){
	/**
	 * 复制地市tr元素
	 */
	var citynumnow = $('input[name="popConfigInfo.cityThemeNum"]').val();
	if(citynumnow > 9 || citynumnow <1){
		$.ligerDialog.warn("展示主题数量必须大于1小于9");
		return;
	}
	var pronum = $('input[name="popConfigInfo.provinceThemeNum"]').val();
	var i = parseInt(citynumnow)-parseInt(citynum); 
	if(i > 0){
		for(var j=1;j<=i;j++){
			var tr = $("#tableCityPop tr").eq(0).clone(true);
			tr.appendTo("#tableCityPop");
			$("#tableCityPop tr").eq(j+parseInt(citynum)-1).find("td .em2").eq(0).html(j+parseInt(citynum)+parseInt(pronum));
			$("#tableCityPop tr").eq(j+parseInt(citynum)-1).find("td").eq(1).find('select').attr('name','popCityList['+(j+parseInt(citynum)-1)+'].themeCode');
		}
	}else if(i < 0){
		for(var k=parseInt(citynum);k>parseInt(citynumnow);k--){
			$("#tableCityPop tr").eq(k-1).remove();
		}
	}
}
function popSubmit(){
	/**
	 * 保存操作
	 */
	var provinceThemeNum = $("input[name='popConfigInfo.provinceThemeNum']").val();
	var cityThemeNum = $("input[name='popConfigInfo.cityThemeNum']").val();
	var themeCodeAll="";
	$("#tablePop tr").find('select').each(function(){
		themeCodeAll += $(this).val()+","
	})
	$("#tableCityPop tr").find('select').each(function(){
		themeCodeAll += $(this).val()+","
	})
	var popIsSave = $("#popIsSave").val();
	//alert(themeCodeAll);
	$.ajax({
		async : false,
		type : "POST",
		url : "popConfigSave",  
		data : {
			"popConfigInfo.provinceThemeNum":provinceThemeNum,
			"popConfigInfo.cityThemeNum":cityThemeNum,
			"popConfigInfo.themeCodeAll":themeCodeAll.substring(0,(themeCodeAll.length-1)),
			"popIsSave":popIsSave
		},
		// dataType:"json",
		success : function(data) {
			if(data=="success"){
				$.ligerDialog.warn("保存成功!");
			}else{
				$.ligerDialog.warn("保存失败");
			}
		}
	});
	
}