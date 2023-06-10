class UsersController < ApplicationController

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:nickname, :age, :gender, /* 他のパラメータをここに追加... */)
  end
  
end
