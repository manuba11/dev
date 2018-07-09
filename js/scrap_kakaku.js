//Scraping code of kakaku.com

var urlKakakucom = "http://kakaku.com/search_results/";
var urlAddChar = "/?act=sp"; //これ何だろう？

//テキストボックス上でEnterキーが押された時の処理
//Formの入力イベントをチェックしてEnterのキーコードであればsubmit()を呼びだす。
var fncTBoxEnter = function()
{
    if(window.event.keycode==13)
    {
        document.forms.form1.tboxText.submit();
    }
}

var fncClickButton = function()
{
    var tArea = document.getElementById("t2");
    var strKeyword = document.forms.form1.tboxText.value;
    var strError = "There are no keywords. Please enter the keywords.";

    console.log(strKeyword);
    if(strKeyword != "")
    {
        tArea.innerHTML = urlKakakucom + EscapeSJIS(strKeyword) + urlAddChar;
        //console.log(tArea.innerHTML);
        //location.href = tArea.innerHTML;
        window.open(tArea.innerHTML, '_blank');
    }
    else {
        tArea.innerHTML = strError;
    }
}
