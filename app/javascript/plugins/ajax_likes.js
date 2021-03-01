import { csrfToken } from "@rails/ujs"; // for AJAX likes


  const farListener = (heart) => {
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
          // console.log(`creation of like ${data.like_id}`)
          // handle JSON response from server
          // like_id = data.like_id;
          fasListener(heart, data.like_id);
        });


    }, {once: true}); // addEventListener closing (once: true because of the recursive call of the function)
  }


  const fasListener = (heart, like_id) => {
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
      }

      farListener(heart);

    }, {once: true}); // addEventListener closing (once: true because of the recursive call of the function)
  }


// Main function to export

  const ajaxLikes = () => {

    const hearts = document.querySelectorAll(".fa-heart"); // select all hearts (empty or plain)

    hearts.forEach( (heart) => {
      // console.log(heart)
      if ( heart.classList.contains('far') ) {

        farListener(heart);

      } // if end


      if ( heart.classList.contains('fas') ) {

        fasListener(heart, heart.dataset.likeid);

      } // if end
    }) // forEach end

  };


export { ajaxLikes };
