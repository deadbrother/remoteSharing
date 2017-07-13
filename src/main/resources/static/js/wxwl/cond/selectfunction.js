function saveCalculation(currnode){
    var targetobj,hiddenobj;
    if(currnode==null)
    	return;  
    targetobj = document.getElementById("calculation") ;
	hiddenobj = document.getElementById("formula") ;
	var id = currnode.id;
	switch (id){
		case "0":
			togglesParent("stepDark");
			hidesParent("stepBrilliant");
			targetobj.innerHTML="";
			document.getElementById("note").innerHTML="说明：数值函数";
			break;
		case "N_num0":
			targetobj.innerHTML = "Int(129.11) <br>返回结果为：129";
			hiddenobj.value = "取整";
			idstartStep(id);
			document.getElementById("note").innerHTML="说明：INT(数值表达式)";
			document.getElementById("explained").innerHTML="取整(数值表达式)";
			document.getElementById("id").value=id;
			break;
		case "N_num1_4":
			targetobj.innerHTML = "取余数(10, 3) <br>返回结果为: 1";
			hiddenobj.value = "取余数";
			idstartStep(id);
			document.getElementById("note").innerHTML="说明：FUNCMOD(数值表达式,数值表达式)";
			document.getElementById("explained").innerHTML="取余数(数值表达式,数值表达式)";
			document.getElementById("id").value=id;
			break;
		case "N_num2_2":
			targetobj.innerHTML = "Round(129.166,2) <br>返回结果为：129.17";
			hiddenobj.value = "四舍五入";
			idstartStep(id); 
			document.getElementById("decimalname").innerHTML="整数  ";
			document.getElementById("note").innerHTML="说明：ROUND(数值表达式,保留小数点位数)";
			document.getElementById("explained").innerHTML="四舍五入(数值表达式,保留小数点位数)";
			document.getElementById("id").value=id;
			break;
		case "N_num3":
			targetobj.innerHTML = "SANQI(129.34) <br>返回结果为：129.5";
			hiddenobj.value = "三舍七入";
			idstartStep(id);
			document.getElementById("note").innerHTML="说明：SANQI;三舍七入,其他为0.5";
			document.getElementById("explained").innerHTML="三舍七入(数值表达式)";
			document.getElementById("id").value=id;
			break;
		case "N_num4":
			targetobj.innerHTML = "YUAN(129.02) <br>返回结果为：130";
			hiddenobj.value = "逢分进元";
			idstartStep(id);
			document.getElementById("note").innerHTML="说明：YUAN";
			document.getElementById("explained").innerHTML="逢分进元(数值表达式)";
			document.getElementById("id").value=id;
			break;
		case "N_num5":
			targetobj.innerHTML = 'JIAO(129.11) <br>返回结果为：129.2"';
			hiddenobj.value = "逢分进角";
			idstartStep(id);
			document.getElementById("note").innerHTML="说明：JIAO(129.11) \n返回结果为：129.2";
			document.getElementById("explained").innerHTML="逢分进角(数值表达式)";
			document.getElementById("id").value=id;
			break;
		case "NN_num6":
			targetobj.innerHTML = '幂(3,2) <br>返回结果为：9<br>注意: 在进行N次方根的计算时,第二个参数可用小数或分数(1/n),在用分数时,应使用类似1.0/n的格式';
			hiddenobj.value = "幂(,)";
			idstartStep(id);
			document.getElementById("decimalname").innerHTML="次方";
			document.getElementById("note").innerHTML="说明：求底数的n次方";
			document.getElementById("explained").innerHTML="幂(数值表达式,数值表达式)";
			document.getElementById("id").value=id;
			break;
		case "1":
			togglesParent("stepDark");
			hidesParent("stepBrilliant");
			targetobj.innerHTML="";
			document.getElementById("note").innerHTML="说明：字符串函数";
			break;
		case "A_str0":
			targetobj.innerHTML = 'Trim("&nbsp;&nbsp;AbcD&nbsp;&nbsp;") <br>返回结果为："AbcD"';
			hiddenobj.value = "去空格";
			idstartStep(id);
			document.getElementById("strsubset").innerHTML="字符串表达式";
			document.getElementById("note").innerHTML="说明：Trim(字符串表达式)";
			document.getElementById("explained").innerHTML="去空格(字符串表达式)";
			document.getElementById("id").value=id;
			break;
		case "A_str1":
			targetobj.innerHTML = 'LTrim("&nbsp;&nbsp;AbcD&nbsp;&nbsp;") <br>返回结果为："AbcD&nbsp;&nbsp;"';
			hiddenobj.value = "去左空格";
			idstartStep(id);
			document.getElementById("strsubset").innerHTML="字符串表达式";
			document.getElementById("note").innerHTML="说明：LTRIM(字符串表达式)";
			document.getElementById("explained").innerHTML="去左空格(字符串表达式)";
			document.getElementById("id").value=id;
			break;
		case "A_str2":
			targetobj.innerHTML = 'RTrim("&nbsp;&nbsp;AbcD&nbsp;&nbsp;") <br>返回结果为："&nbsp;&nbsp;AbcD"';
			hiddenobj.value = "去右空格";
			idstartStep(id);
			document.getElementById("strsubset").innerHTML="字符串表达式";
			document.getElementById("note").innerHTML="说明：RTRIM(字符串表达式)";
			document.getElementById("explained").innerHTML="去右空格(字符串表达式)";
			document.getElementById("id").value=id;
			break;
		case "A_str3_2_2":
			targetobj.innerHTML = 'SubStr("AykchrbcD",2,5) <br>返回结果为："ykchr"';
			hiddenobj.value = "子串";
			idstartStep(id);
			document.getElementById("strsubset").innerHTML="字符串表达式";
			document.getElementById("decimalname").innerHTML="起&nbsp;&nbsp;&nbsp;&nbsp;始&nbsp;&nbsp;&nbsp;&nbsp;位  ";
			document.getElementById("note").innerHTML="说明：SUBSTR(字符串表达式,起始位,长度)";
			document.getElementById("explained").innerHTML="子串(字符串表达式,整数,整数)";
			document.getElementById("id").value=id;
			break;
		case "A_str4":
			targetobj.innerHTML = 'LEN("ykchrbcD") <br>返回结果为：8';
			hiddenobj.value = "串长";
			idstartStep(id);
			document.getElementById("strsubset").innerHTML="字符串表达式";
			document.getElementById("note").innerHTML="说明：LEN(字符串表达式)";
			document.getElementById("explained").innerHTML="串长(字符串表达式)";
			document.getElementById("id").value=id;
			break;
		case "A_str5_2":
			targetobj.innerHTML = 'Left("ykchrbcD",5) <br>返回结果为："ykchr"';
			hiddenobj.value = "左串";
			idstartStep(id);
			document.getElementById("strsubset").innerHTML="字符串表达式";
			document.getElementById("decimalname").innerHTML="长&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;度";
			document.getElementById("note").innerHTML="说明：LEFT(字符串表达式,长度)";
			document.getElementById("explained").innerHTML="左串(字符串表达式,长度)";
			document.getElementById("id").value=id;
			break;
		case "A_str6_2":
			targetobj.innerHTML = 'Right("Abcykchr",5) <br>返回结果为："ykchr"';
			hiddenobj.value = "右串";
			idstartStep(id);
			document.getElementById("strsubset").innerHTML="字符串表达式";
			document.getElementById("decimalname").innerHTML="长&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;度";
			document.getElementById("note").innerHTML="说明：RIGHT(字符串表达式,长度)";
			document.getElementById("explained").innerHTML="右串(字符串表达式,长度)";
			document.getElementById("id").value=id;
			break;
		case "AA_str7":
			targetobj.innerHTML = 'su(1) <br>返回结果为："su"';
			hiddenobj.value = "登录用户名()";
			idstartStep(id);
			document.getElementById("decimalname").innerHTML="次方";
			document.getElementById("note").innerHTML="说明：求登录用户名1(简写)|2(全称)";
			document.getElementById("explained").innerHTML="登录用户名(1(简写)|2(全称))";
			document.getElementById("id").value=id;
			break;
		case "2":
			togglesParent("stepDark");
			hidesParent("stepBrilliant");
			targetobj.innerHTML="";
			document.getElementById("note").innerHTML="说明：日期函数 ";
			break;
		case "D_data0":
			targetobj.innerHTML = 'Year(#1992.10.10#) <br>返回结果为：1992';
			hiddenobj.value = "年";
			idstartStep(id);
			document.getElementById("datesubset").innerHTML="日期表达式  ";
			document.getElementById("note").innerHTML="说明：YEAR(日期)：取日期的年";
			document.getElementById("explained").innerHTML="年(日期)";
			document.getElementById("id").value=id;
			break;
		case "D_data1":
			targetobj.innerHTML = 'Month(#1992.10.13#) <br>返回结果为：10';
			hiddenobj.value = "月";
			idstartStep(id);
			document.getElementById("datesubset").innerHTML="日期表达式  ";
			document.getElementById("note").innerHTML="说明：MONTH(日期)：取日期的月";
			document.getElementById("explained").innerHTML="月(日期)";
			document.getElementById("id").value=id;
			break;
		case "D_data2":
			targetobj.innerHTML = 'Day(#1992.10.11#) <br>返回结果为：11';
			hiddenobj.value = "日";
			idstartStep(id);
			document.getElementById("datesubset").innerHTML="日期表达式  ";
			document.getElementById("note").innerHTML="说明：DAY(日期)：取日期的日";
			document.getElementById("explained").innerHTML="日(日期)";
			document.getElementById("id").value=id;
			break;
		case "D_data3":
			targetobj.innerHTML = 'QUARTER(#1992.10.11#) <br>返回结果为：4';
			hiddenobj.value = "季度";
			idstartStep(id);
			document.getElementById("datesubset").innerHTML="日期表达式  ";
			document.getElementById("note").innerHTML="说明：QUARTER(日期)：取日期的季度";
			document.getElementById("explained").innerHTML="季度(日期)";
			document.getElementById("id").value=id;
			break;
		case "D_data4":
			targetobj.innerHTML = 'Week(#1992.1.9#) <br>返回结果为：2';
			hiddenobj.value = "周";
			idstartStep(id);
			document.getElementById("datesubset").innerHTML="日期表达式  ";
			document.getElementById("note").innerHTML="说明：WEEK(日期)：该日期为本年的第几周";
			document.getElementById("explained").innerHTML="周(日期)";
			document.getElementById("id").value=id;
			break;
		case "D_data5":
			targetobj.innerHTML = 'WEEKDAY(#1992.1.9#) <br>返回结果为：4';
			hiddenobj.value = "星期";
			idstartStep(id);
			document.getElementById("datesubset").innerHTML="日期表达式  ";
			document.getElementById("note").innerHTML="说明：WEEKDAY(日期)：该日期为星期几";
			document.getElementById("explained").innerHTML="星期(日期)";
			document.getElementById("id").value=id;
			break;
		case "DD_data6":
			targetobj.innerHTML = 'Today <br>返回结果为：#2007.06.26#';
			hiddenobj.value = "今天";
			idstartStep(id);
			document.getElementById("note").innerHTML="说明：TODAY 或 TODAY()";
			document.getElementById("id").value=id;
			break;
		case "DD_data7":
			targetobj.innerHTML = 'TOWEEK <br>返回结果为：当前系统时间的周数';
			hiddenobj.value = "本周";
			idstartStep(id);
			document.getElementById("note").innerHTML="说明：TOWEEK";
			document.getElementById("id").value=id;
			break;
		case "DD_data8":
			targetobj.innerHTML = 'TOMONTH <br>返回结果为：当前系统时间的月份';
			hiddenobj.value = "本月()";
			idstartStep(id);
			document.getElementById("note").innerHTML="说明：TOMONTH";
			document.getElementById("id").value=id;
			break;
		case "DD_data9":
			targetobj.innerHTML = 'TOQUARTER <br>返回结果为：当前系统时间的季度数';
			hiddenobj.value = "本季度()";
			idstartStep(id);
			document.getElementById("note").innerHTML="说明：TOQUARTER";
			document.getElementById("id").value=id;
			break;
		case "DD_data10":
			targetobj.innerHTML = 'TOYEAR <br>返回结果为：当前系统时间的年份';
			hiddenobj.value = "今年()";
			idstartStep(id);
			document.getElementById("note").innerHTML="说明：TOYEAR";
			document.getElementById("id").value=id;
			break;
		case "DD_data11":
			targetobj.innerHTML = 'APPDATE() <br>返回结果为：用户设置的计算截止日期';
			hiddenobj.value = "截止日期()";
			idstartStep(id);
			document.getElementById("note").innerHTML="说明：APPDATE";
			document.getElementById("id").value=id;
			break;
		case "DD_data11":
			targetobj.innerHTML = 'APPDATE() <br>返回结果为：用户设置的计算截止日期';
			hiddenobj.value = "截止日期()";
			idstartStep(id);
			document.getElementById("note").innerHTML="说明：APPDATE";
			document.getElementById("id").value=id;
			break;
		case "D_data12":
			targetobj.innerHTML = 'Age(#1992.7.12#) <br>返回结果为：计算到日的年龄';
			hiddenobj.value = "年龄";
			idstartStep(id);
			document.getElementById("datesubset").innerHTML="日期表达式  ";
			document.getElementById("note").innerHTML="说明：AGE(日期)：计算到日的年龄";
			document.getElementById("explained").innerHTML="年龄(日期)";
			document.getElementById("id").value=id;
			break;
		case "D_data13":
			targetobj.innerHTML = 'WorkAge(#1992.7.12#) <br>返回结果为：年份相减加1';
			hiddenobj.value = "工龄";
			idstartStep(id);
			document.getElementById("datesubset").innerHTML="日期表达式  ";
			document.getElementById("note").innerHTML="说明：WORKAGE(日期)：年份相减加1";
			document.getElementById("explained").innerHTML="工龄(日期)";
			document.getElementById("id").value=id;
			break;
		case "D_data14":
			targetobj.innerHTML = 'WMONTHAGE(#1992.7.12#) <br>返回结果为：计算到月的年龄';
			hiddenobj.value = "到月年龄";
			idstartStep(id);
			document.getElementById("datesubset").innerHTML="日期表达式";
			document.getElementById("note").innerHTML="说明：WMONTHAGE(日期)：计算到月的年龄";
			document.getElementById("explained").innerHTML="到月年龄(日期)";
			document.getElementById("id").value=id;
			break;
		case "D_data15_1":
			targetobj.innerHTML = 'Years(#2002.10.10#,#1992.7.12#) <br>返回结果为：两日期之间年数';
			hiddenobj.value = "年数";
			idstartStep(id);
			document.getElementById("datesubset").innerHTML="日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;期1  ";
			document.getElementById("datesubset1").innerHTML="日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;期2  ";
			document.getElementById("note").innerHTML="说明：YEARS(日期1,日期2)：从日期2到日期1的年数";
			document.getElementById("explained").innerHTML="年数(日期1,日期2)";
			document.getElementById("id").value=id;
			break;
		case "D_data16_1":
			targetobj.innerHTML = 'Months(#2002.10.10#,#1992.7.12#) <br>返回结果为：两日期之间月数';
			hiddenobj.value = "月数";
			idstartStep(id);
			document.getElementById("datesubset").innerHTML="日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;期1  ";
			document.getElementById("datesubset1").innerHTML="日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;期2  ";
			document.getElementById("note").innerHTML="说明：MONTHS(日期1,日期2)：从日期2到日期1的月数";
			document.getElementById("explained").innerHTML="月数(日期1,日期2)";
			document.getElementById("id").value=id;
			break;
		case "D_data17_1":
			targetobj.innerHTML = 'Days(#2002.10.10#,#1992.7.12#) <br>返回结果为：两日期之间天数';
			hiddenobj.value = "天数";
			idstartStep(id);
			document.getElementById("datesubset").innerHTML="日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;期1  ";
			document.getElementById("datesubset1").innerHTML="日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;期2  ";
			document.getElementById("note").innerHTML="说明：DAYS(日期1,日期2)：从日期2到日期1的天数";
			document.getElementById("explained").innerHTML="天数(日期1,日期2)";
			document.getElementById("id").value=id;
			break;
		case "D_data18_1":
			targetobj.innerHTML = 'QUARTERs(#1992.7.12#,#2002.10.10#) <br>返回结果为：两日期之间季度数';
			hiddenobj.value = "季度数";
			idstartStep(id);
			document.getElementById("datesubset").innerHTML="日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;期1  ";
			document.getElementById("datesubset1").innerHTML="日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;期2  ";
			document.getElementById("note").innerHTML="说明：QUARTERS(日期1,日期2)：从日期1到日期2的季度数";
			document.getElementById("explained").innerHTML="季度数(日期1,日期2)";
			document.getElementById("id").value=id;
			break;
		case "D_data19_1":
			targetobj.innerHTML = 'Weeks(#1992.7.12#,#2002.10.10#) <br>返回结果为：两日期之间周数';
			hiddenobj.value = "周数";
			idstartStep(id);
			document.getElementById("datesubset").innerHTML="日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;期1  ";
			document.getElementById("datesubset1").innerHTML="日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;期2  ";
			document.getElementById("note").innerHTML="说明：WEEKS(日期1,日期2)：从日期1到日期2的周数";
			document.getElementById("explained").innerHTML="周数(日期1,日期2)";
			document.getElementById("id").value=id;
			break;
		case "D_data20_2":
			targetobj.innerHTML = 'AddYear(#1992.7.12#,2) <br>返回结果为：日期';
			hiddenobj.value = "增加年数";
			idstartStep(id);
			document.getElementById("datesubset").innerHTML="日期表达式  ";
			document.getElementById("decimalname").innerHTML="整&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数  ";
			document.getElementById("note").innerHTML="说明：AddYear(日期,整数)";
			document.getElementById("explained").innerHTML="增加年数(日期,整数)";
			document.getElementById("id").value=id;
			break;
		case "D_data21_2":
			targetobj.innerHTML = 'AddMonth(#1992.7.12#,21) <br>返回结果为：日期';
			hiddenobj.value = "增加月数";
			idstartStep(id);
			document.getElementById("datesubset").innerHTML="日期表达式  ";
			document.getElementById("decimalname").innerHTML="整&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数  ";
			document.getElementById("note").innerHTML="说明：AddMonth(日期,整数)";
			document.getElementById("explained").innerHTML="增加月数(日期,整数)";
			document.getElementById("id").value=id;
			break;
		case "D_data22_2":
			targetobj.innerHTML = 'AddDay(#1992.7.12#,200) <br>返回结果为：日期';
			hiddenobj.value = "增加天数";
			idstartStep(id);
			document.getElementById("datesubset").innerHTML="日期表达式  ";
			document.getElementById("decimalname").innerHTML="整&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数  ";
			document.getElementById("note").innerHTML="说明：AddDay(日期,整数)";
			document.getElementById("explained").innerHTML="增加天数(日期,整数)";
			document.getElementById("id").value=id;
			break;
		case "D_data23_2":
			targetobj.innerHTML = 'AddQUARTER(#1992.7.12#,200) <br>返回结果为：日期';
			hiddenobj.value = "增加季度数";
			idstartStep(id);
			document.getElementById("datesubset").innerHTML="日期表达式  ";
			document.getElementById("decimalname").innerHTML="整&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数  ";
			document.getElementById("note").innerHTML="说明：AddQUARTER(日期,整数)";
			document.getElementById("explained").innerHTML="增加季度数(日期,整数)";
			document.getElementById("id").value=id;
			break;
		case "D_data24_2":
			targetobj.innerHTML = 'AddWeek(#1992.7.12#,12) <br>返回结果为：日期';
			hiddenobj.value = "增加周数";
			idstartStep(id);
			document.getElementById("datesubset").innerHTML="日期表达式  ";
			document.getElementById("decimalname").innerHTML="整&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数  ";
			document.getElementById("note").innerHTML="说明：AddWeek(日期,整数)";
			document.getElementById("explained").innerHTML="增加周数(日期,整数)";
			document.getElementById("id").value=id;
			break;
		case "DD_data25":
			targetobj.innerHTML = '返回结果为：当前工资发放的归属日期';
			hiddenobj.value = "归属日期()";
			idstartStep(id);
			document.getElementById("note").innerHTML="说明：归属日期";
			document.getElementById("id").value=id;
			break;
		case "3":
			togglesParent("stepDark");
			hidesParent("stepBrilliant");
			targetobj.innerHTML="";
			document.getElementById("note").innerHTML="说明：转换函数";
			break;
		case "T_str0":
			targetobj.innerHTML = 'CTOD("1992.7.2") <br>返回结果为：日期';
			hiddenobj.value = "字符转日期";
			idstartStep(id);
			document.getElementById("strsubset").innerHTML="字符串表达式";
			document.getElementById("note").innerHTML="说明：CTOD(字符串表达式)";
			document.getElementById("explained").innerHTML="字符转换日期(字符串表达式)";
			document.getElementById("id").value=id;
			break;
		case "T_str1":
			targetobj.innerHTML = 'CTOI("12922.01") <br>返回结果为：12922.01';
			hiddenobj.value = "字符转数值";
			idstartStep(id);
			document.getElementById("strsubset").innerHTML="字符串表达式";
			document.getElementById("note").innerHTML="说明：CTOI(字符串表达式)";
			document.getElementById("explained").innerHTML="字符转换数值(字符串表达式)";
			document.getElementById("id").value=id;
			break;
		case "T_data2":
			targetobj.innerHTML = 'DTOC(#1991.10.10#) <br>返回结果为："1991.10.10"';
			hiddenobj.value = "日期转字符";
			idstartStep(id);
			document.getElementById("datesubset").innerHTML="日期表达式  ";
			document.getElementById("note").innerHTML="说明：DTOC(日期)";
			document.getElementById("explained").innerHTML="日期转换字符(日期)";
			document.getElementById("id").value=id;
			break;
		case "T_num3":
			targetobj.innerHTML = 'ITOC(129.02) <br>返回结果为："129.02"';
			hiddenobj.value = "数值转字符";
			idstartStep(id);
			document.getElementById("note").innerHTML="说明：ITOC(数值表达式)";
			document.getElementById("explained").innerHTML="数值转换字符(数值表达式)";
			document.getElementById("id").value=id;
			break;
		case "T_vol7_2":
			targetobj.innerHTML = '“编号”指标值为“第0003号”<br>数字转汉字(编号,1)<br>返回结果为：第○○○三号<br>数字转汉字(编号,2)<br>返回结果为：第零零零叁号';
			hiddenobj.value = "数字转汉字";
			idstartStep(id);
			//document.getElementById("strsubset").innerHTML="指标名称";
			document.getElementById("decimalname").innerHTML="参&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数";
			document.getElementById("note").innerHTML="说明：NumConversion(指标名称,1|2)";
			document.getElementById("explained").innerHTML="数字转汉字(指标,参数)";
			document.getElementById("id").value=id;
			break;
		case "T_code4":
			targetobj.innerHTML = 'CTON(性别) <br>返回结果为：数符';
			hiddenobj.value = "代码转名称";
			idstartStep(id);
			document.getElementById("strsubset").innerHTML="指标名称";
			document.getElementById("note").innerHTML="说明：CTON(指标名称)";
			document.getElementById("explained").innerHTML="代码转名称(指标名称)";
			document.getElementById("id").value=id;
			break;
		case "TT_tra5":
			targetobj.innerHTML = "";
			hiddenobj.value = "~";
			idstartStep(id);
			document.getElementById("note").innerHTML="说明：代码转换符号";
			document.getElementById("id").value=id;
			break;
		case "TT_tra5":
			targetobj.innerHTML = "";
			hiddenobj.value = "~";
			idstartStep(id);
			document.getElementById("note").innerHTML="说明：代码转换符号";
			document.getElementById("id").value=id;
			break;
		case "T_item6_5":
			targetobj.innerHTML = 'CTON2(性别,"AX") <br>如果性别为"1"<br>&nbsp;&nbsp;返回结果为：男<br>如果性别为"2"<br>&nbsp;&nbsp;返回结果为：女';
			hiddenobj.value = "代码转名称2";
			idstartStep(id);
			document.getElementById("itemidname").innerHTML="表达式";
			document.getElementById("codeMaxname").innerHTML="代码类";
			document.getElementById("note").innerHTML="说明：CTON2(表达式,代码类)";
			document.getElementById("explained").innerHTML="代码转名称2(表达式,代码类)";
			document.getElementById("id").value=id;
			break;
		case "4":
			togglesParent("stepDark");
			hidesParent("stepBrilliant");
			targetobj.innerHTML="";
			document.getElementById("note").innerHTML="说明：类型不定函数";
			break;
		case "VV_vol0":
			targetobj.innerHTML = '如果 性别="01" 那么 男 <br>否则 女 <br>结束';
			hiddenobj.value = '如果 <Lexp1> 那么 <exp1> \n否则 <exp1>  \n结束';
			idstartStep(id);
			document.getElementById("note").innerHTML="说明：IIF<Lexp1> THEN<exp1> ELSE<exp1> END";
			document.getElementById("id").value=id;
			break;
		case "VV_vol1":
			targetobj.innerHTML = '分情况<br>如果 年龄<18 那么 儿童 <br>如果 年龄>=18 且 年龄<30 那么 青年 <br>如果 年龄>=30 且 年龄<60 那么 壮年 <br>否则 老年 <br>结束';
			hiddenobj.value = '分情况 \n如果 Lexp1 那么 exp1 \n如果 Lexp2 那么 exp2 \n否则 expn... \n结束';
			idstartStep(id);
			document.getElementById("note").innerHTML="说明：CASEIIF Lexp1 THEN exp1 IIF Lexp2 THEN exp2[ELSE expn]结束";
			document.getElementById("id").value=id;
			break;
		case "V_vol2_6":
			targetobj.innerHTML = 'GetMax(192,22) <br>值为192';
			hiddenobj.value = "较大值";
			idstartStep(id);
			document.getElementById("datastrcssaname").innerHTML="表 达 式1  ";
			document.getElementById("datastrcss1name").innerHTML="表 达 式2  ";
			document.getElementById("note").innerHTML="说明：GETMAX(exp1,exp2)";
			document.getElementById("explained").innerHTML="较大值(exp1,exp2)";
			document.getElementById("id").value=id;
			break;
		case "V_vol3_6":
			targetobj.innerHTML = 'GetMin(192,22) <br>值为22';
			hiddenobj.value = "较小值";
			idstartStep(id);
			document.getElementById("datastrcssaname").innerHTML="表 达 式1  ";
			document.getElementById("datastrcss1name").innerHTML="表 达 式2  ";
			document.getElementById("note").innerHTML="说明：GETMIN(exp1,exp2)";
			document.getElementById("explained").innerHTML="较小值(exp1,exp2)";
			document.getElementById("id").value=id;
			break;
		case "V_vol4_2_1":
			targetobj.innerHTML = '取 年龄 最近第 1 条记录';
			hiddenobj.value = '取';
			idstartStep(id);
			document.getElementById("datastrcssaname").innerHTML="指标名称";
			document.getElementById("decimalname").innerHTML="整&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数  ";
			document.getElementById("note").innerHTML="说明：GET(指标名称，整数，方向)";
			document.getElementById("explained").innerHTML="取 指标名称 [最近第|最初第] 整数 条记录";
			document.getElementById("id").value=id;
			break;
		case "V_vol5_3_3":
			targetobj.innerHTML = '统计 职务工资 满足 Year(记账日期)=2002 的总和';
			hiddenobj.value = '统计';
			idstartStep(id);
			document.getElementById("note").innerHTML="说明：SELECT(指标名称,条件,方式)";
			document.getElementById("explained").innerHTML="统计 指标名称 满足 条件 [第一条记录..";
			document.getElementById("id").value=id;
			break;
		case "V_vol6":
			targetobj.innerHTML = '例子: 为空(地市)<br>地市 IS NULL';
			hiddenobj.value = '为空';
			idstartStep(id);
			document.getElementById("note").innerHTML="说明：指标 IS NULL";
			document.getElementById("explained").innerHTML="为空(指标)";
			document.getElementById("id").value=id;
			break;
		case "5":
			togglesParent("stepDark");
			hidesParent("stepBrilliant");
			targetobj.innerHTML="";
			document.getElementById("note").innerHTML="说明：常量";
			break;
		case "CC_con0":
			targetobj.innerHTML = '';
			hiddenobj.value = '真';
			idstartStep(id);
			document.getElementById("note").innerHTML="说明：逻辑常量(TRUE)";
			document.getElementById("id").value=id;
			break;
		case "CC_con1":
			targetobj.innerHTML = '';
			hiddenobj.value = '假';
			idstartStep(id);
			document.getElementById("note").innerHTML="说明：逻辑常量(FALSE)";
			document.getElementById("id").value=id;
			break;
		case "CC_con2":
			targetobj.innerHTML = '';
			hiddenobj.value = '空';
			idstartStep(id);
			document.getElementById("note").innerHTML="说明：空(日期)";
			document.getElementById("id").value=id;
			break;
		case "CC_con3":
			targetobj.innerHTML = '';
			hiddenobj.value = '#2000.3.22#';
			idstartStep(id);
			document.getElementById("note").innerHTML="说明：#2000.3.22#表示2000年3月22日";
			document.getElementById("id").value=id;
			break;
		case "CC_con4":
			targetobj.innerHTML = '';
			hiddenobj.value = '#3.22#';
			idstartStep(id);
			document.getElementById("note").innerHTML="说明：#3.22#表示3月22日";
			document.getElementById("id").value=id;
			break;
		case "CC_con5":
			targetobj.innerHTML = '';
			hiddenobj.value = '"张三"';
			idstartStep(id);
			document.getElementById("note").innerHTML="说明：“张三”表示姓名为张三";
			document.getElementById("id").value=id;
			break;
		case "6":
			togglesParent("stepDark");
			hidesParent("stepBrilliant");
			targetobj.innerHTML="";
			document.getElementById("note").innerHTML="说明：逻辑操作符";
			break;
		case "LL_log0":
			targetobj.innerHTML = '';
			hiddenobj.value = '且';
			idstartStep(id);
			document.getElementById("note").innerHTML="说明：AND";
			document.getElementById("id").value=id;
			break;
		case "LL_log1":
			targetobj.innerHTML = '';
			hiddenobj.value = '或';
			idstartStep(id);
			document.getElementById("note").innerHTML="说明：OR";
			document.getElementById("id").value=id;
			break;
		case "LL_log2":
			targetobj.innerHTML = '';
			hiddenobj.value = '非';
			idstartStep(id);
			document.getElementById("note").innerHTML="说明：NOT";
			document.getElementById("id").value=id;
			break;
		case "7":
			togglesParent("stepDark");
			hidesParent("stepBrilliant");
			targetobj.innerHTML ="";
			break;
		case "OO_opr0":
			targetobj.innerHTML = '';
			hiddenobj.value = '+';
			idstartStep(id);
			document.getElementById("note").innerHTML="说明：加";
			document.getElementById("id").value=id;
			break;
		case "OO_opr1":
			targetobj.innerHTML = '';
			hiddenobj.value = '-';
			idstartStep(id);
			document.getElementById("note").innerHTML="说明：减";
			document.getElementById("id").value=id;
			break;
		case "OO_opr2":
			targetobj.innerHTML = '';
			hiddenobj.value = '*';
			idstartStep(id);
			document.getElementById("note").innerHTML="说明：乘";
			document.getElementById("id").value=id;
			break;
		case "OO_opr3":
			targetobj.innerHTML = '';
			hiddenobj.value = '/';
			idstartStep(id);
			document.getElementById("note").innerHTML="说明：除";
			document.getElementById("id").value=id;
			break;
		case "OO_opr4":
			targetobj.innerHTML = '';
			hiddenobj.value = '\\';
			idstartStep(id);
			document.getElementById("note").innerHTML="说明：整除";
			document.getElementById("id").value=id;
			break;
		case "OO_opr5":
			targetobj.innerHTML = '';
			hiddenobj.value = 'DIV';
			idstartStep(id);
			document.getElementById("note").innerHTML="说明：整除";
			document.getElementById("id").value=id;
			break;
		case "OO_opr6":
			targetobj.innerHTML = '';
			hiddenobj.value = '%';
			idstartStep(id);
			document.getElementById("note").innerHTML="说明：求余";
			document.getElementById("id").value=id;
			break;
		case "OO_opr7":
			targetobj.innerHTML = '';
			hiddenobj.value = 'MOD';
			idstartStep(id);
			document.getElementById("note").innerHTML="说明：求余";
			document.getElementById("id").value=id;
			break;
		case "8":
			togglesParent("stepDark");
			hidesParent("stepBrilliant");
			targetobj.innerHTML="";
			document.getElementById("note").innerHTML="说明：关系运算符";
			break;
		case "RR_rel0":
			targetobj.innerHTML = '';
			hiddenobj.value = '=';
			idstartStep(id);
			document.getElementById("note").innerHTML="说明：等于";
			document.getElementById("id").value=id;
			break;
		case "RR_rel1":
			targetobj.innerHTML = '';
			hiddenobj.value = '>';
			idstartStep(id);
			document.getElementById("note").innerHTML="说明：大于";
			document.getElementById("id").value=id;
			break;
		case "RR_rel2":
			targetobj.innerHTML = '';
			hiddenobj.value = '>=';
			idstartStep(id);
			document.getElementById("note").innerHTML="说明：大于等于";
			document.getElementById("id").value=id;
			break;
		case "RR_rel3":
			targetobj.innerHTML = '';
			hiddenobj.value = '<';
			idstartStep(id);
			document.getElementById("note").innerHTML="说明：小于";
			document.getElementById("id").value=id;
			break;
		case "RR_rel4":
			targetobj.innerHTML = '';
			hiddenobj.value = '<=';
			idstartStep(id);
			document.getElementById("note").innerHTML="说明：小于等于";
			document.getElementById("id").value=id;
			break;
		case "RR_rel5":
			targetobj.innerHTML = '';
			hiddenobj.value = '<>';
			idstartStep(id);
			document.getElementById("note").innerHTML="说明：不等于";
			document.getElementById("id").value=id;
			break;
		case "RR_rel6":
			targetobj.innerHTML = '';
			hiddenobj.value = 'LIKE';
			idstartStep(id);
			document.getElementById("note").innerHTML="说明：包含";
			document.getElementById("id").value=id;
			break;
		case "9":
			togglesParent("stepDark");
			hidesParent("stepBrilliant");
			targetobj.innerHTML="";
			document.getElementById("note").innerHTML="说明：其他";
			break;
		case "EE_oth0":
			targetobj.innerHTML = '';
			hiddenobj.value = '(  )';
			idstartStep(id);
			document.getElementById("note").innerHTML="说明：括号";
			document.getElementById("id").value=id;
			break;
		case "EE_oth1":
			targetobj.innerHTML = '';
			hiddenobj.value = '[  ] ';
			idstartStep(id);
			document.getElementById("note").innerHTML="说明：中括号[表示指标]";
			document.getElementById("id").value=id;
			break;
		case "EE_oth2":
			targetobj.innerHTML = '';
			hiddenobj.value = '{  } ';
			idstartStep(id);
			document.getElementById("note").innerHTML="说明：大括号[临时变量]";
			document.getElementById("id").value=id;
			break;
		case "EE_oth3":
			targetobj.innerHTML = '';
			hiddenobj.value = '// ';
			idstartStep(id);
			document.getElementById("note").innerHTML="说明：注释标识";
			document.getElementById("id").value=id;
			break;
		case "10":
			togglesParent("stepDark");
			hidesParent("stepBrilliant");
			targetobj.innerHTML="";
			document.getElementById("note").innerHTML="说明：工资函数";
			break;
		case "S_stan0":
			targetobj.innerHTML = '执行标准(标准号,横一,横二,纵一,纵二)<br>例子：执行标准(12, 档次, 空, 工资级别, 空)<br>返回值：找出工资级别、工资档次对应的结果值（级别工资）';
			hiddenobj.value = '执行标准';
			idstartStep(id);
			document.getElementById("standname").innerHTML='标准表';
			document.getElementById("note").innerHTML="说明：ExecuteStandard(标准号,横一,横二,纵一,纵二)";
			document.getElementById("id").value=id;
			break;
		case "S_sthl1":
			targetobj.innerHTML = '例子：就近就高(12, 工资级别, 级别工资)<br>只支持代码型指标建立的，且只有一个横向指标及一个纵向指标的标准!';
			hiddenobj.value = '就近就高';
			idstartStep(id);
			document.getElementById("standhlname").innerHTML='标准表';
			document.getElementById("note").innerHTML="说明：NearByHigh(标准号,纵向指标,结果指标)";
			document.getElementById("id").value=id;
			break;
		case "S_sthl2":
			targetobj.innerHTML = '例子：就近就低(12, 工资级别, 级别工资)<br>只支持代码型指标建立的，且只有一个横向指标及一个纵向指标的标准!';
			hiddenobj.value = '就近就低';
			idstartStep(id);
			document.getElementById("standhlname").innerHTML='标准表';
			document.getElementById("note").innerHTML="说明：NearByLow(标准号,纵向指标,结果指标)";
			document.getElementById("id").value=id;
			break;
		case "S_item3_2_4":
			targetobj.innerHTML = '前一个代码(工资级别, 1, "03")<br>工资级别指标代码向前递一级，但不会超过"03"所代表级别<br>如"10"变为"09", "07"变为"06"';
			hiddenobj.value = '前一个代码';
			idstartStep(id);
			document.getElementById("itemidname").innerHTML='前一个代码';
			document.getElementById("decimalname").innerHTML='增量';
			document.getElementById("codeMaxname").innerHTML='极值代码';
			document.getElementById("note").innerHTML="说明：前一个代码(代码指标,增量,极值代码)";
			document.getElementById("id").value=id;
			break;
		case "S_item4_2_4":
			targetobj.innerHTML = '后一个代码(工资级别, 1, "13")<br>工资级别指标代码向后递一级，但不会超过"13"所代表级别<br>如"08"变为"09", "07"变为"08"';
			hiddenobj.value = '后一个代码';
			idstartStep(id);
			document.getElementById("itemidname").innerHTML='后一个代码';
			document.getElementById("decimalname").innerHTML='增量';
			document.getElementById("codeMaxname").innerHTML='极值代码';
			document.getElementById("note").innerHTML="说明：后一个代码(代码指标,增量,极值代码)";
			document.getElementById("id").value=id;
			break;
		case "S_item5_7_4_5":
			targetobj.innerHTML = '代码调整(工资级别, 调整级数, "03", "15")<br>代码调整(“05”,2, "03", "15") 返回值：07<br>代码调整(“05”,-2,"03","15") 返回值：03';
			hiddenobj.value = '代码调整';
			idstartStep(id);
			document.getElementById("itemidname").innerHTML='代码调整';
			document.getElementById("incrementalItemname").innerHTML='增量指标';
			document.getElementById("codeMaxname").innerHTML='极大值代码';
			document.getElementById("codeMinname").innerHTML='极小值代码';
			document.getElementById("note").innerHTML="说明：代码调整(代码指标,增量指标,极大值代码,极小值代码)";
			document.getElementById("id").value=id;
			break;
		case "SS_sar5":
			targetobj.innerHTML = '例子：分段计算(exp1)<br>&nbsp;&nbsp;基于子集 A02 满足 开始时间>=#1998.7.1#计算满足条件的∑(exp1)';
			hiddenobj.value = '前一个代码(现所学专业,0,"0101分段计算(exp1) 基于子集 ... [满足 ...]") ';
			idstartStep(id);
			document.getElementById("note").innerHTML="说明：基于一个子集的历史记录，计算满足条件的表达式exp1累计之和";
			document.getElementById("id").value=id;
			break;
		case "SS_sar6":
			targetobj.innerHTML = '例子：分段计算2(A07,开始时间, 结束时间,<br>'
										+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;exp1,"",<br>'
										+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A10,聘任起始时间, 聘任终止时间,'
										+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;exp2,"",<br>'
										+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;exp3,"#2004.10.1", "")<br>'
										+'计算2004.10.1后　∑(exp3*MAX(exp1,exp2))';
			hiddenobj.value = '分段计算2(子集1, 开始时间1, 结束时间1, exp1, "",\n '
								+'子集2, 开始时间2, 结束时间2, exp2, "",\n'
								+'expl3, "", "")';
			idstartStep(id);
			document.getElementById("note").innerHTML="说明：分段计算的扩展，是基于两个子集的历史记录，满足条件的历史";
			document.getElementById("id").value=id;
			break;
		case "SS_sar7":
			targetobj.innerHTML = '例子：历史记录最初指标值(任职时间,  职务名称="03")<br>'
								+'返回指标必须是子集指标<br>'
								+'返回子集中最近符合条件的记录连续上溯到第一条记录的指标值';
			hiddenobj.value = '历史记录最初指标值(,)';
			idstartStep(id);
			document.getElementById("note").innerHTML="说明：历史记录最初指标值(返回指标，条件) ";
			document.getElementById("id").value=id;
			break;
		case "SS_sar8":
			targetobj.innerHTML = '例子：历史记录最初指标值(任职时间,  职务名称="03")<br>'
								+'返回指标必须是子集指标<br>'
								+'返回子集中最近符合条件的记录连续上溯到第一条记录的指标值';
			hiddenobj.value = '历史记录最初指标值(,)';
			idstartStep(id);
			document.getElementById("note").innerHTML="说明：历史记录最初指标值(返回指标,条件)";
			document.getElementById("id").value=id;
			break;
		case "SS_sar9":
			targetobj.innerHTML = '例子：上一个历史记录指标值(职务名称,  职务名称="03")<br>'
								+'返回指标必须是子集指标<br>'
								+'返回子集中最近符合条件的上一个不符条件的指标值';
			hiddenobj.value = '上一个历史记录指标值(,)';
			idstartStep(id);
			document.getElementById("note").innerHTML="说明：上一个历史记录指标值(返回指标,条件)";
			document.getElementById("id").value=id;
			break;
		
	}
}
function idstartStep(id){
	if(id.length>0){
		var array = id.split("_");
		if(array.length>0){
			if(array[0].length==2){
				togglesParent("stepDark");
				togglesParent("brilliantCompleted");
				hidesParent("stepBrilliant");
				hidesParent("darkCompleted");
			}else{
				togglesParent("stepBrilliant");
				togglesParent("darkCompleted");
				hidesParent("stepDark");
				hidesParent("brilliantCompleted");
			}
		}
	}
}

