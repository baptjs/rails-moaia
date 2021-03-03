// To scroll down to the bottom of messages
const scrollDownMessages = () => {
  var scrolled = false;
  var messages = document.querySelector(".messages-container");

if (messages) {
  function updateScroll(){
    if(!scrolled){
      messages.scrollTop=messages.scrollHeight;
      // location.reload();
    }
  }

  messages.addEventListener('scroll', function(){
      scrolled=true;
  });

  setInterval(updateScroll,500);
  }
}

export { scrollDownMessages }
