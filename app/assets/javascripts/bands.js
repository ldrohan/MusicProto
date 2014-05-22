
$(document).ready(function(){
	$('#submit').click(function(e){
		e.preventDefault();
		var BandName = $("#bandName").val();
		$('ul').append("<li>" + BandName + "</li>");

		$("#bandName").val("");
		
		$.ajax({url:('/bands/create'), method: ('post'), 
			data: {"band": {"name":BandName}}, dataType: "json", success: function(data) {
				console.log(data);
			} 
		});
	});
		
	var loadBands = function() {
			$.ajax('/bands.json', {type: 'get'}).success(function(data){
				for (var i in data) {
					$('ul').append('<li>' + data[i]["name"] + '</li>' );
			}
		});
	}
	
	loadBands();
});