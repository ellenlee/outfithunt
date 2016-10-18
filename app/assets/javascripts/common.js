function showMyImage(fileInput) {
  console.log('showMyImage start');
  var files = fileInput.files;
  for (var i = 0; i < files.length; i++) {
      var file = files[i];
      var imageType = /image.*/;
      if (!file.type.match(imageType)) {
          continue;
      }
      var img=document.getElementById("thumbnil");
      img.file = file;
      var reader = new FileReader();
      reader.onload = (function(aImg) {
          return function(e) {
              aImg.src = e.target.result;
          };
      })(img);
      reader.readAsDataURL(file);
  }
  $('.img-show').removeClass('hide');
  $('.fileUpload').toggle('hide');
};

$(document).on('turbolinks:load', function(){
  $(".request-photo img").click(function(){
      console.log("i am clicked!");
      $(".request-photo").toggleClass('stretch');
    });
});
