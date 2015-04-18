class MessagesController < ApplicationController
	before_filter :authenticate_user!
	before_filter :get_mailbox, :get_box, :get_user


	def index

	end

	def show
	end

	def new
		# if params[:receiver].present?
		# 	@recipient = User.find_by_id(params[:receiver])
		# 	return redirect_to root_path if @recipient.nil? or current_user == @recipient
		# end

		return redirect_to root_path if params[:receiver] == current_user.id
	end

	def create
		@recipient = User.find_by_id(message_params.fetch(:receiver))
		if @recipient.nil?
			flash[:notice] = 'message not sent'
			return redirect_to root_path
		end

		@receipt = @user.send_message(@recipient, message_params.fetch(:body), message_params.fetch(:subject))
		if @receipt.errors.blank?
		@conversation = @receipt.conversation
		flash[:notice]= 'Message sent'
		redirect_to conversation_path(@conversation, :box => :sentbox)
		else
		render :action => :new
		end
	end

	def update
		@recipient = User.find_by_id(message_params.fetch(:receiver))
		if @recipient.nil?
			flash[:notice] = 'message not sent'
			return redirect_to root_path
		end

		@receipt = @user.send_message(@recipient, message_params.fetch(:body), message_params.fetch(:subject))
		if @receipt.errors.blank?
		@conversation = @receipt.conversation
		flash[:notice]= 'Message sent'
		redirect_to conversation_path(@conversation, :box => :sentbox)
		else
		render :action => :new
		end

	end

	def destroy
	end

	private

	def get_mailbox
		@mailbox = current_user.mailbox
	end

	def get_box
    if params[:box].blank? or !["inbox","sentbox","trash"].include?params[:box]
      @box = "inbox"
    return
    end
    @box = params[:box]
  end

  def get_user
  	@user = current_user
  end

  def message_params
  	params[:message].permit(:body, :subject, :receiver)
  end

end
