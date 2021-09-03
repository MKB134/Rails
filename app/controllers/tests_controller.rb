class TestsController < ApplicationController
  def index
    logger.info(self.object_id)
    render json: {tests: Test.all}
  end
end
