module SessionsHelper

 	# log in user
	def log_in user
		session[:user_id] = user.id
	end

	# current logged in user if any
	def current_user
		@current_user ||= User.find_by(id: session[:user_id])
	end

	def logged_in? # or user_signed_in? instead
		!current_user.nil?
	end

  def log_out # for logging out
    session.delete(:user_id)
    @current_user = nil
  end	

end
