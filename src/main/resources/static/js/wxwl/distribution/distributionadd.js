var detailWin;
var optionoData;
var orgTreeObj;
var parentorgid;
var i=0;
function strToJson(str)
{
     var json = eval('(' + str + ')');
     return json;
}
var option={	
optionData:function(value){	
	   var amanager= $("#rule_type_name").ligerComboBox({
	        width : 180,
	        data:[], 
	    });
		$.ajax({
			url: "/epmwxwl/distribution/option",
			type: "GET",
			async: false,
			success: function(data,amanager) 
			{   
			    if(data!=null){
			    optionoData=strToJson(data);
			    amanager=    $("#rule_type_name").ligerComboBox({
			        width : 180,
			        initIsTriggerEvent: false,
			        data:optionoData, 
			        value:value,
			        onSelected: function (value)
			        {
			        $("#rule_type_id").attr("value",value);
			        },
			        resize:true,
			        selectBoxWidth:200,
			    	valueFieldID: ''
			    });
			    }
			}
	}); 
		return amanager;
	},
showMenu:function(parentorgid){
	var that=this;
	$("#menuContent").fadeIn("fase");
	var cityObj = $("#target_dept_name");
	var cityOffset = $("#target_dept_name").offset();
	var contentOffset=$($("#menuContent").offset());
	$("#menuContent").css({left: cityOffset.left-contentOffset.left + "px", top:cityObj.outerHeight()+cityOffset.top+"px"}).slideDown("fast");
	$("body").bind("mousedown", function(event){
		if (!(event.target.id == "menuBtn" || event.target.id == "target_dept_name" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length>0)) {
			that.hideMenu();
		}
	});
	that.initOrgTree();
},
hideMenu:function(){
	var that=this;
	$("#menuContent").fadeOut("fast");
	$("body").unbind("mousedown", function(event){
		if (!(event.target.id == "menuBtn" || event.target.id == "target_dept_name" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length>0)) {
			that.hideMenu();
		}
	});
},
initOrgTree:function(){
	var that=this;
	var orgTree = $("#orgTree");
	orgTreeObj = $.fn.zTree.init(orgTree,treeSetting);
},
check:function(){
},
beforeClick:function(){
}
};
var treeSetting = {
		check: {
			enable: false,
			chkboxType: {"Y":"", "N":""}
		},
		data:{
			simpleData: {
				enable:true, 
				idKey:'id',
				pIdKey: "pId",
				rootPId: 0
			},
			key:{
				name:'name'
			},
			keep: {
				parent: true,
				leaf: true
			}
		},
		view:{
			showIcon: true,
			dblClickExpand:false,
			showLine :true
		},
		async: {
			enable: true,
			type:"POST",
			url:"/epmwxwl/distribution/orgData",
			dataFilter: null
		},
		callback:{
			beforeClick: option.beforeClick,
			beforeAsync:function(treeId, treeNode){
				var treeObj = $.fn.zTree.getZTreeObj("orgTree");
				var parentorgid=$("#parentorgid").val();
				if(i==0){
					treeObj.setting.async.autoParam=[];
					treeObj.setting.async.otherParam=["orgid",parentorgid];	
					i++;
				}else{
					treeObj.setting.async.autoParam=["id=orgid"];
					treeObj.setting.async.otherParam=[];	
				}
			},
			onAsyncSuccess :function (event, treeId, treeNode,msg){
			},
			onDblClick: function(event,treeID,treeNode,msg){
			$("#target_dept_name").attr("value",treeNode.name);
			$("#target_dept_id").attr("value",treeNode.id);
			$("#menuContent").fadeOut("fast");
			}
		},
	};
$(function(){
	option.optionData("");	
})

var RuleButton={
click:function(){
	 var that = this;
	 var ruleDesc=$("#cond_resume").val();
	 conditionObj.personCond(ruleDesc,function(condSql,condResume){
	     $("#cond_resume").attr("value",condResume);
	     $("#cond_sql").attr("value",condSql);
		 });
	  
}	,
save:function(){
 }
}