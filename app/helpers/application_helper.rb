module ApplicationHelper

  def guest_topic
    @guest_topic = GuestTopic.where(title: 'Try it out!').first
  end

  def current_guest_user
    if !cookies[:user_identifier].nil?
      @guest_user = GuestUser.find_by_identifier( cookies[:user_identifier])
      if @guest_user.nil?
        create_user
      else
        @guest_user
      end
    else
      create_user
    end
  end

  def create_user
    @guest_user = GuestUser.new
    @guest_user.identifier = generate_token
    @guest_user.save
    cookies[:user_identifier] = @guest_user.identifier
    @guest_user
  end

  def generate_token
    loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless GuestUser.exists?(identifier: random_token)
    end
  end
end
