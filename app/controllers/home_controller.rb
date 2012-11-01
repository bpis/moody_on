class HomeController < ApplicationController
    before_filter :authenticate_user!
    before_filter :is_admin?, :except =>  [:index, :show_sub_moods, :profile, :new_profile, :show]
  
  def index
    #@users = User.all
    #debugger
    @moods = Mood.order 'name'
    @sub_moods = SubMood.dep_sub_mood(params[:id])
  end
  
  def show_sub_moods
    @sub_moods = SubMood.dep_sub_mood(params[:id])
    #render :partial => 'sub_moods', :layout => false, :locals => { :sub_moods => @sub_moods }
    respond_to do |format|
      format.js
    end
  end
  
  # def show_profile
    # @user = current_user.profile if current_user.present?
   # end
   def new_profile
    @profile = Profile.new  
   end

   def profile
    @user = current_user
    @profile = Profile.where(["user_id=?", current_user.id])
    # debugger
    if @profile.present?
      if @user.profile.update_attributes(params[:profile])
    
      flash[:notice] = "Profile saved successfully."
      #redirect_to "/show_profile/#{current_user.id}"
      redirect_to "/"
    else
      flash[:error] = "Something went wrong."
      redirect_to :back
   end
    end
    #profile = Profile.new(params[:profile])
    # @profile = current_user.build_profile(params[:profile])
    #profile.user_id = current_user.id
    
  end

  
end
