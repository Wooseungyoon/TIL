# Scroll Function

### 요소

#####  1) 문서의 높이 

#####  2) 스크롤의 높이

#####  3) 윈도우 창의 높이









<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>


<style>
div{

	width:300px;
	border:2px solid red;
}
</style>
<script>
/*
	{"rank":1,"keyword":"김서겸","type":"up","cnt":100},
	{"rank":2,"keyword":"Java","type":"down","cnt":1},
	{"rank":3,"keyword":"Ajax","type":"down","cnt":100},
	{"rank":4,"keyword":"임지훈 잠","type":"up","cnt":20},
	{"rank":5,"keyword":"승엽이 술","type":"up","cnt":30},


*/
function display(data){
	$(data).each(function(index,item){
			var str= '';
			str +='<h3>';
			str +=item.rank+" "+item.keyword+" "+item.type+" "+item.cnt;
			str +='<h3>';
			$('div').append(str);
	});

};
	function display(data){


	};
	function getDate(){
		$.ajax({
			url:'chart',
			success:function(result){
				alert(typeof(result));
			}
	
		});
	
	};
	$(document).ready(function(){
	
			getData();
		
	});
</script>

</head>
<body>
	
	<h1>Keyword Chart</h1>
	<div></div>
</body>
</html> -->