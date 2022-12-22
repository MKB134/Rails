class BadgesController < ApplicationController
  def index
    @badges = current_user.badges
  end

  def my
    @badges = current_user.badges.group('id')
    render 'index'
  end
end
