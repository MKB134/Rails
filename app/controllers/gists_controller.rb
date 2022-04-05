class GistsController < ApplicationController

  def create
    @test_passage = TestPassage.find(params[:id])
    result = GistQuestionService.new(@test_passage.current_question).call

    if result.success?
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
end
