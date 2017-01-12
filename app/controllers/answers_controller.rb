class AnswersController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question

    if @answer.save
      redirect_to @question, notice: 'Answer was successfully created.'
    else
      @answers = @question.answers.reverse
      render "questions/show"
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body,:question_id)
  end

end
