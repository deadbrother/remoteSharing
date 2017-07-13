<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>测试</title>
</head>
<body>
</body>
</html>
<script type="text/javascript">
//layer弹窗
var dialogObj = parent.parent.conditionObj.dialog;
var condSql = "${condSql}";
var condResume = "${condResume}";
var condStatus = "${condStatus}";

var data = {};
data.msg = condSql;
data.condMemo = condResume;
data.status = condStatus;
dialogObj.set('data', data);
dialogObj.close();
</script>
