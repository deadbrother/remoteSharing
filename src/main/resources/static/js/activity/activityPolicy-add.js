/**
 * 时间控件js
 */
var browser = navigator.appName;
$(function() {

	$("#save-policy-btn")
			.click(
					function() {
						if (checkForm()) {
							if ($("#fileId").val() != "") {

								var fileNaae = $("#fileId").val().split("\\")[$(
										"#fileId").val().split("\\").length - 1];
								var policyfix = fileNaae.split(".")[fileNaae
										.split(".").length - 1];
								if (!(policyfix == "doc" || policyfix == "docx"
										|| policyfix == "txt"
										|| policyfix == "xlsx"
										|| policyfix == "xls" || policyfix == "pdf")) {
									$.ligerDialog.warn("不能上传此文件类型");
									return false;
								}
							}
							$('#policyInputForm').submit();
						} else {
							return false;
						}
					});

});
/**
 * 初始化开始日期的datetimepicker
 */
/*
 * $("#queryStartTime").parent(".form_date").datetimepicker({ showClear: true,
 * allowInputToggle:true, showTodayButton: true, format: "YYYY-MM-DD",
 * useCurrent: false, widgetPositioning: {horizontal: "left"}, locale: "zh-cn"
 * }).on("dp.change", function(e) { if ($("#queryStartTime").val() == "")
 * return;
 * $("#queryEffectiveTime").parent(".form_date").data("DateTimePicker").minDate(e.date);
 * }).on("dp.show",function (e) {
 * $("#queryEffectiveTime").parent(".form_date").data("DateTimePicker").hide();
 * }); $("#queryEffectiveTime").parent(".form_date").datetimepicker({ showClear:
 * true, allowInputToggle:true, showTodayButton: true, format: "YYYY-MM-DD",
 * useCurrent: false, widgetPositioning: {horizontal: "left"}, locale: "zh-cn"
 * }).on("dp.change", function(e) { if ($("#queryEffectiveTime").val() == "")
 * return;
 * $("#queryStartTime").parent(".form_date").data("DateTimePicker").maxDate(e.date);
 * }).on("dp.show",function (e) {
 * $("#queryStartTime").parent(".form_date").data("DateTimePicker").hide(); });
 */
$(document)
		.click(
				function(e) {
					var target = $(e.target);
					if (target.parents('.form_date').length < 1
							&& target
									.parents('.bootstrap-datetimepicker-widget').length < 1) {
						if ($('.bootstrap-datetimepicker-widget').length > 0) {
							$(".bootstrap-datetimepicker-widget").parents(
									".form_date").data('DateTimePicker').hide();
						}
					}
				});

function checkForm() {
	if (browser == "Microsoft Internet Explorer") {
		if ($("input[name='po.policyName']").val() == "") {
			$.ligerDialog.warn("请填写政策名称！");
			return false;
		}else if($("input[name='po.policyName']").val().length > 90){
			$.ligerDialog.warn("政策名称长度过长！请重新输入");
			return false;
		}
		if ($("#checkNameValid").val() == "1") {
			$.ligerDialog.warn("政策名称重复！请重新输入");
			return false;	
		}

		if ($("select[name='po.policyClassId']").val() == "") {
			$.ligerDialog.warn("请选择政策类型！");
			return false;
		}
		if ($("input[name='po.startTime']").val() == "") {
			$.ligerDialog.warn("请选择开始时间！");
			return false;
		}

		if ($("input[name='po.effectiveTime']").val() == "") {
			$.ligerDialog.warn("请选择结束时间！");
			return false;
		}
		return true;
	} else {
		if ($("input[name='po.policyName']").val().trim() == "") {
			$.ligerDialog.warn("请填写政策名称！");
			return false;
		}else if($("input[name='po.policyName']").val().trim().length > 90){
			$.ligerDialog.warn("政策名称长度过长！请重新输入");
			return false;
		}
		if ($("#checkNameValid").val() == "1") {
			$.ligerDialog.warn("政策名称重复！请重新输入");
			return false;
		}

		if ($("select[name='po.policyClassId']").val().trim() == "") {
			$.ligerDialog.warn("请选择政策类型！");
			return false;
		}
		if ($("input[name='po.startTime']").val().trim() == "") {
			$.ligerDialog.warn("请选择开始时间！");
			return false;
		}

		if ($("input[name='po.effectiveTime']").val().trim() == "") {
			$.ligerDialog.warn("请选择结束时间！");
			return false;
		}
		return true;
	}

}

/**
 * 验证政策名称不可重复
 */
function checkPolicyName() {
	var name = "";
	if (browser == "Microsoft Internet Explorer") {
		name = $("input[name='po.policyName']").val();
	} else {
		name = $("input[name='po.policyName']").val().trim();
	}
	if (name == "")
		return;
	// 得到文件的名字，把文件的名字赋值给另一个。
	$.ajax({
		type : "POST",
		url : "../activityPolicy/check",// Servlet Action
		async : false,
		data : {
			"po.policyId" : $("input[name='po.policyId']").val(),
			"po.policyName" : name
		},
		success : function(data) {
			$("#checkNameValid").val(data.conflict);
		}
	});
}
function scan() {
	var _i = $("#fileId");
	_i.click();
}

function deletefile() {
	$("#fileId").remove("");// 把文件删除
	// 载创建一个file
	$("#delButton")
			.parent()
			.prev()
			.prev()
			.html(
					'<input type="file" name="eventfile" value="${bo.policyInfo.uploadFileName}" class="slds-button " id="fileId" onchange="fileCheck(this)" />');
	jQuery("#uploadFileName2").html("");// 显示的内容删除
	$("#fileState").val("2");
}

function setFileName(nameStr) {

	nameStr = nameStr.substr(nameStr.lastIndexOf("\\") + 1);
	document.getElementById("uploadFileName").value = nameStr;
	$('#uploadFileName2').text(nameStr);

}

function fileCheck(obj) {
	var policyfix = obj.value.match(/^(.*)(\.)(.{1,8})$/)[3].toLowerCase(); // 获得选择的上传文件的后缀名的正则表达式
	if (!(policyfix == "doc" || policyfix == "docx" || policyfix == "txt"
			|| policyfix == "xlsx" || policyfix == "xls" || policyfix == "pdf")) {
		$.ligerDialog.warn("不能上传此文件类型");
		$("#fileId").val("");
		return false;
	}
	// 显示名字替换一下
	var name = obj.value;
	var fileNaae = name.split("\\")[name.split("\\").length - 1];
	$("#uploadFileName2").html(fileNaae);
	// 改变一下状态;
	$("#fileState").val("1");
}
$(function() {
	if ($("#uploadFileName").val() != null) {
		$('#uploadFileName2').text($("#uploadFileName").val());
	}
});
