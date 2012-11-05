class HomeController < ApplicationController
    before_filter :authenticate_user!
    before_filter :is_admin?, :except =>  [:index, :show_sub_moods, :profile, :new_profile, :show]
  
  def index
    @users = User.paginate(page: params[:page])
    # @profile = current_user.profile.paginate(page: params[:page]) 
    #@users = User.paginate(page: params[:page], :per_page => 10)
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
  
  def new_profile
    @profile = current_user.profile
  end

  def profile
    @user = current_user
    @profile = current_user.profile
    if @profile.present?
      if @user.profile.update_attributes(params[:profile])
        flash[:notice] = "Profile saved successfully."
        redirect_to "/"
      else
        flash[:error] = "Something went wrong."
        redirect_to :back
      end
    end
  end
end
