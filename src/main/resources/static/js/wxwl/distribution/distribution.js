var gridManager;
var detailWin;
var amanager;
var target_dept;
var ruleTypelist;
var option={
showOption:function(){
	var that=this;
	$.ajax({
		url: "/epmwxwl/distribution/orgOption",
		data:{"orgid":""},
		type: "POST",
		async: false,
		success: function(data) 
		{   
			var JsonData= strToJson(data);
			var a = $("#orgOption").ligerComboBox({
				width : 130,
				initIsTriggerEvent: false,
				data : JsonData,
				value:JsonData[0].text,
				valueFieldID : '',
				onSelected:function(value){
				that.targetOption(value);
				reload(value);
				$("#dept_id").attr("value",value);
				}
			});
		}
});		
},
targetOption:function(dept_id){
	$.ajax({
		url: "/epmwxwl/distribution/orgOption",
		data:{"orgid":dept_id},
		type: "POST",
		async: false,
		success: function(data) 
		{   
			var JsonData= strToJson(data);
			target_dept=JsonData;
		}
});			
}
};
function gridManager(){
	$.ajax({
		url: "/epmwxwl/distribution/option",
		type: "GET",
		async: false,
		success: function(data) 
		{   
			var JsonData= strToJson(data);
			ruleTypelist=JsonData;		}
});		
	gridManager=$("#maingrid").ligerGrid({
		columns: [
		          { display: '规则名称', type: 'String', align: 'center', name: 'clientsetname', id: 'role_set_id',editor:{type:"text"} 
		          },
		          { display: '划配规则', name: 'rule_type_id', align: 'center', width: 200,  render: function (item,rowindex){
			        	var s = "";
			        	var name;
			        	for (var i = 0; i < ruleTypelist.length; i++){
			        		if (ruleTypelist[i]['rule_type_id'] == item.rule_type_id){
			        			name=ruleTypelist[i]['rule_type_name'];
			        			s = "<div  id='se_"+item.role_set_id+"' gzname='"+name+"' onmouseenter=\"Rulebutton.showSelect('" + rowindex +"')\" onmouseleave=\"Rulebutton.hideSelect('" + rowindex +"')\">"+name+"</div>";
			        			break;
			        		}
			        	}
			        	if(s.length<1){
			        		name=ruleTypelist[0]['rule_type_name'];
			        		s = "<div  id='se_"+item.role_set_id+"' gzname='"+name+"' onmouseenter=\"Rulebutton.showSelect('" + rowindex +"')\" onmouseleave=\"Rulebutton.hideSelect('" + rowindex +"')\">"+name+"</div>";
			        	}
	        			return s;
		          }},
		          { display: '用户筛选条件', name: 'cond_resume', align: 'center',type: 'String' , render: function (rowdata, rowindex, value){
	        		  value = value!=null&&value.length>0?value:"&nbsp;";
	        		  var s = "<div id='resc_"+rowindex+"'  onclick=\"Rulebutton.dialog('" + rowindex + "','resc_')\"  >"+value+"<span>&nbsp;</span></div>";
	        		  if(rowdata.isparent=="true"&&"root"!=rowdata.id){
	        			  s="";
	        		  }
	        		  return s;				
	        	  }
		          },
		          { display: '条件sql', name: 'cond_sql', align: 'left', hide:true,width:"0"
		          },
		          { display: '目标部门',name:'target_dept_id', align: 'center',  render: function (item,rowindex){
			        	var s = "";
			        	var name;
			        	for (var i = 0; i < target_dept.length; i++){
			        		if (target_dept[i]['id'] == item.target_dept_id){
			        			name=target_dept[i]['text'];
			        			s = "<div  id='ta_"+item.role_set_id+"' gzname='"+name+"' onmouseenter=\"Rulebutton.showDeptSelect('" + rowindex +"')\" onmouseleave=\"Rulebutton.hideDeptSelect('" + rowindex +"')\">"+name+"</div>";
			        			break;
			        		}
			        	}
			        	if(s.length<1){
			        		name=target_dept[0]['text'];
			        		s = "<div  id='ta_"+item.role_set_id+"' gzname='"+name+"' onmouseenter=\"Rulebutton.showDeptSelect('" + rowindex +"')\" onmouseleave=\"Rulebutton.hideDeptSelect('" + rowindex +"')\">"+name+"</div>";
			        	}
	        			return s;
		          }
		          },
		          { display: '调整顺序', name: 'sortid', align: 'center', type: 'String',render:function(rowdata,rowindex,value){
			        	var h=  "<div><image  src='/epmwxwl/image/up.png'  style='cursor:pointer' href=\"javascript:;\" onclick=\"Rulebutton.move('"+rowindex+"','up')\" /><image  style='cursor:pointer' src='/epmwxwl/image/down.png' onclick=\"Rulebutton.move('"+rowindex+"','down')\" /> </div>";
			            return h;
			           }
		          },
		          ],   
		          isScroll: false,
		          checkbox:true,
		          rownumbers:false,
		          usePager: true ,
		          enabledEdit: true ,
		          url:"../distribution/findAllAjax",
		          parms:{ "dept_id":$("#dept_id").val() },
		          onAfterEdit: f_onAfterEdit
	});		 
}
function addNewRow(){
	var dept_id=$("#dept_id").val();
	var data;
	data={
	"dept_id":dept_id
	};
	$.ajax({
			url: "/epmwxwl/distribution/saveNull",
			type: "POST",
			async: true,
			data:data,
			success: function(data) 
			{   
				if(data!=null){
					gridManager.addRow({
						 role_set_id:data,
						 clientsetname :'' ,
						 rule_type_name:'',
						 cond_resume:'',
						 dept_id:$("#dept_id").val(),
						 target_dept_id:"",
						 creatuserid:'',
						 arvstutas:''
				});
				}   
			}
		}); 
}
function f_onAfterEdit( e){
	var rowdata = gridManager.getRow(e.rowindex);
	var submitData= {"role_set_id":rowdata["role_set_id"],"clientsetname":e.value};
	Rulebutton.editRoleSet(submitData);
}
//重新加载数据
function reload(chooseId) {
	var dept_id=chooseId;
	gridManager.options.parms = {
			"dept_id":dept_id 
	};
	gridManager.reload(1);
}
$(function(){
	option.showOption();
	gridManager();
});
var Rulebutton={
		doRule:function(){
		var that=this;
		var gridRows=gridManager.getSelectedRows();
		var ids=new Array();
		if(gridRows!=null&&gridRows.length>=1){
			for(var i = 0;i<gridRows.length;i++){
				if(gridRows[i].target_dept_id==null||gridRows[i].target_dept_id.length<=0||gridRows[i].rule_type_id==null||gridRows[i].rule_type_id.length<=0){
				alert("规则名称:"+gridRows[i].clientsetname+"的目标机构不能为空!");
				}
				else{
				ids.push(gridRows[i]["role_set_id"]);	
				}
				}
				that.dodistribution(ids);
		}else{
			$.ligerDialog.waitting('请选择要执行的用户划配规则！'); 
			setTimeout(function () { $.ligerDialog.closeWaitting(); }, 1000);	
		}
		},
		dodistribution:function(rolesetids){
			var manager = $.ligerDialog.waitting('正在执行中,请稍候...'); 
			 setTimeout(function () { manager.close(); }, 3000);
			var gridRows=gridManager.getSelectedRows();
			var ids=new Array();
			$.ajax({
				url: "/epmwxwl/analysis/userdistribution",
				type: "POST",
				data:{"rolesetids":rolesetids.toString()},
				async: true,
				success: function(data) 
				{   
					if(data=="1"){
						$.ligerDialog.waitting('执行成功！'); 
						setTimeout(function () { $.ligerDialog.closeWaitting(); }, 1000);	
					}else if(data=="0"){
						$.ligerDialog.waitting('执行失败！'); 
						setTimeout(function () { $.ligerDialog.closeWaitting(); }, 1000);
					}
				}
		});		
		},
		addclick:function(){
			addNewRow();
//			var that=this;
//			var dept_id=$("#dept_id").val();
//			if(dept_id!=null&&dept_id.length>=1){
//			 detailWin=$.ligerDialog.open({
//	    			title:'增加用户化配规则',
//	    			url : "/epmwxwl/distribution/saveJsp/"+DO_TYPE_SAVE+"?dept_id="+dept_id,
//	    			height : 420,
//	    			width:400,
//	    			isResize : true,
//	    			isDrag:true,
//	    		  buttons: [
//	                     { text: '确定', onclick: function () { that.save(); } },
//	                     { text: '取消', onclick: function () { detailWin.hide(); } }
//	                     ]
//
//	    		});	
//			}else {
//				alert("请选择化配结构");
//			}
		},
		editclick:function(){
			var that=this;
			var dept_id=$("#dept_id").val();
			if(dept_id!=null&&dept_id.length>=1){
			 detailWin=$.ligerDialog.open({
	    			title:'修改用户化配规则',
	    			url : "/epmwxwl/distribution/saveJsp/"+DO_TYPE_EDIT+"?dept_id="+dept_id,
	    			height : 320,
	    			width:400,
	    			isResize : true,
	    			isDrag:true,
	    		  buttons: [
	                     { text: '确定', onclick: function () { that.save(); } },
	                     { text: '取消', onclick: function () { detailWin.hide(); } }
	                     ]

	    		});		
			}else{
				alert("请选择化配结构");
			}
		},
		 hideSelect:function(rowindex){
		    	var rowdata = gridManager.getRow(rowindex);
		    	var obj = $("#se_"+rowdata["role_set_id"]);
		    	var clientsetname = obj.attr("gzname");
		    	obj.empty().html(clientsetname);
		    }, 
		    showSelect:function(rowindex){
		    	var rowdata = gridManager.getRow(rowindex);
		    	var id = rowdata["role_set_id"];

		    	var rule_type_id = rowdata["rule_type_id"];
		    	
		    	var html = "";
		    	for (var i = 0; i < ruleTypelist.length; i++){
		    		if(rule_type_id==ruleTypelist[i]['rule_type_id']){
		    			html+="<option value='"+ruleTypelist[i]['rule_type_id']+"' selected>"+ruleTypelist[i]['rule_type_name']+"</option>";
		    		}else{
		    			html+="<option value='"+ruleTypelist[i]['rule_type_id']+"'>"+ruleTypelist[i]['rule_type_name']+"</option>";
		    		}
		    	}
		    	var obj = $("#se_"+id);
		    	var se = " <div class='slds-select_container'><select class='slds-select' onchange=\"Rulebutton.changeGz(this,'"+rowindex+"')\">"+html+"</select></div>";
		    	obj.empty().html(se);
		    },
		    changeGz:function(obj,rowindex){
		    	var that=this;
				var rowdata = gridManager.getRow(rowindex);
		    	var id = rowdata["role_set_id"];
				
				var objgz = $("#se_"+id);
				var rule_type_id = $(obj).find("option:selected").val();
				var gzname = $(obj).find("option:selected").text();
				
				objgz.attr("gzname",gzname);
				rowdata["rule_type_id"] = rule_type_id;
				
				this.hideSelect(rowindex);

			    if(rowdata.isparent=="true"&&"root"!=id){
				    return false;
			    }
			    var submitData={"role_set_id":id,"rule_type_id":rule_type_id};
			    that.editRoleSet(submitData);
		    }, 
		    hideDeptSelect:function(rowindex){
		    	var rowdata = gridManager.getRow(rowindex);
		    	var obj = $("#ta_"+rowdata["role_set_id"]);
		    	var clientsetname = obj.attr("gzname");
		    	obj.empty().html(clientsetname);
		    }, 
		    showDeptSelect:function(rowindex){
		    	var rowdata = gridManager.getRow(rowindex);
		    	var id = rowdata["role_set_id"];

		    	var target_dept_id = rowdata["target_dept_id"];
		    	
		    	var html = "";
		    	for (var i = 0; i < target_dept.length; i++){
		    		if(target_dept_id==target_dept[i]['id']){
		    			html+="<option value='"+target_dept[i]['id']+"' selected>"+target_dept[i]['text']+"</option>";
		    		}else{
		    			html+="<option value='"+target_dept[i]['id']+"'>"+target_dept[i]['text']+"</option>";
		    		}
		    	}
		    	var obj = $("#ta_"+id);
		    	var se = " <div class='slds-select_container'><select class='slds-select' onchange=\"Rulebutton.changeDeptGz(this,'"+rowindex+"')\">"+html+"</select></div>";
		    	obj.empty().html(se);
		    },
		    changeDeptGz:function(obj,rowindex){
		    	var that=this;
				var rowdata = gridManager.getRow(rowindex);
		    	var id = rowdata["role_set_id"];
				var objgz = $("#ta_"+id);
				var target_dept_id = $(obj).find("option:selected").val();
				var gzname = $(obj).find("option:selected").text();
				objgz.attr("gzname",gzname);
				rowdata["target_dept_id"] = target_dept_id;
				
				this.hideDeptSelect(rowindex);
			    var submitData={"role_set_id":id,"target_dept_id":rowdata["target_dept_id"]};
			    that.editRoleSet(submitData);
		    }, 
		dialog:function(rowindex,ftype){
			var that= this;
			 var rowdata=gridManager.getRow(rowindex);
			 var ruleDesc=rowdata.cond_resume;
			 var filedName;
				conditionObj.personCond(ruleDesc,function(condSql,condResume){
				var rowdata = gridManager.getRow(rowindex);
				var submitData = {"role_set_id":rowdata["role_set_id"],"cond_resume":condResume,"cond_sql":condSql};
				that.editRoleSet(submitData);
				gridManager.updateCell("cond_resume", condResume, rowindex);
				gridManager.updateCell("cond_sql",condSql,rowindex);
				});
		},
		editRoleSet:function(submitData){
			$.ajax({
				url: "/epmwxwl/distribution/updateRoleSet",
				type: "POST",
				async: true,
				data:submitData,
				success: function(data) 
				{   
				}
			}); 
		},
		move:function(rowindex,mtype){
			var that=this;
			var rowindexInt=parseInt(rowindex);
			var rowdata = gridManager.getRow(rowindexInt);
			var nowRoleSetId=rowdata["role_set_id"];
			var nowSortId=rowdata["sortid"];
			if(mtype=="up"){
				var rowdatapre=gridManager.getRow(rowindexInt-1);
				var preRoleSetId=rowdatapre["role_set_id"];
				var preSortId=rowdatapre["sortid"];
				var preData,nowData;
				preData={"role_set_id":preRoleSetId,"sortid":nowSortId};
				nowData={"role_set_id":nowRoleSetId,"sortid":preSortId};
//				that.editRoleSet(nowData);
//				that.editRoleSet(preData);
				gridManager.up(rowindexInt);
			}else if(mtype=="down"){
				var rowdataaft=gridManager.getRow(rowindexInt+1);
				var aftRoleSetId=rowdataaft["role_set_id"];
				var aftSortId=rowdataaft["sortid"];
				aftData={"role_set_id":aftRoleSetId,"sortid":nowSortId};
				nowData={"role_set_id":nowRoleSetId,"sortid":aftSortId};
//				that.editRoleSet(nowData);
//				that.editRoleSet(aftData);
				gridManager.down(rowindexInt);
			}
		},
		save:function(){
		var that=this;
		var clientsetname=detailWin.frame.$("#clientsetname").val();
		var cond_sql=detailWin.frame.$("#cond_sql").val();
		var cond_resume=detailWin.frame.$("#cond_resume").val();
		var target_dept_id=detailWin.frame.$("#target_dept_id").val();
		var rule_type_id=detailWin.frame.$("#rule_type_id").val();
		var dept_id=$("#dept_id").val();
		var data;
		data={
		"clientsetname":clientsetname,		
		"cond_sql":cond_sql,
		"cond_resume":cond_resume,
		"target_dept_id":target_dept_id,
		"rule_type_id":rule_type_id,
		"dept_id":dept_id
		};
		that.submit(data);
		},
		submit:function(submitData){
			$.ajax({
				url: "/epmwxwl/distribution/save.do",
				type: "POST",
				async: true,
				data:submitData,
				success: function(data) 
				{   
					if(data=="success"){
						alert("成功");
						detailWin.hide();
					}else{
						alert("添加失败，重新添加");
					}    
				}
			}); 
		},
		deleRule:function(){
			var gridRows=gridManager.getSelectedRows();
			var ids=new Array();
			for(var i = 0;i<gridRows.length;i++){
				ids.push(gridRows[i]["role_set_id"]);
				}
			$.ligerDialog.confirm('是否要删除所选中项!', function (flag) { 
				if(flag==true){
					var manager = $.ligerDialog.waitting('正在删除中,请稍候...'); 
					$.ajax({
						url: "/epmwxwl/distribution/deleRule",
						type: "POST",
						async: true,
						data:{"jsonStr":ids.toString()},
						success: function(data) 
						{ 
						$.ligerDialog.waitting('删除成功！'); 
						setTimeout(function () { $.ligerDialog.closeWaitting(); }, 1000);		
						manager.close();	
						reload($("#dept_id").val());	
						}
					}); 	
				}
			});
		}
	};