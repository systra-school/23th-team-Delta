/**
 * ファイル名：check.js
 * 共通処理
 *
 * 変更履歴
 * 1.0  2010/09/10 Kazuya.Naraki
 */

/**
 *  ログアウトボタンサブミット
 */
function logout() {
    var isLogout = confirm("ログアウトしますか？");
    if (isLogout) {
        document.forms[0].action = "/kikin-for-Struts-bug/logout.do";
        document.forms[0].submit();
    } else {
        // キャンセル時は何もしない（ポップアップが閉じるだけ）
    }
}


/**
 *  戻るボタンサブミット
 */
function doSubmit(action) {
    document.forms[0].action = action;
    document.forms[0].submit();
}

