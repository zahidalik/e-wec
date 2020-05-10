//= require semantic-ui

$(document).on('turbolinks:load', function() {
  $('.ui.dropdown').dropdown();

  $('.message .close').on('click', function() {
    $(this).closest('.message').transition('fade');
  });

  $('.ui.labeled.icon.sidebar').sidebar('toggle');

  $('.ui.checkbox').checkbox();

  $('.menu .item').tab();
  
})
