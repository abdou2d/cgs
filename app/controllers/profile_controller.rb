class ProfileController < ApplicationController
  before_action :set_profile, only: [:edit, :update]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :profile_owner, only: [:edit, :update]

  
  def index
    if user_signed_in? 
      redirect_to profile_path(current_user.username)
    else
      redirect_to root_path
    end
  end

  def show
    if(User.find_by_username(params[:id]))
      @user = User.find_by_username(params[:id])
    else
      redirect_to root_path, alert: "هذا المستخدم غير موجود"
    end
  end

  def edit
    
  end

  def update    
    if @profile.update(profile_params)
      redirect_to @profile, notice: 'تم تحديث الملف الشخصي.'
    else      
      render :edit, alert: 'رجاء مراجعة البيانات'
    end
  end

  private
  
  def profile_owner
    unless @profile.user_id == current_user.id
     flash[:alert] = 'غير مصرح لك للوصول لهذه الصفحة'
     redirect_to profile_path
    end
   end
   
    def set_profile
      @profile = Profile.friendly.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :avatar)
    end

end
