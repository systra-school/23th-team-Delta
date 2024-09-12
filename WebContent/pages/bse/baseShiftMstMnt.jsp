<!-- baseShiftMstMnt.jsp -->
<%@page import="constant.CommonConstant.DayOfWeek"%>
<%
/**
* ファイル名：baseShiftMstMnt.jsp
*
* 変更履歴
* 1.0  2010/11/13 新規作成 西岡孝太郎
*/
%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="constant.RequestSessionNameConstant"%>
<%@ page import="constant.CommonConstant"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<% String color = ""; %>
<html>
  <head>
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="Thu, 01 Dec 1994 16:00:00 GMT">
    <script type="text/javascript" src="/kikin-for-Struts-bug/pages/js/common.js">
    </script>
    <script type="text/javascript" src="/kikin-for-Struts-bug/pages/js/checkCommon.js">
    </script>
    <script type="text/javascript" src="/kikin-for-Struts-bug/pages/js/message.js">
    </script>
    <script type="text/javascript">
    /**
     * 登録へ
     */
    function register() {
    	
        /// 登録確認のポップアップを表示
        if (!confirm("この内容で登録しますか？")) {
            // キャンセルされた場合、処理を中断
            return false;
        }
    	
        alert("登録に成功しました！");
        
        // サブミット
        doSubmit('/kikin-for-Struts-bug/baseShiftRegister.do');
    }			   
    </script>

    <title>
    基本シフト登録
    </title>
    <link href="/kikin-for-Struts-bug/pages/css/common.css" rel="stylesheet" type="text/css" />
  	<link rel="icon" href="/kikin-for-Struts-bug/pages/img/icon.jpg" type="image/x-icon">
  	
  </head>
  <body>
  
  <header id="header">
        
            <div id="headLeft">
              <input value="戻る" type="button" class="smallButton"  onclick="doSubmit('/kikin-for-Struts-bug/menu.do')" />
            </div>
            <div id="headCenter">
              基本シフト登録
            </div>
            <div id="headRight">
              <input value="ログアウト" type="button" class="smallButton"  onclick="logout()" />
            </div>
          
      </header>
  
    <div id="wrapper">
      
      <div id="businessBody">
        <html:form action="/baseShiftRegister" >
          <div class="centered-container">
          <%-- 凡例 --%>
          <div id="pattern" style="width:600px; margin-left:0px; float:left">
            <div>
              <table class="tableHeader">
                <tr style="height: 35px;">
                  <td width="100px" align="center">
                    シフト名
                  </td>
                  <td width="100px" align="center">
                    シンボル
                  </td>
                  <td width="200px" align="center">
                    時間
                  </td>
                  <td width="100px" align="center">
                    休憩
                  </td>
                </tr>
              </table>
            </div>
            <div style="height:200px;overflow:auto">
              <table class="tableBody">
                <logic:iterate id="baseShiftPatternBeanList" name="baseShiftMstMntForm"  property="baseShiftPatternBeanList" indexId="idx">
                  <tr style="height: 35px;">
                    <td width="100px" align="center">
                      <bean:write property="shiftName" name="baseShiftPatternBeanList"/>
                    </td>
                    <td width="100px" align="center">
                      <bean:write property="symbol" name="baseShiftPatternBeanList"/>
                    </td>
                    <td width="200px" align="center">
                      <bean:write property="timeZone" name="baseShiftPatternBeanList" filter="false"/>
                    </td>
                    <td width="100px" align="center">
                      <bean:write property="breakTime" name="baseShiftPatternBeanList"/>
                    </td>
                  </tr>
                </logic:iterate>
              </table>
            </div>
          </div>
          <div id="data" style="width:600px; margin-left:0px; float:right">
            <div>
              <table class="tableHeader">
                <tr>
                  <td width="200px" align="center">
                    社員名
                  </td>
                  <td width="50px" align="center">
                    月
                  </td>
                  <td width="50px" align="center">
                    火
                  </td>
                  <td width="50px" align="center">
                    水
                  </td>
                  <td width="50px" align="center">
                    木
                  </td>
                  <td width="50px" align="center">
                    金
                  </td>
                  <td width="50px" align="center">
                    土
                  </td>
                  <td width="50px" align="center">
                    日
                  </td>
                </tr>
              </table>
            </div>
            <div style="height:500px;overflow:auto">
              <table class="tableBody">
                <logic:iterate id="baseShiftMstMntBeanList" name="baseShiftMstMntForm" property="baseShiftMstMntBeanList" indexId="idx">
                  <tr style="height: 20px;">
                    <html:hidden name="baseShiftMstMntBeanList" property="employeeId" />
                    <td width="200px" align="center">
                      <bean:write property="employeeName" name="baseShiftMstMntBeanList"/>
                    </td>
                    <td width="50px" align="center">
                      <html:select property="shiftIdOnMonday" name="baseShiftMstMntBeanList" indexed="true" >
                      <html:optionsCollection name="baseShiftMstMntForm" property="shiftCmbMap" value="key" label="value"/>
                      </html:select>
                    </td>
                    <td width="50px" align="center">
                      <html:select property="shiftIdOnTuesday" name="baseShiftMstMntBeanList" indexed="true" >
                      <html:optionsCollection name="baseShiftMstMntForm" property="shiftCmbMap" value="key" label="value"/>
                      </html:select>
                    </td>
                    <td width="50px" align="center">
                      <html:select property="shiftIdOnWednesday" name="baseShiftMstMntBeanList" indexed="true" >
                      <html:optionsCollection name="baseShiftMstMntForm" property="shiftCmbMap" value="key" label="value"/>
                      </html:select>
                    </td>
                    <td width="50px" align="center">
                      <html:select property="shiftIdOnThursday" name="baseShiftMstMntBeanList" indexed="true" >
                      <html:optionsCollection name="baseShiftMstMntForm" property="shiftCmbMap" value="key" label="value"/>
                      </html:select>
                    </td>
                    <td width="50px" align="center">
                      <html:select property="shiftIdOnFriday" name="baseShiftMstMntBeanList" indexed="true" >
                      <html:optionsCollection name="baseShiftMstMntForm" property="shiftCmbMap" value="key" label="value"/>
                      </html:select>
                    </td>
                    <td width="50px" align="center">
                      <html:select property="shiftIdOnSaturday" name="baseShiftMstMntBeanList" indexed="true" >
                      <html:optionsCollection name="baseShiftMstMntForm" property="shiftCmbMap" value="key" label="value"/>
                      </html:select>
                    </td>
                    <td width="50px" align="center">
                      <html:select property="shiftIdOnSunday" name="baseShiftMstMntBeanList" indexed="true" >
                      <html:optionsCollection name="baseShiftMstMntForm" property="shiftCmbMap" value="key" label="value"/>
                      </html:select>
                    </td>
                  </tr>
                </logic:iterate>
              </table>
            </div>
          </div>
          </div>
        </html:form>
      </div>
      <div id="footer" style="position: fixed; bottom: 0; width: 95%;">
        <table>
          <tr>
            <td id="footLeft">
              　
            </td>
            <td id="footCenter">
              　
            </td>
            <td id="footRight">
              <input value="登録"  type="button" class="smallButton"  onclick="register()" />
            </td>
          </tr>
        </table>
      </div>
    </div>
  </body>
</html>
