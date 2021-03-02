class ConversationsController < ApplicationController

  def index
    @conversations = Conversation.all
  end

  def show
    @conversation = Conversation.find(params[:id])
    @message = Message.new
  end
  
  
end