function toggles(targetId){
	$("#"+targetId).show();
} 
function hides(targetId){
	$("#"+targetId).hide();
}
function togglesParent(targetId){
	$("#"+targetId).show();
} 
function hidesParent(targetId){
	$("#"+targetId).hide();
}
function nextStep(){
    toggles("stepDark");
	hides("stepBrilliant");
	hides("darkReturnStep");
	toggles("brilliantReturnStep");
	hides("darkCompleted");
	toggles("brilliantCompleted");
	hides("selectifram");
	toggles("selectformula");
}
function returnStep(){
    hides("stepDark");
	toggles("stepBrilliant");
	toggles("darkReturnStep");
	hides("brilliantReturnStep");
	toggles("darkCompleted");
	hides("brilliantCompleted");
	hides("directioncss");
	hides("conditionscss");
	hides("datastrcss");
	hides("datastrcss1");
	hides("waycss");
	toggles("selectifram");
	hides("selectformula");
	hides("subsetstr");
	hides("subsetnum1");
	hides("subsetnum2");
	hides("subsetdate1");
	hides("subsetdate2");
	hides("decimalpoint");
	hides("incrementalItem");
	hides("initiationnum");
	hides("codeMax");
	hides("codeMin");
	hides("itemidSelect");
	hides("stand");
	hides("standHfactor");
	hides("standVfactor");
	hides("standS_hfactor");
	hides("standS_vfactor");
	hides("standhHighLow");
	hides("standItem");
	valueToNull();
}
function returnStepParent(){
    hidesParent("stepDark");
	togglesParent("stepBrilliant");
	togglesParent("darkReturnStep");
	hidesParent("brilliantReturnStep");
	togglesParent("darkCompleted");
	hidesParent("brilliantCompleted");
}


