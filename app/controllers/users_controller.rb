class UsersController < ApplicationController

	def show
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)

  	if @user.save
      # Send Email
      log_in @user
      UserMailer.signup_confirmation(@user).deliver_now
  		flash[:notice] = "Successfully Signed Up"
  		redirect_to @user # also can be redirect to the root_path
  	else
  		render :new
  	end
  end

  private

  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
