
$(document).ready(function(){
	$('#submit').click(function(e){
		e.preventDefault();
		var BandName = $("#bandName").val();
		$('#bands').append("<li>" + BandName + "</li>");

		$("#bandName").val("");
		
		$.ajax({url:('/bands/create'), method: ('post'), 
			data: {"band": {"name":BandName}}, dataType: "json", success: function(data) {
				console.log(data);
			} 
		});

	
var loadAlbums = function() {
		$.ajax('https://itunes.apple.com/search?term=' + BandName + '&entity=album', {type: 'get', dataType: 'jsonp'}).success
		(function(data){
			var albums = data["results"];
			//console.log(albums)
			
			 for(var i in albums) {
			   var albumName = albums[i]["collectionName"];
			   var releaseDate = albums[i]["releaseDate"];
			   console.log(albumName, releaseDate);
			   $('#albums').append(albums[i]["collectionName"] + ', ');
			   $('#albums').append('<img src="' + albums[i]["artworkUrl60"] + '">');
			 
			   $.ajax({url:('/albums/create'), method: ('post'), 
					data: {"album": {"name":albumName, "releaseDate":releaseDate}}, dataType: "json", success: function(data) {
					console.log(data);
					} 
			  });

			 }
			 
	
		 });

		
	}
loadAlbums();

	});

		
	var loadBands = function() {
			$.ajax('/bands.json', {type: 'get'}).success(function(data){
				for (var i in data) {
					$('#bands').append('<li>' + data[i]["name"] + '</li>' );
			}
		});
	}
	//loadAlbums();
	loadBands();
});