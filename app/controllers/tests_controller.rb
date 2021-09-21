class TestsController < ApplicationController
  before_action :find_test, only: %i[show]

  def index
    @tests = Test.all
  end

  def show
    find_test
  end

  def new
    @test = Test.new
  end

  def edit
    find_test
  end

  def update
    find_test

    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def destroy
    @test = Test.find(params[:id])

    @test.destroy
    redirect_to tests_path
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
