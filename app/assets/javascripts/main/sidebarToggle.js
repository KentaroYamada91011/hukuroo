$(window).click(function(e) {
  if ($(e.target).hasClass("js-taxonomies")) {
    $(e.target).toggleClass('show');
  }
});