class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.complited?
      TestsMailer.complited_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call

    if result
      Gist.create!(gist_url: result.html_url, user: current_user, question: @test_passage.current_question)
      flash[:notice] = t('.success', link_gist: link_gist(result))
    else
      flash[:alert] = t('.failure')
    end
    redirect_to @test_passage
  end

  private

  def link_gist(result)
    view_context.link_to('Gist', result.html_url, target: '_blank')
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
