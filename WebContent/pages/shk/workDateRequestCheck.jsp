<!-- workDateRequestCheck.jsp -->
<%@page import="constant.CommonConstant.DayOfWeek"%>
<%@page import="business.logic.utils.CheckUtils"%>
<%@page import="form.common.DateBean"%>
<%@page import="java.util.List"%>
<%@page import="form.shk.WorkDateRequestCheckForm"%>
<%
/**
 * ファイル名：workDateRequestCheck.jsp
 *
 * 変更履歴
 * 1.0  2010/09/13 Kazuya.Naraki
 * 2.0  2024/04/25 Atsuko.Yoshioka
 */
%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="constant.RequestSessionNameConstant"%>
<%@ page import="constant.CommonConstant"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>

<bean:size id="dateBeanListSize" name="workDateRequestCheckForm"
	property="dateBeanList" />
<bean:define id="offset" name="workDateRequestCheckForm"
	property="offset" />
<bean:define id="color" value="" type="java.lang.String" />
<bean:define id="showLength" value="19" type="java.lang.String" />
<bean:define id="symbol" value="" type="java.lang.String" />
<html lang="ja">
<head>
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="Thu, 01 Dec 1994 16:00:00 GMT">
<script type="text/javascript"
	src="/kikin-for-Struts-bug/pages/js/common.js"></script>
<script type="text/javascript"
	src="/kikin-for-Struts-bug/pages/js/checkCommon.js"></script>
<script type="text/javascript"
	src="/kikin-for-Struts-bug/pages/js/message.js"></script>
<script type="text/javascript">
	/**
	 * 検索
	 */
	function submitSearch() {
		doSubmit('/kikin-for-Struts-bug/workDateRequestCheckSearch.do');
	}
	/**
	 * サブウィンドウを開く
	 */
	function openWindow() {
		window
				.open(
						"/kikin-for-Struts-bug/shiftPattern.do?param=",
						"windowBPopup",
						"menubar=no, toolbar=no, scrollbars=auto, resizable=yes, width=520px, height=650px");
	}
</script>
<title>出勤希望確認画面</title>

<link href="/kikin-for-Struts-bug/pages/css/common.css" rel="stylesheet"
	type="text/css" />
	<link rel="icon" href="/kikin-for-Struts-bug/pages/img/icon.jpg" type="image/x-icon">
	
</head>
<body>
<header id="header">
			
					<div id="headLeft"><input value="戻る" type="button"
						class="smallButton"
						onclick="doSubmit('/kikin-for-Struts-bug/menu.do')" /></div>
					<div id="headCenter">出勤希望確認</div>
					<div id="headRight"><input value="ログアウト" type="button"
						class="smallButton" onclick="logout()" /></div>
			
		</header>
	<div id="wrapper">
		
		<div id="businessBody" style="overflow: hidden; height: auto;">
			<html:form action="/workDateRequestCheckInit">
				<div id="resize">
					表示年月：
					<html:select name="workDateRequestCheckForm" property="yearMonth"
						onchange="submitSearch()">

						<html:optionsCollection name="workDateRequestCheckForm"
							property="yearMonthCmbMap" value="key" label="value" />
					</html:select>

					<html:link
						href="/kikin-for-Struts-bug/workDateRequestCheckPage.do?paging=back">前へ</html:link>
					<html:link
						href="/kikin-for-Struts-bug/workDateRequestCheckPage.do?paging=next">次へ</html:link>
					<bean:write name="workDateRequestCheckForm" property="countPage" />
					/
					<bean:write name="workDateRequestCheckForm" property="maxPage" />
					<table class="widthTable">
						<tr>
							<td width="150px" valign="top">
								<table class="tableBody">
									<tr class="tableHeader">
										<td width="150px" align="center">&nbsp;</td>
									</tr>
									<tr class="tableHeader">
										<td width="150px" nowrap="nowrap" align="center">社員名</td>
									</tr>
									<logic:iterate offset="offset" length="<%=showLength %>"
										id="workDateRequestCheckBeanList"
										name="workDateRequestCheckForm"
										property="workDateRequestCheckBeanList">
										<tr class="tableBody">
											<td width="150px" align="center" class="tableBody"><bean:write
													property="employeeName" name="workDateRequestCheckBeanList" /><br>
											</td>
										</tr>
									</logic:iterate>
								</table>
							</td>
							<td valign="top">
								<div
									style="overflow-x: auto; overflow-y: hidden; height: 100%; text-align: center;">
									<table class="tableBody">
										<tr class="tableHeader">
											<%
											for (int i = 1; i <= dateBeanListSize; i++) {
											%>
											<td width="40px" align="center" valign="middle"><%=i%></td>
											<%
											}
											%>
										</tr>
										<tr class="tableHeader">
											<logic:iterate id="dateBeanList"
												name="workDateRequestCheckForm" property="dateBeanList">
												<bean:define id="weekDayEnum" name="dateBeanList"
													property="weekDayEnum" />
												<bean:define id="publicHolidayFlg" name="dateBeanList"
													property="publicHolidayFlg" />
												<%
												if (DayOfWeek.SATURDAY.equals(weekDayEnum)) {
													color = "fontBlue";
												} else if (DayOfWeek.SUNDAY.equals(weekDayEnum) || ((boolean) publicHolidayFlg)) {
													color = "fontRed";
												} else {
													color = "fontBlack";
												}
												%>
												<td width="40px" align="center" valign="middle"
													class="<%=color%>"><bean:write property="weekDay"
														name="dateBeanList" /></td>
											</logic:iterate>
										</tr>
										<logic:iterate offset="offset" length="<%=showLength %>"
											id="workDateRequestCheckBeanList"
											name="workDateRequestCheckForm"
											property="workDateRequestCheckBeanList">
											<tr class="tableBody">
												<%
												for (int i = 1; i <= dateBeanListSize; i++) {
												%>
												<td width="40px" align="center" valign="middle"
													class="tableBody">
													<%
													if (i < 10) {
														symbol = "symbol0" + i;
													} else {
														symbol = "symbol" + i;
													}
													%> <bean:write property="<%=symbol%>"
														name="workDateRequestCheckBeanList" />
												</td>
												<%
												}
												%>
											</tr>
										</logic:iterate>
									</table>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</html:form>
		</div>
		<div id="footer" style="padding: 0;">
			<table>
				<tr>
					<td id="footLeft">
						<div style="margin-left: 50px;">
							<input value="凡例表示" type="button" class="longButton"
								onclick="openWindow()" />
						</div>
					</td>
					<td id="footCenter"></td>
					<td id="footRight"></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>