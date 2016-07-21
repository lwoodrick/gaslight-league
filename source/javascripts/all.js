// This is where it all goes :)

window.onload = init;
function init() {
  document.getElementById('small-ranking').onclick = closeLargeRanking;
  document.getElementById('large-ranking').onclick = openLargeRanking;
}

function closeLargeRanking() {
  document.getElementById('rank-toggle').setAttribute('class','open');
}

function openLargeRanking() {
  document.getElementById('rank-toggle').setAttribute('class','');
}
