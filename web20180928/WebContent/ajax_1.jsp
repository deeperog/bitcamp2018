<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script>
	$(document).ready(function(){
	/*	var data = {
				name : 'cool',
				loc : 'seoul'
		}; */
		
	/* 	$.ajax('data.jsp', {
			success : function(data){
				$('body').append(data);
			}
		}); */

	    /*   
	       $.get('data.jsp', function(data){
	    	  $('body').append(data); 
	       });
		*/
		
		/* var id = $('#uid').val()//'cool';
		var pw = $('#upw').val()//'1234';
		
 	      $.ajax({
	          url :'data.jsp',
	          data : {id:id, pw:pw},
	          success : function(data) {
	             $('body').append(data);
	          }
	       });  */
		/* $('body').load('data.jsp?id='+$.param(data)); */
		
		/* $.getJSON('datajson.jsp', function(data){
			$.each(data, function(key, value){
				var htmlstr = '<h1> '+value.name+':'+value.price+' </h1>';
				$('body').append(htmlstr);
			});
		}); */
		
		/* $.ajax({
			url : 'dataXML.jsp',
			success : function(data){
				$(data).find('product').each(function(){
					var name = $(this).find('name').text();
					var price = $(this).find('price').text()
					
					var htmlstr = '<h1>'+ name +':'+price+'원</h1>'
					
					$('body').append(htmlstr);
				});
			}
		}); */
		
		
		
		/* $('<h1></h1>').text($.param(data)).appendTo('body'); */
			
			
		$('#my-form').submit(function(event){
         $('#wrap').load('data.jsp',$(this).serialize());
         
         event.preventDefault();
      });		
	});
</script>
</head>
<body>
<form id="my-form">
   <input type="text" id="uid" name="id" value="djarlgns999@naver.com" />
   <input type="password" id="upw" name="pw" value="1111111111" />
   <input type="submit" />
</form>
<div id="wrap"></div>

</body>
</html>