<!-- employeeMstMntRegister.jsp -->
<%
/**
 * ファイル名：employeeMstMntRegister.jsp
 *
 * 変更履歴
 * 1.0  2010/09/13 Kazuya.Naraki
 */
%>
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
    <script type="text/javascript" src="/kikin-for-Struts-bug/pages/js/common.js"></script>
    <script type="text/javascript" src="/kikin-for-Struts-bug/pages/js/checkCommon.js"></script>
    <script type="text/javascript" src="/kikin-for-Struts-bug/pages/js/message.js"></script>
    <script type="text/javascript">
    /**
     * チェックボックスがチェックされたら true、されていなければ false
     * param index 対象行番号
     */
    function checkDeleteFlg(index) {
      var isCheck = document.forms[0].elements.deleteEmployeeId[index].checked;

      document.forms[0].elements.deleteFlg[index].value = isCheck;
    }

    /**
     * 新規登録画面へ
     */
    function employeeMstMntRegister() {
    	
    	var password = document.forms[0].password.value;
        var employeeName = document.forms[0].employeeName.value;
        var employeeNameKana = document.forms[0].employeeNameKana.value;
        var authorityId = document.forms[0].authorityId.value;

        // ポップアップに表示する内容を組み立て
        var confirmationMessage = "以下の内容で登録しますか？\n\n" +
            "パスワード: " + password + "\n" +
            "社員名: " + employeeName + "\n" +
            "社員名カナ: " + employeeNameKana + "\n" +
            "権限: " + authorityId;

        // 登録確認のポップアップを表示
        if (!confirm(confirmationMessage)) {
            // キャンセルされた場合、処理を中断
            return false;
        }

        with (document.forms[0]) {
            // パスワード
            var passwordVar = password.value;
            // 社員名カナ
            var employeeNameKanaVar = employeeNameKana.value;
            //社員名
            var employeeNameVar = employeeName.value;
            // エラーメッセージ
            var errorMsg = '';

            // 背景色をクリアする
            password.style.backgroundColor = 'white';
            employeeNameKana.style.backgroundColor = 'white';

            // パスワード
            if (!checkRequired(passwordVar)) {
                // エラー有り
                var strArr = ['パスワード'];
                errorMsg += getMessage('E-MSG-000001', strArr);
                password.style.backgroundColor = 'red';
            }
            // 社員名カナ
            if (!checkHalfWidthKana(employeeNameKanaVar)) {
                // エラー有り
                var strArr = ['社員名カナ'];
                errorMsg += getMessage('E-MSG-000003', strArr);
                employeeNameKana.style.backgroundColor = 'red';
            }
            
            if (!checkRequired(employeeNameKanaVar)) {
                // エラー有り
                var strArr = ['社員名カナ'];
                errorMsg += getMessage('E-MSG-000001', strArr);
                employeeNameKana.style.backgroundColor = 'red';
            }
            
            if (!checkRequired(employeeNameVar)) {
                // エラー有り
                var strArr = ['社員名'];
                errorMsg += getMessage('E-MSG-000001', strArr);
                employeeName.style.backgroundColor = 'red';
            }

            if (errorMsg) {
                alert(errorMsg);
                // エラー
                return false;
            }
            
            alert("登録に成功しました！");
            
        }
        
        // サブミット
        doSubmit('/kikin-for-Struts-bug/employeeMstMntRegister.do');
    }
    </script>
    <title>社員マスタメンテナンス画面</title>

    <link href="/kikin-for-Struts-bug/pages/css/common.css" rel="stylesheet" type="text/css" />
    <link rel="icon" href="/kikin-for-Struts-bug/pages/img/icon.jpg" type="image/x-icon">
    
  </head>
  <body>
  
   <header id="header">
        
            <div id="headLeft">
              <input value="戻る" type="button" class="smallButton"  onclick="doSubmit('/kikin-for-Struts-bug/employeeMstMntRegisterBack.do')" />
            </div>
            <div id="headCenter">
              社員マスタメンテナンス（新規登録）
            </div>
            <div id="headRight">
            <input value="ログアウト" type="button" class="smallButton"  onclick="logout()" />
            </div>
        
      </header>
  
    <div id="wrapper">
     
      <div id="businessBody">
        <html:form action="/employeeMstMntRegister" >
          <div style="width: 650px;text-align: left;  margin: 0 auto;">
            <table class="tableHeader">
              <tr>
                <td width="150px" align="center" height="40px">
                  パスワード
                </td>
                 <td width="200px" align="center" height="40px">
                  社員名
                </td>
                <td width="200px" align="center" height="40px">
                  社員名カナ
                </td>
                <td width="100px" align="center" height="40px">
                  権限
                </td>
              </tr>
            </table>
          </div>
          <div style="overflow: auto;width: 650px; margin: 0 auto; ">
            <table class="tableBody">
              <tr>
                <td width="150px"  align="center" height="55px">
                  <html:password property="password"  value="" size="10" />
                </td>
                <td width="200px"  align="center" height="55px">
                  <html:text property="employeeName" value="" size="20" />
                </td>
                 <td width="200px"  align="center" height="55px">
                  <html:text property="employeeNameKana" value="" size="20" />
                  </td>
                <td width="100px" align="center" height="55px">
                  <html:select property="authorityId" value="01">
                    <html:optionsCollection name="employeeMstMntForm"
                                            property="authorityCmbMap"
                                            value="key"
                                            label="value"/>
                  </html:select>
					
                </td>
              </tr>
            </table>
            <br>
            
					
          </div>
        </html:form>
       <div>
        
        <div style="text-align:center; margin:0 auto; ">
    		<div style="display:inline-block; text-align:left; border: 3px solid rgba(0, 89, 179, 0.5); padding: 0px 20px 20px 20px">
    		<h3 style="color: red">※入力時の注意点※</h3>
        		・社員IDは登録時に自動で割り振られます<br>
        		・各項目は必須入力です<br>
        		・社員名カナは、半角カナで入力してください<br>
        		・管理者権限の選択忘れにご注意ください<br>
    		</div>
		</div>
       </div>
        
      </div>
    
    </div>
    
      <footer id="footer">
        
            <div id="footLeft">
              　
            </div>
            <div id="footCenter">
             
            </div>
            <div id="footRight">
              <input value="登録" type="button" class="smallButton"  onclick="employeeMstMntRegister()" />
            </div>
          
      </footer>
    
  </body>
</html>