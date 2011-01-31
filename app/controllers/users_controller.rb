class UsersController < ApplicationController
  before_filter :authenticate, :except => [:show, :new, :create]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user,   :only => :destroy
  
  def index
    @title = "All users"
    @users = User.paginate(:page => params[:page])
  end
  
    def show
    @user = User.find(params[:id])
    @courses = @user.courses.paginate(:page => params[:page])
    @title = [@user.first_name, @user.last_name].reject(&:empty?).join(' ') 
  end
  
  def new
    @title = "Sign up"
    @user = User.new  
  end
  
  def create
    @user = User.new(params[:user])
    if validate_recap(params, @user.errors) && @user.save
      UserMailer.welcome_email(@user).deliver
      sign_in @user
      redirect_to @user, :flash => {:success => "Welcome to Group Course!"}
    else
      @title = "Sign up"
      render 'new'
    end
  end
  
  def edit
    @title = "Edit user"
  end
  
  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end
  end
  
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end
  
  private
  
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
    
    def admin_user
      @user = User.find(params[:id])
      redirect_to(root_path) if !current_user.admin? || current_user?(@user)
    end
end
