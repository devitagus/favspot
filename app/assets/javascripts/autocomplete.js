// This example adds a search box to a map, using the Google Place Autocomplete
// feature. People can enter geographical searches. The search box will return a
// pick list containing a mix of places and predicted search terms.


function initAutocomplete(id) {
  // Create the search box and link it to the UI element.
  var input = document.getElementById(id);
  if (input) {
    var searchBox = new google.maps.places.SearchBox(input, { types: ["geocode"]});
    google.maps.event.addListener(searchBox, 'places_changed', onPlaceChanged);
 }
}


function onPlaceChanged() {
  var place = this.getPlaces();
  $(".place_id_value").val(place[0].place_id);
}

google.maps.event.addDomListener(window, 'load', function() {
  initAutocomplete('pac-input');
 });

