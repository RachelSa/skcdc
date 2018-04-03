$(document).on('turbolinks:load', function() {
  $(".dropdown-button").dropdown({
    hover: true,
    constrainWidth: false
  });
  $(".button-collapse").sideNav({
    edge: 'right',
    constrainWidth: false });

  $('.carousel.carousel-slider').carousel({fullWidth: true, indicators:true, duration:600});
  setInterval(() => {
    $('.carousel.carousel-slider').carousel('next');
  }, 5000);
});
