class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def create
    @message = Message.new(message_params)
    @message.conversation_id = params[:message][:conversation]
    if @message.save
      flash[:success] = "Message successfully created"
      redirect_to conversation_path(@message.conversation_id)
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  
  private

  def message_params
    params.require(:message).permit(:content, :user_id, :conversation_id)
  end
  
  
end
