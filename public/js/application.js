$(document).ready(function(){

	$("form").submit(function(e){
			e.preventDefault();
		console.log($(this).serialize());
		console.log($(this).attr("method"));
		console.log($(this).attr("action"));
	

		$.ajax({
			type: $(this).attr("method"),
			url: $(this).attr("action"),
			data: $(this).serialize(),
			dataType: "json",

			success: function(abc){
				if (abc["errors"]){
	;
					$("#error").html(abc["errors"]);
				}
				else{
		
					$("#error").html("");
							$(".table").append(
					'<tr>' +
					'<td>' +
					abc.url +
					'</td>'+
					'<td>'+
						'<a href="/' +
						abc.shorturl +
						'">' +
						abc.shorturl +
						'</a>'+
						'</td>'+
						'<td>' +
						abc.clickcount +
						'</td>' +
						'</tr>' );

	//end of if
				}
	// end of success
			}
	// end of ajax

		});
	//end of function(e)
	});


	$('a').mousedown(function(event){

	switch (event.which) {
	    case 1:
	        //alert('Left mouse button pressed');
	        $(this).attr('target','_self');
	         window.location.reload();
	        break;
	    case 2:
	        //alert('Middle mouse button pressed');
	        $(this).attr('target','_blank');
	        break;
	    case 3:
	        //alert('Right mouse button pressed');
	        $(this).attr('target','_blank');
	        window.location.reload();
	        break;
	    default:
	        //alert('You have a strange mouse');
	        $(this).attr('target','_self"');
				//end of switch
				}

		//end of mousedown function
	});


// end of $(document).ready
});