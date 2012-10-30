class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
  
  def update
    authorize! :update, @user, :message => 'Not authorized as an administrator.'
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user], :as => :admin)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end
    
  def destroy
    authorize! :destroy, @user, :message => 'Not authorized as an administrator.'
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    else
      redirect_to users_path, :notice => "Can't delete yourself."
    end
  end
  
  def settings
    @user = current_user
  end
  
   # def show_profile
    # @user = current_user.profile if current_user.present?
   # end
   def new_profile
    @profile = Profile.new  
   end

   def profile
    @user = current_user
    profile = @user.build_profile(params[:profile])
    
    if profile.save
      flash[:notice] = "Profile saved successfully."
      #redirect_to "/show_profile/#{current_user.id}"
      redirect_to "/"
    else
      flash[:error] = "Something went wrong."
      redirect_to :back
   end
  end
  
end