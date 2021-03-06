class MessagesController < ApplicationController
  before_action :set_message, only: %i[show edit update destroy]

  # GET /messages
  def index
    @messages = Message.all
  end

  # GET /messages/1
  def show; end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit; end

  # POST /messages
  def create
    @message = Message.new(message_params)
    send_time = params[:message][:send_time]
    name = params[:message][:contact_id]
    @message.contact = Contact.find_by(name: name)
    @message.send_time = Time.strptime(send_time, "%m/%d/%Y %l:%M %p").to_datetime

    if @message.save
      redirect_to messages_url, notice: "Message was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /messages/1
  def update
    send_time = params[:message][:send_time]
    name = params[:message][:contact_id]
    content = params[:message][:content]
    @message.contact = Contact.find_by(name: name)
    if send_time.present?
      @message.send_time = Time.strptime(send_time, "%m/%d/%Y %l:%M %p").to_datetime
    end

    if @message.save
      redirect_to messages_url, notice: "Message was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /messages/1
  def destroy
    @message.destroy
    redirect_to messages_url, notice: "Message was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_message
    @message = Message.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def message_params
    params.require(:message).permit(:content, :send_time, :message_sent, :contact_id)
  end
end
