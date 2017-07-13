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

<body>

<table class="activeLayout">
        <colgroup>
            <col width="125px" />
            <col width="*" />
            <col width="*" />
            <col width="*" />
        </colgroup>
        <tr>
            <th></th>
            <td colspan="3">
               <ul>
                   <li>
                       <input type="radio" name="activ" class="icheckS" value="" checked/>执行活动
                       <i class="fa fa-question-circle-o" aria-hidden="true" data-toggle="tooltip" data-placement="right" title="执行活动提示"></i>
                   </li>
                   <li>
                       <input type="radio" name="activ" class="icheckS" value="" />仅下发活动
                       <i class="fa fa-question-circle-o" aria-hidden="true" data-toggle="tooltip" data-placement="right" title="仅下发活动提示"></i>
                   </li>
               </ul>
            </td>
        </tr>
        <tr>
            <th>活动类型</th>
            <td colspan="4">
                <ul class="inputUl">
                   <li style="margin-right:58px;"><input type="radio" name="time" class="icheckS" value="" checked />一次性</li>
                   <li class="ChannelOut"><input type="radio" name="time" class="icheckS" value=""  />周期</li>
                    <li class="showInput mon"><input type="radio" name="day" class="icheckS" value="" />按月刷新</li>
                   <li class="showInput mon"><input type="radio" name="day" class="icheckS " value="" />按日刷新</li>
                </ul>
            </td>
        </tr>
        <tr>
            <th>
                <span>*</span>活动名称
            </th>
            <td colspan="4">
                <input type="text" class="form-control" id="inputEmail3" placeholder="">
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
   </body>