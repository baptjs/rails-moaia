class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def create
    # raise
    @message = Message.new(message_params)
    @message.conversation_id = params[:message][:conversation]

      # raise
    if @message.save
      # Websocket
      day = @message.created_at.strftime("%d-%m-%Y")[0,2]
      month = Date::MONTHNAMES[@message.created_at.strftime("%d-%m-%Y")[3,2].to_i]
      year = @message.created_at.strftime("%d-%m-%Y")[6,4]
      time = @message.created_at.strftime("%I:%M %p")

      ConversationChannel.broadcast_to(
        @message.conversation, {
          content: render_to_string(partial: "shared/message.html", locals: { message: @message, index: params[:message][:index].to_i, conversation: @message.conversation }, sender_user: current_user),
          sender_id: current_user.id,
          sender_avatar_url: current_user.avatar_url,
          day: day,
          month: month,
          year: year,
          time: time
      }

      ) #

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
