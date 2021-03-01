import $ from 'jquery';
import 'select2';


  const initSelect2 = () => {
    $('.select2').select2({placeholder: {id: -1, text: "Select an option"}}); // (~ document.querySelectorAll)
  };


export { initSelect2 };
