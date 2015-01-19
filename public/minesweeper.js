function prepGame(){
  setCellClickListeners();
}

function setCellClickListeners(){
  $(".cell").click(function(){
    checkCellForBomb(this);
  });
};

function checkCellForBomb(cell){
  var cellContent = $(cell).html().trim();
  if (cellContent == "x"){
    alert("Game over!");
    window.location.reload(true);
  } else {
    $(cell).addClass("clicked");
  };
}


$(document).ready(function() {
  prepGame();
});
