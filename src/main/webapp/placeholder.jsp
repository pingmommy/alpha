<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="/webjars/jquery/jquery.js"></script>

<title>placeholder.jsp</title>

<style type="text/css">
 img {
 
  animation : rotate 10s infinite linear;
}

@keyframes rotate {
 from {
 	transform: rotate(0deg);
 }
 
 to {
 	transform: rotate(360deg);
 }
}

</style>


<script type="text/javascript">
$(function() {
	for(let i=0; i<100 ; i++){
		$('body').append('<img alt="xxx"/>').css('background','white');
	}
	
	//$('img').attr('src','http://via.placeholder.com/100X100');
	
	$('img').attr({
		alt: function(i) {
			return i +' num';
		},
		src : function(i) {
			
			let colors = [
				'FF0000',
				'0000FF',
				'00FF00',
				'FFFF00',
				'00FFF0',
				'0F0F0F',
				'0F0FF0'
				];
			let fg = null;
			let bg = null;
			do{
			    fg=colors[parseInt(Math.random()*colors.length)];
				bg=colors[parseInt(Math.random()*colors.length)];
			}while(fg==bg);
			let width = parseInt(Math.random()*10+1)*10;
			let height = parseInt(Math.random()*10+1)*10;
			return `http://via.placeholder.com/\${width}X\${height}/\${fg}/\${bg}`
		}
	})
	.css('border','1px solid red')
	.css('margin',10)
	.css('vertical-align','top');
});



</script>
</head>
<body>

</body>
</html>