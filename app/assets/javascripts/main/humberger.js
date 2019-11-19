
  $(document).ready(function() {
    $('.drawer').drawer({
      iscroll: {
          scrollX: false,
          scrollY: true,
          click:true,
          mouseWheel: true,
          disablePointer: true,
          disableTouch: false,
          disableMouse: false
      },
    });
  });
// $(document).on('DOMContentLoaded', function () {
//   $(document).on("click", ".drawer-toggle", function() {
//     $('.container').toggleClass('scrollLock');
//   });
// });