class ConversationsController < ApplicationController

	before_filter :authenticate_user!
	before_filter :get_mailbox, :get_box
	before_filter :get_user, :only => [:show, :update, :destroy]
	before_filter :check_current_subject_in_conversation, :only => [:show, :update, :destroy]

	def index
		if @box.eql? "inbox"
			@conversations = @mailbox.inbox.page(params[:page])
		elsif @box.eql? 'sentbox'
			@conversations = @mailbox.sentbox.page(params[:page])
		else
			@conversations = @mailbox.trash.page(params[:page])
		end

		#render @conversations
	end

	def show
		if @box.eql? 'trash'
			@receipts = @mailbox.receipts_for(@conversation).trash
		else
			@receipts = @mailbox.receipts_for(@conversation).not_trash
		end

		render :action => :show
		@receipts.mark_as_read
	end

	def update
		body = nil
		if !params[:body].nil?
			body = params[:body]
		elsif !params[:message][:body].nil?
			body = params[:message][:body]
		else
			body = '(empty message)'
		end
		@user.reply_to_conversation(@conversation, body)
		redirect_to conversation_path(@conversation)
	end

	def destroy
		@conversation.move_to_trash(current_user)
		redirect_to conversations_path
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

	  def check_current_subject_in_conversation
    @conversation = Mailboxer::Conversation.find_by_id(params[:id])

    if @conversation.nil? or !@conversation.is_participant?(@user)
      redirect_to conversations_path(:box => @box)
    return
    end
  end


end
