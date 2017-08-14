$(function(){
  $('#pics').masonry({
    itemSelector: '.box',
    columnWidth: 200,
    isAnimated: !Modernizr.csstransitions,
    isFitWidth: true
  });

});

$('#pics').masonry({
  itemSelector: '.box',
  // set columnWidth a fraction of the container width
  columnWidth: function( containerWidth ) {
    return containerWidth / 5;
  }
});

$(function(){

  $('#pics').masonry({
    itemSelector: '.box',
    columnWidth: 100,
    gutterWidth: 40
  });

});