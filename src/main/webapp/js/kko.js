$(function(){
	$('#kkopay').click(function(){
		$.ajax({
			url:'cls/jq/kakaopay.cls' ,
			dataType:'json' ,
			success:function(data){
				alert(data.next_redirect_pc_url);
			} ,
			error:function(error){
				alert(error);
			}
		});
	});
});