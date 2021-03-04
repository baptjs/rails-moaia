class ConversationChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "test"
    conversation = Conversation.find(params[:id])
    stream_for conversation
  end

end
