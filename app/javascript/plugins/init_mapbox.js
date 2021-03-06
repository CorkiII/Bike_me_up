import mapboxgl from 'mapbox-gl';


const builMap = (mapElement) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10',
    zoom: '11'
  });
};

const addMarkersToMap = (map, markers) => {
  // console.log(markers);

  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
    // Create a HTML element for your custom marker
    const element = document.createElement('div');
    element.className = 'marker';
    element.style.backgroundImage = `url('${marker.image_url}')`;
    element.style.backgroundSize = 'contain';
    element.style.width = '25px';
    element.style.height = '25px';

    new mapboxgl.Marker(element)
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup) // add this
      .addTo(map);
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};


const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    const map = builMap(mapElement);
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
  }
};



// const initMapbox = () => {
//   const mapElement = document.getElementById('map');


//  if (mapElement) { // only build a map if there's a div#map to inject into
//     mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
//     const map = new mapboxgl.Map({
//       container: 'map',
//       style: 'mapbox://styles/mapbox/streets-v10',
//       zoom: '15'
//       // center: [ -1.668822, 48.109870]
//     });

//     const markers = JSON.parse(mapElement.dataset.markers);
//     markers.forEach((marker) => {
//       new mapboxgl.Marker()
//         .setLngLat([ marker.lng, marker.lat ])
//         .addTo(map);
//     });

//     const addMarkersToMap = (map, markers) => {
//       markers.forEach((marker) => {
//         const popup = new mapboxgl.Popup().setHTML(marker.infoWindow); // add this

//         new mapboxgl.Marker()
//           .setLngLat([ marker.lng, marker.lat ])
//           .setPopup(popup) // add this
//           .addTo(map);
//     });
//   }
// };
// };

export { initMapbox };

