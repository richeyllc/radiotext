class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def dashboard
    # Change the following to reflect the count of unread messages
    @unread_messages = Message.count
  end

  def unread
    # Change the following to be all unread messages only
    @unread_messages = Message.all
  end

  def send_message_from_conversation
    # This will send a message from inside the conversation modal-footer
    # Parameters: {"utf8"=>"✓", "authenticity_token"=>"...", "message"=>{"to"=>"+14353134714", "from"=>"+14352161902", "body"=>"This was sent from the modal.", "conversation_id"=>"1"}, "commit"=>"Send Message"}

    # TODO: Send the message to Twilio
    te = TwilioEngine.new
    # TODO: Add a message to the conversation.
    convo = Conversation.find(params[:message][:conversation_id])
    # TODO: Create the message
    mes = Message.create(from: params[:message][:from], to: params[:message][:to], body: params[:message][:body], conversation: convo)
    # TODO: send the message to twilio 
    res = te.send_message(mes)



    # Get the relevant Conversation

    respond_to do |format|
      format.html { redirect_to conversation_url(params[:message][:conversation_id]), notice: 'Message was successfully sent.' }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:contact_id, :phone_number_id, :twilio_date_created, :twilio_date_updated, :date_sent, :account_sid, :to, :from, :body, :status, :flag, :api_version, :price, :uri, :twilio_data)
    end
end
