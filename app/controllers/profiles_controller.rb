class ProfilesController < ApplicationController
  before_action :authenticate_user!
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    
    # Set Settings Values
    @user.settings(:user_settings).birthday = params[:birthday]
    @user.settings(:user_settings).website = params[:website]
    @user.settings(:user_settings).bio = params[:bio]
    
    # Set Show Setting Values
    @user.settings(:user_show_settings).show_name = true?(params[:show_name])
    @user.settings(:user_show_settings).show_email = true?(params[:show_email])
    @user.settings(:user_show_settings).show_birthday = true?(params[:show_birthday])
    @user.settings(:user_show_settings).show_website = true?(params[:show_website])
    
    if @user.save()
      flash[:success] = "Profile Updated Successfully"
      redirect_to user_path(@user)
    else
      redirect_to edit_profile_path(@user)
    end
  end
  
  def true?(obj)
    obj.to_s == "true"
  end
end
