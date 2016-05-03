<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="replace" type="java.lang.String" required="true" description="需要替换的textarea编号"%>
<%@ attribute name="uploadPath" type="java.lang.String" required="false" description="文件上传路径，路径后自动添加年份。若不指定，则编辑器不可上传文件"%>
<%@ attribute name="height" type="java.lang.String" required="false" description="编辑器高度"%>
<!-- <script type="text/javascript">include('ckeditor_lib','${ctxStatic}/ckeditor/',['ckeditor.js']);</script>
<script type="text/javascript">
	var ${replace}Ckeditor = CKEDITOR.replace("${replace}");
	${replace}Ckeditor.config.height = "${height}";//<c:if test="${not empty uploadPath}">
	${replace}Ckeditor.config.ckfinderPath="${ctxStatic}/ckfinder";
	var date = new Date(), year = date.getFullYear(), month = (date.getMonth()+1)>9?date.getMonth()+1:"0"+(date.getMonth()+1);
	${replace}Ckeditor.config.ckfinderUploadPath="${uploadPath}/"+year+"/"+month+"/";//</c:if>
</script> -->
<script type="text/javascript">include('ueditor_lib','${ctxStatic}/ueditor/',['ueditor.config.js', 'ueditor.all.js']);</script>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/themes/default/css/ueditor.css" />
<script type="text/javascript">
	var ${replace}ue = UE.getEditor('${replace}', {
        //toolbars:[['Undo', 'Redo','|','Bold', 'italic', 'underline','strikethrough','removeformat','formatmatch',
        //           'forecolor','backcolor','insertorderedlist','insertunorderedlist','|',
        //           'fontfamily','fontsize','justifyleft','justifyright','justifycenter','justifyjustify','|',
        //          'insertimage','insertvideo','|','preview','searchreplace','FullScreen']],
        toolbars:[['Undo', 'Redo','|','Bold', 'italic', 'underline','strikethrough','removeformat','formatmatch',
                   'forecolor','backcolor','insertorderedlist','insertunorderedlist','|',
                   'justifyleft','justifyright','justifycenter','justifyjustify','|',
                   'insertimage','|','preview','searchreplace','FullScreen']],
        
        //关闭字数统计
        wordCount:false,
        //maximumWords:2000,
        autoHeightEnabled: true,
        //关闭elementPath
        elementPathEnabled:false,
        //默认的编辑区域高度
        initialFrameHeight:300
        //更多其他参数，请参考ueditor.config.js中的配置项
    });
</script>