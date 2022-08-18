function get_hitokoto()
{
    xmlhttp = new XMLHttpRequest();
    xmlhttp.open("GET","https://v1.hitokoto.cn",true);
    xmlhttp.send();
    return xmlhttp.responseText.toString();
}
