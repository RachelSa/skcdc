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
    onCycleTo : function() {
        stopAutoplay();
        startAutoplay();
      }
  });

  var autoplay_id;

  function startAutoplay() {
    autoplay_id = setInterval(() => {
      $('.carousel.carousel-slider').carousel('next')
    }, 4500)
  }

  function stopAutoplay() {
    if(autoplay_id) {
      clearInterval(autoplay_id)
    }
  }
});
