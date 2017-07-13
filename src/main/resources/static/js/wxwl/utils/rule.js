var conditionObj = {
	/**
	 * 调用条件设置功能
	 * @param ruleType //划配类型 1.用户划配  2.任务划配
	 * @param varType //判断条件还是逻辑 7.条件 8.逻辑
	 * @param condSqlDesc //条件描述
	 * @param callBack //回调函数
	 */
    closedFlag:"",
	ruleSqlDesc:"",
	condSqlDesc:"",
	ruleDialog:$.ligerDialog,
	callBack:function(){},
	doClose:function(){
		if(this.closedFlag=="" || this.closedFlag == "0"){
	       	this.ruleDialog.hide();
    		return false;
    	}
    	$.ajax({
    		type:"post",
    		url:"/xbuilderoracle/lable/sql/parser.e",
    		data:{"sqlDesc":conditionObj.ruleSqlDesc},
    		cache:false,
    		async:false,
    		dataType:"json",
    		success:function(data) {
    			if(data.status == "success") {
    				conditionObj.callBack(data.msg,conditionObj.ruleSqlDesc,conditionObj.condSqlDesc);
        			conditionObj.ruleDialog.hide();
    			} else {
    				$.ligerDialog.error(data.msg);
    			}
    		}
    	});
	},
	setCond:function(ruleType,varType,condSqlDesc,typeflag,resType,callBack){
		conditionObj.callBack = callBack;
		typeflag = typeflag!=null?typeflag:"";
		this.ruleDialog.open({
            height:560,
            width: 850,
            title : "条件设置",
            url: "/xbuilderoracle/lable/index.e?conditionFlag=1", 
//            url: "http://clyxys.bonc.yz/epmwxwl/condFunc/tagconditionJsp/"+ruleType,
 //           url: "http://127.0.0.1:8080/epmwxwl/condFunc/tagconditionJsp/"+ruleType,
            showMax: false,
            showToggle: true,
            showMin: false,
            isResize: true,
            slide: false,
            modal: true,
            data: {
            	conditionInfo:condSqlDesc,
                typeflag:typeflag,
                varType:varType
            }
        });
	},
	taskCond:function(condsql,typeflag,resType,callBack){//typeflag: 0.移网 1宽带 2全网 -1 
		this.setCond("2",7,condsql,typeflag,resType,callBack);
	},
	personCond:function(condsql,resType,callBack){
		this.setCond("1",7,condsql,"-1",resType,callBack);
	},
	avgPersonCond:function(condsql,resType,callBack){
		this.setCond("1",8,condsql,"-1",resType,callBack);
	},
	avgTaskCond:function(condsql,resType,callBack){
		this.setCond("2",8,condsql,"-1",resType,callBack);
	}

};
