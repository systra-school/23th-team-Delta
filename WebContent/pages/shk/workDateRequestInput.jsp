<%@page import="constant.CommonConstant.DayOfWeek"%>
<%@page import="business.logic.utils.CheckUtils"%>
<%@page import="form.common.DateBean"%>
<%@page import="java.util.List"%>
<%@page import="form.shk.WorkDateRequestInputForm"%>

<%
/**
 * ファイル名：workDateRequestInput.jsp
 *
 * 変更履歴
 * 1.0  2010/09/13 Kazuya.Naraki
 * 2.0  2024/04/25 Atsuko.Yoshioka
 */
%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="constant.RequestSessionNameConstant"%>
<%@page import="constant.CommonConstant"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>

<bean:size id="dateBeanListSize" name="workDateRequestInputForm" property="dateBeanList"/>
<bean:define id="color" value="" type="java.lang.String"/>
<bean:define id="showLength" value="userId" type="java.lang.String"/>
<bean:define id="shiftId" value="" type="java.lang.String"/>

<html lang="ja">
  <head>
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="Thu, 01 Dec 1994 16:00:00 GMT">
    <script type="text/javascript" src="/kikin-for-Struts-bug/pages/js/common.js"></script>
    <script type="text/javascript" src="/kikin-for-Struts-bug/pages/js/checkCommon.js"></script>
    <script type="text/javascript" src="/kikin-for-Struts-bug/pages/js/message.js"></script>
    
    <style>
        /* モーダルウィンドウのスタイル */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: #ff0000;
        }

        .modal-content {
            background-color: #000000;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 40%;
            text-align: center;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
    </style>

    <script type="text/javascript">
    /**
     * 登録
     */
    function submitRegister() {
    	
    	 /// 登録確認のポップアップを表示
        if (!confirm("この内容で登録しますか？")) {
            // キャンセルされた場合、処理を中断
            return false;
        }
    	 
        // サブミット
        doSubmit('/kikin-for-Struts-bug/workDateRequestInputRegister.do');
        
        alert("登録に成功しました！");
    }

    /**
     * 検索
     */
    function submitSearch() {
        doSubmit('/kikin-for-Struts-bug/workDateRequestInputSearch.do');
    }

    /**
     * サブウィンドウを開く
     */
    function openWindow() {
        window.open("/kikin-for-Struts-bug/shiftPattern.do?param=", "windowBPopup", "menubar=no, toolbar=no, scrollbars=auto, resizable=yes, width=520px, height=650px");
    }

    function openSearch() {
        window.open("/kikin-for-Struts-bug/workDateRequestCheckSubInit.do?param=", "searchPopup", "menubar=no, toolbar=no, scrollbars=auto, resizable=yes, width=1000px, height=600px");
    }
    
    function openModal() {
        document.getElementById('modal').style.display = 'block';
    }

    function closeModal() {
        document.getElementById('modal').style.display = 'none';
    }
    </script>

    <title>出勤希望入力画面</title>
    <link href="/kikin-for-Struts-bug/pages/css/common.css" rel="stylesheet" type="text/css" />
    <link rel="icon" href="/kikin-for-Struts-bug/pages/img/icon.jpg" type="image/x-icon">
    
  </head>

  <body>
    <% String user_id = (String)session.getAttribute("session_cmn_login_user_id"); %>

    <header id="header">
        <div id="headLeft">
            <input value="戻る" type="button" class="smallButton" onclick="doSubmit('/kikin-for-Struts-bug/menu.do')" />
        </div>
        <div id="headCenter">
            出勤希望入力
        </div>
        <div id="headRight">
            <input value="ログアウト" type="button" class="smallButton" onclick="logout()" />
        </div>
    </header>

    <div id="wrapper">
        <div id="businessBody" style="overflow: hidden;">
            <div style="margin-left:5%;">
                <html:form action="/workDateRequestInputInit">
                    表示年月：
                    <html:select name="workDateRequestInputForm" property="yearMonth" onchange="submitSearch()">
                        <html:optionsCollection name="workDateRequestInputForm"
                            property="yearMonthCmbMap"
                            value="key"
                            label="value"/>
                    </html:select>
                    <div>
                        <table class="widthTable">
                <tr>
                  <td width="150px" valign="top">
                    <table class="tableBody">
                      <tr class="tableHeader">
                        <td width="150px" align="center">
                          &nbsp;
                        </td>
                      </tr>
                      <tr class="tableHeader">
                        <td width="150px" nowrap = "nowrap" align="center">
                        社員名
                        </td>
                        </tr>
                      <logic:iterate length="<%=showLength %>" id="workDateRequestInputBeanList" name="workDateRequestInputForm" property="workDateRequestInputBeanList">
                       <logic:equal name="workDateRequestInputBeanList" property = "employeeId"  value="<%=user_id%>">
                      <tr class="tableBody">
                          <td width="150px" align="center" class="tableBody">
                            <bean:write property="employeeName" name="workDateRequestInputBeanList"/><br>
                          </td>
                        </tr>
                        </logic:equal>
                       </logic:iterate>
                    </table>
                  </td>
                  <td>
                    <div style="overflow-x: auto;overflow-y: hidden; width:1300px;height: 100%; text-align:center;">
                      <table class="tableBody">
                        <tr class="tableHeader">
 						  <% for(int i = 1;i <= dateBeanListSize;i++ ) { %>
                        	 <td width="40px" align="center" valign="middle">
                          		<%= i %> 
                          	 </td>
                      	  <% } %>
                        </tr>
                        <tr class="tableHeader">
                          <logic:iterate id="dateBeanList" name="workDateRequestInputForm" property="dateBeanList">
                          <bean:define id="weekDayEnum" name="dateBeanList" property="weekDayEnum"/>
                          <bean:define id="publicHolidayFlg" name="dateBeanList" property="publicHolidayFlg"/>
                              <%
                              if (DayOfWeek.SATURDAY.equals(weekDayEnum)) {
                                  color = "fontBlue";
                              } else if (DayOfWeek.SUNDAY.equals(weekDayEnum) || ((boolean)publicHolidayFlg)) {
                                  color = "fontRed";
                              } else {
                                  color = "fontBlack";
                              }
                              %>

                              <td width="40px" align="center" valign="middle" class="<%=color %>">
                                <bean:write property="weekDay" name="dateBeanList"/>
                              </td>
                          </logic:iterate>
                        </tr>
                        <logic:iterate offset="offset"  length="<%=showLength %>" id="workDateRequestInputBeanList" name="workDateRequestInputForm" property="workDateRequestInputBeanList">
                         <logic:equal name="workDateRequestInputBeanList" property = "employeeId"  value="<%=user_id%>">
                         <tr class="tableBody">
                         	<% for(int i = 1; i <= dateBeanListSize; i++) {%>
                            <td width="40px" align="center" valign="middle">
                            	<%if(i < 10){
                            			shiftId = "shiftId0" + i;
    							}else{
    									shiftId = "shiftId" + i;
    							} %>
                            	<html:select property="<%=shiftId %>" name="workDateRequestInputBeanList" indexed="true">
                            		<html:optionsCollection name="workDateRequestInputForm" property="shiftCmbMap" value="key" label="value"/>
                            	</html:select>
                          	</td>
                          	<% } %>
                          </tr>
                           </logic:equal>
                        </logic:iterate>
                      </table>
                    </div>
                  </td>
                </tr>
              </table>
                    </div>
                </html:form>
            </div>
        </div>

        <div id="footer">
            <table>
                <tr>
                    <td id="footLeft">
                        <input value="凡例表示" type="button" class="longButton" onclick="openWindow()" />
                        <input value="出勤希望日参照" type="button" class="longButton" onclick="openSearch()" />
                        <input value="給与アップの秘訣" type="button" class="longButton" onclick="openModal()" />
                    </td>
                    <td id="footCenter">　</td>
                    <td id="footRight">
                        <div style="margin-right:30px; margin-top: 150px;">
                            <input value="登録" type="button" class="longButton" onclick="submitRegister()" />
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <!-- モーダルウィンドウの内容 -->
    <div id="modal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h2>給与アップの秘訣</h2>
            <img src="/kikin-for-Struts-bug/pages/img/penny.png" alt="給与アップの秘訣" style="width:100%; height:auto;">
            <br>
            <input type="button" value="ｲｲｴ ｻｲｺｰ ﾃﾞｽ" class="longButton" onclick="closeModal()">
        </div>
    </div>
  </body>
</html>