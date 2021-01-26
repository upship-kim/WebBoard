<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="function"
	uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"	href="/board/view/css/summernote-lite.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="/board/view/contents/summerNote/summernote-lite.js"></script>
<script src="/board/view/contents/summerNote/lang/summernote-ko-KR.js"></script>
<script type="text/javascript">
	$(function() {
		/* 글쓰기 */
		$("input#save").click(function() {
			if ($("textarea[name='contents']").val() == ""|| $("input#title").val() == "") {
				alert("제목 또는 내용을 채워주세요");
				return false;
			} else {
				$("form#bbs").submit();
			}
		});
		
		/* 수정하기 */
		$("input#mod").click(function() {
			if ($("textarea[name='contents']").val() == ""|| $("input#title").val() == "") {
				alert("제목 또는 내용을 채워주세요");
				return false;
			} else {
				$("form#bbs").submit();
				window.close();
			}
		});
		
		$("#fileDel").click(function(){
			alert('aa');
			$("#originFile").html('');
			$("input[name='fileName']").val('');
		}); 
		
		$("input[type='file']").change(function(){
			$("#originFile").html('');
			$("input[name='fileName']").val('');
		})
	});
</script>


</head>
<body>
<!-- 글쓰기  -->
<c:choose>
<c:when test="${modify eq null }">
<form id="bbs" method="post" action="/board/boardWrite.do" enctype="multipart/form-data">
			<input type="hidden" name="uno" value="${id}">
		<div>
			<label>게시판 선택</label>&nbsp;&nbsp; | &nbsp;&nbsp;
			<label class="radio-inline"><input type="radio" name="category" value="public">Public Board</label>
			<label class="radio-inline"><input type="radio" name="category" value="private">Private Board</label>
		</div>
		<div>
			<label>세부 카테고리</label>&nbsp;&nbsp; | &nbsp;&nbsp;
			<label class="radio-inline"><input type="radio" name="infoCategory" value="테크">테크</label>
			<label class="radio-inline"><input type="radio" name="infoCategory" value="리빙">리빙</label>
			<label class="radio-inline"><input type="radio" name="infoCategory" value="기타">기타</label>
		</div>
		<input type="text" id="title" name="title" maxlength="100" size="100%" placeholder="제목">
		<textarea id="summernote" name="contents"></textarea>
		<div class="panel panel-default">
 			 <div class="panel-body">
				<input type="file" name="file"  >
 			 </div>
		</div>
	</form>
	
	<input type="button" class="btn btn-default" name="cancle" id="cancle" value="취소"
		style="float: right">
	<input type="submit" class="btn btn-primary" name="save" id="save" value="저장"
		style="float: right">
	<script>
		$('document').ready(function() {
			//여기 아래 부분
			$('#summernote').summernote({
				height : 300, // 에디터 높이
				minHeight : 300, // 최소 높이
				maxHeight : 500, // 최대 높이
				focus : true, // 에디터 로딩후 포커스를 맞출지 여부
				lang : "ko-KR", // 한글 설정
				placeholder : '최대 2048자까지 쓸 수 있습니다', //placeholder 설정
				callbacks : { //이미지 업로드 콜백함수
				}
			});
		});
	</script>
</c:when>
<c:otherwise>
<!-- 게시물 수정하기  -->
	<h3>게시물 수정하기</h3>
	${modify }
	<hr>
	<div class="page">
	<form id="bbs" method="post" action="/board/boardWrite.do" enctype="multipart/form-data">
			<input type="hidden" name="cno" value="${modify.cno}">
			<input type="hidden" name="viewCount" value="${modify.viewCount}">
			<input type="hidden" name="lCount" value="${modify.lCount}">
			<input type="hidden" name="uno" value="${modify.uno}">
		<div>
			<label>게시판 선택</label>&nbsp;&nbsp; | &nbsp;&nbsp;
			<c:choose>
			<c:when test="${modify.category eq 'public'}">
			<label class="radio-inline"><input type="radio" name="category" value="public" checked>Public Board</label>
			<label class="radio-inline"><input type="radio" name="category" value="private">Private Board</label>
			</c:when>
			<c:otherwise>
			<label class="radio-inline"><input type="radio" name="category" value="public" >Public Board</label>
			<label class="radio-inline"><input type="radio" name="category" value="private" checked>Private Board</label>
			</c:otherwise>
			</c:choose>
		</div>
		<div>
			<label>세부 카테고리</label>&nbsp;&nbsp; | &nbsp;&nbsp;
			<c:choose>
			<c:when test="${modify.infoCategory eq '테크'}">
			<label class="radio-inline"><input type="radio" name="infoCategory" value="테크" checked>테크</label>
			<label class="radio-inline"><input type="radio" name="infoCategory" value="리빙">리빙</label>
			<label class="radio-inline"><input type="radio" name="infoCategory" value="기타">기타</label>
			</c:when>
			<c:when test="${modify.infoCategory eq '리빙'}">
			<label class="radio-inline"><input type="radio" name="infoCategory" value="테크" >테크</label>
			<label class="radio-inline"><input type="radio" name="infoCategory" value="리빙" checked>리빙</label>
			<label class="radio-inline"><input type="radio" name="infoCategory" value="기타">기타</label>
			</c:when>
			<c:otherwise>
			<label class="radio-inline"><input type="radio" name="infoCategory" value="테크" >테크</label>
			<label class="radio-inline"><input type="radio" name="infoCategory" value="리빙" >리빙</label>
			<label class="radio-inline"><input type="radio" name="infoCategory" value="기타" checked>기타</label>
			</c:otherwise>
			</c:choose>
		</div>
		<input type="text" id="title" name="title" maxlength="100" size="100%" placeholder="제목" value="${modify.title }">
		<textarea id="summernote" name="contents">${modify.contents }</textarea>
		<div class="panel panel-default">
 			 <div class="panel-body">
				<input type="file" name="file">
				<c:if test="${modify.fileName != null }">
				<p id="originFile">기존 파일:<label> ${modify.fileName }</label>
				&nbsp;&nbsp;	
				<label id="fileDel" style="color: red; font-size: 1rem; cursor: pointer;">삭제하기</label></p>
				<input type="hidden" name="fileName" value="${modify.fileName }">
				</c:if>
 			 </div>
		</div>
	</form>
	
	<input type="button" class="btn btn-default" name="cancle" id="cancle" value="취소"
		style="float: right">
	<input type="submit" class="btn btn-primary" name="mod" id="mod" value="수정"
		style="float: right">
	<script>
		$('document').ready(function() {
			//여기 아래 부분
			$('#summernote').summernote({
				height : 300, // 에디터 높이
				minHeight : 300, // 최소 높이
				maxHeight : 500, // 최대 높이
				focus : true, // 에디터 로딩후 포커스를 맞출지 여부
				lang : "ko-KR", // 한글 설정
				placeholder : '최대 2048자까지 쓸 수 있습니다', //placeholder 설정
				callbacks : { //이미지 업로드 콜백함수
				}
			});
		});
	</script>
	</div>
</c:otherwise>
</c:choose>
</body>
</html>