class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  #TODO: add authorize! options.

  def show
    # authorize! :read, @user
  end

  def edit
    # authorize! :update, @user
  end

  def update
    # authorize! :update, @user
    if @user.update(user_params)
      sign_in(@user == current_user ? @user : current_user, :bypass => true)
      redirect_to @user, notice: 'Your profile was successfully updated.'
    else
      render action: 'edit'
    end
  end


  def destroy
    # authorize! :delete, @user
    @user.destroy
    redirect_to root_url
  end

  def account
    @user = current_user
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    accessible = [ :name, :email ]
    accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
    params.require(:user).permit(accessible)
  end
end