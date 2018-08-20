let dropzoneInit = function() {
	  const zone = document.querySelector('.dropzonable')
	  const input = document.querySelector('#message-attachment')
	  const form = document.querySelector('#new_message')

	  if (zone) {
	    const dropzone = new Dropzone(zone, { 
	      url: form.action.replace('messages.js', 'dropfiles'),
	      error: function(file, errorMessage, xhr) {
	        console.log(errorMessage)
	        toastr.options = {
	            closeButton: true,
	            progressBar: true,
	            showMethod: 'slideDown',
	            positionClass: 'toast-bottom-left',
	            timeOut: 7000
	        }

	        toastr.error(errorMessage.error)
	      }
	    })

	    dropzone.on("complete", function(file) {
	      dropzone.removeFile(file);
	    });
	  }

	  var order_messages = document.getElementById('order_messages');
	  if (order_messages) {
	  	var height = order_messages.scrollHeight;
      	$(order_messages).scrollTop(height);
	  }
      
	  var modal = document.getElementById('msg_preview');
      var imgs = document.getElementsByClassName('msg_image');
      var modalImg = document.getElementById("img01");

      [].forEach.call(imgs, function (img) {
        img.onclick = function(){
          modal.style.display = "block";
          modalImg.src = this.src;
        }
      });

      var span = document.getElementsByClassName("close_preview")[0];

      span.onclick = function() { 
          modal.style.display = "none";
      }
}