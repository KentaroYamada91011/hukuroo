$(window).click(function(e) {
  console.log($(e.target).hasClass("js-taxonomies"))
  if ($(e.target).hasClass("js-taxonomies")) {
    $(e.target).toggleClass('show');
  }
});