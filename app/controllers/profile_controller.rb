class ProfileController < ApplicationController
  def index
    @user = User.find(params[:id])
    @users = User.all

    @weight = Float(@user.weight)
    @bmi = Float((@weight/(@user.height**2))*10000)

  end
end
