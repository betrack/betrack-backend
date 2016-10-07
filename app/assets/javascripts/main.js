// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function() {
  var map = initMap();
  getMarkersInfo(map);
});

var getMarkersInfo = function(map) {
  $.ajax({
    url: '/active_transports.json',
    type: 'GET',
    dataType: 'json',
    success: function(response) {
      if (response.transports.length > 0) {
        response.transports.forEach(function(transport) {
          setMarker(transport, map);
        });
      }
    },
  });
};

var setMarker = function(marker, map) {
  var marker = new google.maps.Marker({
    position: new google.maps.LatLng(marker.current_lat, marker.current_lon),
    map: map,
  });
};

var initMap = function() {
  var map;
  var style = [{
    featureType: "poi",
    elementType: "labels",
    stylers: [{
      visibility: "off"
    }]
  }];

  var mapOptions = {
    zoom: 10,
    center: new google.maps.LatLng(-34.578801, -58.463954),
    mapTypeId: google.maps.MapTypeId.TERRAIN,
    disableDefaultUI: true,
    styles: style
  };

  return new google.maps.Map(document.getElementById('map'), mapOptions);
};
