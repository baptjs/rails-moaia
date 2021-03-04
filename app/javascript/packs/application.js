// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

import { enterSubmit } from '../plugins/enter_to_submit';
import { initMapbox } from '../plugins/init_mapbox';
import { dynamicRating } from "../plugins/stars_in_review_form"; // for reviews rating with stars
import { ajaxLikes } from "../plugins/ajax_likes";
import { initSelect2 } from '../plugins/init_select2';
import { selectSpecies } from '../plugins/select_species';
import { scrollDownMessages } from '../plugins/scroll_down_messages';
import { initConversationCable } from '../channels/conversation_channel';

var senders = [];

document.addEventListener('turbolinks:load', () => {

  initMapbox();
  const markers = document.querySelectorAll('.mapboxgl-marker')
  console.log(markers)
  markers.forEach(marker => {
    marker.addEventListener('click', (e) => {
      if (document.querySelector('.selected')) {
        document.querySelector('.selected').classList.remove('selected')
      };
      const spotId = marker.dataset.markerId;
      const spot = document.querySelector(`#spot_${spotId}`);
      spot.scrollIntoView({block: "center"});
      spot.classList.add("selected");

    })
  });

  dynamicRating();

  // enterSubmit()

  ajaxLikes();

  initSelect2();

  selectSpecies();

  scrollDownMessages();


  senders = initConversationCable(senders);



}); // turbolinks closing
