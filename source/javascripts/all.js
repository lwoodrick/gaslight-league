// This is where it all goes :)

//= require bootstrap

// window.onload = init;
// function init() {
//   document.getElementById('small-ranking').onclick = closeLargeRanking;
//   document.getElementById('large-ranking').onclick = openLargeRanking;
// }
//
// function openLargeRanking() {
//   document.getElementById('rank-toggle').setAttribute('class','open');
// }
//
// function closeLargeRanking() {
//   document.getElementById('rank-toggle').setAttribute('class','');
// }

$(document).ready(function(){

  $('#small-ranking').parent().click(function(){
    if($('#rank-toggle').hasClass('open')) {
      $('#rank-toggle').removeClass('open');
      $('#large-ranking').parent().removeClass('active');
      $('#small-ranking').parent().addClass('active');
    }
  });

  $('#large-ranking').parent().click(function(){
    if($('#rank-toggle').hasClass('')) {
      $('#rank-toggle').addClass('open');
      $('#small-ranking').parent().removeClass('active');
      $('#large-ranking').parent().addClass('active');
    }
  });
});
