$(document).ready(function(){
  console.log(screen.width>400);
  if (screen.width>750) {
    $('#slider').slick({
      autoplay:false,
      autoplaySpeed:2000,
      dots:false,
      arrows: true,
      nextArrow: '<button type="button" class="slick-next"></button>',
      prevArrow: '<button type="button" class="slick-prev"></button>',
      infinite: true,
      slidesToShow: 3,
      slidesToScroll: 1,
      centerMode: true,
      centerPadding: '25%'
    });
  } else {
    $('#slider').slick({
      autoplay:false,
      autoplaySpeed:2000,
      dots:false,
      arrows: true,
      nextArrow: '<button type="button" class="slick-next"></button>',
      prevArrow: '<button type="button" class="slick-prev"></button>',
      infinite: true,
      slidesToShow: 3,
      slidesToScroll: 1,
      centerMode: true,
      centerPadding: '5%'
    });
  }
});
