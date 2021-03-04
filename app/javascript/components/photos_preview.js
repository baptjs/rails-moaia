const previewImageOnFileSelect = () => {
  $(function () {
    // Multiple images preview in browser
    var imagesPreview = function (input, placeToInsertImagePreview) {

      if (input.files) {
        var filesAmount = input.files.length;
        console.log(filesAmount)
        for (let i = 0; i < filesAmount; i++) {
          var reader = new FileReader();
          reader.onload = function (event) {
            $($.parseHTML('<img>')).attr('src', event.target.result).appendTo(placeToInsertImagePreview);
          }

          reader.readAsDataURL(input.files[i]);
        }
      }

    };

    $('#photo-input').on('change', function () {
      imagesPreview(this, 'div.gallery-review');
    });
  });
};

export { previewImageOnFileSelect };
