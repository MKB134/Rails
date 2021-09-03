class QuestionsController < ApplicationController
  def index
    test = Test.find(params[:test_id])
    render json: { questions: test.questions }
  end

  def show
    question = Question.find(params[:id])
    render json: question
  end

  def new

  end

  def create
    result = ["Class: #{params.class}","Parameters: #{params.inspect}"]

    render plain: result.join("\n")
  end

end
