let readURL = function(input, preview){
  if (input.files && input.files[0]) {
    let reader = new FileReader();
    reader.onload = function (e) {
      $(preview).parent().removeClass('hidden');
      $(preview).attr('src', e.target.result);
    }
    reader.readAsDataURL(input.files[0]);
  }
};

$(document).ready(function() {
  let preview = "img-preview > img";

  $("#post-attachment").click(function() {
    $("#post-attachment").click();
  });

  $("#post-attachment").change(function() {
    readURL(this, preview);
  });
});
