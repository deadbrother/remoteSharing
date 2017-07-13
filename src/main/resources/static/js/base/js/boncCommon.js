$(function(){

    //icheck模拟单选多选
    $('input.icheckS').iCheck({
        labelHover : false,
        cursor : true,
        checkboxClass : 'icheckbox_square-blue',
        radioClass : 'iradio_square-blue',
        increaseArea : '20%'
    });

    //bootstrap气泡弹出层
     $("[data-toggle='tooltip']").tooltip();

    //icheck indexActivity.html隐藏处
        $(".ChannelOut input.icheckS").iCheck({
            labelHover : false,
            cursor : true,
            checkboxClass : 'icheckbox_square-blue',
            radioClass : 'iradio_square-blue',
            increaseArea : '20%'
        }).on('ifChecked', function(event){
            //选中时要做的事
            $(".mon").removeClass("showInput");
        }).on('ifUnchecked', function(event){
            //取消选中时要做的事
            $(".mon").addClass("showInput");
        });

    //icheck advancedActivity.html隐藏处
        $('.li1.toggole input.icheckS').iCheck({
            labelHover : false,
            cursor : true,
            checkboxClass : 'icheckbox_square-blue',
            radioClass : 'iradio_square-blue',
            increaseArea : '20%'
        }).on('ifChecked', function(event){
            $("#explainTable").show();
        }).on('ifUnchecked', function(event){
            $("#explainTable").hide();
        });

    //各渠道指标块
    $(function(){
        var $indexBlockList =$(".IndexBlock_activity ol li");
        $indexBlockList.eq(0).addClass("first-child");//各渠道指标总和样式，读取顺序勿动
        var $firstBlockWidth = $indexBlockList.eq(0).width()+14;
        var $lt3BlockWidth = $(".IndexBlock_activity").width()-$firstBlockWidth-13;
        $(".IndexBlock_activity h4").css("padding-left",$firstBlockWidth); //各渠道指标块自适应 副标题位置
        $(".IndexBlock_activity li:lt(4)").not($indexBlockList.eq(0)).css("width",$lt3BlockWidth/3); //第一排渠道指标块自适应
        $(".IndexBlock_activity ol li:gt(3)").addClass("wAuto");//第二排或更多渠道指标块自适应
        $indexBlockList.each(function(index, obj){
            $(this).addClass('ColorNo0'+(index+1));//渠道指标块颜色追加class类
        });
    });
    //各渠道块内容
        $(".ChannelOut_activity").eq(0).css("margin-top", "16px");//第一个渠道内容给出间距
        $(".ChannelOut_activity .AreaIn").hide();//默认所有渠道块隐藏
        //$(".ChannelOut_activity h5:gt(1)").addClass("unbordered");//渠道块头部线处理
        $(".ChannelOut_activity h5:last").removeClass("unbordered");
        $(".ChannelOut_activity h5").each(function(index, obj){
            $(this).addClass('ColorNo0'+(index+1));//各渠道内容追加class类
        });
        $('.ChannelOut_activity input.icheckS').iCheck({
            labelHover : false,
            cursor : true,
            checkboxClass : 'icheckbox_square-blue',
            radioClass : 'iradio_square-blue',
            increaseArea : '20%'
        }).on('ifChecked', function(event){
            $(this).parents("h5").siblings(".AreaIn").slideDown(100);
            $(this).parents("h5").removeClass("unbordered");
        }).on('ifUnchecked', function(event){
            $(this).parents("h5").siblings(".AreaIn").slideUp(200);
            $(this).parents("h5").addClass("unbordered");
        });//选中后显示渠道快
});