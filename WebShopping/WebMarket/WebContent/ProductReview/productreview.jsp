<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<jsp:include page="../menu.jsp" />
<%
	String p_id=request.getParameter("p_id");
	String index=request.getParameter("index");
	int pageNum=1;
	
	
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
	#table{
		width:90%;
		border:1px solid black;
		height:400px
	}
		
	}
	th,td{
		border:1px solid black;
	}
	
	#table label{
	    font-size: 2em;
	    color: transparent;
	    text-shadow: 0 0 0 #f0f0f0;
	}
	#table label:hover{
	    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}
	#table label:hover ~ label{
	    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}
	#table input[type=radio]:checked ~ label{
	    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}
	
	#reviewDetail {
		  display: flex;
		  justify-content: center;
		  align-items: center;
		  min-height: 100vh;
	}
</style>

<script type="text/javascript">

 	var content =null;
 	
	function product(){
		window.location.href="./Bcontroller.po?p_id=<%=p_id%>";
	}
	function deleteBtn(index) {
		
	    var confirmed = confirm("정말로 삭제하겠습니까?"); 
	    if (confirmed) {
	    	alert("삭제되었습니다");
	    	location.href="./ReviewDelete.po?index=<%=index%>&&p_id=<%=p_id%>";
	    }
	}
	
	
	
	function updateBtn(index) {
		
		 var tr = '<table class="table" id="table" style="width:90%;">';
			 tr +='<tr>' ;
 	 		 tr +='<tr style="text-align: center;">';
 	  		 tr +='<th style="height: 50px;width:20%;border:1px solid black">제목</th>';
			 tr +='<td style="height: 50px;width:25%;">';
			 tr +='<textarea id="title" style="width:95%;height:80%;">${review.title}</textarea>';
			 tr +='</td>';
			 tr +='<th style="height: 50px;width:20%;border:1px solid black">별점</th>';
			 tr +='<td style="height: 50px;width:25%;">';
			 
			 tr +='<fieldset style="display: inline-block; direction: rtl;border:0;">';
			 tr +='<input type="radio" name="reviewStar" value="5" id="rate1" style="display: none" >';
			 tr +='<label for="rate1" >★</label>';
			 tr +='<input type="radio" name="reviewStar" value="4" id="rate2" style="display: none">';
			 tr +='<label for="rate2">★</label>';
			 tr +='<input type="radio" name="reviewStar" value="3" id="rate3" style="display: none" checked>';
			 tr +='<label for="rate3">★</label>';
			 tr +='<input type="radio" name="reviewStar" value="2" id="rate4" style="display: none">';
			 tr +='<label for="rate4">★</label>';
			 tr +='<input type="radio" name="reviewStar" value="1" id="rate5" style="display: none">';
			 tr +='<label for="rate5">★</label>';
			 tr +='</fieldset>';
			 tr +='</td>';
		
			 tr +='<tr style="text-align: center;">';
			 tr +='<th style="height: 50px;border:1px solid black;">작성날짜</th>';
			 tr +='<td colspan="3">${review.postdate_ymd}&nbsp${review.postdate_hms}</td>';
			 tr +='</tr><tr style:"margin:auto;">';
			 tr +='<th style="height: 400px;border:1px solid black;text-align: center;">내용</th>';
			 tr +='<td colspan="3" style="vertical-align: top; padding: 10px;">';
			 tr +='<textarea id="content" style="width:95%;height:95%;">${review.content}</textarea></td>';
			 tr +='</tr>';
			 tr +='<tr style="text-align: right">';
  			 tr +='<td colspan="4" style="height: 50px;">';
  			 tr +='<button id="updateBtn" onclick="updateBtn2()">확인</button>';
  			 tr +='<button id="reviewBtn" onclick="location.reload()">취소</button>';
  			 tr +='<button id="productBtn" onclick="product()">상품으로 돌아가기</button>';
  			 tr +='</tr></table>';
					 
	     $("#reviewDetail").replaceWith(tr);	// 테이블에 추가
	}
	
	function updateBtn2() {
		
		 $.ajax({
		        type:"POST",
		        url:"./ReviewUpdate.po",
		        dataType:"json",
		        data:{
		        	"index" : ${review.index},
					"title" : $("#content").val(),
     				"content" : $("#title").val(),
     				"star" : $('input[name="reviewStar"]:checked').val()
		        	},
		        success : function(data){
		        	 if(data=='1'){
		        		alert("수정완료");
		        		location.reload();
		        	 } 
		        }
		       
		    });
	}
	
	 function review_view(){
		    $.ajax({
		        type:"POST",
		        url:"./ReviewControllerOne.po",
		        dataType:"json",
		        data:{
		        		"index" : <%=index%>
		        	},
		        success : function(data){
		            //alert('ajax POST 통신 성공'); 
		        	var reviewList = data.result;
		            //alert(userList[0]);
		           // alert(userList[0][0]["m_id"]);
		        	 var tr = '<table class="table" id="table" style="width:90%;">'+
				 	   	 	'<tr>' +
				 	   		'<tr style="text-align: center;">'+
							'<th style="height: 50px;width:20%;border:1px solid black">제목</th>'+
							'<td style="height: 50px;width:25%;">'+reviewList[0][5]["title"]+'</td>'+
							'<th style="height: 50px;width:20%;border:1px solid black">별점</th>'+
							'<td style="height: 50px;width:25%;">';

		        		 for(let j=0;j<reviewList[0][1]["star"];j++){
	      					tr+='★';
	      					 }
		               	    tr+='</td></tr>';
		   
		      			tr +='<tr style="text-align: center;">';
		      			tr +='<th style="height: 50px;border:1px solid black">작성날짜</th>';
		      			tr +='<td colspan="3">'+reviewList[0][3]["time"]+'</td>';
		      			tr +='</tr><tr>';
		      			tr +='<th style="height: 400px;border:1px solid black;text-align: center;">내용</th>';
		      			tr +='<td colspan="3" style="vertical-align: top; padding: 10px;">'+reviewList[0][2]["content"]+'</td>';
		      			tr +='</tr>';
		      			tr +='<tr style="text-align: right">';
		      			tr +='<td colspan="4" style="height: 50px;">';
		      			
		      			if(${review.m_id eq sessionId and review.m_id eq 'admin'}){
			      			tr +='<button id="updateBtn" onclick="updateBtn(${review.index})">수정</button>';
			      			tr +='<button id="deleteBtn" onclick="deleteBtn(${review.index})">삭제</button>';
		      			}
		      			tr +='<button id="productBtn" onclick="product()">상품으로 돌아가기</button>';
		      			tr +='</tr></table>';
		            $("#reviewDetail").append(tr);	// 테이블에 추가
		        }
		       
		    });
		    };
		    
		    $(document).ready(function(){
				
		  	  		review_view();
					 
			  });
	
		 
			
	</script>
</head>
<body>
	
	<div id="reviewDetail" style="margin:auto;">		
		
		
	</div>	
	
	
<jsp:include page="../footer.jsp" />
</body>
</html>