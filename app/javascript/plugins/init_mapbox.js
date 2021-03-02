import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const buildMap = (mapElement) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10'
  });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
    const mark = new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map)
      mark.getElement().dataset.markerId = marker.spotId;
  });
};


const fitMapToMarkers = (map, markers, maxZoom) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: maxZoom });
};

const initMapbox = (markersToDelete = []) => {
  const mapElement = document.getElementById('map');
  if (mapElement) {
    const map = buildMap(mapElement);
    console.log(map);
    let markers = JSON.parse(mapElement.dataset.markers);
    console.log(markers);
    console.log(typeof markers)
    console.log(markersToDelete)

    if (markersToDelete != []) {
      markersToDelete.forEach((markerToDelete) => {

        markers = markers.filter(function (marker){
          // console.log(marker);
          // console.log(markerToDelete)
          // console.log(marker.spotId != markerToDelete.spotId)
          return marker.spotId != markerToDelete.spotId;
        });

      });
    }

    console.log(markers)
    const maxZoom = parseInt(mapElement.dataset.zoom, 10);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers, maxZoom);
    console.log("done!")
    map.addControl(
      new mapboxgl.GeolocateControl({
      positionOptions: {
      enableHighAccuracy: true
      },
      trackUserLocation: true
      })
      );
  }

};

export { initMapbox };
