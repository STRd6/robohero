$(function(){
    var url = 'http://localhost:3000/';
    var data = 'zomg test';
    function callback() {alert("wow it worked");}
    $('.card').draggable({revert:'invalid'});
    $('.card').click(function(){
      $('.detail').html($(this).html());
      
    });
    $('.deck').click(function(){addCardToHand()});
    $('.counterCreator').click(function(){createCounter()});
    $('.discard').droppable({
      drop: function(event, ui) {
        var id = ui.draggable.context.children[3].innerHTML;
        ui.draggable.remove();
        $.post(url + 'cards/' + id + '/discard', data, callback());
        
    }})
    $('.slot').droppable({
        drop: function(event, ui) {
          var id = ui.draggable.context.children[3].innerHTML;
          $.post(url + 'cards/' + id + '/played', data, callback());
          ui.draggable.appendTo($(event.target));
          ui.draggable.css({top:-30,left:10});
      }})
    $('.hand').droppable({
        drop: function(event, ui) {
          ui.draggable.appendTo($(event.target));
          ui.draggable.css({top:-10});
        }
    })
    $('.card').droppable({
        accept: '.counter',
        hoverClass: 'ui-state-active',
        drop: function(event, ui) {
          ui.draggable.appendTo($(event.target));
          ui.draggable.css({top:-10,left:0});
          
        }
    })
});

function addCardToHand(){
//    $('#allCards').children()[0].removeClass('hidden');
}
function createCounter(){
  $('<div class="counter" />').draggable({snap:false, revert:'invalid'}).appendTo('.counterDropZone');
}