function completed(){
	var formula = document.getElementById("formula").value;
	var id = document.getElementById("id").value;

	var array = id.split("_");
	var attribute = defvalue();
	var returns = "";
	if(array[0].length==2){
		returns = formula;
	}else if(id=="V_vol4_2_1"){
		returns = formula;
		var dateexpression1=document.getElementById("datestr_item").value;
		var direction=document.getElementById("direction").value;
		var decimal=document.getElementById("decimal").value;
		 if(dateexpression1.length>0){
			returns += " " +dateexpression1+" ";
		 }
		 if(direction.length>0){
			returns += " " +direction+" ";
		 }
		 if(decimal.length>0){
			returns += " " +decimal+" ";
		 }else{
			returns += " 0 ";
		 }
		
		returns += "条记录";
		
	}else if(id=="V_vol5_3_3"){
		var returns = formula;
		var datestr=document.getElementById("datestr_item").value;
		
		var conditions=document.getElementById("conditions").value;
		var way=document.getElementById("way").value;
		if(datestr!=null&&datestr.length>0)
			returns += " " +datestr+" ";
		returns+= " 满足 ";
		if(conditions.length>0){
			returns+= " "+conditions+" ";
		}
		if(way.length>0){
			returns+= " "+way+" ";
		}

	}else{
		returns = formula+"("+attribute+")";
	}
	parent.conditionSet.symbol(returns);
	frameDialog().close();
}
function frameDialog(){
	var frame = null;
	if(frameElement){
		frame = frameElement;
	}else{
		frame = self.frames[0];
	}
	return frame.dialog;
}
function subsetfunction(){
	var id = document.getElementById("id").value;
	if(id!=null&&id.length>1){
		var array = id.split("_");
		var start1="";
		var start2="";
		var start3="";
		var start4="";
		var start5="";
		
		if(array.length>0){
			start1=array[0];
		}
		if(array.length>1){
			start2=array[1];
		}
		if(array.length>2){
			start3=array[2];
		}
		if(array.length>3){
			start4=array[3];
		}
		if(array.length>4){
			start5=array[4];
		}
		if(start2.length>0){
			var subset = "";
			if(start2.length==6){
				subset = start2.substring(0,start2.length-2);
			}else{
				subset = start2.substring(0,start2.length-1);
			}
			switch (subset){
				case 'str':
					toggles("fieldsetview");
					toggles("subsetstr");
					break;
				case 'code':
					toggles("fieldsetview");
					toggles("subsetstr");
					break;
				case 'num':
					toggles("fieldsetview");
					toggles("subsetnum1");
					break;
				case 'data':
					toggles("fieldsetview");
					toggles("subsetdate1");
					break;
				case 'vol':
					toggles("fieldsetview");
					toggles("datastrcss");
					break;
				case 'item':
					toggles("fieldsetview");
					toggles("itemidSelect");
					break;
				case 'stan':
					hides("fieldsetview");
					toggles("stand");
					break;
				case 'sthl':
					hides("fieldsetview");
					toggles("standhHighLow");
					break;
			}
		}
		if(start3.length>0){
		switch (start3){
				case '1':
					toggles("subsetdate2");
					break;
				case '2':
					toggles("decimalpoint");
					break;
				case '3':
					toggles("conditionscss");
					break;
				case '4':
					toggles("subsetnum2");
					break;
				case '5':
					toggles("codeMax");
					break;
				case '6':
					toggles("datastrcss1");
					break;
				case '7':
					toggles("incrementalItem");
					break;
			}
		}
		if(start4.length>0){
			switch (start4){
				case '1':
					toggles("directioncss");
					break;
				case '2':
					toggles("initiationnum");
					break;
				case '3':
					toggles("waycss");
					break;
				case '4':
					toggles("codeMax");
					break;
				case '5':
					toggles("codeMin");
					break;
			}
		}
		if(start5.length>0){
			if(start5==5){
				toggles("codeMin");
			}
		}
	}
}
function defvalue(){
	var atvalue="";
	var id = document.getElementById("id").value;
	if(id!=null&&id.length>1){
		var array = id.split("_");
		var start1="";
		var start2="";
		var start3="";
		var start4="";
		var start5="";
		
		if(array.length>0){
			start1=array[0];
		}
		if(array.length>1){
			start2=array[1];
		}
		if(array.length>2){
			start3=array[2];
		}
		if(array.length>3){
			start4=array[3];
		}
		if(array.length>4){
			start5=array[4];
		}
		if(start2.length>0){
			var subset = "";
			if(start2.length==6){
				subset = start2.substring(0,start2.length-2);
			}else{
				subset = start2.substring(0,start2.length-1);
			}
			switch (subset){
				case 'str':
					var strexpression = $("input[name='strexpression_item']").val();
					if(strexpression!=null&&strexpression.length>0){
						atvalue+="【"+strexpression+"】";
					}
					break;
				case 'code':
					var strexpression=$("input[name='strexpression_item']").val();
					if(strexpression!=null&&strexpression.length>0){
						atvalue+="【"+strexpression+"】";
					}
					break;
				case 'num':
					var numexpression1=$("input[name='numexpression1_item']").val();
					
					if(numexpression1!=null&&numexpression1.length>0){
						atvalue+="【"+numexpression1+"】";
					}
					break;
				case 'data':
					var dateexpression1=$("input[name='dateexpression1_item']").val();
					if(dateexpression1!=null&&dateexpression1.length>0){
						atvalue+="【"+dateexpression1+"】";
					}
					break;
				case 'vol':
					var datestr=$("input[name='datestr_item']").val();
					if(datestr!=null&&datestr.length>0){
						atvalue+="【"+datestr+"】";
					}
					break;
				case 'item':
					var itemid=$("input[name='itemid_item']").val();
					if(itemid!=null&&itemid.length>0){
						atvalue+="【"+itemid+"】";
					}
					break;
				case 'stan':
					var standid=$("input[name='standid']").val();
					var hfactor=getCodesid("hfactor_arr");
					var vfactor=getCodesid("vfactor_arr");
					var s_hfactor=getCodesid("s_hfactor_arr");
					var s_vfactor=getCodesid("s_vfactor_arr");
					if(standid.length>0){
						var itemarr = standid.split(":"); 
						if(itemarr.length==7){
							atvalue+=itemarr[6];
						}
						if(hfactor.length>0){
							var hfactorarr = hfactor.split(":");
							if(hfactorarr.length==2){
								atvalue+=','+hfactorarr[1];
							}else{
								atvalue+=",''";
							}
						}else{
							atvalue+=',空';
						}
						
						if(s_hfactor.length>0){
							var s_hfactorarr = s_hfactor.split(":");
							if(s_hfactorarr.length==2){
								atvalue+=','+s_hfactorarr[1];
							}else{
								atvalue+=",''";
							}
						}else{
							atvalue+=',空';
						}
						if(vfactor.length>0){
							var vfactorarr = vfactor.split(":");
							if(vfactorarr.length==2){
								atvalue+=','+vfactorarr[1];
							}else{
								atvalue+=",''";
							}
						}else{
							atvalue+=',空';
						}
						if(s_vfactor.length>0){
							var s_vfactorarr = s_vfactor.split(":");
							if(s_vfactorarr.length==2){
								atvalue+=','+s_vfactorarr[1];
							}else{
								atvalue+=',空';
							}
						}else{
							atvalue+=',空';
						}
					}
					break;
				case 'sthl':
					var standhlid=$("input[name='standhlid']").val();
					var vfactor=getCodesid("vfactor_arr");
					var s_vfactor=getCodesid("s_vfactor_arr");
					var item=getCodesid("item");
					if(standhlid.length>0){
						var itemarr = standhlid.split(":"); 
						if(itemarr.length==7){
							atvalue+=itemarr[6];
						}
						if(vfactor.length>0){
							var vfactorarr = vfactor.split(":");
							if(vfactorarr.length==2){
								atvalue+=','+vfactorarr[1];
							}
						}
						if(s_vfactor.length>0){
							var s_vfactorarr = s_vfactor.split(":");
							if(s_vfactorarr.length==2){
								atvalue+=','+s_vfactorarr[1];
							}else{
								atvalue+=',';
							}
						}else{
							if(vfactor.length<1){
								atvalue+=',';
							}
						}
						if(item!=null&&item.length>0){
							var itemarr = item.split(":");
							if(itemarr.length==2){
								atvalue+=','+itemarr[1];
							}
						}else{
							atvalue+=',';
						}
					}
					break;
			}
		}
		if(start3.length>0){
			switch (start3){
				case '1':
					var dateexpression2=$("input[name='dateexpression2_item']").val();
					if(dateexpression2!=null&&dateexpression2.length>0){
						atvalue+=","+"【"+dateexpression2+"】";
					}else{
						atvalue+=",";
					}
					break;
				case '2':
					var decimal=$("input[name='decimal']").val();
					if(decimal!=null&&decimal.length>0){
//						atvalue+=","+"【"+decimal+"】";
						atvalue+=","+decimal;
					}else{
						atvalue+=",";
					}
					break;
				case '3':
					var conditions=$("input[name='conditions']").val();
					if(conditions!=null&&conditions.length>0){
						atvalue+=","+"【"+conditions+"】";
					}else{
						atvalue+=",";
					}
					break;
				case '4':
					var numexpression2=$("input[name='numexpression2_item']").val();
					if(numexpression2!=null&&numexpression2.length>0){
						atvalue+=","+"【"+numexpression2+"】";
					}else{
						atvalue+=",";
					}
					break;
				case '5':
					var codemax=getCodesid("code_maxarr");
					if(codemax!=null&&codemax.length>0){
						atvalue+=',"'+codemax+'"';
					}else{
						atvalue+=',""';
					}
					break;
				case '6':
					var strid=$("input[name='strid_item']").val();
					if(strid!=null&&strid.length>0){
						atvalue+=","+strid;
					}else{
						atvalue+=",";
					}
					break;
				case '7':
					var incrementalItemid=$("input[name='incrementalItem_item']").val();
					if(incrementalItemid!=null&&incrementalItemid.length>0){
						atvalue+=","+"【"+incrementalItemid+"】";
					}else{
						atvalue+=",";
					}
					break;
			}
		}
		if(start4.length>0){
			switch (start4){
				case '1':
					var direction=$("input[name='direction']").val();
					if(direction!=null&&direction.length>0){
						atvalue+=","+direction;
					}else{
						atvalue+=",";
					}
					break;
				case '2':
					var initiation=$("input[name='initiation']").val();
					if(initiation!=null&&initiation.length>0){
						atvalue+=","+initiation;
					}else{
						atvalue+=",";
					}
					break;
				case '3':
					var way=$("input[name='way']").val();
					if(way!=null&&way.length>0){
						atvalue+=","+way;
					}else{
						atvalue+=",";
					}
					break;
				case '4':
					var codemax=getCodesid("code_maxarr");
					if(codemax!=null&&codemax.length>0){
						atvalue+=',"'+codemax+'"';
					}else{
						atvalue+=',""';
					}
					break;
				case '5':
					var codemin=getCodesid("code_minarr");
					if(codemin!=null&&codemin.length>0){
						atvalue+=',"'+codemin+'"';
					}else{
						atvalue+=',""';
					}
					break;
			}
		}
		if(start5.length>0){
			if(start5==5){
				var codemin=getCodesid("code_minarr");
				if(codemin!=null&&codemin.length>0){
					atvalue+=',"'+codemin+'"';
				}else{
					atvalue+=',""';
				}
			}
		}
	}
	return atvalue;
}


