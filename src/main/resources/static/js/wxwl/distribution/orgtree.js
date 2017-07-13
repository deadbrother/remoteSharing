$(function(){
	
	$("#treetest").ligerGrid({
		columns: [
		          { display: '组织机构', type: 'String', align: 'center', name: 'orgName',render: function (item,rowindex){
		        	  var s= "";
			          s ="<div class='orgid' onmouseenter=\"RuleImplement.showCount('" + item.allocationall +"','" + item.allocationyes +"','" + item.allocationno +"')\" onmouseleave=\"RuleImplement.hideCount()\" >"+item.orgName+"</div>";
			          return s;
	          		  }
		          }], 
		url:'../distribution/treeList',
		checkbox:false,
		usePager:false,

		width:'40%',
		align:'center',
		tree:{
      	  columnId: 'orgName',
      	  idField: 'orgId',
      	  parentIDField: 'parenId',
      	  isParent: function (data)
      	  { 
      		  if (data.parenId==null) return true;
      		  var exist = 'parenId' in data;
      		  console.log(exist);
//      		  var isparent = ('true' == data.isparent);
//      		  if (!exist) return false;
//      		  if (exist) return true;
//      		  if (isparent) return true;
//      		  return false;
      	  },
      	  isExpand :function(){
      		  return false;
      	  }
        }
			
	});
	
	
});
var html = "";
var RuleImplement = {
		showCount:function(allocationall,allocationyes,allocationno){
			$(".showData").show();
			$(".showData").eq(0).text('用户数量:'+allocationall);
			$(".showData").eq(1).text('已划配:'+allocationyes);
			$(".showData").eq(2).text('未划配:'+allocationno);
		},
		hideCount:function(){
			$(".showData").hide();
			$(".showData").text();
		}
}
