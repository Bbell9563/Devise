class QuizzesController < ApplicationController
  before_action :set_quiz, only: [:show, :edit, :update, :destroy]
  def index
  end

  def show
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = current_user.quizzes.new(quiz_params)
    if @quiz.save
      redirect_to quizzes_path
    else  
      render :new
    end
  end

  def edit
  end

  def update
    if @quiz.update(quiz_params)
      redirect_to quiz_path(@quiz)
    else  
      render :edit 
    end
  end
  
  def destroy
    @quiz.destroy
    redirect_to quizzes_path(current_user)
  end

  private
    def quiz_params
      params.require(:quiz).permit(:title)
    end

    def set_quiz 
      @quiz = current_user.quizzes.find(params[:id])
    end
end
