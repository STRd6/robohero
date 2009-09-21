$(function(){
  var url = '/';
  var gameId = $('#gameId').children().html();
  var data = {authenticity_token: $token};
  function callback() {alert("wow it worked");}

  $('.card').draggable({revert:'invalid'});
  
  $('.card').click(function(){
    $('.detail').html($(this).html());
    if(declareAttackers) {
      $(this).toggleClass("selected");
    }
  });

  $('.discard').droppable({
    drop: function(event, ui) {
      var id = $(ui.draggable).children('.id').html();
      ui.draggable.remove();
      $.post(url + 'games/' + gameId + '/discard/' + id, data, callback());

  }});

  $('.slot').droppable({
    drop: function(event, ui) {
      var id = $(ui.draggable).children('.id').html();
      var slot_type = $(this).children('p').html();
      var position = $(this).children('.position').html();

      $.post(url + 'games/' + gameId + '/deploy/' + id, $.extend({
        slot_type: slot_type,
        position: position
      }, data), callback());
      ui.draggable.appendTo($(event.target));
      ui.draggable.css({top:-30,left:10});
  }});

  $('.hand').droppable({
    drop: function(event, ui) {
      ui.draggable.appendTo($(event.target));
      ui.draggable.css({top:-10});
    }
  });

  $('.card').droppable({
    accept: '.counter',
    hoverClass: 'ui-state-active',
    drop: function(event, ui) {
      ui.draggable.appendTo($(event.target));
      ui.draggable.css({top:-10,left:0});
    }
  });

  $('.deck').click(function(){
    var id = $(this).children('.id').html();
    $.post(url + 'games/' + gameId + '/draw/' + id, data);
  });
  
  function getAttackDeclarationParams() {
    var targetPlayerId = $('.player').children('.id').eq(0).html();
    var attackingWeapons = $('.slot .card.selected').children('.id');

    var data = {};

    attackingWeapons.each(function(){
      data["attack_declarations["+targetPlayerId+"][]"] = $(this).html();
    });

    return data;
  }

  declareAttacks = function() {
    $.post('/games/' + gameId + '/attack',
      $.extend(getAttackDeclarationParams(), data)
    )
  }
});
