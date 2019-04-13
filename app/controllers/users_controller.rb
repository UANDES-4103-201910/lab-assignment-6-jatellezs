class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :is_user_logged_in?

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      #format.html { redirect_to root, notice: 'User was successfully created.' }
      #format.json { render :show, status: :created, location: @user }
      flash[:notice] = "User created successfully"
      redirect_to @user
    else
      #format.html { redirect_to registrations }
      #format.json { render json: @user.errors, status: :unprocessable_entity }
      flash.now[:error] = "User could not be created (invalid format)"
      render "new"
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user.update(user_params)
      #format.html { redirect_to @user, notice: 'User was successfully updated.' }
      #format.json { render :show, status: :ok, location: @user }
      flash[:notice] = "User updated successfully"
      redirect_to @user
    else
      #format.html { render :edit }
      #format.json { render json: @user.errors, status: :unprocessable_entity }
      flash.now[:error] = "Could not update User (invalid format)"
      render "edit"
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    #complete this method
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :last_name, :email, :password, :phone)
    end
end
