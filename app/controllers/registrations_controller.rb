class RegistrationsController < ApplicationController
	def new
	
	end

	def create
	  @registrations = User.new(user_params)

      if @registrations.save
        #format.html { redirect_to root_path, notice: 'User was successfully created.' }
        #format.json { render :show, status: :created, location: @user }
        flash[:notice] = "User created successfully"
        redirect_to root_path
      else
        #format.html { render :new }
        #format.json { render json: @registrations.errors, status: :unprocessable_entity, location: @registrations }
        flash.now[:error] = "Could not create User"
        render action: "new"
      end
	end

	def user_params
      params.require(:registrations).permit(:name, :last_name, :email, :password, :phone)
    end
end
