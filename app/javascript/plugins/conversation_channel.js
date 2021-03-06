import consumer from "./consumer";

const initConversationCable = () => {
  const messagesContainer = document.getElementById('messages-container');
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;

    consumer.subscriptions.create({ channel: "ConversationChannel", id: id }, {
      received(data) {
        console.log(data); // called when data is broadcast in the cable
        messagesContainer.insertAdjacentHTML('beforeend', data);
      },
    });
  }
}

export { initConversationCable };
