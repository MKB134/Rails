class TestsController < ApplicationController
  before_action :find_test, only: %i[show edit destroy update start]
  
  def index
    @tests = Test.all
  end

  def show; end

  def new
    @test = Test.new
  end

  def edit;end

  def update
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
    @test.destroy
    redirect_to tests_path
  end

  def start
    find_user
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def find_user
    @user = User.first
  end

end
