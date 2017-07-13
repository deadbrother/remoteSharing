<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'activity-step-add.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<%@ taglib prefix="b" uri="/bonc-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="js/lib/jquery/jquery.min.js" type="text/javascript"></script>
<script src="js/lib/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="js/lib/bootstrap/js/npm.js" type="text/javascript"></script>
<script src="js/lib/icheck/icheck.min.js" type="text/javascript"></script>
<script src="js/lib/swiper/dist/idangerous.swiper.min.js" type="text/javascript"></script>
<script src="js/base/js/boncCommon.js" type="text/javascript"></script>
<link href="js/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="js/lib/fontawesome/boncFont.css" rel="stylesheet" type="text/css" />
<link href="js/lib/easyui/themes/metro/easyui.css" rel="stylesheet" type="text/css" />
<link href="js/base/css/boncBase@links.css" rel="stylesheet" type="text/css" />
<link href="js/lib/icheck/icheck.css" rel="stylesheet" type="text/css" />
<link href="js/activity/epm-ui.css" rel="stylesheet" type="text/css" />
  </head>

  <body>
  <div>
<h2 class="activity">活动策划</h2>
<div class="activitySetArea">
 <!-- 第一个表格部分-->
    <table class="activeLayout">
        <colgroup>
            <col width="125px" />
            <col width="*" />
            <col width="*" />
            <col width="*" />
        </colgroup>
         <input type="hidden" name="saveType" value="${bo.saveType }"/>
         <input type="hidden" name="po.activityId" value="${bo.po.activityId }"/>
        <tr>
            <th></th>
            <td colspan="3">
               <ul>
                   <li>
                       <input type="radio" name="po.activityFunction" class="icheckS" value="${bo.activityBasicInfo.ACTIVITYFUNCTION}" ${activityBasicInfo.ACTIVITYFUNCTION==1||bo.activityBasicInfo.ACTIVITYFUNCTION==null?'checked':''} />执行活动
                       <i class="fa fa-question-circle-o" aria-hidden="true" data-toggle="tooltip" data-placement="right" title="执行活动提示"></i>
                   </li>
                   <li>
                       <input type="radio" name="po.activityFunction" class="icheckS" value="" ${bo.activityBasicInfo.ACTIVITYFUNCTION==2?'checked':''}/>仅下发活动
                       <i class="fa fa-question-circle-o" aria-hidden="true" data-toggle="tooltip" data-placement="right" title="仅下发活动提示"></i>
                   </li>
               </ul>
            </td>
        </tr>
        <tr>
            <th>活动类型</th>
            <td colspan="4">
                <ul class="inputUl">
                   <li style="margin-right:58px;"><input type="radio" name="po.activityCycle" class="icheckS" value="3" ${bo.activityBasicInfo.ACTIVITYCYCLE==3||bo.activityBasicInfo.ACTIVITYCYCLE==null?'checked':''}/>一次性</li>
                   <li class="ChannelOut"><input type="radio" name="po.activityCycle" class="icheckS" value=""  />周期</li>
                    <li class="showInput mon"><input type="radio" name="po.activityCycle" class="icheckS" value="1" ${bo.activityBasicInfo.ACTIVITYCYCLE==1?'checked':''}/>按月刷新</li>
                   <li class="showInput mon"><input type="radio" name="po.activityCycle" class="icheckS " value="2" ${bo.activityBasicInfo.ACTIVITYCYCLE==2?'checked':''}/>按日刷新</li>
                </ul>
            </td>
        </tr>
        <tr>
            <th>
                <span>*</span>活动名称
            </th>
            <td colspan="4">
                <input type="text" name="po.activityName" class="form-control" id="inputEmail3" value="${bo.activityBasicInfo.ACTIVITYNAME }" placeholder="">
            </td>
            <td></td>
        </tr>
        <tr>
            <th>
                <span>*</span>活动主题
            </th>
            <td colspan="4">
                <select class="form-control">
                    <option>请选择</option>
                </select>
            </td>
            <td></td>
        </tr>
        <tr>
            <th>
                <span>*</span>适用范围
            </th>
            <td colspan="4">
                <input type="text" class="form-control" id="inputEmail4" placeholder="" >
            </td>
            <td class="iconleft"><i class="fa fa-question-circle-o" aria-hidden="true" data-toggle="tooltip" data-placement="right" title="使用范围提示"></i></td>
        </tr>
        <tr>
            <th>开始时间 </th>
            <td>
                <input type="date" class="form-control" id="inputEmail6" placeholder="">
            </td>
            <td class="iconleft"><i class="fa fa-question-circle-o" aria-hidden="true" data-toggle="tooltip" data-placement="right" title="不填，默认当天"></i></td>
            <th>结束时间</th>
            <td>
                <input type="date" class="form-control" id="inputEmail5" placeholder="">
            </td>
            <td class="iconleft"><i class="fa fa-question-circle-o" aria-hidden="true" data-toggle="tooltip" data-placement="right" title="结束时间不填,周期的默认一直循环,一次性的默认"></i></td>
        </tr>
        <tr>
            <th>
                活动说明
            </th>
            <td colspan="4">
                <textarea class="form-control" rows="3"></textarea>
            </td>
            <td></td>
        </tr>
    </table>
   <div class="activediv"></div>
    <!-- //第一个表格结束 -->
    <!-- 第二个表格-->
    <table class="activeLayout">
        <colgroup>
            <col width="125px" />
            <col width="*" />
            <col width="*" />
            <col width="*" />
        </colgroup>
        <tr>
            <th>
                <span>*</span>目标客户
            </th>
            <td>
                  <input type="text" class="form-control" id="inputEmail8" placeholder="">
            </td>
            <th>
                <span class="people">用户数：</span>
                <span class="num">23456</span>
            </th>
            <td class="fr">
                <button type="button" class="btn btn-primary user" data-toggle="modal" data-target="#myModal">选择用户群</button>
            </td>
        </tr>
        <tr>
            <th>是否删除黑名单</th>
            <td>
                <ul>
                    <li class="li1"><input type="radio" name="dele1" class="icheckS" value="" checked />是</li>
                    <li class="li2"><input type="radio" name="dele1" class="icheckS" value="" />否</li>
                </ul>
            </td>
            <th >是否删除黑名单</th>
            <td>
                <ul>
                    <li class="li1"><input type="radio" name="delete" class="icheckS" value="" checked />是</li>
                    <li class="li2"><input type="radio" name="delete" class="icheckS" value=""  />否</li>
                </ul>
            </td>
        </tr>
        <tr>
            <th>成功标准类型</th>
            <td>
                <select class="form-control">
                    <option>请选择</option>
                </select>

            </td>
            <th>匹配类型</th>
            <td>
                <ul>
                    <li style="margin-right: 14px;"> <input type="radio" name="same" class="icheckS" value="" />全不匹配</li>
                    <li class="li2"><input type="radio" name="same" class="icheckS" value="" checked />精确匹配</li>
                </ul>
            </td>
        </tr>
        <tr>
            <th>
                附加成功判断条件
            </th>
            <td colspan="3">
                  <input type="text" class="form-control ktext" id="inputEmail9" placeholder="">
                <button type="button" class="btn btn-primary term " >条件</button>
            <td class="iconleft"> <i class="fa fa-question-circle-o" aria-hidden="true" data-toggle="tooltip" data-placement="right" title="增加其他附加条件,与成功标准类型组合判断成功与否"></i></td>
        </tr>
        <tr>
            <th>
                奖励描述
            </th>
            <td colspan="3">
                <input type="text" class="form-control" id="inputEmail10" placeholder="">
            </td>
            <td class="iconleft"> <i class="fa fa-question-circle-o" aria-hidden="true" data-toggle="tooltip" data-placement="right" title="本活动的奖励描述,执行页面可以展示"></i></td>
        </tr>
        <tr>
            <th>策略描述</th>
            <td colspan="3">
                <textarea class="form-control" rows="3"></textarea>
            </td>
            <td class="iconleft"><i class="fa fa-question-circle-o" aria-hidden="true" data-toggle="tooltip" data-placement="right" title="策略描述,根据成功标准自动生成"></i></td>
        </tr>
    </table>
    <!-- 弹出框-->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title" id="myModalLabel"><input type="text" class="form-control manInput" placeholder="请输入用户群名称" ><button type="button" class="btn btn-primary term " >查询</button></h4>
                </div>
                <table class="ac">
                    <colgroup>
                        <col width="25%"/>
                        <col width="10%"/>
                        <col width="30%"/>
                        <col width="20%"/>
                        <col width="15%"/>
                    </colgroup>
                    <tr class="ar">
                        <th>用户群名称</th>
                        <th>用户群数</th>
                        <th>用户群条件</th>
                        <th>创建人</th>
                        <th>创建时间</th>
                    </tr>
                    <tr>
                      <td>郑州宽带用户</td>
                      <td>234,523</td>
                      <td>查询条件</td>
                      <td>市场部-杨艳</td>
                      <td>2016-10-20</td>
                   </tr>
                    <tr>
                        <td>开封宽带用户</td>
                        <td>234,523</td>
                        <td>查询条件</td>
                        <td>市场部-杨艳</td>
                        <td>2016-10-20</td>
                    </tr>
                    <tr>
                        <td>开封在网用户</td>
                        <td>234,523</td>
                        <td>查询条件</td>
                        <td>市场部-杨艳</td>
                        <td>2016-10-20</td>
                    </tr>
                    <tr>
                        <td>老用户价值提升推荐流量包</td>
                        <td>234,523</td>
                        <td>查询条件</td>
                        <td>市场部-杨艳</td>
                        <td>2016-10-20</td>
                    </tr>
                    <tr>
                        <td>y6y6(已拆分)</td>
                        <td>,1234,523</td>
                        <td>查询条件</td>
                        <td>市场部-杨艳</td>
                        <td>2016-10-20</td>
                    </tr>
                </table>

            </div>
        </div>
    </div>
    <!--// 弹出框结束-->
    <div class="activediv"></div>
    <!-- //第二个表格结束 -->
    <!-- 渠道触点 -->
      <div class="manager">
          <table style="width:730px;">
              <colgroup>
                  <col width="125px" />
                  <col width="*" />
              </colgroup>
              <tr>
                  <th style="text-align: right; padding-right:10px; padding-top:20px; vertical-align: top;">渠道触点</th>
                  <td>
                      <div class="IndexBlock_activity">
                          <!--各渠道指标-->
                          <h4 style=" padding-right:0px;text-align:right"><a href="javascript:void(0)">按照用户渠道偏好统计</a><a href="javascript:void(0)" class="linkrefsh"><i class="fa  fa-repeat" aria-hidden="true"></i></a></h4>                      
                          <ol>
                              <li>
                                  <a href="javascript:void(0)">
                                      <strong>1362200 <sub>户</sub></strong>
                                      <em>目标用户总数</em>
                                  </a>
                              </li>
                              <li>
                                  <a href="javascript:void(0)" >
                                      <strong>1600 <sub>户</sub></strong>
                                      <em>客户经理</em>
                                  </a>
                              </li>
                              <li>
                                  <a href="javascript:void(0)" >
                                      <strong>6000 <sub>户</sub></strong>
                                      <em>短信</em>
                                  </a>
                              </li>
                              <li>
                                  <a href="javascript:void(0)" >
                                      <strong>3000 <sub>户</sub></strong>
                                      <em>微信公众号</em>
                                  </a>
                              </li>
                              <li>
                                  <a href="javascript:void(0)" >
                                      <strong>333000 <sub>户</sub></strong>
                                      <em>弹窗</em>
                                  </a>
                              </li>
                              <li>
                                  <a href="javascript:void(0)" >
                                      <strong>3000 <sub>户</sub></strong>
                                      <em>网厅</em>
                                  </a>
                              </li>
                              <li>
                                  <a href="javascript:void(0)" >
                                      <strong>2600 <sub>户</sub></strong>
                                      <em>手厅</em>
                                  </a>
                              </li>
                              <li>
                                  <a href="javascript:void(0)" >
                                      <strong>1000 <sub>户</sub></strong>
                                      <em>沃视窗</em>
                                  </a>
                              </li>
                          </ol>
                          <!--//各渠道指标-->
                          <div class="ChannelOut_activity">
                              <h5>
                                  <input type="checkbox" name="" class="icheckS" value="" />
                                  <i class="fa fa-user-o" aria-hidden="true"></i>
                                  客户经理
                              </h5>
                              <div class="AreaIn" id="InNo1">
                                  <!-- 客户经理 -->
                                  <table class="managerTable">
                                      <colgroup>
                                          <col width="20%"/>
                                          <col width="20%"/>
                                          <col width="35%"/>
                                          <col width="10%"/>
                                      </colgroup>
                                      <tr>
                                          <td class="ar">客户经理</td>
                                          <td class="ar" colspan="3">当前目标用户数：<span class="grayRed"  style="font-weight: 700">2099</span></td>
                                      </tr>
                                      <tr>
                                          <td class="ar">是否需要删选数据</td>
                                          <td>
                                              <ul>
                                                  <li class="li3"><input type="radio" name="numed1" class="icheckS" value="" />是</li>
                                                  <li class="li2"><input type="radio" name="numed1" class="icheckS" value="" checked />否</li>
                                              </ul>
                                          </td>
                                          <td>
                                              筛选数据条件
                                              <input type="text" class="form-control manInput" placeholder="" >
                                          </td>
                                          <td>
                                              <button type="button" class="btn btn-primary term " >条件</button>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td class="ar">营销话术</td>
                                          <td colspan="3">
                                              <textarea class="form-control" rows="3"></textarea>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td class="ar">是否能发送短信</td>
                                          <td>
                                              <ul>
                                                  <li class="li3">  <input type="radio" name="message" class="icheckS" value="" />是</li>
                                                  <li class="li2"><input type="radio" name="message" class="icheckS" value="" checked />否</li>
                                              </ul>
                                          </td>
                                          <td colspan="2">
                                              <textarea class="form-control" rows="3"></textarea>
                                          </td>

                                      </tr>
                                      <tr>
                                          <td class="ar">工单下发规则</td>
                                          <td colspan="2">
                                              <select class="form-control">
                                                  <option>请选择</option>
                                              </select>
                                          </td>
                                          <td class="ar">
                                              <button type="button" class="btn btn-primary term " >增加规则</button>
                                          </td>
                                      </tr>
                                  </table>
                                  <!-- //客户经理结束 -->
                              </div>
                          </div>
                          <div class="ChannelOut_activity">
                              <h5>
                                  <input type="checkbox" name="" class="icheckS" value="" />
                                  <i class="fa fa-envelope-open-o" aria-hidden="true"></i>
                                  短信
                              </h5>
                              <div class="AreaIn" id="InNo2">
                                  <!-- 短信 -->
                                  <table class="managerTable">
                                      <colgroup>
                                          <col width="20%"/>
                                          <col width="20%"/>
                                          <col width="35%"/>
                                          <col width="10%"/>
                                      </colgroup>
                                      <tr>
                                          <td class="ar">短信</td>
                                          <td class="ar" colspan="3">当前目标用户数：<span class="grayRed"  style="font-weight: 700">2099</span></td>
                                      </tr>
                                      <tr>
                                          <td class="ar">是否需要删选数据</td>
                                          <td>
                                              <ul>
                                                  <li class="li3"><input type="radio" name="numed" class="icheckS" value="" />是</li>
                                                  <li class="li2"><input type="radio" name="numed" class="icheckS" value="" checked />否</li>
                                              </ul>
                                          </td>
                                          <td>
                                              筛选数据条件
                                              <input type="text" class="form-control manInput" placeholder="" >
                                          </td>
                                          <td>
                                              <button type="button" class="btn btn-primary term " >条件</button>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td class="ar">模板参数</td>
                                          <td colspan="3">
                                              年：*YEAR*    月：*MONTH*      日：*DAY*    套内流量*TNLL*
                                          </td>

                                      </tr>
                                      <tr>
                                          <td class="ar">发送内容</td>
                                          <td colspan="3">
                                              <textarea class="form-control" rows="3"></textarea>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td class="ar">测试号码</td>
                                          <td colspan="2">
                                              <input type="text" class="form-control" placeholder="测试号码" >
                                          </td>
                                          <td class="ar">
                                              <button type="button" class="btn btn-primary term " >发送测试</button>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td class="ar">合成短连接工具</td>
                                      </tr>
                                      <tr>
                                          <td></td>
                                          <td colspan="2">
                                              原地址：
                                              <input type="text" class="form-control manInput" placeholder="" >
                                              <button type="button" class="btn btn-primary term " >合成</button>
                                              <i class="fa fa-question-circle-o" aria-hidden="true" data-toggle="tooltip" data-placement="right" title="自定义：不使用统一设置，重新定义接触频次"></i>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td></td>
                                          <td colspan="2">
                                              短链接：<input type="text" class="form-control manInput" placeholder=" " >
                                              <i class="fa fa-question-circle-o" aria-hidden="true" data-toggle="tooltip" data-placement="right" title="自定义：不使用统一设置，重新定义接触频次"></i>
                                          </td>
                                      </tr>
                                  </table>
                                  <!-- //短信结束 -->
                              </div>
                          </div>
                          <div class="ChannelOut_activity">
                              <h5>
                                  <input type="checkbox" name="" class="icheckS" value="" />
                                  <i class="fa fa-commenting-o" aria-hidden="true"></i>
                                  微信公众号
                              </h5>
                              <div class="AreaIn" id="InNo3">
                                  <!-- 微信 -->
                                  <table class="managerTable">
                                      <colgroup>
                                          <col width="20%"/>
                                          <col width="80%"/>
                                      </colgroup>
                                      <tr>
                                          <td class="ar">
                                              <span>*</span>标题
                                          </td>
                                          <td><input type="text" class="form-control" placeholder="" ></td>
                                      </tr>
                                      <tr>
                                          <td class="ar">
                                              <span>*</span>网址
                                          </td>
                                          <td><input type="url" class="form-control" placeholder="请输入网址" ></td>
                                      </tr>
                                      <tr>
                                          <td class="ar">
                                              <span>*</span>话术
                                          </td>
                                          <td><textarea class="form-control" rows="3"></textarea></td>
                                      </tr>
                                  </table>
                                  <!-- //微信结束 -->
                              </div>
                          </div>
                          <div class="ChannelOut_activity">
                              <h5>
                                  <input type="checkbox" name="" class="icheckS" value="" />
                                  <i class="fa fa-newspaper-o" aria-hidden="true"></i>
                                  弹窗
                              </h5>
                              <div class="AreaIn" id="InNo4">
                                  <!-- 弹窗 -->
                                  <div class="windowDiv">
                                      <ul class="nav nav-tabs " role="tablist" id="myTab">
                                          <li role="presentation"  class="active"><a href="#home" role="tab" data-toggle="tab">自有营业厅</a></li>
                                          <li role="presentation"><a href="#profile" role="tab" data-toggle="tab">社会营业厅</a></li>
                                      </ul>
                                      <div class="tab-content">
                                          <div role="tabpanel" class="tab-pane active" id="home">
                                              <table class="managerTable">
                                                  <colgroup>
                                                      <col width="20%"/>
                                                      <col width="60%"/>
                                                      <col width="20%"/>
                                                  </colgroup>
                                                  <tr>
                                                  <tr>
                                                      <td class="ar">
                                                          渠道生效
                                                      </td>
                                                      <td> <input type="checkbox" name="activ" class="icheckS" value="" checked/>点选生效</td>
                                                  </tr>
                                                  <tr>
                                                      <td  class="ar">
                                                          单每户每日
                                                      </td>
                                                      <td colspan="2"><input type="number" class="form-control" placeholder="" min="1" max="100" ></td>
                                                  </tr>
                                                  <tr>
                                                      <td  class="ar">
                                                          弹出次数限制
                                                      </td>
                                                      <td colspan="2"><input type="number" class="form-control" placeholder="" min="1" max="100" ></td>
                                                  </tr>
                                                  <tr>
                                                      <td class="ar">
                                                          目标
                                                      </td>
                                                      <td colspan="2"><input type="number" class="form-control" placeholder="" min="1" max="100" ></td>
                                                  </tr>
                                                  <tr>
                                                      <td  class="ar">
                                                          话术
                                                      </td>
                                                      <td><textarea class="form-control" rows="3"></textarea></td>
                                                      <td>
                                                          <div class="textDiv">
                                                              <ul>
                                                                  <li>渠道偏好</li>
                                                                  <li>稳定度标签</li>
                                                                  <li>出账费用(元)</li>
                                                                  <li>合约到期时间</li>
                                                                  <li>合约类型</li>
                                                                  <li>地市</li>
                                                                  <li>省份</li>
                                                                  <li>产品分类</li>
                                                                  <li>服务类型</li>
                                                                  <li>费用类型</li>
                                                              </ul>
                                                          </div>
                                                      </td>
                                                  </tr>
                                              </table>
                                          </div>
                                      </div>
                                  </div>
                                  <!-- //弹窗结束 -->
                              </div>
                          <div class="ChannelOut_activity">
                              <h5>
                                  <input type="checkbox" name="" class="icheckS" value="" />
                                  <i class="fa fa-television" aria-hidden="true"></i>
                                  网厅
                              </h5>
                              <div class="AreaIn" id="InNo5">
                                  <!-- 网厅 -->
                                  <table class="managerTable">
                                      <colgroup>
                                          <col width="20%"/>
                                          <col width="80%"/>
                                      </colgroup>
                                      <tr>
                                          <td class="ar">
                                              <span>*</span>话术
                                          </td>
                                          <td><textarea class="form-control" rows="3"></textarea></td>
                                      </tr>
                                      <tr>
                                          <td class="ar">
                                              <span>*</span>标题
                                          </td>
                                          <td><input type="text" class="form-control" placeholder="" ></td>
                                      </tr>
                                      <tr>
                                          <td class="ar">
                                              <span>*</span>网址
                                          </td>
                                          <td><input type="text" class="form-control" placeholder="" ></td>
                                      </tr>
                                  </table>
                                  <!-- //网厅结束 -->
                              </div>
                          </div>
                          <div class="ChannelOut_activity">
                              <h5>
                                  <input type="checkbox" name="" class="icheckS" value=""  />
                                  <i class="fa fa-tablet" aria-hidden="true"></i>
                                  手厅
                              </h5>
                              <div class="AreaIn" id="InNo6">
                                  <!-- 手厅 -->
                                  <table class="managerTable">
                                      <colgroup>
                                          <col width="20%"/>
                                          <col width="80%"/>
                                      </colgroup>
                                      <tr>
                                          <td class="ar">
                                              <span>*</span>话术
                                          </td>
                                          <td><textarea class="form-control" rows="3"></textarea></td>
                                      </tr>
                                      <td class="ar">
                                          <span>*</span>标题
                                      </td>
                                      <td><input type="text" class="form-control" placeholder="" ></td>
                                      </tr>
                                      <tr>
                                          <td class="ar">
                                              <span>*</span>网址
                                          </td>
                                          <td><input type="url" class="form-control" placeholder="请输入网址" ></td>
                                      </tr>

                                  </table>
                                  <!-- //手厅结束 -->
                              </div>
                          </div>
                          <div class="ChannelOut_activity">
                              <h5>
                                  <input type="checkbox" name="" class="icheckS" value=""  />
                                  <i class="fa fa-sticky-note-o" aria-hidden="true"></i>
                                  沃视窗
                              </h5>
                              <div class="AreaIn" id="InNo7">
                                  <!-- 沃视厅 -->
                                  <table class="managerTable">
                                      <colgroup>
                                          <col width="20%"/>
                                          <col width="80%"/>
                                      </colgroup>
                                      <tr>
                                          <td class="ar">
                                              <span>*</span>话术
                                          </td>
                                          <td><textarea class="form-control" rows="3"></textarea></td>
                                      </tr>
                                      <tr>
                                          <td class="ar">
                                              <span>*</span>标题
                                          </td>
                                          <td><input type="text" class="form-control" placeholder="" ></td>
                                      </tr>
                                      <tr>
                                          <td class="ar">
                                              <span>*</span>网址
                                          </td>
                                          <td><input type="url" class="form-control" placeholder="请输入网址" ></td>
                                      </tr>
                                      <tr>
                                          <td class="ar">
                                              <span>*</span>图片网址
                                          </td>
                                          <td><input type="url" class="form-control" placeholder="" ></td>
                                      </tr>
                                      <tr>
                                          <td class="ar">
                                              <span>*</span>图片尺寸
                                          </td>
                                          <td>
                                              <select class="form-control">
                                                  <option>600*360</option>
                                              </select>
                                          </td>
                                      </tr>
                                  </table>
                                  <!-- //沃视厅结束 -->
                              </div>
                          </div>
                      </div>
