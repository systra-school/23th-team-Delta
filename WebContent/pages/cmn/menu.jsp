<!-- menu.jsp -->
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="constant.RequestSessionNameConstant"%>
<%@ page import="constant.CommonConstant"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>

<html lang="ja">
<head>
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="Thu, 01 Dec 1994 16:00:00 GMT">
    <html:javascript formName="loginForm" />
    <script type="text/javascript" src="/kikin-for-Struts-bug/pages/js/common.js"></script>
    <script type="text/javascript" src="/kikin-for-Struts-bug/pages/js/checkCommon.js"></script>
    <script type="text/javascript" src="/kikin-for-Struts-bug/pages/js/message.js"></script>

    <title>メニュー画面</title>
    <link href="/kikin-for-Struts-bug/pages/css/common.css" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css2?family=BIZ+UDPGothic:wght@400;700&family=DotGothic16&family=Hachi+Maru+Pop&family=Klee+One:wght@400;600&family=Murecho:wght@100..900&family=Zen+Maru+Gothic:wght@300;400;500;700;900&display=swap" rel="stylesheet">
    <link rel="icon" href="/kikin-for-Struts-bug/pages/img/icon.jpg" type="image/x-icon">
    
    <style>
        .flex-container {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
        }
        .flex {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }
        
        /* ここにCSSアニメーションを追加 */
        .page-enter {
            animation: fadeIn 0.5s forwards;
        }
        .page-exit {
            animation: fadeOut 0.5s forwards;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        
        @keyframes fadeOut {
            from { opacity: 1; }
            to { opacity: 0; }
        }
    </style>
</head>
<body>
<% 
    String userId = (String) session.getAttribute(RequestSessionNameConstant.SESSION_CMN_LOGIN_USER_ID); 
    String userName = (String) session.getAttribute(RequestSessionNameConstant.SESSION_CMN_LOGIN_USER_NAME); 
%>
<div class="bird"></div>
<div class="bird -type_2"></div>
<div class="bird -type_3"></div>
<div id="header">
    <table class="full-width">
        <tr>
            <td id="headLeft">
                <div style="color: white;">
                    社員ID: <%= userId %><br>
                    社員名: <%= userName %>
                </div>
            </td>
            <td id="headCenter">
                <logic:equal name="<%=RequestSessionNameConstant.SESSION_CMN_LOGIN_USER_INFO %>"
                             property="authorityId"
                             value="<%=CommonConstant.Authority.ADMIN.getId() %>">
                    メニュー(管理者)
                </logic:equal>
                <logic:equal name="<%=RequestSessionNameConstant.SESSION_CMN_LOGIN_USER_INFO %>"
                             property="authorityId"
                             value="<%=CommonConstant.Authority.USER.getId() %>">
                    メニュー(一般)
                </logic:equal>
            </td>
            <td id="headRight">
                <input value="ログアウト" type="button" class="smallButton" onclick="logout()" />
            </td>
        </tr>
    </table>
</div>

<div id="wrapper">
    <div id="businessBody">
        <logic:equal name="<%=RequestSessionNameConstant.SESSION_CMN_LOGIN_USER_INFO %>"
                     property="authorityId"
                     value="<%=CommonConstant.Authority.ADMIN.getId() %>">
            <div style="margin-top:60px;"> 
                <div class="flex-container">
                    <div class="flex">
                        <div class="menuBlock" title="新規入力">
                            <html:form action="/workRecordInputInit">
                                <input type="submit" value="勤務実績入力" class="bigButton" />
                            </html:form>
                            <html:form action="/monthlyShiftInputInit">
                                <input type="submit" value="月別シフト入力" class="bigButton" />
                            </html:form>
                            <html:form action="/baseShiftInit">
                                <input type="submit" value="基本シフト登録" class="bigButton" />
                            </html:form>
                        </div>

                        <div class="menuBlock" title="勤怠確認">
                            <html:form action="/workRecordCheckInit">
                                <input type="submit" value="勤務実績確認" class="bigButton" />
                            </html:form>
                            <html:form action="/monthlyShiftCheckInit">
                                <input type="submit" value="月別シフト確認" class="bigButton" />
                            </html:form>
                            <html:form action="/workDateRequestCheckInit">
                                <input type="submit" value="出勤希望日確認" class="bigButton" />
                            </html:form>
                            <html:form action="/dailyShiftInit">
                                <input type="submit" value="日別シフト確認" class="bigButton" />
                            </html:form>
                        </div>

                        <div class="menuBlock" title="マスタメンテナンス">
                            <html:form action="/employeeMstMnt">
                                <input type="submit" value="社員マスタメンテナンス" class="bigButton" />
                            </html:form>
                            <html:form action="/shiftMstMnt">
                                <input type="submit" value="シフトマスタメンテナンス" class="bigButton" />
                            </html:form>
                        </div>
                    </div>
                </div>
            </div>
        </logic:equal>

        <logic:equal name="<%=RequestSessionNameConstant.SESSION_CMN_LOGIN_USER_INFO %>"
                     property="authorityId"
                     value="<%=CommonConstant.Authority.USER.getId() %>">
            <div style="margin-top:60px;">
                <div class="flex-container">
                    <div class="flex">
                        <div class="menuBlock" title="新規入力">
                            <html:form action="/workRecordInputInit">
                                <input type="submit" value="勤務実績入力" class="bigButton" />
                            </html:form>
                            <html:form action="/workDateRequestInputInit">
                                <input type="submit" value="出勤希望日入力" class="bigButton" />
                            </html:form>
                        </div>
                        
                        <div class="menuBlock" title="勤怠管理">
                            <html:form action="/baseShiftCheckInit">
                                <input type="submit" value="基本シフト確認" class="bigButton" />
                            </html:form>
                            <html:form action="/monthlyShiftCheckInit">
                                <input type="submit" value="月別シフト確認" class="bigButton" />
                            </html:form>
                            <html:form action="/dailyShiftInit">
                                <input type="submit" value="日別シフト確認" class="bigButton" />
                            </html:form>
                        </div>
                    </div>
                </div>
            </div>
        </logic:equal>
    </div>          
</div>

<div id="footer">
    <table>
        <tr>
            <td id="footLeft"> </td>
            <td id="footCenter"> </td>
            <td id="footRight"> </td>
        </tr>
    </table>
</div>

<script type="text/javascript">
    // ページ遷移時のアニメーションを処理する関数
    function handlePageTransition(newUrl) {
        var currentPage = document.querySelector('body');
        currentPage.classList.add('page-exit');
        
        setTimeout(function() {
            window.location.href = newUrl;
        }, 500); // アニメーションの時間と一致させる
    }

    document.addEventListener('DOMContentLoaded', function() {
        document.querySelectorAll('input[type="submit"]').forEach(function(button) {
            button.addEventListener('click', function(event) {
                event.preventDefault(); // デフォルトのフォーム送信を防ぐ
                var form = button.closest('form');
                handlePageTransition(form.action);
            });
        });
    });
</script>
</body>
</html>