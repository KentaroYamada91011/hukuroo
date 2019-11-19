$(window).click((e) => {
  if ($(e.target).hasClass("js-taxonomies")) {
    $(e.target).toggleClass('show');
  }
});