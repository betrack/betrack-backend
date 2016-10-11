// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function() {
  if (document.getElementById('map')) {
    var map = initMap();
    getMarkersInfo(map);
  }
});

var getMarkersInfo = function(map) {
  $.ajax({
    url: '/active_markers.json',
    type: 'GET',
    dataType: 'json',
    success: function(response) {
      if (response.stores && response.stores.length > 0) {
        response.stores.forEach(function(store) {
          setMarker(store, store.lat, store.lon, map, 'store');
        });
      }
      if (response.transports && response.transports.length > 0) {
        response.transports.forEach(function(transport) {
          setMarker(transport, transport.current_lat, transport.current_lon, map, 'transport');
        });
      }
    },
  });
};

var setMarker = function(markerInfo, lat, lon, map, type) {
  var marker = new google.maps.Marker({
    position: new google.maps.LatLng(lat, lon),
    icon: type == 'transport' ? 'pin_rosa.png' : 'pin_celeste.png',
    map: map
  });

  google.maps.event.addListener(marker, 'click', function() {
    window.location. href = 'transports/' + markerInfo.id;
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
