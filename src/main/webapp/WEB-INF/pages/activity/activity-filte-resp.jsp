<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="head-js-css.jsp"%>
<c:choose>
<c:when test="${isRespFileSuccess=='1'}">
	<h3 style="position: absolute; left: 42%;top: 12%;">导入结果</h3>
	<table id="hideTable" class="table table-bordered"
		style="width: 500px; left: 30%; top:20%; position: absolute;">
		<thead>
			<tr class="active">
				<th style="width: 10%;">成功导入</th>
				<th style="width: 10%;">失败导入</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><span>人数 :</span>${correctCount }<a id="sucNum"
					style="cursor:pointer"></a></td>
				<td><span>人数 :</span>${errorCount}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:if
						test="${errorCount!=0}">
						<a id="failNum" style="cursor:pointer"
							href="../filte/downloadResp">下载查看失败数据</a>
					</c:if></td>
			</tr>
		</tbody>
	</table>
	<a id="backList" class="slds-button slds-button--brand" type="primary"
		style="position: absolute;left: 58%;top: 40%;" href="../filte/list">
		<span style="color:white"
		class="epm-icon glyphicon glyphicon-chevron-left"></span>&nbsp;返回
	</a>
	</c:when>
	<c:when test="${isRespFileSuccess=='0'}">
	          <h3 style="position: absolute; left:44%;top: 12%;">导入结果</h3>
	<table id="hideTable" class="table table-bordered"
		style="width: 500px; left: 30%; top:20%; position: absolute;">
		<thead>
			<tr class="active">
				<th style="width: 10%;text-align: center;">失败导入</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><span style="color: red;">文件上传失败,记录最多可以有两万条数据,允许一个sheet，否则上传失败</span></td>
				
			</tr>
		</tbody>
	</table>
	<a id="backList" class="slds-button slds-button--brand" type="primary"
		style="position: absolute;left: 58%;top: 40%;" href="../filte/list">
		<span style="color:white"
		class="epm-icon glyphicon glyphicon-chevron-left"></span>&nbsp;返回
	</a>
	</c:when>
</c:choose>