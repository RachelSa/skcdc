$(document).on('turbolinks:load', function() {

  $(".dropdown-button").dropdown({
    hover: true,
    constrainWidth: false
  });

  $(".button-collapse").sideNav({
    edge: 'right',
    constrainWidth: false
  });

  $('.carousel.carousel-slider').carousel({
    fullWidth: true,
    indicators: true,
    duration: 600
  });

  function autoplay() {
    $('.carousel.carousel-slider').carousel('next');
    setTimeout(autoplay, 4500);
  }

  autoplay();
});
