#class UsersController < InheritedResources::Base
#end

class UsersController < ApplicationController
  respond_to :json
	#before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    respond_with User.all
  end

  def show
  end

  def create
		@user = User.new params[:user]
		if @user.save
            respond_to do |format|
                format.html { redirect_to :root, notice: "Signed up!" }

                format.json { render json: { user: @user.as_json(only: :email) }, status: :created }
            end
		else
            respond_to do |format|
                format.html { render :new }
                format.json { render json: { errors: @user.errors }, status: :unprocessable_entity }
            end
		end
  end

  def update
    respond_with user.update(user_params)
  end

  def destroy
    respond_with user.destroy
  end

  private

  def user
    User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :passwordConfirmation, :encrypted_password)
  end

end