$(document).on('turbolinks:load', function() {
  $(".dropdown-button").dropdown({
    hover: true,
  });
  $(".button-collapse").sideNav({
    edge: 'right',
    constrainWidth: false });
});
