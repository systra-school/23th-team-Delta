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

<style>
  @import url('https://fonts.googleapis.com/css2?family=Zen+Old+Mincho:wght@700&display=swap');
  
  #wrapper{
   margin-top:65px;
  }
  
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
  margin: 0% auto;
  padding: 10px;
  border: 1px solid #888;
  width: 60%;
  font-family: 'Zen Old Mincho', serif; /* Applied to all content inside the modal */
}

.modal-content img {
  display: block;
  max-width: 100%;
  height: auto;
}

.modal-content p {
  font-size: 40px;
  color: #333;
}

.modal-buttons button {
  font-family: 'Zen Old Mincho', serif; /* Ensure buttons inherit the same font */
  font-size: 35px;
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
  
   .box { 
   overflow: hidden; 
   width: 150px; 
   height: 240px; 
   animation: pikopiko 1s steps(2, start) infinite; 
 } 

 @keyframes pikopiko { 
   0% { 
     transform: rotate(20deg); 
   } 
   to { 
     transform: rotate(-10deg); 
   } 
 } 
  
</style>

<html:javascript formName="loginForm" />
<title>ログイン画面</title>
<link href="/kikin-for-Struts-bug/pages/css/common.css" rel="stylesheet" type="text/css" />
<link href="/kikin-for-Struts-bug/pages/css/animation.css" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css2?family=BIZ+UDPGothic:wght@400;700&family=DotGothic16&family=Hachi+Maru+Pop&family=Klee+One:wght@400;600&family=Murecho:wght@100..900&family=Zen+Maru+Gothic:wght@300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="icon" href="/kikin-for-Struts-bug/pages/img/icon.jpg" type="image/x-icon">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</head>

<body class="fade-in"> <!-- ページ全体にフェードインアニメーションを追加 -->

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
	<div id="loginBody">
		<div align="center">
			<div style="font-size:25px; font-family: 'Noto Sans Japanese', sans-serif;"></div>

			<html:form action="/login" onsubmit="return validateLoginForm(this)" styleId="loginForm">
			    <html:text property="employeeId" size="25" value="" styleId="employeeId" style="height: 30px;" />
			    <br /><br>
			    <html:password property="password" size="25" redisplay="false" styleId="password" style="height: 30px;" />
			    <br /><br />
			    <div class="buttons">
			        <html:submit property="submitBtn" value="ログイン" styleClass="submit-button animated-button" />
			        <html:reset value="リセット" styleClass="reset-button animated-button" />
			    </div>
			</html:form>

			<img src="/kikin-for-Struts-bug/pages/img/ぜるだ.png" style="width: 100px;  height: 90px;" alt="ぜるだ画像">
			<div class="box">
				<img src="/kikin-for-Struts-bug/pages/img/img_6378.png" style="width: 150px;  height: 240px;" alt="ドット画像">
			</div>
		</div>
	</div>

	<div id="footer">
	  <table>
	    <tr>
	      <td id="footLeft"></td>
	      <td id="copyrightfootCenter">
	      <ul class="sns_button">
	  			<li><a href="#" target="_blank" rel="nofollow"><i class="fab fa-twitter"></i></a></li>
	  			<li><a href="https://www.facebook.com/systra.co.jp/" target="_blank" rel="nofollow"><i class="fab fa-facebook-square"></i></a></li>
	  			<li><a href="#" target="_blank" rel="nofollow"><i class="fab fa-line"></i></a></li>
	  			<li><a href="https://www.youtube.com/@S.YOSHIDA.safety" target="_blank" rel="nofollow"><i class="fab fa-youtube"></i></a></li>
			</ul>
			<p>&copy; 2024 風と愉快な仲間たち Co.,Ltd. All rights reserved.</p>
	      </td>
	      <td id="footRight"></td>
	    </tr>
	  </table>
	</div>
</div>

<!-- モーダル -->
<div id="loginModal" class="modal slide-in">
  <div class="modal-content">
    <span class="close">&times;</span>
    <p>ログインする覚悟はいいか？俺はできてる</p>
    <img src="/kikin-for-Struts-bug/pages/img/kakugo.png" alt="確認画像">
    <div class="modal-buttons">
      <button id="confirmLogin" class="animated-button" onclick="submitForm()">「ログインする」と心の中で思ったならッ！ その時スデに行動は終わっているんだッ！</button>
      <button id="cancelLogin" class="animated-button">逃げるんだよォォォーーーーーッ</button>
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
    // モーダルをフェードインで表示
    modal.classList.add("show-modal");
    return false; // フォーム送信を中止
  }

  span.onclick = function() {
    modal.classList.remove("show-modal");
  }

  cancelButton.onclick = function() {
    modal.classList.remove("show-modal");
  }

  function submitForm() {
    modal.classList.remove("show-modal");
    document.forms["loginForm"].submit();
  }

  window.onclick = function(event) {
    if (event.target == modal) {
      modal.classList.remove("show-modal");
    }
  }

  document.getElementById("employeeId").setAttribute("placeholder", "ログインIDを入力");
  document.getElementById("password").setAttribute("placeholder", "パスワードを入力");
</script>

</body>
</html>