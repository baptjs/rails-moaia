class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def create
    @message = Message.new(params[:message])
    if @message.save
      flash[:success] = "Message successfully created"
      redirect_to @message
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  
  
  
  
end
