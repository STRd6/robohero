$(function(){
    $('.card').draggable({snap:true});
    $('.deck').click(function(){addCardToHand()});
    $('.discard').droppable({
      drop: function(event, ui) {
        console.log(ui);
        console.log($(ui));
        ui.draggable.remove();
    }})
});

function addCardToHand(){
    $('<div class="card" />').draggable({snap:true}).appendTo('.hand');
}