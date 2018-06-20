// import Dropzone from "../node_modules/dropzone";
$(function (){
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
})

