function prepGame(){
  setCellClickListeners();
}

function setCellClickListeners(){
  $(".cell").click(function(){
    checkCellForBomb(this);
  });
};

function checkCellForBomb(cell){
  var cellContent = $(cell).find(".cellContent");
  if (cellContent.html().trim() == "x"){
    alert("Game over!");
    window.location.reload(true);
  } else {
    cellContent.addClass("clicked");
  };
}


$(document).ready(function() {
  prepGame();
});
