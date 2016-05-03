<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="input" type="java.lang.String" required="true" description="输入框"%>
<%@ attribute name="type" type="java.lang.String" required="true" description="files、images、flash、thumb"%>
<%@ attribute name="uploadPath" type="java.lang.String" required="true" description="打开文件管理的上传路径"%>
<%@ attribute name="selectMultiple" type="java.lang.Boolean" required="false" description="是否允许多选"%>
<%@ attribute name="readonly" type="java.lang.Boolean" required="false" description="是否查看模式"%>
<%@ attribute name="maxWidth" type="java.lang.String" required="false" description="最大宽度"%>
<%@ attribute name="maxHeight" type="java.lang.String" required="false" description="最大高度"%>

<script type="text/javascript">include('ueditor_lib','${ctxStatic}/ueditor/',['ueditor.config.js', 'ueditor.all.js']);</script>

<div id="${input}editor-img" style="display:none"></div> 
<div id="${input}temp-img-list" style="display: none"></div> 
<ol id="${input}Preview"></ol>
<c:if test="${!readonly}">
	<a href="javascript:" onclick="${input}FinderOpen();" class="btn">${selectMultiple?'添加':'选择'}</a>
&nbsp;<a href="javascript:" onclick="${input}DelAll();" class="btn">清除</a>
</c:if>
<script type="text/javascript">
var ${input}ue = UE.getEditor('${input}editor-img', {
    toolbars: [[ 'insertimage', 'scrawl', 'simpleupload' ,'attachment' ,'insertvideo']],
});

${input}ue.addListener('contentChange', function (editor) {
       //获取编辑器中的内容（html 代码）
       var img = ${input}ue.getPlainTxt();
       if (img != "") {
               //把编辑器中的内容放到临时div中，然后进行获取文件名称。
               $("#${input}temp-img-list").html(img);
               var array = new Array();
               var array_filename = new Array();
               //循环获取文件名称
               //<c:if test="${type eq 'images'}">
               $("#${input}temp-img-list img").each(function () {
                   var src = $(this).attr("src");
                   //var name = src.replace("/upload/image/", "");
                   array.push(src);
               });
               //</c:if>
               //<c:if test="${type eq 'files'}">
               $("#${input}temp-img-list a").each(function () {
                   var src = $(this).attr("href");
                   var title = $(this).attr("title");
                   //var name = src.replace("/upload/image/", "");
                   array.push(src);
                   array_filename.push(title);
               });
               //</c:if>
               //<c:if test="${type eq 'video'}">
               $("#${input}temp-img-list img").each(function () {
                   var src = $(this).attr("_url");
                   //var name = src.replace("/upload/image/", "");
                   array.push(src);
               });
               //</c:if>
               //清空编辑器中的内容，以便下一次添加图片。
               ${input}ue.execCommand('cleardoc');
               //调用callbackImg获取懂图片名称
               if (typeof ${input}callbackImg === "function") {
                   //eval("callbackImg('" + array + "')");
                   if (array.length>0){
                	   ${input}callbackImg(array);
                   }
               }
	       }
	   });

	function ${input}callbackImg(files) {
		var url = "";
		for(var i=0; i<files.length; i++){
			url += files[i].replace("${uploadPath}", "");
			if (i<files.length-1) url+="|";
		} //<c:if test="${selectMultiple}">
		$("#${input}").val($("#${input}").val()+($("#${input}").val()==""?url:"|"+url));//</c:if><c:if test="${!selectMultiple}">
		$("#${input}").val(url);//</c:if>
		${input}Preview();
	}

	function ${input}FinderOpen(){
		//'simpleupload' ,'attachment' ,'insertvideo'
		//<c:if test="${type eq 'images' and selectMultiple}">
		$("#${input}editor-img .edui-for-insertimage .edui-button-body")[0].click();
		//</c:if>
		//<c:if test="${type eq 'images' and !selectMultiple}">
		$("#${input}editor-img .edui-for-insertimage .edui-button-body")[0].click();
		//</c:if>
		//<c:if test="${type eq 'files'}">
		$("#${input}editor-img .edui-for-attachment .edui-button-body")[0].click();
		//</c:if>
		//<c:if test="${type eq 'video'}">
		$("#${input}editor-img .edui-for-insertvideo .edui-button-body")[0].click();
		//</c:if>
	}
	
	function ${input}Del(obj){
		var url = $(obj).prev().attr("url").replace("${uploadPath}", "");
		$("#${input}").val($("#${input}").val().replace("|"+url,"","").replace(url+"|","","").replace(url,"",""));
		${input}Preview();
	}
	
	function ${input}DelAll(){
		$("#${input}").val("");
		${input}Preview();
	}
	
	function ${input}Preview(){
		var li, urls = $("#${input}").val().split("|");
		$("#${input}Preview").children().remove();
		for (var i=0; i<urls.length; i++){
			if (urls[i]!=""){
				url_i = "${uploadPath}"+urls[i];
				//<c:if test="${type eq 'thumb' || type eq 'images'}">
				li = "<li><img src=\""+url_i+"\" url=\""+url_i+"\" style=\"max-width:${empty maxWidth ? 200 : maxWidth}px;max-height:${empty maxHeight ? 200 : maxHeight}px;_height:${empty maxHeight ? 200 : maxHeight}px;border:0;padding:3px;\">";//</c:if><c:if test="${type ne 'thumb' && type ne 'images'}">
				li = "<li><a href=\""+url_i+"\" url=\""+url_i+"\" target=\"_blank\">"+decodeURIComponent(url_i.substring(url_i.lastIndexOf("/")+1))+"</a>";//</c:if>
				li += "&nbsp;&nbsp;<c:if test="${!readonly}"><a href=\"javascript:\" onclick=\"${input}Del(this);\">×</a></c:if></li>";
				$("#${input}Preview").append(li);
			}
		}
		if ($("#${input}Preview").text() == ""){
			$("#${input}Preview").html("<li style='list-style:none;padding-top:5px;'>无</li>");
		}
	}
	${input}Preview();
</script>
