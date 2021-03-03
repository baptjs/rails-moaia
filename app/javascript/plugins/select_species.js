const selectSpecies = () => {
  const speciesImages = document.querySelectorAll(".image-select");

    speciesImages.forEach( (speciesImage) => {
      speciesImage.addEventListener('click', (e) => {

        const img = speciesImage.querySelector("img");

        if (img.style.border === '') {
          img.style.border = 'solid';
        } else {
          img.style.border='';
        }

      });

      speciesImage.querySelector("label").addEventListener("click", (e) => {
        e.stopPropagation();
      });

    });
};

export { selectSpecies }

