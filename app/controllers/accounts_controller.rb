class AccountsController < ApplicationController
  before_action :authorize_user, only: %i[edit update]

  def show
    @user = if params[:id] == 'me'
              current_user
            else
              User.find(params[:id])
            end
  end

  def edit; end

  def update
    if current_user.update(user_params)
      redirect_to account_path('me')
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :about, :theme)
  end

  def authorize_user
    authorize current_user
  end

end
