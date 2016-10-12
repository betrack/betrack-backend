// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$(function() {
  if (document.getElementById('map-small')) {
    var lat = $('#map-data').data('lat');
    var lon = $('#map-data').data('lon');
    var type = $('#map-data').data('type');
    var map = initSmallMap(lat, lon);
    setCurrentMarker(lat, lon, map, type);
  }
});

var initSmallMap = function(lat, lon) {
  var map;
  var style = [{
    featureType: "poi",
    elementType: "labels",
    stylers: [{
      visibility: "off"
    }]
  }];

  var mapOptions = {
    zoom: 17,
    center: new google.maps.LatLng(lat, lon),
    mapTypeId: google.maps.MapTypeId.TERRAIN,
    disableDefaultUI: true,
    styles: style
  };

  return new google.maps.Map(document.getElementById('map-small'), mapOptions);
};

var setCurrentMarker = function(lat, lon, map, type) {
  var marker = new google.maps.Marker({
    position: new google.maps.LatLng(lat, lon),
    icon: type == 'transport' ? '/pin-transporte.png' : '/pin-cerveceria.png',
    map: map,
  });
};
