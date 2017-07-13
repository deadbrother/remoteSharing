<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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


<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'activity-step3.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
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
            <h4 style=" padding-right:px;text-align:right"><a href="javascript:void(0)">按照用户渠道偏好统计</a><a href="javascript:void(0)" class="linkrefsh"><i class="fa  fa-repeat" aria-hidden="true"></i></a></h4>                      
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
                      
                          <div class="ChannelOut_activity">
                              <h5>
                                  <input type="checkbox" name="" class="icheckS" value="" />
                                  <i class="fa fa-user-o" aria-hidden="true"></i>
                                  客户经理
                              </h5>
                              <div class="AreaIn" id="InNo1">
                          
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
                                 
                              </div>
                          </div>
                          <div class="ChannelOut_activity">
                              <h5>
                                  <input type="checkbox" name="" class="icheckS" value="" />
                                  <i class="fa fa-envelope-open-o" aria-hidden="true"></i>
                                  短信
                              </h5>
                              <div class="AreaIn" id="InNo2">
                         
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
                                  //短信结束
                              </div>
                          </div>
                          <div class="ChannelOut_activity">
                              <h5>
                                  <input type="checkbox" name="" class="icheckS" value="" />
                                  <i class="fa fa-commenting-o" aria-hidden="true"></i>
                                  微信公众号
                              </h5>
                              <div class="AreaIn" id="InNo3">
                                 
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
                          
                              </div>
                          </div>
                          <div class="ChannelOut_activity">
                              <h5>
                                  <input type="checkbox" name="" class="icheckS" value="" />
                                  <i class="fa fa-newspaper-o" aria-hidden="true"></i>
                                  弹窗
                              </h5>
                              <div class="AreaIn" id="InNo4">
         
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
                                 
                              </div>
                          <div class="ChannelOut_activity">
                              <h5>
                                  <input type="checkbox" name="" class="icheckS" value="" />
                                  <i class="fa fa-television" aria-hidden="true"></i>
                                  网厅
                              </h5>
                              <div class="AreaIn" id="InNo5">
        
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
                     
                              </div>
                          </div>
                          <div class="ChannelOut_activity">
                              <h5>
                                  <input type="checkbox" name="" class="icheckS" value=""  />
                                  <i class="fa fa-tablet" aria-hidden="true"></i>
                                  手厅
                              </h5>
                              <div class="AreaIn" id="InNo6">
                     
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
                       
                              </div>
                          </div>
                          <div class="ChannelOut_activity">
                              <h5>
                                  <input type="checkbox" name="" class="icheckS" value=""  />
                                  <i class="fa fa-sticky-note-o" aria-hidden="true"></i>
                                  沃视窗
                              </h5>
                              <div class="AreaIn" id="InNo7">
                  
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
第一部分
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
    //第一部分结束
    //第二部分
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
 
</div>
</div>
<script type="text/javascript">

    $("#advancedActivityBtn").click(function(){
    $("#advancedActivity").toggle();
    });
  
</script>
  </body>
</html>
