<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">

		var xmlHttp;

		function getMoreContent() {

			var content = document.getElementById("keyword").value;

			if(content==""){
		cleanKeyContent();

				return;

			}

			xmlHttp = getXmlHttp();		//获取XmlHttp对象实现Ajax异步传输数据

			var url = "AjaxTest1?keyword="+encodeURI(encodeURI(content));	//encodeURI解决中文关键字乱码问题

			xmlHttp.open("GET", url, true);


			xmlHttp.onreadystatechange = callback;		//调用onreadystatechange的回调函数

			xmlHttp.send(null);
	}


		//获取XmlHttp对象实现Ajax异步传输数据

		function getXmlHttp() {
	var xmlHttp;
		if(window.XMLHttpRequest){			//这种情况针对于目前主流浏览器都适用

		xmlHttp = new XMLHttpRequest();

			}


			if(window.ACTIVEXObject){

				xmlHttp = new ACTIVEXObject("Microsoft.XMLHttp");
		if(!xmlHttp){

			xmlHttp = new ACTIVEXObject("Msxml2.XMLHttp");

				}


			}

			return xmlHttp;


		}



		function callback() {

			if(xmlHttp.readyState == 4 && xmlHttp.status == 200){

				var result = xmlHttp.responseText;		//获取服务器返回的文本数据

				var jsonData = eval("(" +result+ ")");	//解析获取的Json数据

				document.getElementById("test").innerHTML = jsonData;


			}


		}



		function cleanKeyContent() {


			document.getElementById("test").innerHTML = "";

		}


	</script>



</head>


<body>


	<div id="myDiv">

		<input type="text" size="50" id="keyword" onkeyup="getMoreContent()" onblur="cleanKeyContent()" onfocus="getMoreContent()"/>

		<input type="button" value="百度一下" width="50px"/>

		<p id="test">新哥要变的内容</p>

	</div>




</body>
</html>