</div>
                  </td>
              </tr>
          </table>
          </div>

          <button id="advancedActivityBtn" type="button" class="btn btn-primary fr" style="margin-top:10px;" data-toggle="modal" data-target="">高级模式</button>
     <div id="advancedActivity" style="display:none">
     <h2 class="activity">高级模式</h2>
<div class="activitySetArea">
<!-- 第一部分-->
    <h3 class="headList">活动信息扩展配置</h3>
    <table class="activeLayout">
        <colgroup>
            <col width="22%" />
            <col width="15%" />
            <col width="15%" />
        </colgroup>
        <tr>
            <th>活动优先级</th>
            <td colspan="2">
                <select class="form-control">
                    <option value="" >高</option>
                    <option value=""  selected>中</option>
                    <option value="" >低</option>
                </select>
            </td>
        </tr>
        <tr>
            <th>关联活动</th>
            <td colspan="2">
                <select class="form-control">
                    <option value="" >1</option>
                    <option value="" >2</option>
                    <option value="" >3</option>
                </select>
            </td>
        </tr>
        <tr>
            <th>所属政策</th>
            <td colspan="2">
                <select class="form-control">
                    <option value="" >1</option>
                    <option value="" >2</option>
                    <option value="" >3</option>
                </select>
            </td>
        </tr>
    </table>
    <!-- //第一部分结束 -->
    <!-- //第二部分-->
    <h3 class="headList">工单规则扩展配置</h3>
    <table class="activeLayout">
        <colgroup>
            <col width="22%" />
            <col width="25%" />
            <col width="25%" />
            <col width="28%" />
        </colgroup>
        <tr>
            <th class="whiteNormal">不同用户显示不同推荐信息说明</th>
            <td colspan="2">
                <form>
                <ul>
                    <li class="li1 toggole"><input  type="radio" onclick="getRadio()" name="userSelect" class="icheckS" value="是" />是</li>
                    <li class="li2"><input  type="radio" onclick="getRadio()"  name="userSelect" class="icheckS" value="否"  checked="checked"/>否
                        <i data-toggle="tooltip" data-placement="right" title="同一个活动，在执行页面不同用户展现不同的推荐信息" class="fa fa-question-circle-o" aria-hidden="true"></i>
                    </li>
                </ul>
                </form>
            </td>
        </tr>
        <tr style="display: none" id="explainTable">
            <th></th>
            <td colspan="3">
                <table class="explainTable">
                    <colgroup>
                        <col width="36px" />
                        <col width="15%" />
                        <col width="25%" />
                        <col width="6%" />
                        <col width="*" />
                        <col width="36px" />
                    </colgroup>
                    <thead>
                    <tr>
                        <th>序号</th>
                        <th>规则名称</th>
                        <th>数据条件</th>
                        <th>筛选后用户数</th>
                        <th>推荐信息</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>0</td>
                        <td>剩余用户数</td>
                        <td>以下筛选条件剩余用户数</td>
                        <td>0</td>
                        <td><input type="text" class="form-control tableInput" placeholder="引导用户打开网络"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td><input type="text" class="form-control tableInput" placeholder="规则一"></td>
                        <td>终端类型：4g终端；卡类型：uim卡；</td>
                        <td>2700</td>
                        <td><input type="text" class="form-control tableInput" placeholder="引导用户先换卡"></td>
                        <td><i class="fa fa-trash" aria-hidden="true"></i></td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td><input type="text" class="form-control tableInput" placeholder="规则二"></td>
                        <td>终端类型：4g终端；卡类型：sim卡；</td>
                        <td>4300</td>
                        <td><input type="text" class="form-control tableInput" placeholder="引导用户打开网络"></td>
                        <td><i class="fa fa-trash" aria-hidden="true"></i></td>
                    </tr>
                    </tbody>
                </table>
            </td>
        </tr>
        <tr>
            <th>工单生命周期</th>
            <td>
                <input class="form-control" placeholder="1" type="number"  min="1" max="100">
            </td>
            <td style="padding-left: 10px" >
                单位(月/日)
            </td>
            <td>
                <input  type="radio" name="" class="icheckS" value="" />
                是否参照活动结束时间
            </td>
        </tr>
        <tr>
            <th>工单更新规则</th>
            <td colspan="2">
                <form>
                    <ul>
                        <li class="li1"><input  type="radio"  name="updateRules" class="icheckS" value="" />追加
                            <i data-toggle="tooltip" data-placement="right" title="符合口径的新工单追加进来，现有工单不符合口径的注销" class="fa fa-question-circle-o" aria-hidden="true"></i>
                        </li>
                        <li class="li2"><input  type="radio"  name="updateRules" class="icheckS" value=""  checked="checked"/>覆盖
                            <i data-toggle="tooltip" data-placement="right" title="将原有用户工单未执行未成功的注销，生成新工单" class="fa fa-question-circle-o" aria-hidden="true"></i>
                        </li>
                    </ul>
                </form>
            </td>
        </tr>
    </table>
    <!-- //第二部分结束 -->
    <!-- //第三部分-->
    <h3 class="headList">渠道扩展配置</h3>
    <table class="activeLayout">
        <colgroup>
            <col width="125px" />
            <col width="30%" />
            <col width="*" />
            <col width="*" />
        </colgroup>
        <tr>
            <th>接触频次定义</th>
            <td>客户经理</td>
            <td colspan="2">
                <form>
                    <ul>
                        <li class="li1"><input  type="radio"  name="accountManager" class="icheckS" value="" checked />使用统一设置
                            <i data-toggle="tooltip" data-placement="right" title="使用统一设置：使用渠道总控设置里的接触频次" class="fa fa-question-circle-o" aria-hidden="true"></i>
                        </li>
                        <li class="li2"><input  type="radio"  name="accountManager" class="icheckS" value="" />自定义
                            <i data-toggle="tooltip" data-placement="right" title="自定义：不使用统一设置，重新定义接触频次" class="fa fa-question-circle-o" aria-hidden="true"></i>
                        </li>
                    </ul>
                </form>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>短信</td>
            <td colspan="2">
                <form>
                    <ul>
                        <li class="li1"><input  type="radio"  name="note" class="icheckS" value="" checked />使用统一设置
                            <i data-toggle="tooltip" data-placement="right" title="使用统一设置：使用渠道总控设置里的接触频次" class="fa fa-question-circle-o" aria-hidden="true"></i>
                        </li>
                        <li class="li2"><input  type="radio"  name="note" class="icheckS" value="" />自定义
                            <i data-toggle="tooltip" data-placement="right" title="自定义：不使用统一设置，重新定义接触频次" class="fa fa-question-circle-o" aria-hidden="true"></i>
                        </li>
                    </ul>
                </form>
            </td>
        </tr>
        <tr>
            <th class="whiteNormal">处于接触频次限制的目标客户处理方式</th>
            <td><a href="javasciprt:void(0)">查看限制用户数</a> </td>
            <td colspan="3">
                客户经理：100个 占总数3%；短信：50个 占总数1%
            </td>
        </tr>
        <tr>
            <th></th>
            <td>处理方式</td>
            <td colspan="3">
                <input  class="icheckS" type="radio" name=""  value="" checked="checked"/>
                不出工单
            </td>
        </tr>
        <tr>
            <th rowspan="3">渠道之间协同关系配置</th>
            <td>自动发送渠道关系配置（当微信与短信同时选择时）</td>
            <td colspan="3">
                <form>
                    <ul>
                        <li class="li4"><input  type="radio"  name="autoChannels" class="icheckS" value="" checked />各自发送可以重复
                        </li>
                        <li class="li2"><input  type="radio"  name="autoChannels" class="icheckS" value="" />短信微信互斥发送
                            <i data-toggle="tooltip" data-placement="right" title="先发送微信，其它用户发送短信" class="fa fa-question-circle-o" aria-hidden="true"></i>
                        </li>
                    </ul>
                </form>
            </td>
        </tr>
        <tr>
            <td >电子渠道关系配置（网厅、手厅、沃视窗、弹窗）</td>
            <td colspan="2">
                <form>
                    <ul>
                        <li class="li1">
                            <input  type="radio"  name="eleChannels" class="icheckS" value="" checked="checked"/>不互斥
                            <i data-toggle="tooltip" data-placement="right" title="不互斥：表示互不影响，每个渠道都可以展示一次" class="fa fa-question-circle-o" aria-hidden="true"></i>
                        </li>
                    </ul>
                </form>
            </td>
        </tr>
        <tr>
            <td>客户经理与弹窗是否互斥</td>
            <td colspan="2">
                <form>
                    <ul>
                        <li class="li1">
                            <input  type="radio"  name="consumerChannels" class="icheckS" value="" checked="checked"/>不互斥
                            <i data-toggle="tooltip" data-placement="right" title="不互斥表示都可以执行一次" class="fa fa-question-circle-o" aria-hidden="true"></i>
                        </li>
                        <li class="li2">
                            <input  type="radio"  name="consumerChannels" class="icheckS" value=""  />互斥
                            <i data-toggle="tooltip" data-placement="right" title="互斥表示客户经理与弹窗只执行一次" class="fa fa-question-circle-o" aria-hidden="true"></i>
                        </li>
                    </ul>
                </form>
            </td>
        </tr>
    </table>
    <!-- //第三部分结束 -->
</div>
     
     </div>
     
      </div>
    <!-- //渠道触点结束 -->
</div>
<script type="text/javascript">

    $("#advancedActivityBtn").click(function(){
    $("#advancedActivity").toggle();
    });
  
</script>

<!--<script type="text/javascript">
    //指标块与渠道块之间联动
    function expanDetail(indexDiv){
        $("#InNo"+indexDiv).slideDown(100, function(){
            $("#InNo"+indexDiv).siblings("h5").removeClass("unbordered");
            $("#InNo"+indexDiv).siblings("h5").find("input.icheckS").iCheck('check');
        });
    }
</script>-->
</div>
  </body>
</html>
