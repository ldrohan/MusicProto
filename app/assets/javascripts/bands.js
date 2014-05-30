
$(document).ready(function(){
	//HIDING CSS ELEMENTS ON PAGE LOAD
	$('#albumheader').hide();
	$('#recents').hide();
	$('.albumbox').hide();

	//SHOWS EVENTS BASED ON ARTISTS AT TOP OF PAGE
	var events = function() {
			$.ajax('/bands/events.json', {type: 'get'}).success(function(data){
				//ITERATES THROUGH EVENTS, SHOWING RESULTS FOR CA ONLY
				for (var x in data[0]) {
					if ((data[0][x]["venue"]["region"]) === "CA") {
						console.log(data[0][x]);
						$('#concerts').append('<li>' + data[0][x]["artists"][0]["name"] + "  " + data[0][x]["datetime"] + "  " + data[0][x]["venue"]["name"] + '</li>');
					}
				}
					
		  });
	}

events();

	var recentAlbums = function() {
			$.ajax('/albums/recent.json', {type: 'get'}).success(function(data){
				for (var i in data) {
					$('#recentalbums').append('<li>' + data[i] + '</li>');
					if (data[i].length > 0){
						$('#recents').show();
					}
				}
		});
	}

recentAlbums();
	

	$('#bands').on("click", '.delete',function(e) {
		e.preventDefault();
    var parent = $(this).parent();
    //console.log(parent.attr('id'));
			$.ajax({
			  type: 'get',
			  url: 'bands/delete', 
			  data: 'ajax=' + parent.attr('id') + '&delete=',
			});        
		  parent.fadeOut(300,function(){
		 	parent.remove();
		});
	});



	$('#submit').click(function(e){
		e.preventDefault();
		
		if(($("#bandName").val()) !== "") {
		//CAPITALIZES BANDNAME THROUGH WAY TOO MUCH EFFORT
		var lowerband = $("#bandName").val();
		var BandName = lowerband.charAt(0).toUpperCase() + lowerband.substring(1);
		$('#bands').append("<div>" + BandName + '<button class="delete" type="submit">Delete</button>' + "</div>");

		$("#bandName").val("");
		//SAVES BANDS TO THE DATABASE
		$.ajax({url:('/bands/create'), method: ('post'), 
			data: {"band": {"name":BandName}}, dataType: "json", success: function(data) {
				var bandID = data.id;
				loadAlbums(bandID);
				//console.log(data);
			} 

		});
	} 



   var loadAlbums = function(bandID) {
   	//SHOWS ALBUMS AND ARTWORK AS WELL AS SAVES ALBUMS WITH BAND_ID TO DB
   	$('#albumheader').show();
		 $.ajax('https://itunes.apple.com/search?term=' + BandName + '&entity=album', {type: 'get', dataType: 'jsonp'}).success
		 (function(data){
			var albums = data["results"];
			//console.log(albums)
			$('.albumbox').show();
			 for(var i in albums) {
			 	 var parent = $(this).parent();
			   var albumName = albums[i]["collectionName"];
			   var releaseDate = albums[i]["releaseDate"];
			   //console.log(parent);
			   $('#albums').append('<div class="indiv_album">'+ albums[i]["collectionName"] + ' ' + '<img src="' + albums[i]["artworkUrl60"] + '"></div>');
				//ITERATES THROUGH API RETURN HASH AND SAVES EACH ALBUM TO DB.			 
			   $.ajax({url:('/albums/create'), method: ('post'), 
					data: {"album": {"name":albumName, "releaseDate":releaseDate, "band_id":bandID}}, dataType: "json", success: function(data) {
					//console.log(data);
					} 
			  });
			 }
		});
  }



	});

		//
	var loadBands = function() {
			$.ajax('/bands.json', {type: 'get'}).success(function(data){
				for (var i in data) {
					$('#bands').append('<li id=' + data[i]["id"] + '>' + data[i]["name"] + '<button class="delete" type="submit">' + 'Delete</button>' +'</li>' );
					
			}
		});
	}
	
  loadBands();
});