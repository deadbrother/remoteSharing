$(function(){
	var DrId=$("#drid").val();
	var TagList;
	
	var typeflag = $("#typeflag").val();
	var treeSetting = {
		    data:{
				simpleData: {
					enable:true, 
					idKey:'id',
					pIdKey:'pid',
					rootPId: 0
				},
				key:{
					name:'res_filed_type_name',
					title: "name"
				},
				keep: {
					parent: true,
					leaf: true
				}
			},
			view:{
				dblClickExpand:false
			},
			async: {
				enable: true,
				type:"POST",
				autoParam: ["id=res_field_type_id","flag"],
				otherParam: { "drawTypeId":DrId,"typeflag":typeflag},
				url:"../../condFunc/tagTreeData",
				dataFilter: null
			},
			callback:{
				//双击事件，将标签拖到文本框
				onDblClick: function(event,treeId,treeNode){
					if(treeNode.flag=="1"||treeNode.flag=="2"){
						conditionSet.symbol("【"+treeNode.res_filed_type_name+"】");
					}
					
					if(treeNode.flag=="3"){
						conditionSet.symbol(treeNode.res_filed_type_name);
					}
				}

			},
			//节点拖拽操作结束的事件回调
			onDrop:function(event, treeId, treeNodes, targetNode, moveType){
				return false;
			}
		};

		function initTagTree(){
			var dayTagTree = $("#TagTree");
//			
//			$("#TagTree").ligerTree({ 
//				url: "../../condFunc/tagTreeData?drawTypeId="+DrId, 
//				ajaxType:"get",
//				idFieldName: "id",
//				textFieldName:"res_filed_type_name",
//				delay: function(e){
//					var data = e.data;
//					return { url: "../../condFunc/tagTreeData?drawTypeId="+DrId+'&res_field_type_id='+ data.id };
//				}
//			});
//			
		   var dayTagTreeObj = $.fn.zTree.init(dayTagTree,treeSetting);
		}
		function initCond(){
			if (document.selection) {
				$("#groupDesc").bind("click",function(){
					conditionSet.selection(this);
				});
			}
			
			var data = conditionSet.frameDialog().get("data");
			var condMemo = data.cond;
			var varType = data.varType;
			
			$("#groupDesc").val(condMemo);
			if(varType==7){
				$("#condTitile").hide();
			}
		}
		initTagTree();
		initCond();
});
var conditionSet = {
	selectionSE:{},
	symbol:function(str) {
		var obj = document.getElementById('groupDesc');
		str += "";
		if (document.selection) { //ie
			if(this.selectionSE.start!=null){
				var v = obj.value;
				var s = v.substring(0,this.selectionSE.start);
				var e = v.substring(this.selectionSE.end,v.length);
				obj.value = s+str+e;
			}else{
				obj.value += str;
			}
		} else if (typeof obj.selectionStart === 'number'
			&& typeof obj.selectionEnd === 'number') { //非ie
			var startPos = obj.selectionStart, endPos = obj.selectionEnd, cursorPos = startPos, tmpStr = obj.value;
			obj.value = tmpStr.substring(0, startPos) + str
			+ tmpStr.substring(endPos, tmpStr.length);
			cursorPos = cursorPos + str.length;
			obj.selectionStart = obj.selectionEnd = cursorPos;
		} else {
			obj.value += str;
		}
	},
	selection:function(obj){
		var s,e,range,stored_range;
		if(obj.selectionStart == undefined){
			var selection=document.selection;
			if (obj.tagName.toLowerCase() != "textarea") {
				var val = this.val(),
				range = selection.createRange().duplicate();
				range.moveEnd("character", val.length);
				s = (range.text == "" ? val.length:val.lastIndexOf(range.text));
				range = selection.createRange().duplicate();
				range.moveStart("character", -val.length);
				e = range.text.length;
			}else {
				range = selection.createRange();
				stored_range = range.duplicate();
				stored_range.moveToElementText(obj);
				stored_range.setEndPoint("EndToEnd", range);
				s = stored_range.text.length - range.text.length;
				e = s + range.text.length;
			}
		}else{
			s=obj.selectionStart;
			e=obj.selectionEnd;
		}
		var te=obj.value.substring(s,e);
		this.selectionSE = {start:s,end:e,text:te};
	},
	condSubmit:function (draw_type_id) {
		var conditionResume = $("#groupDesc").val();
		var typeflag = $("#typeflag").val();
		typeflag = typeflag!=null?typeflag:"";
		
		var dx = {
			"drawTypeId" :draw_type_id,
			"typeflag" :typeflag,
			"ruleDesc" : conditionResume
		};
		var that = this;
		$.ajax({
			url : "../../condFunc/checkRule",
			type : "POST",
			async : true,
			dataType : "json",
			data : dx,
			success : function(data) {
				if (data.status == "success") {
					var dialog = that.frameDialog();
					data.condMemo = conditionResume;
					data.status = "ok";
					dialog.set('data', data);
					dialog.close();
				}else{
					$.ligerDialog.error(data.msg);
				}
			}
		});
	},
	functionWizard:function (){
		var drawTypeId = $("#drid").val();
		var typeflag = $("#typeflag").val();
		$.ligerDialog.open({
            height:450,
            width: 600,
            title : "函数向导",
            url: "../../condFunc/functionwizard", 
            showMax: false,
            showToggle: true,
            showMin: false,
            isResize: true,
            slide: false,
            data: {
            	"typeflag" :typeflag,
                "drawTypeId":drawTypeId
            },
            onClosed:function(){
            	var condData = this.options.data;
            	if(data.status=="close"){
            		return false;
            	}
            	callBack(condData.msg,condData.condMemo);
            }
        });
	},
	closeCond:function(){
		var dialog = this.frameDialog();
		var data={status:"close"};
		dialog.set('data', data);
		dialog.close();
	},
	frameDialog:function(){
		var frame = null;
		if(frameElement){
			frame = frameElement;
		}else{
			frame = self.frames[0];
		}
		return frame.dialog;
	}
};