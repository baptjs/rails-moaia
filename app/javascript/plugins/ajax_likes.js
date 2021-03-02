import { csrfToken } from "@rails/ujs"; // for AJAX likes
import { initMapbox } from './init_mapbox';
import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';


  const farListener = (heart, markersToDelete) => {
    // console.log(`/likes/${heart.dataset.likeid}`)
    heart.addEventListener('click',  (e) => {
      // console.log("clic détecté sur coeur vide")
      heart.classList.add('fas');
      heart.classList.remove('far');

      // console.log(heart.dataset.offerid)

      fetch("/likes", { method: "POST",
        headers: {
          "X-CSRF-Token": csrfToken(),
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        credentials: 'same-origin',
        body: JSON.stringify({ like: { spot_id: heart.dataset.spotid }})
      })
        .then(response => response.json())
        .then((data) => {

          fasListener(heart, data.like_id, markersToDelete);
        });


    }, {once: true}); // addEventListener closing (once: true because of the recursive call of the function)
  }


  const fasListener = (heart, like_id, markersToDelete) => {
      // console.log(`/likes/${like_id}`)
      heart.addEventListener('click', (e) => {
      // console.log("clic détecté sur coeur plein")
      heart.classList.add('far');
      heart.classList.remove('fas');

      // console.log(`/like/${like_id}`)

      fetch(`/likes/${like_id}`, { method: "DELETE",
        headers: {
          "X-CSRF-Token": csrfToken(),
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        credentials: 'same-origin',
        body: JSON.stringify({ like: { spot_id: heart.dataset.spotid }})
      })
        .then(response => response.json())
        .then((data) => {
          // console.log(data)
          // handle JSON response from server
        });

      const card = document.getElementById(`spot_${heart.dataset.spotid}`)

      if (card.dataset.whereami === "likes") {
        card.style.display = "none"; // to remove the spot from the list without reloading the likes page

        // begin
        const mapElement = document.getElementById('map');

        if (mapElement) {

          const markers = JSON.parse(mapElement.dataset.markers);
          // console.log(`anc. markers: ${markers}`);

          // let markersToDelete = null

          markers.forEach( (marker) => {
            // console.log(marker)
            // console.log(heart.dataset.spotid)
            // console.log(marker.spotId)
            if (marker.spotId == heart.dataset.spotid) {
              // console.log(`marker identifie: ${marker}`)
              markersToDelete.push(marker);
            }
          });
          // console.log(`ici: ${markersToDelete}`)
          initMapbox(markersToDelete);

        }
      }

      farListener(heart, markersToDelete);

    }, {once: true}); // addEventListener closing (once: true because of the recursive call of the function)
  }


// Main function to export

  const ajaxLikes = () => {

    const hearts = document.querySelectorAll(".fa-heart"); // select all hearts (empty or plain)
    let markersToDelete = []; // to AJAX-update the map when deleting favorite spot

    hearts.forEach( (heart) => {
      // console.log(heart)
      if ( heart.classList.contains('far') ) {

        farListener(heart, markersToDelete);

      } // if end


      if ( heart.classList.contains('fas') ) {

        fasListener(heart, heart.dataset.likeid, markersToDelete);

      } // if end
    }) // forEach end

  };


export { ajaxLikes };
