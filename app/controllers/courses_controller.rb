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
  
  def index
    @title = "All Courses"
    @courses = Course.paginate(:page => params[:page])
    if params[:word]
      @search = Course.search {keywords params[:word]}
      @posts = @search.results
    else
      @courses = course.all
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
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