class ConversationsController < ApplicationController

  def index
    @conversations = Conversation.all
  end

  def show
    @conversation = Conversation.find(params[:id])
    @message = Message.new
  end
  
  def create
    @conversation = Conversation.new()
    @conversation.people << params[:format].to_i
    @conversation.people << current_user.id
    if @conversation.save
      flash[:success] = "Conversation successfully created"
      redirect_to @conversation
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  
  
end
