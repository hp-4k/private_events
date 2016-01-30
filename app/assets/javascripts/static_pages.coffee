# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$("#btn-sign-up").hoverIntent(
  -> $("#login-tooltip").fadeIn("slow"),
  -> $("#login-tooltip").fadeOut("slow")
);