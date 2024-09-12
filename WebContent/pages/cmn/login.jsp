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
  @import url('https://fonts.googleapis.com/css2?family=Zen+Old+Mincho:wght@700&display=swap');
  
  
  .modal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0,0,0,0.4);
  }

  .modal-content {
  background-color: #fefefe;
  margin: 10% auto;
  padding: 10px;
  border: 1px solid #888;
  width: 40%;
  font-family: 'Zen Old Mincho', serif; /* Applied to all content inside the modal */
}

.modal-content img {
  display: block;
  max-width: 100%;
  height: auto;
}

.modal-content p {
  font-size: 18px;
  color: #333;
}

.modal-buttons button {
  font-family: 'Zen Old Mincho', serif; /* Ensure buttons inherit the same font */
  font-size: 16px;
  margin: 5px; /* Add margin for spacing between buttons */
}

.close {
  color: #aaa;
  float: right;
  font-size: 24px;
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
    margin-top: 10px; 
  }

  .modal-buttons button {
    font-size: 16px; 
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

<header id="header">
			
	<div id="headLeft"></div>
	<div id="headCenter">ログイン</div>
	<div id="headRight"></div>
				
</header>
<div id="wrapper">
	

	<div id="businessBody">
		<div align="center">
			<div style="font-size:25px; font-family: 'Noto Sans Japanese', sans-serif;">
			</div>

			<html:form action="/login" onsubmit="return validateLoginForm(this)" styleId="loginForm">
    <html:text property="employeeId" size="25" value="" styleId="employeeId" style="height: 25px;" />
    <br />
    <br>
    <html:password property="password" size="25" redisplay="false" styleId="password" style="height: 25px;" />
    <br />
    <br />
    <div class="buttons">
        <html:submit property="submitBtn" value="ログイン" styleClass="submit-button" />
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
    <p>ログインする覚悟はいいか？俺はできてる</p>
   <img src="/kikin-for-Struts-bug/pages/img/kakugo.png" alt="確認画像">

    <div class="modal-buttons">
      <button id="confirmLogin" onclick="submitForm()">「ログインする」と心の中で思ったならッ！　その時スデに行動は終わっているんだッ！
</button>
      <button id="cancelLogin">やめとく</button>
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