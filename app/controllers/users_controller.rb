class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user
    def show
      @user = current_user
    end
    def update
      if @user.update(user_params)
        redirect_to profile_path, notice: 'Profile was successfully updated.'
      else
        render :show, status: :unprocessable_entity
      end
    end

    private

    def set_user
      @user = current_user
    end

    def user_params
      params.require(:user).permit(:full_address, :province_id)
    end
  end
