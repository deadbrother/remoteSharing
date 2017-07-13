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
<link href="js/activity/epm-ui.css" rel="stylesheet" type="text/css" />
<body>
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
<!--     弹出框结束 -->
    <div class="activediv"></div>
  <!--   //第二个表格结束 -->
    </body>