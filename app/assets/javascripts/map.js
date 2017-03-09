function initMap() {
  var philly = {lat: 39.9526, lng: -75.1652};
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 12,
    center: philly
  });
  var geocoder = new google.maps.Geocoder();

  window.onload = function() {
    geocodeAddress(geocoder, map);
  };
}

function geocodeAddress(geocoder, resultsMap) {
  var address = document.getElementById('address').value;
  geocoder.geocode({'address': address}, function(results, status) {
    if (status === 'OK') {
      resultsMap.setCenter(results[0].geometry.location);
      var marker = new google.maps.Marker({
        map: resultsMap,
        position: results[0].geometry.location
      });
      resultsMap.setZoom(17);
      resultsMap.panTo(marker.position);
    } else {
      alert('Geocode was not successful for the following reason: ' + status);
    }
  });
}
