import consumer from "./consumer";

const initConversationCable = (senders) => {
  const messagesContainer = document.getElementById('messages-container');



  if (messagesContainer) {
    console.log(messagesContainer);
    const id = messagesContainer.dataset.conversationId;
    console.log(id);
    console.log(consumer.subscriptions)
    consumer.subscriptions.create(
    {
      channel: "ConversationChannel", id: id
    }
      ,{
      received(data) {

        const messagerie = document.querySelector('.messagerie');
        let firstOrNot= messagerie.dataset.firstMsg;
        console.log(`first message ? ${firstOrNot}`)
        messagerie.dataset.firstMsg = "no";




        // const indexDiv = document.querySelector('#index');
        // const index = indexDiv.dataset.index;
        //  console.log( `index: ${index}` );

        console.log(data); // called when data is broadcast in the cable
        messagesContainer.insertAdjacentHTML('beforeend', data.content);

        const lastMessage = messagesContainer.lastElementChild;

        console.log( `last child: ${messagesContainer.lastElementChild}` )
         if (lastMessage.querySelector(".message-content-sender") === null) {

              senders.push(0); // si le dernier sender est moi
            } else {
              senders.push(1);
            }


        const curId = messagerie.dataset.userId;
        console.log( `current user: ${curId}` )
        console.log( `sender: ${data.sender_id}` );

        console.log(senders)
        console.log(senders[senders.length - 1])
        if (senders[senders.length - 1] === 1) {
          console.log('yes');
          const headerDiv = document.querySelector('.sender-js');
          headerDiv.insertAdjacentHTML('afterbegin', ` <div class="message-header-sender"> <img src="${data.sender_avatar_url}" alt="" class="avatar"><div class="header-text">${data.month} ${data.day}, ${data.year} at ${data.time} </div></div> ` );


          // if (firstOrNot === "yes") {
          //   if (lastMessage.querySelector(".message-header-sender") === null ) {

          //     console.log("last element is receiver");
          //   } else {
              // const headerDiv = document.querySelector('.sender-js');
              // headerDiv.insertAdjacentHTML('afterbegin', ` <div class="message-header-sender"> <img src="${data.sender_avatar_url}" alt="" class="avatar"><div class="header-text">${data.month} ${data.day}, ${data.year} at ${data.time} </div></div> ` );
          //     // DO NOTHING
          //     console.log("last element is sender");
          //   }
          // } else {
          //   const headerDiv = document.querySelector('.sender-js');
          //   headerDiv.insertAdjacentHTML('afterbegin', ` <div class="message-header-sender"> <img src="${data.sender_avatar_url}" alt="" class="avatar"><div class="header-text">${data.month} ${data.day}, ${data.year} at ${data.time} </div></div> ` );
          // }




        }


        // console.log( `sender: ${data.sender_id}` );
        // console.log(senders);
        senders.push(data.sender_id)
        // senders.push(true)

        // if (data.sender_id === )
        messagesContainer.scrollTop=messagesContainer.scrollHeight;
        return senders
      }
    }
    );
  }
}

export { initConversationCable };
