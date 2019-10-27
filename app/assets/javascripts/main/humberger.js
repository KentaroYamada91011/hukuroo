	$(document).ready(function(){
    $(".menu-trigger").click(function (){
      console.log("ハンバーガー空いたよ")
      $(".js-humberger_background").addClass("active");
      $(".js-humberger").addClass("active");
      // $('.js-humberger').each(function(i) {
      //   $(this).delay(80 * i).addClass("active");
      //   $(this).delay(80 * i).fadeIn(500);
      // });
    });
  });