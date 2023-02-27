class User::GuestsController < ApplicationController

  before_action :new_guest, only: %i[update destroy]

 def new_guest
   @user = User.find_or_create_by!(email: 'guest@example.com') do |user|
     user.password = SecureRandom.urlsafe_base64
     user.name= 'GUEST'
     user.introduction= 'HELLO!!'
   end
   if sign_in @user
   redirect_to user_user_path(id:current_user), notice: 'ゲストユーザーとしてログインしました。'
   end
 end

end
