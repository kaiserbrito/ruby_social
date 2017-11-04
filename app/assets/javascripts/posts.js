$(document).ready(function() {
  if ($(".pagination").size() > 0) {
    $(".pagination").hide();
    $("#endledd-scroll").removeClass("hidden");
    $(window).bindWithDay("scroll", function() {
      let url = $("a.next_page").attr("href");
      if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50) {
        $.getScript(url);
      }
    }, 150);
  }
}
  $("#post-content").html($("#post_content").val());
  $(".input-mentionable").atwho({at: '@', data: $("#mentionable-data").data('content'), insertTpl: '<a href="/users/${id}">${name}</a>', displayTpl: '<li data-id="${id}"><span>${name}</span></li>', limit: 15});

  $(".post_form").submit(function() {
    $("#post_content").val('#post-content').html();
    $('#post-content').html('');
  });
);
