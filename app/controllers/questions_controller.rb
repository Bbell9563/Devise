class QuestionsController < ApplicationController
  before_action :set_quiz
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  def show
  end

  def new
    @question = Question.new(quiz_id: params[:quiz_id])
  end

  def create
    @question = @quiz.questions.new(question_params)
    if @question.save
      redirect_to quiz_path(@quiz)

    else
      render :new
    end
  end

  def index
    @question = @quiz.questions.all
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to quiz_path(@quiz)
    else  
      render :edit
    end

  end

  def destroy
    @question.destroy
    redirect_to quiz_path(@quiz)
  end

  private
    def set_quiz
      @quiz = Quiz.find(params[:quiz_id])
    end

    def set_question
      @question = @quiz.questions.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:query, :correct_answer, wrong_answer: [])
    end
end
