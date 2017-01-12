class QuestionsController < ApplicationController
  def index
    @questions = Question.all.reverse
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @answers = @question.answers.reverse
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to @question, notice: 'Question was successfully created.'
    else
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      redirect_to @question, notice: 'Question was successfully udated.'
    else
      render :new
    end
  end

  def destroy
    Question.delete(params[:id])
    Answer.delete_all(question_id: params[:id])
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:title, :details)
  end
end
