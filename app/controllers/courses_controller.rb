class CoursesController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]
  before_filter :authorized_user, :only => :destroy
  
  def create
    @course  = current_user.courses.build(params[:course])
    if @course.save
      flash[:success] = "Course created!"
      redirect_to root_path, :flash => {:success => "Course created!"}
    else
      @feed_items = []
      render 'pages/home'
    end
  end

  def destroy
    @course.destroy
    redirect_to root_path, :flash => {:success => "Course deleted!"}
  end
  
  private

    def authorized_user
      @course = Course.find(params[:id])
      redirect_to root_path unless current_user?(@course.user)
    end
end