class UsersController < ApplicationController
	def index
		@users = User.all
	end
	def new
		@user = User.new
	end
	def edit
		@user = User.find(params[:id])
		puts @user.inspect
	end
	def destroy
		@user = User.find(params[:id])
		@user.destroy

		redirect_to '/menus'
	end
	def create
	@user = User.new(user_params) 
		if @user.save
			session[:user_id] = @user.id 
			MyMailer.delay.new_registration(@user)
			redirect_to '/menus' 
		else
			render 'new'
		end
	end
	def update
  @user = User.find(params[:id])
	  if (@user.update_attributes! user_params_update)
	    redirect_to '/menus'
	  else
	    render 'edit'
	  end
	end
	def show
		@user = User.find(params[:id])
	end
	private
		def user_params
			params.require(:user).permit(:first_name, :last_name, :email, :password, :role, :phone, :address)
		end

		def user_params_update
			params.require(:user).permit(:first_name, :last_name, :email, :role, :phone, :address)
		end
end