function upadd(valueadd){
	var addValue  = document.getElementById(valueadd).value;
	if(addValue.length<1){
		addValue = 0;
	}
    document.getElementById(valueadd).value = parseInt(addValue)+1
}
function downcut(valuecut){
	var cutValue  = document.getElementById(valuecut).value;
	if(cutValue.length<1){
		cutValue = 0;
	}
    document.getElementById(valuecut).value = parseInt(cutValue)-1
}
function getCodesid(code_arr){
	var codeid="";
	var codesetid_arr= document.getElementsByName(code_arr);
	if(codesetid_arr==null){
		return "";
	}else{
		var codesetid_arr_vo = codesetid_arr[0];
		for(var i=0;i<codesetid_arr_vo.options.length;i++){
			if(codesetid_arr_vo.options[i].selected){
				codeid =codesetid_arr_vo.options[i].value;
			}
		}
	}
	return codeid;
}
function arrToNull(code_arr){
	var codeid="";
	var codesetid_arr= document.getElementsByName(code_arr);
	if(codesetid_arr==null){
		return "";
	}else{
		var codesetid_arr_vo = codesetid_arr[0];
		if(codesetid_arr_vo.options!=null){
			for(var i=0;i<codesetid_arr_vo.options.length;i++){
				if(codesetid_arr_vo.options[i].selected){
					codesetid_arr_vo.options[i].selected=false;
				}
			}
		}
	}
}
function changeCodeValue(){
   var itemid=getCodesid("itemid_arr");
   var arr = itemid.split(":");
   if(arr.length==2){
   		var fieldsetid = getCodesid("fieldname");
   		var hashvo=new ParameterSet();
   		hashvo.setValue("itemid",arr[0]);
   		hashvo.setValue("fieldsetid",fieldsetid);
	    var request=new Request({asynchronous:false,
     		onSuccess:showCodeFieldList,functionId:'3020050012'},hashvo);
   }
}
function showCodeFieldList(outparamters){
	var codelist=outparamters.getValue("codelist");
	
	if(codelist!=null&&codelist.length>1){
		AjaxBind.bind(projectForm.code_maxarr,codelist);
		if(document.getElementById("codeMin").style.display == "block"){
			AjaxBind.bind(projectForm.code_minarr,codelist);
		}
	}
}
function showFactor(outparamters){
	hides("standHfactor");
	hides("standVfactor");
	hides("standS_hfactor");
	hides("standS_vfactor");
	var hfactorlsit=outparamters.getValue("hfactorlsit");
	var vfactorlsit=outparamters.getValue("vfactorlsit");
	var s_hfactorlsit=outparamters.getValue("s_hfactorlsit");
	var s_vfactorlsit=outparamters.getValue("s_vfactorlsit");
	var str=outparamters.getValue("str");
	
	arrToNull("hfactor_arr");
	arrToNull("vfactor_arr");
	arrToNull("s_hfactor_arr");
	arrToNull("s_vfactor_arr");
	document.getElementById("calculation").innerHTML=str;
	if(hfactorlsit!=null&&hfactorlsit.length>0){
		toggles("standHfactor");
		document.getElementById("hfactorname").innerHTML='横一';
		AjaxBind.bind(projectForm.hfactor_arr,hfactorlsit);
	}else{
		AjaxBind.bind(projectForm.hfactor_arr,hfactorlsit);
	}
	if(vfactorlsit!=null&&vfactorlsit.length>0){
		toggles("standVfactor");
		document.getElementById("vfactorname").innerHTML='纵一';
		AjaxBind.bind(projectForm.vfactor_arr,vfactorlsit);
	}else{
		AjaxBind.bind(projectForm.vfactor_arr,vfactorlsit);
	}
	if(s_hfactorlsit!=null&&s_hfactorlsit.length>0){
		toggles("standS_hfactor");
		document.getElementById("s_hfactorname").innerHTML='横二';
		AjaxBind.bind(projectForm.s_hfactor_arr,s_hfactorlsit);
	}else{
		AjaxBind.bind(projectForm.s_hfactor_arr,s_hfactorlsit);
	}
	if(s_vfactorlsit!=null&&s_vfactorlsit.length>0){
		toggles("standS_vfactor");
		document.getElementById("s_vfactorname").innerHTML='纵二';
		AjaxBind.bind(projectForm.s_vfactor_arr,s_vfactorlsit);
	}else{
		AjaxBind.bind(projectForm.s_vfactor_arr,s_vfactorlsit);
	}
}
function standSelect(salaryid,tabid,checktemp){
	 var standid=document.getElementById("standid").value;
	 var codearr=document.getElementById("codearr").value;
	 if(standid.length>0){
	    var hashvo=new ParameterSet();
	    hashvo.setValue("standid",standid);
	    hashvo.setValue("salaryid",salaryid);
	    hashvo.setValue("tabid",tabid);
	    hashvo.setValue("checktemp",checktemp);
	    var request=new Request({asynchronous:false,
     		onSuccess:showFactor,functionId:'3020050012'},hashvo);
     }
}
function changeItemValue(salaryid,tabid,checktemp){
   var standhlid=document.getElementById("standhlid").value;
   if(standhlid.length>0){
	    var hashvo=new ParameterSet();
	    hashvo.setValue("standid",standhlid);
	    hashvo.setValue("salaryid",salaryid);
	    hashvo.setValue("tabid",tabid);
	    hashvo.setValue("checktemp",checktemp);
	    var request=new Request({asynchronous:false,
     		onSuccess:showItemFactor,functionId:'3020050012'},hashvo);
    }
}
function showItemFactor(outparamters){
	hides("standVfactor");
	hides("standS_vfactor");
	hides("standItem");
	var vfactorlsit=outparamters.getValue("vfactorlsit");
	var s_vfactorlsit=outparamters.getValue("s_vfactorlsit");
	var itemidlist=outparamters.getValue("itemidlist");
	var hlstr=outparamters.getValue("hlstr");
	
	arrToNull("vfactor_arr");
	arrToNull("s_vfactor_arr");
	arrToNull("item");
	document.getElementById("calculation").innerHTML=hlstr;
	
	toggles("standVfactor");
	document.getElementById("vfactorname").innerHTML='纵向指标';
	AjaxBind.bind(projectForm.vfactor_arr,vfactorlsit);
	if(s_vfactorlsit!=null&&s_vfactorlsit.length>0){
		hides("standVfactor");
		toggles("standS_vfactor");
		document.getElementById("s_vfactorname").innerHTML='纵向指标';
		AjaxBind.bind(projectForm.s_vfactor_arr,s_vfactorlsit);
	}
	if(itemidlist!=null&&itemidlist.length>0){
		toggles("standItem");
		document.getElementById("itemname").innerHTML='结果指标';
		AjaxBind.bind(projectForm.item,itemidlist);
	}
}
function valueToNull(){
	arrToNull("strexpression_arr");
	arrToNull("numexpression1_arr");
	arrToNull("numexpression2_arr");
	
	arrToNull("dateexpression1_arr");
	arrToNull("dateexpression2_arr");
	arrToNull("incrementalItem_arr");
	
	//document.getElementById("fieldname").value='';
	document.getElementById("decimal").value='';
	document.getElementById("initiation").value='';
	document.getElementById("direction").value='';
	arrToNull("itemid_arr");
	arrToNull("datestr_arr");
	
	document.getElementById("standhlid").value='';
	arrToNull("strid_arr");
	arrToNull("code_maxarr");
	arrToNull("code_minarr");
	
	document.getElementById("standid").value='';
	arrToNull("hfactor_arr");
	arrToNull("vfactor_arr");
	arrToNull("s_hfactor_arr");
	arrToNull("s_vfactor_arr");
	arrToNull("item");
}
function changes(obj,salaryid,tabid,checktemp){
 	var hashvo=new ParameterSet();
 	hashvo.setValue("salaryid",salaryid);
 	hashvo.setValue("tabid",tabid);
	hashvo.setValue("fieldsetid",obj.value);
	hashvo.setValue("checktemp",checktemp);
	var request=new Request({asynchronous:false,
     		onSuccess:changesItem,functionId:'3020050013'},hashvo);
}
function changesItem(outparamters){
	var alist=outparamters.getValue("alist");
	var dlist=outparamters.getValue("dlist");
	var nlist=outparamters.getValue("nlist");
	var vlist=outparamters.getValue("vlist");
	var ilist=outparamters.getValue("ilist");
	var itemlist=outparamters.getValue("itemlist");
	
	var id = document.getElementById("id").value;
	if(id!=null&&id.length>1){
		var array = id.split("_");
		var start1="";
		var start2="";
		var start3="";
		var start4="";
		var start5="";
		
		if(array.length>0){
			start1=array[0];
		}
		if(array.length>1){
			start2=array[1];
		}
		if(array.length>2){
			start3=array[2];
		}
		if(array.length>3){
			start4=array[3];
		}
		if(array.length>4){
			start5=array[4];
		}
		if(start2.length>0){
			var subset = "";
			if(start2.length==6){
				subset = start2.substring(0,start2.length-2);
			}else{
				subset = start2.substring(0,start2.length-1);
			}
			switch (subset){
				case 'str':
					AjaxBind.bind(projectForm.strexpression_arr,alist);
					break;
				case 'code':
					AjaxBind.bind(projectForm.strexpression_arr,alist);
					break;
				case 'num':
					AjaxBind.bind(projectForm.numexpression1_arr,nlist);
					break;
				case 'data':
					AjaxBind.bind(projectForm.dateexpression1_arr,dlist);
					break;
				case 'vol':
					AjaxBind.bind(projectForm.datestr_arr,vlist);
					break;
				case 'item':
					AjaxBind.bind(projectForm.itemid_arr,itemlist);
					break;
			}
		}
		if(start3.length>0){
		switch (start3){
				case '1':
					AjaxBind.bind(projectForm.dateexpression2_arr,dlist);
					break;
				case '4':
					AjaxBind.bind(projectForm.numexpression2_arr,nlist);
					break;
				case '6':
					AjaxBind.bind(projectForm.strid_arr,vlist);
					break;
				case '7':
					AjaxBind.bind(projectForm.incrementalItem_arr,ilist);
					break;
			}
		}
	}
	
}
function funcJsonData(){
	return [{"id":"0","name":"数值函数","isParent":"true"},
	            {"id":"N_num0","name":"取整(数值表达式)","isParent":"false","pid":"0"},
	            {"id":"N_num1_4","name":"取余数(数值表达式,数值表达式)","isParent":"false","pid":"0"},
	            {"id":"N_num2_2","name":"四舍五入(数值表达式,整数)","isParent":"false","pid":"0"},
	            {"id":"N_num3","name":"三舍七入(数值表达式)","isParent":"false","pid":"0"},
	            {"id":"N_num4","name":"逢分进元(数值表达式)","isParent":"false","pid":"0"},
	            {"id":"N_num5","name":"逢分进角(数值表达式)","isParent":"false","pid":"0"},
	            {"id":"NN_num6","name":"幂(底数，次方)","isParent":"false","pid":"0"},
	            {"id":"1","name":"字符串函数","isParent":"true"},
	            {"id":"A_str0","name":"去空格(字符串表达式)","isParent":"false","pid":"1"},
	            {"id":"A_str1","name":"去左空格(字符串表达式)","isParent":"false","pid":"1"},
	            {"id":"A_str2","name":"去右空格(字符串表达式)","isParent":"false","pid":"1"},
	            {"id":"A_str3_2_2","name":"子串(字符串表达式,整数,整数)","isParent":"false","pid":"1"},
	            {"id":"A_str4","name":"串长(字符串表达式)","isParent":"false","pid":"1"},
	            {"id":"A_str5_2","name":"左串(字符串表达式,整数)","isParent":"false","pid":"1"},
	            {"id":"A_str6_2","name":"右串(字符串表达式,整数)","isParent":"false","pid":"1"},
	          //  {"id":"AA_str7","name":"登录用户名(1|2)","isParent":"false","pid":"1"},
	            {"id":"2","name":"日期函数","isParent":"true"},
	            {"id":"D_data0","name":"年(日期)","isParent":"false","pid":"2"},
	            {"id":"D_data1","name":"月(日期)","isParent":"false","pid":"2"},
	            {"id":"D_data2","name":"日(日期)","isParent":"false","pid":"2"},
	            {"id":"D_data3","name":"季度(日期)","isParent":"false","pid":"2"},
	            {"id":"D_data4","name":"周(日期)","isParent":"false","pid":"2"},
	            {"id":"D_data5","name":"星期(日期)","isParent":"false","pid":"2"},
	            {"id":"DD_data6","name":"今天","isParent":"false","pid":"2"},
	            {"id":"DD_data7","name":"本周","isParent":"false","pid":"2"},
	            {"id":"DD_data8","name":"本月","isParent":"false","pid":"2"},
	            {"id":"DD_data9","name":"本季度","isParent":"false","pid":"2"},
	            {"id":"DD_data10","name":"今年","isParent":"false","pid":"2"},
	            {"id":"DD_data11","name":"截止日期","isParent":"false","pid":"2"},
	            {"id":"D_data12","name":"年龄(日期)","isParent":"false","pid":"2"},
	            {"id":"D_data13","name":"工龄(日期)","isParent":"false","pid":"2"},
	            {"id":"D_data14","name":"到月年龄(日期)","isParent":"false","pid":"2"},
	            {"id":"D_data15_1","name":"年数(日期1,日期2)","isParent":"false","pid":"2"},
	            {"id":"D_data16_1","name":"月数(日期1,日期2)","isParent":"false","pid":"2"},
	            {"id":"D_data17_1","name":"天数(日期1,日期2)","isParent":"false","pid":"2"},
	            {"id":"D_data18_1","name":"季度数(日期1,日期2)","isParent":"false","pid":"2"},
	            {"id":"D_data19_1","name":"周数(日期1,日期2)","isParent":"false","pid":"2"},
	            {"id":"D_data20_2","name":"增加年数(日期,整数)","isParent":"false","pid":"2"},
	            {"id":"D_data21_2","name":"增加月数(日期,整数)","isParent":"false","pid":"2"},
	            {"id":"D_data22_2","name":"增加天数(日期,整数)","isParent":"false","pid":"2"},
	            {"id":"D_data23_2","name":"增加季度数(日期,整数)","isParent":"false","pid":"2"},
	            {"id":"D_data24_2","name":"增加周数(日期,整数)","isParent":"false","pid":"2"},
	            {"id":"DD_data25","name":"归属日期或归属日期()","isParent":"false","pid":"2"},
	            {"id":"3","name":"转换函数","isParent":"true"},
	            {"id":"T_str0","name":"字符转日期(字符串表达式)","isParent":"false","pid":"3"},
	            {"id":"T_str1","name":"字符转数值(字符串表达式)","isParent":"false","pid":"3"},
	            {"id":"T_data2","name":"日期转字符(日期)","isParent":"false","pid":"3"},
	            {"id":"T_num3","name":"数值转字符(数值表达式)","isParent":"false","pid":"3"},
	            {"id":"T_vol7_2","name":"数字转汉字(指标,参数)","isParent":"false","pid":"3"},
	           // {"id":"T_code4","name":"代码转名称(指标名称)","isParent":"false","pid":"3"},
	           // {"id":"T_item6_5","name":"代码转名称2(表达式,代码类)","isParent":"false","pid":"3"},
	           // {"id":"TT_tra5","name":"代码指标","isParent":"false","pid":"3"},
	             {"id":"4","name":"类型不定函数","isParent":"true"},
	            {"id":"V_vol6","name":"为空(指标)","isParent":"false","pid":"4"},
	            {"id":"VV_vol0","name":"如果 那么 否则 结束","isParent":"false","pid":"4"},
	            {"id":"VV_vol1","name":"分情况 如果 Lexp1 那么 exp1 如果 Lexp2 那么 exp2 [否则expn] 结束","isParent":"false","pid":"4"},
	            {"id":"V_vol2_6","name":"较大值(exp1,exp2)","isParent":"false","pid":"4"},
	            {"id":"V_vol3_6","name":"较小值(exp1,exp2)","isParent":"false","pid":"4"},
//	            {"id":"V_vol4_2_1","name":"取 指标名称 [最近第|最初第] 整数 条记录","isParent":"false","pid":"4"},
//	            {"id":"V_vol5_3_3","name":"统计 指标名称 满足 条件 [的最初一条记录|的最近一条记录|的最大值|的最小值|的总和|的平均值|的个数]","isParent":"false","pid":"4"},
//	            {"id":"10","name":"工资函数","isParent":"true"},
//	            {"id":"S_stan0","name":"执行标准(标准号,横一,横二,纵一,纵二)","isParent":"false","pid":"10"},
//	            {"id":"S_sthl1","name":"就近就高(标准表号, 纵向指标, 结果指标)","isParent":"false","pid":"10"},
//	            {"id":"S_sthl2","name":"就近就低(标准表号, 纵向指标, 结果指标)","isParent":"false","pid":"10"},
//	            {"id":"S_item3_2_4","name":"前一个代码(代码指标,增量,极值代码)","isParent":"false","pid":"10"},
//	            {"id":"S_item4_2_4","name":"后一个代码(代码指标,增量,极值代码)","isParent":"false","pid":"10"},
//	            {"id":"S_item5_7_4_5","name":"代码调整(代码指标,增量,极大值代码,极小值代码)","isParent":"false","pid":"10"},
//	            {"id":"SS_sar8","name":"历史记录最初指标值","isParent":"false","pid":"10"},
//	            {"id":"SS_sar9","name":"上一个历史记录指标值","isParent":"false","pid":"10"},
	            {"id":"5","name":"常量","isParent":"true"},
	            {"id":"CC_con0","name":"真","isParent":"false","pid":"5"},
	            {"id":"CC_con1","name":"假","isParent":"false","pid":"5"},
	            {"id":"CC_con2","name":"空(日期)","isParent":"false","pid":"5"},
	            {"id":"CC_con3","name":"#2000.3.22#表示2000年3月22日","isParent":"false","pid":"5"},
	            {"id":"CC_con4","name":"#3.22#今年3月22号","isParent":"false","pid":"5"},
	            {"id":"CC_con5","name":"“张三”表示姓名为张三","isParent":"false","pid":"5"},
	            {"id":"6","name":"逻辑操作符","isParent":"true"},
	            {"id":"LL_log0","name":"且","isParent":"false","pid":"6"},
	            {"id":"LL_log1","name":"或","isParent":"false","pid":"6"},
	            {"id":"LL_log2","name":"非","isParent":"false","pid":"6"},
	            {"id":"7","name":"算术运算符","isParent":"true"},
	            {"id":"OO_opr0","name":"+(加)","isParent":"false","pid":"7"},
	            {"id":"OO_opr1","name":"-(减)","isParent":"false","pid":"7"},
	            {"id":"OO_opr2","name":"*(乘)","isParent":"false","pid":"7"},
	            {"id":"OO_opr3","name":"/(除)","isParent":"false","pid":"7"},
	            {"id":"OO_opr4","name":"\\(整除)","isParent":"false","pid":"7"},
	            {"id":"OO_opr5","name":"DIV(整除)","isParent":"false","pid":"7"},
	            {"id":"OO_opr6","name":"%(求余)","isParent":"false","pid":"7"},
	            {"id":"OO_opr7","name":"MOD(求余)","isParent":"false","pid":"7"},
	            {"id":"8","name":"关系运算符","isParent":"true"},
	            {"id":"RR_rel0","name":"=(等于)","isParent":"false","pid":"8"},
	            {"id":"RR_rel1","name":">(大于)","isParent":"false","pid":"8"},
	            {"id":"RR_rel2","name":">=(大于等于)","isParent":"false","pid":"8"},
	            {"id":"RR_rel3","name":"<(小于)","isParent":"false","pid":"8"},
	            {"id":"RR_rel4","name":"<=(小于等于)","isParent":"false","pid":"8"},
	            {"id":"RR_rel5","name":"<>(不等于)","isParent":"false","pid":"8"},
	            {"id":"RR_rel6","name":"LIKE(包含)","isParent":"false","pid":"8"},
	            {"id":"9","name":"其他","isParent":"true"},
	            {"id":"EE_oth0","name":"( )括号","isParent":"false","pid":"9"},
	            {"id":"EE_oth1","name":"[ ]中括号","isParent":"false","pid":"9"},
	            {"id":"EE_oth2","name":"{ }大括号","isParent":"false","pid":"9"},
	            {"id":"EE_oth3","name":"//注释标识","isParent":"false","pid":"9"}];
}
function toggleSelect(itemtoArr){
	var itemtoArrObj = $("#"+itemtoArr+"_item");
	var t = itemtoArrObj.offset().top;
	t += 30;
	var l = itemtoArrObj.offset().left;
	
	$("#selectItemPanle").css({top:t+"px",left:l+"px"}).show();
	$("#nodeitemid").val(itemtoArr);
	
	setTimeout(function(){
		$("#itemtreenode").bind("click",function(){
			hideItemTree();
		});
	},10);
	
}
function hideItemTree(){
	$("#selectItemPanle").hide();
	$("#itemtreenode").unbind("click");
}
function toggleText(arrtoItem){
	$("#"+itemtoArr+"_arr").hide();
	$("#"+itemtoArr+"_item").show();
	var itemvalue = $("#"+arrtoItem+"_arr").val();
	var itemarr = itemvalue.split(":");
	if(itemarr.length==2){
		$("#"+arrtoItem+"_item").val(itemarr[1]);
	}else{
		$("#"+arrtoItem+"_item").val("");
	}
}