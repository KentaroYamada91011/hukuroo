$(window).click(function(e) {
  if ($(e.target).parent().hasClass("js-taxonomies")) {
    $(e.target).parent().toggleClass('show');
  }
});