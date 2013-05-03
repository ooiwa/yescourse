class CoursesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter :course_by_me, :except => [:index, :show, :new, :mypage, :create]
  
  # GET /courses
  # GET /courses.json
  # Top Page
  def index
    @courses = Course.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @courses }
    end
  end

  # GET /courses/1
  # GET /courses/1.json
  # Print Page
  def show
    @course = Course.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @course }
    end
  end

  def mypage
    @course = current_user.course
    
    if @course.nil?
      redirect_to new
    elsif @course.has_no_theme?
      redirect_to theme_course_path(@course)
    else
      redirect_to edit_course_path(@course)
    end
  end

  # GET /courses/new
  # GET /courses/new.json
  # root of mypage
  def new
    @course = current_user.build_course

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @course }
    end
  end

  def theme
    if request.get?
      @course = Course.find(params[:id])
      @themes = Theme.all
    elsif request.post?
      @course = Course.find(params[:id])

      theme = Theme.find(params[:theme][:id])
      @course.update_theme(theme)

      redirect_to edit_course_path @course
    end
  end


  # GET /courses/1/edit
  # Edit Page
  def edit
    @course = Course.find(params[:id])
  end

  # POST /courses
  # POST /courses.json
  # select template page
  def create
    @course = current_user.build_course
    # @course = Course.new(params[:course])

    respond_to do |format|
      if @course.update_attributes(params[:course])
        format.html { redirect_to mypage_courses_path, notice: 'Course was successfully created.' }
        format.json { render json: @course, status: :created, location: @course }
      else
        format.html { render action: "new" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /courses/1
  # PUT /courses/1.json
  def update
    @course = Course.find(params[:id])

    respond_to do |format|
      if @course.update_attributes(params[:course])
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    respond_to do |format|
      format.html { redirect_to courses_url }
      format.json { head :no_content }
    end
  end

  private
  def course_by_me
    if current_user.course.id.to_i != params[:id].to_i
      render :text => "it is not your course"
    end
  end
end
