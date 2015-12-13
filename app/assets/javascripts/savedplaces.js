// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// In place editing

$(document).ready(function() {
  /* Activating Best In Place */
  jQuery(".best_in_place").best_in_place();
});

// Tags

$('#tokenfield').tokenfield({
  autocomplete: {
    source: ['red','blue','green','yellow','violet','brown','purple','black','white'],
    delay: 100
  },
  showAutocompleteOnFocus: true
})


// Display edit savedplace form

$('#add-form').click(function(){
$('#showinfo').replaceWith($('#formedit'));
$('#formedit').removeClass('hidden');
// $('#showinfo').addClass('hidden')
//     var x = $('#formedit').removeClass('hidden').hide();
//     x.slideDown();
//     x.show();
  })
