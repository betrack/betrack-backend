// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function() {
  if (document.getElementById('map')) {
    var map = initMap();
    getMarkersInfo(map);
    filter();
  }
});

var markers = [];
var infoWindow;

var filter = function() {
  $('#transport-checkbox, #store-checkbox').click(function() {
    var checkbox = this;

    markers.forEach(function(marker) {
      var type = marker.type == 'transport' ? 'transport' : 'store'
      if ($(checkbox).data('type') == type) {
        marker.setVisible($(checkbox).prop('checked') && type == $(checkbox).data('type'));
      }
    });
  });
};

var getMarkersInfo = function(map) {
  $.ajax({
    url: '/active_markers.json',
    type: 'GET',
    dataType: 'json',
    success: function(response) {
      if (response.stores && response.stores.length > 0) {
        response.stores.forEach(function(store) {
          setMarker(store, store.lat, store.lon, map, store.store_type);
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
  var icon;
  console.log(type)
  switch (type) {
    case 'transport':
      icon = 'pin-transporte.png';
      break;
    case 'brewery':
      icon = 'pin-cerveceria.png';
      break;
    default:
      icon = 'pin-bar.png';
  }

  var marker = new google.maps.Marker({
    position: new google.maps.LatLng(lat, lon),
    icon: icon,
    map: map,
    type: type
  });
  markers.push(marker);

  google.maps.event.addListener(marker, 'click', function() {
    if (infoWindow) {
      infoWindow.close();
    }
    var id = type == 'transport' ? 'transport-' : 'store-';
    console.log(id + markerInfo.id);
    infoWindow = new google.maps.InfoWindow({
      content: document.getElementById(id + markerInfo.id).innerHTML
    });
    infoWindow.open(map, marker);
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
    zoom: 13,
    center: new google.maps.LatLng(-34.578801, -58.463954),
    mapTypeId: google.maps.MapTypeId.TERRAIN,
    disableDefaultUI: true,
    styles: style
  };

  return new google.maps.Map(document.getElementById('map'), mapOptions);
};
