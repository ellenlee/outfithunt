
function showMyImage(fileInput) {
  console.log('showMyImage start');
  var files = fileInput.files;
  for (var i = 0; i < files.length; i++) {
      var file = files[i];
      var imageType = /image.*/;
      if (!file.type.match(imageType)) {
          continue;
      }
      console.log('x');
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
  $('.img-show').toggle('show');
  $('.fileUpload').toggle('hide');
}