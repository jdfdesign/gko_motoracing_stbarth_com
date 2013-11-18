var Product = {

	init: function() {
		$('#grid-products a').attr('data-remote', true).attr('data-type', 'script')
			.on("ajax:beforeSend", function(evt, xhr, settings) {
				
				// Store de current profile for next/prev function
				var id = $(this).closest('li').attr('id');
				
				/*if(currentModal == id) {
					$("#modal-page").modal('show');
					return false;
				}
				else {
					currentProfile = id;
				}*/
				
			}).on("ajax:success", function(evt, xhr, settings) {
				console.log("Site.success xhr " + eval(xhr))
				$("#modal-content").css('max-height', availableHeight).html(eval(xhr));
			/*	try{
					FB.XFBML.parse(); 
				} catch (e){
					console.log("FB error");
				}
				try{
					gapi.plusone.go('content');
				} catch (e){
					console.log("gapi error");
				} */
				
				$("#modal-page").modal('show');
			}).on('ajax:complete', function(evt, xhr, status) {
			}).on("ajax:error", function(evt, xhr, status, error) {
				var flash = $.parseJSON(xhr.getResponseHeader('X-Flash-Messages'));
				console.log("Site.error " + flash.error);
			});
	}
}
