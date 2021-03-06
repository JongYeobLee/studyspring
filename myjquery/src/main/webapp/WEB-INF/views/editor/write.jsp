<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>

<script type="text/javascript" src="/resources/editor/js/service/HuskyEZCreator.js"	charset="utf-8"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>


<script type="text/javascript">
	var oEditors = [];
	$(function(){
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors,
			elPlaceHolder: "ir1", //textarea에서 지정한 id와 일치해야 합니다. 
			//SmartEditor2Skin.html 파일이 존재하는 경로
			sSkinURI: "/resources/editor/SmartEditor2Skin.html", 
			htParams : {
				// 툴바 사용 여부 (true:사용/ false:사용하지 않음) 
				bUseToolbar : true,
				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음) 
				bUseVerticalResizer : true,
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
				bUseModeChanger : true, 
				fOnBeforeUnload : function(){ 
					
				} 
			}, 
			fOnAppLoad : function(){
				//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용 
				oEditors.getById["ir1"].exec("PASTE_HTML", ["기존 DB에 저장된 내용을 에디터에 적용할 문구"]); 
			},
			fCreator: "createSEditor2"
		});
		
		$("#save").click(function() {
			/* oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
			$("#frm").submit(); */
			
			var val = oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
			this.contents = $('#ir1').val();
			alert(this.contents);
		});
	}); 
	
	function pasteHTML() {
		var sHTML = '<object type="text/html" width="100%" height="500" data="//www.youtube.com/embed/k9_XH1YibcY">';
		oEditors.getById["ir1"].exec("PASTE_HTML", [sHTML]);
	}
	
	
</script>

</head>
<body>
	<form id="frm" action="insert.jsp" method="post">
		<table width="100%">
			<tr>
				<td>제목</td>
				<td><input type="text" id="title" /></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="10" cols="30" id="ir1" name="content"
						style="width: 766px; height: 412px;">에디터에 기본으로 삽입할 글(수정 모드)이 없다면 이 value 값을 지정하지 않으시면 됩니다.</textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" id="save" value="저장" /> <input
					type="button" value="취소" /></td>
			</tr>
			<tr>
				<td>
					<input type="button" onclick="pasteHTML();" value="동영상 넣기" />
				</td>
			</tr>
		</table>
	</form>

</body>
</html>
