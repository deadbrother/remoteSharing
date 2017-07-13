var manager;
var browser = navigator.appName;
$(function() {
	$("#form1").ligerForm({
		inputWidth : 200
	});
	manager = $("#maingrid")
			.ligerGrid(
					{
						columns : [
								{
									display : '手机号码',
									name : 'userPhone',
									align : 'center',
									width : '20%'
								},
								{
									display : '操作人',
									name : 'userName',
									align : 'left',
									width : '15%'
								},
								{
									display : '操作时间',
									name : 'operatorTime',
									align : 'center',
									width : '15%',
									render : function(rowdata, rowindex, value) {
										return format(value,
												"yyyy-MM-dd HH:mm:ss");
									}

								},
								{
									display : '用户类型',
									name : 'filteType',
									align : 'center',
									width : '15%',
									render : function(rowdata, rowindex, value) {
										if (value == "0") {
											return "防打扰名单";
										} else{
											return "无";
										}
									}

								},
								{
									display : '描述',
									id : 'desc',
									name : 'desc',
									width : '20%',
									align : 'left',
									render : function(rowdata, index, value) {
										return "<div class='l-grid-row-cell-inner' style='max-height:20px; text-align:left;'  title='"
												+ rowdata.desc
												+ "'>"
												+ rowdata.desc + "</div>";
									}

								}, {
									display : '编号',
									id : 'userId',
									name : 'userId',
									width : '15%',
									hide : 'hide'

								}, {display : '登录人',
									id : 'operator',
									name : 'operator',
									hide : 'hide'
								},{display : '地市编码',
									id : 'areaNo',
									name : 'areaNo',
									width : '7%',
									hide : 'hide'
								},{
									display : '组织机构',
									id : 'orgClassName',
									name : 'orgClassName',
									align : 'left',
									width : '15%',
									render : function(rowdata, index, value) {
										if(value==""|| value==null){
											return "无";
										}else{
										return "<div class='l-grid-row-cell-inner' style='max-height:20px; text-align:left;'  title='"
												+ value
												+ "'>"
												+ value + "</div>";
										}
									}
									
								} ],
						isScroll : false,
						url : '../filte/main',
						pageSize : 5,
						checkbox : true,
						rownumbers : false,
						usePager : true,
						
					});
	
	// 新增
	$("#add-tool-btn").click(function() {
		typeLayer = $.ligerDialog.open({
			title : '防打扰名单新增',
			target : $("#addDialog"),
			width : 500,
			height : 340,
			isResize : true,
		});
		$("#userIdM").val("");
		$("#userPhoneM").val("");
		$("#userPhoneM").attr("disabled", false);
		$("#descM").val("");
		$("#userIdM").val("");
		$("#submitbutton").html("添加");
		/*document.getElementById("filteTypeM").options[0].selected = true;*/
	});
	// 修改类型
	$("#modify-tool-btn")
			.click(
					function() {
						var userId = "";
						var seletedNum = 0;
						$(".l-selected")
								.find("td:eq(5)>div")
								.each(
										function() {
											if (browser == "Microsoft Internet Explorer") {
												if (userId != "") {
													userId = userId + ","
															+ $(this).html();
												} else {
													userId = $(this).html();
												}
											} else {
												if (userId != "") {
													userId = userId
															+ ","
															+ $(this).html()
																	.trim();
												} else {
													userId = $(this).html();
												}
											}
											seletedNum++;
										});
						if (seletedNum == 0) {
							$.ligerDialog.warn("请选择一条记录进行修改");
							return false;
						} else if (seletedNum > 1) {
							$.ligerDialog.warn("一次只能选择一个");
							return false;
						}
						var loginorgclasslevel = $("#loginClassLevel").val();
						var loginOrgClassId = $("#loginOrgClassId").val();
						var number = "";// 获取电话号码
						var areaNo="";//地市编码 
						$(".l-selected").find("td:eq(7)>div").each(function() {
							areaNo = $(this).html();
						});
						$(".l-selected").find("td:eq(0)>div").each(function() {
							number = $(this).html();
						});
						if(!((loginorgclasslevel=="1") || (loginOrgClassId==areaNo) || areaNo=="" || areaNo==null)){
							$.ligerDialog.warn(number+"归属于其它地市,没有权限修改其它地市的名单");
							return false;							
						}
						
						/*if (loginClassLevel == "1") {
						} else if (loginClassLevel == "2") {
							if (classLevel == "1") {
								$.ligerDialog.warn("省份创建的名单，地市没有权限进行修改");
								return false;
							}
							if (loginOrgClassId != orgClassId) {
								$.ligerDialog.warn("该名单不是本地市所创建,没有权限进行修改");
								return false;
							}
						} else {
							$.ligerDialog.warn("县级用户没有权限进行修改");
							return false;
						}*/
						// 先ajax后台获取数据，再显示到页面;
						$.ajax({
								url : '../filte/toModify/' + userId,
								type : "POST",
								async : false,
								success : function(data) {
									typeLayer = $.ligerDialog.open({
										title : '防打扰名单修改',
										target : $("#addDialog"),
										width : 500,
										height : 340,
										isResize : true,
									});
									$("#submitbutton").html("修改");
									$("#userIdM").val(data.userId);
									$("#userPhoneM").val(data.userPhone);
									$("#descM").val(data.desc);
									$("#userPhoneM").attr("disabled", true);
										/*var type = data.filteType;
										if (type == 0) {
											document
													.getElementById("filteTypeM").options[1].selected = true;
										} else if (type == 1) {
											document
													.getElementById("filteTypeM").options[2].selected = true;
										} else {
											document
													.getElementById("filteTypeM").options[0].selected = true;
										}*/

									}
								});
					});
	// 删除
	var numDel = 0;
	$("#deletes-tool-btn").click(
			function() {
				var deleteUrl = "../filte/delete";
				var userId = "";
				var seletedNum = 0;
				$(".l-selected").find("td:eq(5)>div").each(function() {
					if (browser == "Microsoft Internet Explorer") {
						if (userId != "") {
							userId = userId + "," + $(this).html().trim();
						} else {
							userId = $(this).html();
						}
					} else {
						if (userId != "") {
							userId = userId + "," + $(this).html();
						} else {
							userId = $(this).html();
						}
					}

					seletedNum++;
				});
				if (seletedNum == 0) {
					$.ligerDialog.warn("请选择要删除的记录");
					return false;
				}else{
					numDel = numDel + 1;
				}
				/*var loginClassLevel = $("#loginClassLevel").val();
				var classLevel = "";*/
				var loginorgclasslevel = $("#loginClassLevel").val();
				var loginOrgClassId = $("#loginOrgClassId").val();//登录的人的地市编码
				var areaNo="";//电话号码的地市编码
				var number = "";// 获取电话号码
				var info = "";// 提示信息
				var i = 0;// 控制跳出each循环；
				$(".l-selected").find("td:eq(7)>div").each(function() {
					areaNo = $(this).html();
					number = $(this).parent().prev().prev().prev()
					.prev().prev().prev().prev().children().html().trim();
					if(!((loginorgclasslevel =="1") || (loginOrgClassId==areaNo) || areaNo=="" || areaNo==null)){
						info=number+"归属于其它地市,没有权限修改其它地市的名单";
						i=1;	
						return false;
					}
				});
				if (i == 1) {
					$.ligerDialog.warn(info);
					return false;
				}
				/*$(".l-selected").find("td:eq(5)>div").each(
						function() {
							classLevel = $(this).parent().next().next()
									.children().html();
							orgClassId = $(this).parent().next().next().next()
									.children().html();
							number = $(this).parent().prev().prev().prev()
									.prev().prev().children().html().trim();
							if (loginClassLevel == "1") {
								// 全部可以删除
							} else if (loginClassLevel == "2") {
								if (classLevel == "1") {
									info = number + "是省份创建的名单，地市没有权限进行删除";
									i = 1;
									return false;
								}
								if (loginOrgClassId != orgClassId) {
									info = number + "不是本地市所创建,没有权限进行删除";
									i = 1;
									return false;
								}
							} else {
								// 除了1和2的，全部没有权限修改。
								info = number + "是县级用户创建,没有权限进行删除";
								i = 1;
								return false;
							}
							
						});*/
				if (confirm("请确认是否删除?")) {
					if (numDel == 1) {
						$.ajax({
							url : deleteUrl,
							type : "POST",
							async : false,
							data : {
								"ids" : userId
							},
							success : function(data) {
								if (data == "success") {
									$.ligerDialog.warn("删除成功");
									manager.reload(1);
									numDel = 0;
								} else {
									$.ligerDialog.warn("删除失败，请联系管理员！");
									numDel = 0;
								}
							}
						});
					} else {
						$.ligerDialog.warn("正在删除之前所选数据，请稍后操作");
					}
				}
			});
	// 查询
	$("#search-tool-btn").click(function() {
		reload();
	});

	/**
	 * 动态查询,重新加载列表
	 */
	function reload() {
		var code_type_name = $("#code_type_name").val();
		var filteType = $("#filtetyp").val();
		if ("NULL" == code_type_name) {
			code_type_name = "";
		}
		if ("NULL" == filteType) {
			filteType = "";
		}
		manager.options.parms = {
			"userPhone" : code_type_name,
			"filteType" : filteType
		};
		manager.reload(1);
	}
	// 增加,控制添加的过程中，再添加一次。
	var numAdd = 0;
	$("#submitbutton")
			.bind(
					'click',
					function() {

						var userId = $("#userIdM").val();
						var userPhone = $("#userPhoneM").val();
						var desc = $("#descM").val();
						var filteType = $("#filteTypeM").val();
						var phoneNum = /^1[3|4|5|7|8]\d{9}$/;
						if (!phoneNum.test(userPhone)) {
							$.ligerDialog.warn("请输入正确的手机号");
							return false;

						}
						if (desc == null || desc.length == 0 || desc == "") {
							$.ligerDialog.warn("请输入描述信息");
							return false;
						}
						if (filteType == 2) {
							$.ligerDialog.warn("请输入用户类型");
							return false;
						}

						if (confirm('确认提交？')) {
							if (userId != null && userId.length != 0) {
								numAdd = numAdd + 1;
								action = "../filte/modify";
								if (numAdd == 1) {

									$.ajax({
										url : action,
										type : "POST",
										async : true,
										data : {
											"userId" : userId,
											"userPhone" : userPhone,
											"filteType" : filteType,
											"desc" : desc,
										},
										success : function(data) {
											if (data == "success") {
												$.ligerDialog.warn("操作成功");
												typeLayer.hide();
												manager.reload(1);
												numAdd = 0;
											} else {
												$.ligerDialog.warn("操作失败");
												numAdd = 0;
											}
										}
									});
								} else {
									$.ligerDialog.warn("正在修改中，请稍后操作");
								}
							} else {
								numAdd = numAdd + 1;
								action = "../filte/add";
								if (numAdd == 1) {
									$.ajax({
												url : action,
												type : "POST",
												async : true,
												data : {
													"userPhone" : userPhone,
													"desc" : desc,
													"filteType" : filteType
												},
												success : function(data) {
													if (data == "success") {
														$.ligerDialog.warn("添加成功");
														typeLayer.hide();
														$("#userIdM").val("");
														$("#userPhoneM").val("");
														$("#userPhoneM").attr("disabled",false);
														$("#descM").val("");
														$("#userIdM").val("");
														/*document
																.getElementById("filteTypeM").options[0].selected = true;*/
														manager.reload(1);
														numAdd = 0;
													} else if (data == "numberIsSame") {
														$.ligerDialog.warn("插入失败，该手机号已经存在");
														numAdd = 0;
													} else if (data == "addFail") {
														$.ligerDialog.warn("未知原因，插入失败!");
														numAdd = 0;
													}else if (data == "notAllowed"){
														$.ligerDialog.warn("您上传的手机号不属于当前组织机构!");
														numAdd = 0;
													}
												}
											});
								} else {
									$.ligerDialog.warn("正在添加中,请稍后操作");
								}

							}
						}

					});

	// 导入
	$("#import-tool-btn").click(function() {
		typeLayer = $.ligerDialog.open({
			title : '导入文件',
			target : $("#importEx"),
			buttons : [ {
				text : '关闭',
				onclick : function(i, d) {
					$("input").ligerHideTip();
					d.hide();
				}
			} ],
			width : 350,
			height : 350,
			isResize : true,
		});
	});
	// 下载模板
	$("#download-tool-btn").click(function() {
		location.href = "../filte/downloadTemp";
	});
	/**
	 * 导入文件
	 */
	$("#importFile").click(function() {
		// alert(123);
		var url = "../filte/importFile";
		var file = document.getElementById("file").value;
		var yzxls = /.(?:xls|xlsx)$/;
		if (yzxls.test(file)) {
			document.getElementById('upFileFrom').action = url;
			$("#upFileFrom").submit();
			setTimeout(function() {
				location.href = "../filte/respFile";
				// alert("延时测试");
			}, 1000);
		} else {
			$.ligerDialog.warn("请上传Excel文件");
		}
	});
	/**
	 * 时间显示时分秒
	 */
	var format = function(time, format) {
		var t = new Date(time);
		var tf = function(i) {
			return (i < 10 ? '0' : '') + i;
		};
		return format.replace(/yyyy|MM|dd|HH|mm|ss/g, function(a) {
			switch (a) {
			case 'yyyy':
				return tf(t.getFullYear());
				break;
			case 'MM':
				return tf(t.getMonth() + 1);
				break;
			case 'mm':
				return tf(t.getMinutes());
				break;
			case 'dd':
				return tf(t.getDate());
				break;
			case 'HH':
				return tf(t.getHours());
				break;
			case 'ss':
				return tf(t.getSeconds());
				break;
			}
		});
	};
});
