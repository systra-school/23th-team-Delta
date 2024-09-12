<!-- login.jsp -->
<%@page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>

<html lang="ja">
<head>
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="Thu, 01 Dec 1994 16:00:00 GMT">
<script type="text/javascript" src="/kikin-for-Struts-bug/pages/js/message.js"></script>
<html:javascript formName="loginForm" />
<title>ログイン画面</title>
<link href="/kikin-for-Struts-bug/pages/css/common.css" rel="stylesheet" type="text/css" />
<style>
  /* モーダルのスタイル */
  .modal {
    display: none; /* デフォルトでは非表示 */
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgb(0,0,0);
    background-color: rgba(0,0,0,0.4);
  }

  .modal-content {
    background-color: #fefefe;
    margin: 15% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
  }

  .modal-content img {
    max-width: 100%;
    height: auto;
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

  .modal-buttons {
    text-align: center;
    margin-top: 20px;
  }
</style>
</head>
<body>

<%
  if (session.getAttribute("error") != null) {
%>
  <script type="text/javascript">
    var msg = getMessageCodeOnly('E-MSG-000002');
    alert(msg);
  </script>
<%
  session.setAttribute("error", null);
}%>

<div id="wrapper">
	<div id="header">
		<table class="full-width">
			<tr>
				<td id="headLeft"></td>
				<td id="headCenter">ログイン</td>
				<td id="headRight"></td>
			</tr>
		</table>
	</div>

	<div id="businessBody">
		<div align="center">
			<div style="font-size:25px; font-family: 'Noto Sans Japanese', sans-serif;">
			</div>

			<html:form action="/login" onsubmit="return validateLoginForm(this)">
				<div style=""></div>
				<html:text property="employeeId" size="25" value="" style="height: 25px;" styleId="employeeId" />
				<br />
				<br>
				<div style=""></div>
				<html:password property="password" size="25" redisplay="false" value="" style="height: 25px;" styleId="password" />
				<br />
				<br />
				<br>
				<div class="buttons">
					<html:submit property="submit" value="ログイン" styleClass="submit-button" />
					<html:reset value="リセット" styleClass="reset-button" />
				</div>
			</html:form>
		</div>
	</div>

	<div id="footer">
		<table>
			<tr>
				<td id="footLeft"></td>
				<td id="footCenter"></td>
				<td id="footRight"></td>
			</tr>
		</table>
	</div>
</div>

<!-- モーダルのHTML -->
<div id="loginModal" class="modal">
  <div class="modal-content">
    <span class="close">&times;</span>
    <p>本当にログインしますか？</p>
   <img src="/kikin-for-Struts-bug/pages/images/kakugo.png" alt="確認画像">

    <div class="modal-buttons">
      <button id="confirmLogin" onclick="submitForm()">ログイン</button>
      <button id="cancelLogin">キャンセル</button>
    </div>
  </div>
</div>

<!-- JavaScript -->
<script type="text/javascript">
  var modal = document.getElementById("loginModal");
  var span = document.getElementsByClassName("close")[0];
  var cancelButton = document.getElementById("cancelLogin");
  var confirmButton = document.getElementById("confirmLogin");

  function validateLoginForm(form) {
    modal.style.display = "block";
    return false; // フォーム送信を中止
  }

  span.onclick = function() {
    modal.style.display = "none";
  }

  cancelButton.onclick = function() {
    modal.style.display = "none";
  }

  function submitForm() {
    document.forms["loginForm"].submit();
  }

  window.onclick = function(event) {
    if (event.target == modal) {
      modal.style.display = "none";
    }
  }

  document.getElementById("employeeId").setAttribute("placeholder", "ログインIDを入力");
  document.getElementById("password").setAttribute("placeholder", "パスワードを入力");
</script>

</body>
</html>
