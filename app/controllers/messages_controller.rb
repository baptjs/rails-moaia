class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def create
    @message = Message.new(message_params)
    @message.conversation_id = params[:message][:conversation]
    if @message.save
      # Websocket
      # ConversationChannel.broadcast_to(
      #   @conversation,
      #   render_to_string(partial: "message", locals: { message: @message, index: 1, conversation: @message.conversation })
      # ) #

      flash[:success] = "Message successfully created"
      # redirect_to conversation_path(@message.conversation_id, anchor:"message-#{@message.id}")
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
