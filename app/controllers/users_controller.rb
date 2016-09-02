class UsersController < ApplicationController
  before_filter :authorize , :except => [:new, :create]
  before_filter :admin_user, :only => [:list]
  def new
    
  end
  
  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:message] = "User Created Successfully"
      redirect_to '/profile'
    else
      flash[:error] = "Failed to create user."
      redirect_to '/signup'
    end
  end
  
  def profile
    @user = User.find session[:user_id]    
  end
  
  def edit_profile
    @user = User.find session[:user_id]
  end
  
  def update_profile
    @user = User.find session[:user_id]
    if @user.update_attributes(user_profile_params)
      flash[:message] = "Profile Updated successfully"
      redirect_to "/profile"
    else
      flash[:error] = "Failed to update profile"
      redirect_to "/profile"
    end
  end
  
  
  def update_commodities
    @user = User.find session[:user_id]
    @user.commodities = params[:commodities]
    if @user.save
      flash[:message] = "Commodities Updated successfully"
      redirect_to "/profile"
    else
      flash[:error] = "Failed to update Commodities"
      redirect_to "/profile"
    end
  end
  
  def list 
    @users = User.paginate(page: params[:page], :per_page => 10)
  end
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :user_type, :long, :lat)
    end
  
    def user_profile_params
      params.require(:user).permit(:name, :email, :long, :lat)
    end
  
end
